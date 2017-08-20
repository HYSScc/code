<?php

namespace CustomBundle\Biz\Meeting\Service;

interface MeetingRoomService
{
    public function createMeetingRoom($fields);

    public function updateMeetingRoom($id, $fields);

    public function getMeetingRoom($id);

    public function deleteMeetingRoom($id);

    public function countMeetingRooms(array $conditions);

    public function searchMeetingRooms($conditions, $sort, $start, $limit);

    public function getByName($name);

    public function checkName($name);

    public function findMeetingRoomsByIds(array $ids);

    public function findMeetingRoomsByArrayToolkitColumn(array $array, $key);
}
