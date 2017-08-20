<?php

namespace CustomBundle\Biz\Meeting\Dao;

interface MeetingRecordStatisticDao
{
    public function deleteByMeetingRoomId($id);

    public function deleteByMeetingRecordId($id);

    public function refreshMeetingRoomStatisticCode($code);

    public function getMeetingRoomStatisticCodeByRoomId($id);
}