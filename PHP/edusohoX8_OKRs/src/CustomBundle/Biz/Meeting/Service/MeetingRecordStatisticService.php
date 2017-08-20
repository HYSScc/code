<?php

namespace CustomBundle\Biz\Meeting\Service;

interface MeetingRecordStatisticService
{
    public function createMeetingRecordStatistic($fields);

    public function updateMeetingRecordStatistic($id, $fields);

    public function getMeetingRecordStatistic($id);

    public function deleteMeetingRecordStatistic($id, $params);

    public function searchMeetingRecordsStatistic($conditions, $sort, $start, $limit);

    public function getIndexTime($period);

    public function getMeetingRoomStatisticCodeByRoomId($id);

    public function reOrderingMeetingRoomStatisticCode($meetingRoomId,$meetingRoomNums);
}