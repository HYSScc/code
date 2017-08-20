<?php

namespace CustomBundle\Biz\Meeting\Dao\Impl;

use Codeages\Biz\Framework\Dao\GeneralDaoImpl;
use CustomBundle\Biz\Meeting\Dao\MeetingRecordStatisticDao;

class MeetingRecordStatisticDaoImpl extends GeneralDaoImpl implements MeetingRecordStatisticDao
{
    protected $table = 'meeting_record_statistic';

    public function deleteByMeetingRoomId($id)
    {
        $this->db()->delete($this->table(), array('meetingRoomId' => $id));
    }

    public function deleteByMeetingRecordId($id)
    {
        $this->db()->delete($this->table(), array('meetingRecordId' => $id));
    }

    public function refreshMeetingRoomStatisticCode($code)
    {
        $sql = "UPDATE $this->table SET meetingRoomStatisticCode = ($code-1) WHERE meetingRoomStatisticCode = $code";

        $this->db()->executeUpdate($sql);
    }

    public function getMeetingRoomStatisticCodeByRoomId($id)
    {
        $sql = "SELECT meetingRoomStatisticCode FROM $this->table WHERE meetingRoomId = $id LIMIT 1";

        $data = $this->db()->fetchArray($sql);

        return (int)$data['0'];
    }

    public function declares()
    {
        return array(
            'orderbys' => array(
                'meetingRecordId',
                'createdTime',
                'updatedTime',
             ),
            'timestamps' => array('createdTime', 'updatedTime'),
            'conditions' => array(
                'id = :id',
                'meetingRecordId IN (:meetingRecordIds)',
                'meetingDate = :date',
            ),
        );
    }
}