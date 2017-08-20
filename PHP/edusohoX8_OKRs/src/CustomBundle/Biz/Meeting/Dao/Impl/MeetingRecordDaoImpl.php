<?php

namespace CustomBundle\Biz\Meeting\Dao\Impl;

use Codeages\Biz\Framework\Dao\GeneralDaoImpl;
use CustomBundle\Biz\Meeting\Dao\MeetingRecordDao;

class MeetingRecordDaoImpl extends GeneralDaoImpl implements MeetingRecordDao
{
    protected $table = 'meeting_record';

    public function upMeetingRecordSort()
    {
        $time = time();
        $sql = "UPDATE `meeting_record` SET `sort`=100000000000-`endTime` WHERE `startTime`< {$time}";
        $this->db()->executeUpdate($sql);
    }

    public function deleteByMeetingRoomId($id)
    {
        $this->db()->delete($this->table(), array('meetingRoomId' => $id));
    }

    public function declares()
    {
        return array(
            'orderbys' => array(
                'startTime',
                'endTime',
                'createdTime',
                'updatedTime',
                'id',
                'meetingRoomId',
                'sort'
            ),
            'timestamps' => array('createdTime', 'updatedTime'),
            'conditions' => array(
                'id = :id',
                'meetingRoomId = :meetingRoomId',
                'organizerId =:organizerId',
                'organizer IN (:organizers)',
                'id IN (:ids)',
                'updatedTime >= :updatedTime_GE',
                'name LIKE :name',
                'startTime = :startTime',
                'endTime =:endTime',
                'createdTime = :createdTime',
            ),
        );
    }
}
