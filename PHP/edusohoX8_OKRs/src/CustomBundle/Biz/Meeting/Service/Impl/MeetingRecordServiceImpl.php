<?php

namespace CustomBundle\Biz\Meeting\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\Meeting\Service\MeetingRecordService;
use AppBundle\Common\ArrayToolkit;
use Topxia\Service\Common\ServiceKernel;

class MeetingRecordServiceImpl extends BaseService implements MeetingRecordService
{
    public function createMeetingRecord($fields)
    {
        $this->validateMeetingRecordFields($fields);
        $fields = $this->filterFields($fields);

        $fields['meetingDate'] = strtotime(date('Y-m-d',$fields['startTime']));
        $result = $this->getMeetingRecordDao()->create($fields);
        $fieldsForStatistic = $this->handleFields($fields, $result);

        $this->getMeetingRecordStatisticService()->createMeetingRecordStatistic($fieldsForStatistic);

        return $result;
    }

    public function updateMeetingRecord($id, $fields)
    {
        $this->validateMeetingRecordFields($fields);
        $fields = $this->filterFields($fields);

        $fields['meetingDate'] = strtotime(date('Y-m-d',$fields['startTime']));
        $result = $this->getMeetingRecordDao()->update($id, $fields);
        $fieldsForStatistic = $this->handleFields($fields, $result);

        $this->getMeetingRecordStatisticService()->updateMeetingRecordStatistic($fieldsForStatistic['meetingRecordId'], $fieldsForStatistic);

        return $result;
    }

    public function getMeetingRecord($id)
    {
        return $this->getMeetingRecordDao()->get($id);
    }

    public function deleteMeetingRecord($id)
    {
        $meetingRecord = $this->getMeetingRecord($id);

        $this->getMeetingRecordDao()->delete($id);

        $meetingRecordId = $meetingRecord['id'];
        $this->getMeetingRecordStatisticService()->deleteMeetingRecordStatistic($meetingRecordId, 'meetingRecordId');
    }

    public function deleteMeetingRecordWithInMeetingRoom($id,$meetingRoomNums)
    {
        $meetingRoomCode = $this->getMeetingRecordStatisticService()->getMeetingRoomStatisticCodeByRoomId($id);

        $this->getMeetingRecordDao()->deleteByMeetingRoomId($id);

        $this->getMeetingRecordStatisticService()->deleteMeetingRecordStatistic($id, 'meetingRoomId');

        $this->getMeetingRecordStatisticService()->reOrderingMeetingRoomStatisticCode($meetingRoomCode,$meetingRoomNums);
    }

    public function countMeetingRecords(array $conditions)
    {
        return $this->getMeetingRecordDao()->count($conditions);
    }

    public function searchMeetingRecords($conditions, $sort, $start, $limit)
    {
        $this->getMeetingRecordDao()->upMeetingRecordSort();

        return $this->getMeetingRecordDao()->search($conditions, $sort, $start, $limit);
    }

    protected function handleFields($fields, $result)
    {
        $organizer = $this->getUserService()->getUserProfile($result['organizerId']);
        $periods = $this->getTimePeriod($result['meetingDate'], $result['startTime'], $result['endTime']);
        $fieldsForStatistic = array(
            'meetingRecordId' => $result['id'],
            'organizerId' => $result['organizerId'],
            'organizerName' => $organizer['truename'],
            'periods' => $periods,
            'meetingRoomId' => $fields['meetingRoomId'],
            'meetingDate' => $result['meetingDate']
        );

        return $fieldsForStatistic;
    }

    protected function getTimePeriod($dateTime,$startTime, $endTime)
    {
        $periodNum = ($endTime - $startTime) / 1800;

        $time = strtotime('+18 hours', $dateTime) - $startTime;

        $startPeriod = $time / 1800;

        $period = array();
        for ($i = 0; $i < $periodNum; $i++){
            $period[$i] = $startPeriod - $i;
        }

        return $period;
    }


    public function buildCreateFields($fields)
    {
        $startTime = $this->getUtilService()->transformDateAndTimeToStr($fields['dateSelect'], $fields['startClock']);
        $endTime = $this->getUtilService()->transformDateAndTimeToStr($fields['dateSelect'], $fields['endClock']);
        $fields = array(
            'id' => empty($fields['id']) ? '' : $fields['id'],
            'name' => empty($fields['meetingTitle']) ? '' : $fields['meetingTitle'],
            'meetingRoomId' => $fields['categoryId'],
            'organizerId' => empty($fields['userId']) ? '' : $fields['userId'],
            'startTime' => $startTime,
            'endTime' => $endTime,
            'introduction' => $fields['meetingBrief']
        );

        return $fields;
    }

    protected function validateMeetingRecordFields($fields)
    {
        if (!ArrayToolkit::requireds(
            $fields,
            array(
                'name',
                'meetingRoomId',
                'organizerId',
                'startTime',
                'endTime',
            ))
        ) {
            throw $this->createInvalidArgumentException('Lack of required fields');
        }
    }

    protected function filterFields($fields)
    {
        return ArrayToolkit::parts(
            $fields,
            array(
                'name',
                'meetingRoomId',
                'organizerId',
                'startTime',
                'endTime',
                'introduction',
            )
        );
    }

    protected function getKernel()
    {
        return ServiceKernel::instance();
    }

    protected function getMeetingRecordDao()
    {
        return $this->createDao('CustomBundle:Meeting:MeetingRecordDao');
    }

    protected function getUserService()
    {
        return $this->createService('User:UserService');
    }

    protected function getMeetingRoomService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRoomService');
    }

    protected function getMeetingRecordStatisticService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRecordStatisticService');
    }

    protected function getUtilService()
    {
        return $this->createService('CustomBundle:Util:DateTimeTransformService');
    }
}
