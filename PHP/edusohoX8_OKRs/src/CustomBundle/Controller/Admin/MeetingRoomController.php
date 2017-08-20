<?php

namespace CustomBundle\Controller\Admin;

use Symfony\Component\HttpFoundation\Request;
use AppBundle\Controller\BaseController;
use AppBundle\Common\Paginator;

class MeetingRoomController extends BaseController
{
    public function indexAction(Request $request)
    {
        $conditions = $request->query->all();

        $meetingRoomCount = $this->getMeetingRoomService()->countMeetingRooms($conditions);
        $paginator = new Paginator(
            $this->get('request'),
            $meetingRoomCount,
            20
        );

        $meetingRooms = $this->getMeetingRoomService()->searchMeetingRooms(
            $conditions,
            array('createdTime' => 'DESC'),
            $paginator->getOffsetCount(),
            $paginator->getPerPageCount()
        );

        return $this->render('@Custom/admin/meeting-room/index.html.twig',
            array(
                'meetingRooms' => $meetingRooms,
                'paginator' => $paginator,
            ));
    }

    public function createAction(Request $request)
    {
        if ($request->getMethod() === 'POST') {
            $fields = $request->request->all();
            $this->getMeetingRoomService()->createMeetingRoom($fields);
        }

        return $this->render('@Custom/admin/meeting-room/meeting-room-create-modal.html.twig', array());
    }

    public function updateAction(Request $request, $id)
    {
        if ($request->getMethod() === 'POST') {
            $fields = $request->request->all();
            $result = $this->getMeetingRoomService()->updateMeetingRoom($id, $fields);

            return $this->createJsonResponse($result);
        }
        $meetingRoom = $this->getMeetingRoomService()->getMeetingRoom($id);
        if (empty($meetingRoom)) {
            throw $this->createNotFoundException();
        }

        return $this->render('@Custom/admin/meeting-room/meeting-room-create-modal.html.twig', array('meetingRoom' => $meetingRoom));
    }

    public function deleteAction(Request $request, $id)
    {
        $meetingRoom = $this->getMeetingRoomService()->getMeetingRoom($id);
        if (empty($meetingRoom)) {
            throw $this->createNotFoundException();
        }
        $result = $this->getMeetingRoomService()->deleteMeetingRoom($id);

        return $this->createJsonResponse($result);
    }

    public function nameCheckAction(Request $request, $id)
    {
        $name = $request->query->get('value');
        $result = $this->getMeetingRoomService()->getMeetingRoom($id);

        if ($result['name'] === $name) {
            list($result, $message) = array('success', '');
        } else {
            list($result, $message) = $this->getMeetingRoomService()->checkName($name);
        }

        return $this->validateResult($result, $message);
    }

    protected function validateResult($result, $message)
    {
        if ($result === 'success') {
            $response = array('success' => true, 'message' => '');
        } else {
            $response = array('success' => false, 'message' => $message);
        }

        return $this->createJsonResponse($response);
    }

    protected function getMeetingRoomService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRoomService');
    }
}
