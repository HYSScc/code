<?php

namespace CustomBundle\Tests\Meeting;

use Biz\BaseTestCase;

class MeetingRecordServiceTest extends BaseTestCase
{
    public function testCreateMeetingRecord()
    {
        $fields = $this->MeetingRecordFields('testName', 1);
        $result = $this->getMeetingRecordService()->createMeetingRecord($fields);
        $this->assertEquals($fields['name'], $result['name']);
    }

    /**
     *@expectedException \Codeages\Biz\Framework\Service\Exception\InvalidArgumentException
     **/
    public function testCreateMeetingRecordWithoutFields()
    {
        $fields = array(
            'remark' => '备注',
            'limitMin' => 2,
            'limitMax' => 25,
        );
        $result = $this->getMeetingRecordService()->createMeetingRecord($fields);
    }

    public function testUpdateMeetingRecord()
    {
        $fields = $this->MeetingRecordFields('testName', 1);
        $this->getMeetingRecordService()->createMeetingRecord($fields);
        $fields['name'] = 'testRecordName';
        $result = $this->getMeetingRecordService()->updateMeetingRecord($fields['id'], $fields);
        $this->assertEquals($fields['name'], $result['name']);
    }

    public function testGetMeetingRecord()
    {
        $fields = $this->MeetingRecordFields('testName', 1);
        $result = $this->getMeetingRecordService()->createMeetingRecord($fields);
        $result = $this->getMeetingRecordService()->getMeetingRecord($fields['id']);
        $this->assertEquals($fields['name'], $result['name']);
    }

    public function testDeleteMeetingRecord()
    {
        $fields = $this->MeetingRecordFields('testName', 1);
        $result = $this->getMeetingRecordService()->createMeetingRecord($fields);
        $result = $this->getMeetingRecordService()->deleteMeetingRecord($fields['id']);
        $result = $this->getMeetingRecordService()->getMeetingRecord($fields['id']);

        $this->assertNull($result);
    }

    public function testCountMeetingRecords()
    {
        $fields1 = $this->MeetingRecordFields('testName1', 1);
        $fields2 = $this->MeetingRecordFields('testName1', 2);
        $this->getMeetingRecordService()->createMeetingRecord($fields1);
        $this->getMeetingRecordService()->createMeetingRecord($fields2);
        $conditions = array(
            'name' => 'testName1',
        );
        $result = $this->getMeetingRecordService()->countMeetingRecords($conditions);
        $this->assertEquals(2, $result);
    }

    public function testSearchMeetingRecords()
    {
        $fields1 = $this->MeetingRecordFields('testName1', 1);
        $fields2 = $this->MeetingRecordFields('testName1', 2);
        $this->getMeetingRecordService()->createMeetingRecord($fields1);
        $this->getMeetingRecordService()->createMeetingRecord($fields2);
        $conditions = array(
            'name' => 'testName1',
        );
        $result = $this->getMeetingRecordService()->searchMeetingRecords($conditions, null, 0, 10);

        $this->assertEquals(2, count($result));
        $this->assertEquals($fields1['name'], $result[0]['name']);
    }

    public function testBuildCreateFields()
    {
        $fields = array(
            'id' => 1,
            'meetingTitle' => 'test',
            'categoryId' => 1,
            'userId' => 1,
            'dateSelect' => '2015-08-06',
            'startClock' => '10:00',
            'endClock' => '11:00',
            'meetingBrief' => 'test brief'
        );

        $fields = $this->getMeetingRecordService()->buildCreateFields($fields);

        $this->assertEquals('test', $fields['name']);
        $this->assertEquals(1, $fields['meetingRoomId']);
        $this->assertEquals(1438826400, $fields['startTime']);
        $this->assertEquals(1438830000, $fields['endTime']);

    }

    private function MeetingRecordFields($name, $id)
    {
        return array(
            'id' => $id,
            'name'=>$name,
            'meetingRoomId'=>1,
            'organizerId'=>1,
            'startTime'=>1111111111,
            'endTime'=>1111111111,
        );
    }

    protected function getMeetingRecordService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRecordService');
    }
}
