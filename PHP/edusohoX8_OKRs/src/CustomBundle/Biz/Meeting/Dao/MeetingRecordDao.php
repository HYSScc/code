<?php

namespace CustomBundle\Biz\Meeting\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface MeetingRecordDao extends GeneralDaoInterface
{
    public function upMeetingRecordSort();

    public function deleteByMeetingRoomId($id);
}
