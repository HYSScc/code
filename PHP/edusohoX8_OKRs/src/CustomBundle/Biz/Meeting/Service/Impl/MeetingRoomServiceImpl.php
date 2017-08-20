<?php

namespace CustomBundle\Biz\Meeting\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\Meeting\Service\MeetingRoomService;
use AppBundle\Common\ArrayToolkit;
use Topxia\Service\Common\ServiceKernel;

class MeetingRoomServiceImpl extends BaseService implements MeetingRoomService
{
    public function createMeetingRoom($fields)
    {
        $this->validateMeetingRoomFields($fields);
        $fields = $this->filterFields($fields);

        if (!$this->hasMeetingRoomCreateRole()) {
            throw $this->createAccessDeniedException('You have no access to Meeting Room Management');
        }
        return $this->getMeetingRoomDao()->create($fields);
    }

    public function updateMeetingRoom($id, $fields)
    {
        $this->validateMeetingRoomFields($fields);
        $fields = $this->filterFields($fields);

        if (!$this->hasMeetingRoomCreateRole()) {
            throw $this->createAccessDeniedException('You have no access to Meeting Room Management');
        }

        return $this->getMeetingRoomDao()->update($id, $fields);
    }

    public function getMeetingRoom($id)
    {
        return $this->getMeetingRoomDao()->get($id);
    }

    public function deleteMeetingRoom($id)
    {
        $meetingRooms = $this->searchMeetingRooms(
            $conditions = array(),
            array('createdTime' => 'ASC'),
            0,
            PHP_INT_MAX
        );

        $meetingRoomNums = count($meetingRooms);

        $this->getMeetingRoomDao()->delete($id);

        $this->getMeetingRecordService()->deleteMeetingRecordWithInMeetingRoom($id,$meetingRoomNums);
    }

    public function countMeetingRooms(array $conditions)
    {
        return $this->getMeetingRoomDao()->count($conditions);
    }

    public function searchMeetingRooms($conditions, $sort, $start, $limit)
    {
        return $this->getMeetingRoomDao()->search($conditions, $sort, $start, $limit);
    }

    public function getByName($name)
    {
        return $this->getMeetingRoomDao()->getByName($name);
    }

    public function checkName($name)
    {
        $fields = $this->getByName($name);

        if ($fields) {
            return array('error_duplicate', $this->getKernel()->trans('名称已存在!'));
        }

        return array('success', '');
    }

    public function findMeetingRoomsByIds(array $ids)
    {
        $meetingRooms=$this->getMeetingRoomDao()->findByIds($ids);

        return ArrayToolkit::index($meetingRooms, 'id');
    }

    public function findMeetingRoomsByArrayToolkitColumn(array $array, $key)
    {
        $keys = ArrayToolkit::column($array, $key);
        return $this->findMeetingRoomsByIds($keys);
    }

    protected function validateMeetingRoomFields($fields)
    {
        if (!ArrayToolkit::requireds(
            $fields,
            array(
                'name',
                'limitMax',
                'limitMin',
                'remark',
            ))
        ) {
            throw $this->createInvalidArgumentException('Lack of required fields');
        }
    }

    public function hasMeetingRoomCreateRole()
    {
        $user = $this->getCurrentUser();
        if (!$user->isLogin()) {
            return false;
        }

        return $user->hasPermission('admin_meeting_room_create');
    }

    protected function filterFields($fields)
    {
        return ArrayToolkit::parts(
            $fields,
            array(
                'name',
                'limitMax',
                'limitMin',
                'remark',
                )
        );
    }

    protected function getKernel()
    {
        return ServiceKernel::instance();
    }

    protected function getMeetingRoomDao()
    {
        return $this->createDao('CustomBundle:Meeting:MeetingRoomDao');
    }

    protected function getMeetingRecordService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRecordService');
    }

    protected function getMeetingRecordStatisticService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRecordStatisticService');
    }
}
