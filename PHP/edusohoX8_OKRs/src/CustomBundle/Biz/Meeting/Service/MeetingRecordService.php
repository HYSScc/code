<?php

namespace CustomBundle\Biz\Meeting\Service;

interface MeetingRecordService
{
    public function createMeetingRecord($fields);

    public function updateMeetingRecord($id, $fields);

    public function getMeetingRecord($id);

    public function deleteMeetingRecord($id);

    public function deleteMeetingRecordWithInMeetingRoom($id,$meetingRoomNums);

    public function countMeetingRecords(array $conditions);

    public function searchMeetingRecords($conditions, $sort, $start, $limit);

    public function buildCreateFields($fields);
}
