<?php

namespace CustomBundle\Controller\Admin;

use Symfony\Component\HttpFoundation\Request;
use AppBundle\Controller\BaseController;
use AppBundle\Common\Paginator;

class MeetingRecordController extends BaseController
{
    public function indexAction(Request $request)
    {
        $conditions = $request->query->all();

        $meetingRecordCount = $this->getMeetingRecordService()->countMeetingRecords($conditions);
        $paginator = new Paginator(
            $this->get('request'),
            $meetingRecordCount,
            20
        );

        $meetingRecords = $this->getMeetingRecordService()->searchMeetingRecords(
            $conditions,
            array('sort' => 'ASC'),
            $paginator->getOffsetCount(),
            $paginator->getPerPageCount()
        );

        $organizers = $this->getUserService()->findUsersByArrayToolkitColumn($meetingRecords, 'organizerId');

        $meetingRooms = $this->getMeetingRoomService()->findMeetingRoomsByArrayToolkitColumn($meetingRecords, 'meetingRoomId');

        return $this->render('@Custom/admin/meeting-record/index.html.twig', array(
            'meetingRecords' => $meetingRecords,
            'organizers' => $organizers,
            'paginator' => $paginator,
            'meetingRooms' => $meetingRooms,
        ));
    }

    public function updateAction(Request $request, $id)
    {
        $user = $this->getCurrentUser();
        if ($request->getMethod() == 'POST') {
            $fields = $request->request->all();
            $fields['userId'] = $user['id'];
            $fields = $this->getMeetingRecordService()->buildCreateFields($fields);
            $result = $this->getMeetingRecordService()->updateMeetingRecord($id, $fields);

            return $this->createJsonResponse($result);
        }
        $meetingRooms = $this->getMeetingRoomService()->searchMeetingRooms(
            array(),
            array(),
            0,
            PHP_INT_MAX
        );
        $optionDate = $this->getOptionDates();
        $record = $this->getMeetingRecordService()->getMeetingRecord($id);
        $today = date('Y-m-d', $record['startTime']);
        $startClock = date('H:i', $record['startTime']);
        $endClock = date('H:i', $record['endTime']);

        return $this->render('@Custom/admin/meeting-record/meeting-record-update-modal.html.twig', array(
            'record' => $record,
            'dates' => $optionDate,
            'startClock' => $startClock,
            'endClock' => $endClock,
            'rooms' => $meetingRooms,
            'today' => $today,
        ));
    }

    private function getOptionDates()
    {
        $optionDate = array();
        for ($index = 0; $index < 7; ++$index) {
            $optionDate[] = date('Y-m-d', strtotime('+'.$index.' day'));
        }

        return $optionDate;
    }

    public function deleteAction(Request $request, $id)
    {
        $meetingRecord = $this->getMeetingRecordService()->getMeetingRecord($id);
        if (empty($meetingRecord)) {
            throw $this->createNotFoundException();
        }
        $result = $this->getMeetingRecordService()->deleteMeetingRecord($id);

        return $this->createJsonResponse($result);
    }

    protected function getMeetingRecordService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRecordService');
    }

    protected function getUserService()
    {
        return $this->createService('CustomBundle:User:UserService');
    }

    protected function getMeetingRoomService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRoomService');
    }
}
