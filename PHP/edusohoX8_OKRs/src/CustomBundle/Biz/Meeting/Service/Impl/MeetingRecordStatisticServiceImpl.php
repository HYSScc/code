<?php

namespace CustomBundle\Biz\Meeting\Service\Impl;

use AppBundle\Common\ArrayToolkit;
use Biz\BaseService;
use CustomBundle\Biz\Meeting\Service\MeetingRecordStatisticService;

class MeetingRecordStatisticServiceImpl extends BaseService implements MeetingRecordStatisticService
{
    public function createMeetingRecordStatistic($fields)
    {
        $fields['meetingRoomStatisticCode'] = $this->getMeetingStatisticCode($fields['meetingRoomId']);

        $fields = $this->filterFields($fields);

        for ($i = 0; $i < count($fields['periods']); $i++){
            $fieldsForCreate = $fields;
            $fieldsForCreate['periods'] = $fields['periods'][$i];
            $this->getMeetingRecordStatisticDao()->create($fieldsForCreate);
        }
    }

    public function updateMeetingRecordStatistic($id, $fields)
    {
        $this->getMeetingRecordStatisticDao()->deleteByMeetingRecordId($id);
        $fields['meetingRoomStatisticCode'] = $this->getMeetingStatisticCode($fields['meetingRecordId']);

        $fields = $this->filterFields($fields);

        for ($i = 0; $i < count($fields['periods']); $i++){
            $fieldsForCreate = $fields;
            $fieldsForCreate['periods'] = $fields['periods'][$i];
            $this->getMeetingRecordStatisticDao()->create($fieldsForCreate);
        }
    }

    public function reOrderingMeetingRoomStatisticCode($meetingRoomCode, $meetingRoomNums)
    {
        for ($i = $meetingRoomCode + 1; $i <= ($meetingRoomNums - $meetingRoomCode); $i++){
            $this->getMeetingRecordStatisticDao()->refreshMeetingRoomStatisticCode($i);
        }

    }

    public function getMeetingRoomStatisticCodeByRoomId($id)
    {
        return $this->getMeetingRecordStatisticDao()->getMeetingRoomStatisticCodeByRoomId($id);
    }

    public function getMeetingRecordStatistic($id)
    {
        return $this->getMeetingRecordStatisticDao()->get($id);
    }

    public function deleteMeetingRecordStatistic($id, $params)
    {
        if ($params == 'meetingRoomId'){
            $this->getMeetingRecordStatisticDao()->deleteByMeetingRoomId($id);
        } else if ($params == 'meetingRecordId'){
            $this->getMeetingRecordStatisticDao()->deleteByMeetingRecordId($id);
        }
    }

    public function searchMeetingRecordsStatistic($conditions, $sort, $start, $limit)
    {
        $allData = $this->getMeetingRecordStatisticDao()->search($conditions, $sort, $start, $limit);

        $key = array();
        $xdata = array();
        for ($i = 0; $i <= 18; $i++){
            $key[$i] = array_search($i, array_column($allData, 'period'));

            if ($key[$i] === false){
                $xdata[$i] = array($i,0,0,0);
            }
        }

        $meetingRooms = $this->getMeetingRoomService()->searchMeetingRooms(
            $conditions = array(),
            array('createdTime' => 'ASC'),
            0,
            PHP_INT_MAX
        );

        $ydata = array();
        for ($j = 0; $j < count($meetingRooms); $j++){
            $key[$j] = array_search($j, array_column($allData, 'meetingRoomStatisticCode'));

            if ($key[$j] === false){
                $ydata[$j] = array(0,$j,0,0);
            }
        }

        $initialData = array_merge($xdata,$ydata);

        $sum = count($allData);
        $data = array();
        for ($i=0; $i < $sum; $i++){
            $data[$i] = array((int)$allData[$i]['periods'],(int)$allData[$i]['meetingRoomStatisticCode'],(int)$allData[$i]['organizerId'],$allData[$i]['organizerName']);
        }

        $data = array_merge($data, $initialData);
        return $data;
    }

    public function getIndexTime($period)
    {
        $dateTimes = array();
        for ($i = 1; $i <= $period; $i++) {
            $timestamp = strtotime("+$i day");
            $dateTimes[$i] = date('Y-m-d',$timestamp);
        }

        return $dateTimes;
    }

    protected function getMeetingStatisticCode($meetingRoomId)
    {
        $meetingRooms = $this->getMeetingRoomService()->searchMeetingRooms(
            $conditions = array(),
            array('createdTime' => 'ASC'),
            0,
            PHP_INT_MAX
        );

        $meetingStatisticCode = array_search($meetingRoomId,array_column($meetingRooms,'id'));

        return $meetingStatisticCode;
    }

    protected function validateMeetingRecordFields($fields)
    {
        if (!ArrayToolkit::requireds($fields,
            array(
                'meetingRoomId',
                'meetingRecordId',
                'meetingRoomStatisticCode',
                'organizerId',
                'organizerName',
                'meetingDate',
                'period',
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
                'meetingRoomId',
                'meetingRecordId',
                'meetingRoomStatisticCode',
                'organizerId',
                'organizerName',
                'meetingDate',
                'periods',
            )
        );
    }

    protected function getMeetingRecordStatisticDao()
    {
        return $this->createDao('CustomBundle:Meeting:MeetingRecordStatisticDao');
    }

    protected function getMeetingRoomService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRoomService');
    }

    protected function getMeetingRecordService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRecordService');
    }
}
