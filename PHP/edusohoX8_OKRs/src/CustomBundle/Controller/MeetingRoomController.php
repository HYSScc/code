<?php

namespace CustomBundle\Controller;

use AppBundle\Common\ArrayToolkit;
use AppBundle\Common\Paginator;
use AppBundle\Controller\BaseController;
use Symfony\Component\HttpFoundation\Request;

class MeetingRoomController extends BaseController
{
    public function indexAction(Request $request)
    {
        $dayPeriod = 6;
        $dateTimes = $this->getMeetingRecordStatisticService()->getIndexTime($dayPeriod);
        return $this->render('CustomBundle:meeting-room:index.html.twig',array(
            'dateTimes' => $dateTimes
        ));
    }

    public function statisticAction(Request $request, $date)
    {
        if ($date == 'today'){
            $date = strtotime(date('Y-m-d'));
        } else{
            $date = strtotime($date);
        }

        $meetingRooms = $this->getMeetingRoomService()->searchMeetingRooms(
            $conditions = array(),
            array('createdTime' => 'ASC'),
            0,
            PHP_INT_MAX
        );
        $data['meetingRooms'] = ArrayToolkit::column($meetingRooms,'name');

        $data['data'] = $this->getMeetingRecordStatisticService()->searchMeetingRecordsStatistic(
            $conditions = array(
                'date' => $date
            ),
            array('createdTime' => 'ASC'),
            0,
            PHP_INT_MAX
        );

        return $this->createJsonResponse(json_encode($data));
    }

    public function showRecordAction(Request $request)
    {
        $user = $this->getCurrentUser();

        $conditions = array(
            'organizerId' => $user['id'],
        );

        $meetingRecordsCount = $this->getMeetingRecordService()->countMeetingRecords($conditions);
        $paginator = new Paginator($request, $meetingRecordsCount, 10);

        $records = $this->getMeetingRecordService()->searchMeetingRecords(
            $conditions,
            array('sort' => 'ASC'),
            $paginator->getOffsetCount(),
            $paginator->getPerPageCount()
        );
        $roomIds = ArrayToolkit::column($records, 'meetingRoomId');
        $meetingRooms = $this->getMeetingRoomService()->searchMeetingRooms(
            array('ids' => $roomIds),
            array(),
            0,
            PHP_INT_MAX
        );
        $meetingRooms = ArrayToolkit::index($meetingRooms, 'id');

        return $this->render('@Custom/meeting-room/show-my-records.html.twig', array(
            'records' => $records,
            'paginator' => $paginator,
            'meetingRooms' => $meetingRooms,
        ));
    }

    public function addRecordAction(Request $request)
    {
        $user = $this->getCurrentUser();
        if ($request->getMethod() == 'POST') {
            $fields = $request->request->all();
            $fields['userId'] = $user['id'];
            $fields = $this->getMeetingRecordService()->buildCreateFields($fields);
            $this->getMeetingRecordService()->createMeetingRecord($fields);

            return $this->redirectToRoute('show_my_meetingRoom_record');
        }

        $meetingRooms = $this->getMeetingRoomService()->searchMeetingRooms(
            array(),
            array(),
            0,
            PHP_INT_MAX
        );
        $optionDate = $this->getOptionDates();

        return $this->render(
            '@Custom/meeting-room/meeting-record-modal.html.twig',
            array(
                'rooms' => $meetingRooms,
                'dates' => $optionDate,
            )
        );
    }

    private function getOptionDates($option = 7)
    {
        $optionDate = array();
        for ($index = 0; $index < $option; $index++) {
            $optionDate[] = date('Y-m-d', strtotime("+" . $index . " day"));
        }

        return $optionDate;
    }

    public function updateRecordAction(Request $request, $recordId)
    {
        $user = $this->getCurrentUser();
        if ($request->getMethod() == 'POST') {
            $fields = $request->request->all();
            $fields['userId'] = $user['id'];
            $fields = $this->getMeetingRecordService()->buildCreateFields($fields);
            $this->getMeetingRecordService()->updateMeetingRecord($recordId, $fields);

            return $this->redirectToRoute('show_my_meetingRoom_record');
        }

        $meetingRooms = $this->getMeetingRoomService()->searchMeetingRooms(
            array(),
            array(),
            0,
            PHP_INT_MAX
        );
        $optionDate = $this->getOptionDates();
        $record = $this->getMeetingRecordService()->getMeetingRecord($recordId);

        return $this->render(
            '@Custom/meeting-room/meeting-record-modal.html.twig',
            array(
                'record' => $record,
                'dates' => $optionDate,
                'rooms' => $meetingRooms,
                'recordId' => $recordId
            )
        );
    }

    public function deleteRecordAction(Request $request, $recordId)
    {
        $result = $this->getMeetingRecordService()->deleteMeetingRecord($recordId);

        return $this->createJsonResponse($result);
    }

    public function checkTimeAction(Request $request)
    {
        $fields = $request->request->all();
        $fields = $this->getMeetingRecordService()->buildCreateFields($fields);
        $condition['meetingRoomId'] = $fields['meetingRoomId'];
        $records = $this->getMeetingRecordService()->searchMeetingRecords($condition, array(), 0, PHP_INT_MAX);

        foreach ($records as $record) {
            if ($record['id'] != $fields['id']) {
                if ($fields['startTime'] <= $record['startTime'] && $fields['endTime'] > $record['startTime']) {
                    return $this->createJsonResponse('error');
                } elseif ($fields['startTime'] > $record['startTime'] && $fields['startTime'] < $record['endTime']) {
                    return $this->createJsonResponse('error');
                }
            }

        }

        return $this->createJsonResponse('success');
    }

    protected function getMeetingRecordService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRecordService');
    }

    protected function getMeetingRoomService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRoomService');
    }


    protected function getMeetingRecordStatisticService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRecordStatisticService');
    }
}
