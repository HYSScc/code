<?php

namespace CustomBundle\Tests\Meeting\Dao;

use Biz\BaseTestCase;

class MeetingRecordDaoTest extends BaseTestCase
{
    public function testUpdateMeetingRecordSort()
    {
        $fields1 = array(
            'name' => '301',
            'meetingRoomId' => 1,
            'organizerId' => 1,
            'startTime' => 1111111111,
            'endTime' => 1111111111,
            'sort' => 0,
        );
        $fields2 = array(
            'name' => '301',
            'meetingRoomId' => 1,
            'organizerId' => 1,
            'startTime' => 1111111111,
            'endTime' => 1111111111,
            'sort' => 0,
        );
        $this->getMeetingRecordDao()->create($fields1);
        $this->getMeetingRecordDao()->create($fields2);
        $this->getMeetingRecordDao()->upMeetingRecordSort();
        $result = $this->getMeetingRecordDao()->search(array(), array(), 0, PHP_INT_MAX);
        $this->assertEquals(100000000000 - 1111111111, $result[0]['sort']);
        $this->assertEquals(100000000000 - 1111111111, $result[1]['sort']);
    }

    protected function getMeetingRecordDao()
    {
        return $this->createDao('CustomBundle:Meeting:MeetingRecordDao');
    }
}
