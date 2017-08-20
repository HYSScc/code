<?php

namespace CustomBundle\Tests\Meeting;

use Biz\BaseTestCase;

class MeetingRoomServiceTest extends BaseTestCase
{
    public function testCreateMeetingRoom()
    {
        $fields = $this->meetingRoomFields('testName', 1);
        $result = $this->getMeetingRoomService()->createMeetingRoom($fields);
        $this->assertEquals($fields['name'], $result['name']);
    }

    /**
     *@expectedException \Codeages\Biz\Framework\Service\Exception\InvalidArgumentException
     **/
    public function testCreateMeetingRoomWithoutFields()
    {
        $fields = array(
            'remark' => '备注',
            'limitMin' => 2,
            'limitMax' => 25,
        );
        $result = $this->getMeetingRoomService()->createMeetingRoom($fields);
    }

    public function testUpdateMeetingRoom()
    {
        $fields = $this->meetingRoomFields('testName', 1);
        $this->getMeetingRoomService()->createMeetingRoom($fields);
        $fields['name'] = 'testRoomName';
        $result = $this->getMeetingRoomService()->updateMeetingRoom($fields['id'], $fields);
        $this->assertEquals($fields['name'], $result['name']);
    }

    public function testGetMeetingRoom()
    {
        $fields = $this->meetingRoomFields('testName', 1);
        $result = $this->getMeetingRoomService()->createMeetingRoom($fields);
        $result = $this->getMeetingRoomService()->getMeetingRoom($fields['id']);
        $this->assertEquals($fields['name'], $result['name']);
    }

    public function testDeleteMeetingRoom()
    {
        $fields = $this->meetingRoomFields('testName', 1);
        $result = $this->getMeetingRoomService()->createMeetingRoom($fields);
        $result = $this->getMeetingRoomService()->deleteMeetingRoom($fields['id']);
        $result = $this->getMeetingRoomService()->getMeetingRoom($fields['id']);

        $this->assertNull($result);
    }

    public function testCountMeetingRooms()
    {
        $fields1 = $this->meetingRoomFields('testName1', 1);
        $fields2 = $this->meetingRoomFields('testName1', 2);
        $this->getMeetingRoomService()->createMeetingRoom($fields1);
        $this->getMeetingRoomService()->createMeetingRoom($fields2);
        $conditions = array(
            'name' => 'testName1',
        );
        $result = $this->getMeetingRoomService()->countMeetingRooms($conditions);
        $this->assertEquals(2, $result);
    }

    public function testSearchMeetingRooms()
    {
        $fields1 = $this->meetingRoomFields('testName1', 1);
        $fields2 = $this->meetingRoomFields('testName1', 2);
        $this->getMeetingRoomService()->createMeetingRoom($fields1);
        $this->getMeetingRoomService()->createMeetingRoom($fields2);
        $conditions = array(
            'name' => 'testName1',
        );
        $result = $this->getMeetingRoomService()->searchMeetingRooms($conditions, null, 0, 10);

        $this->assertEquals(2, count($result));
        $this->assertEquals($fields1['name'], $result[0]['name']);
    }

    public function testGetByName()
    {
        $fields = $this->meetingRoomFields('testName1', 1);
        $this->getMeetingRoomService()->createMeetingRoom($fields);
        $result = $this->getMeetingRoomService()->getByname($fields['name']);
        $this->assertEquals($fields['name'], $result['name']);
    }

    public function testCheckName()
    {
        $fields = $this->meetingRoomFields('testName1', 'thisYear', 1);
        $this->getMeetingRoomService()->createMeetingRoom($fields);
        $this->getMeetingRoomService()->checkName('testName1');
        $fields = $this->getMeetingRoomService()->getMeetingRoom(1);
        $this->assertEquals('testName1', $fields['name']);
    }

    public function testFindMeetingRoomsByIds()
    {
        $fields1 = $this->meetingRoomFields('testName1', 1);
        $fields2 = $this->meetingRoomFields('testName2', 2);
        $this->getMeetingRoomService()->createMeetingRoom($fields1);
        $this->getMeetingRoomService()->createMeetingRoom($fields2);
        $result = $this->getMeetingRoomService()->findMeetingRoomsByIds(array(1, 2));
        $this->assertEquals(2, count($result));
        $this->assertEquals($fields1['name'], $result[1]['name']);
    }

    public function testFindMeetingRoomsByArrayToolkitColumn()
    {
        $fields1 = $this->meetingRoomFields('testName1', 1);
        $fields2 = $this->meetingRoomFields('testName2', 2);
        $this->getMeetingRoomService()->createMeetingRoom($fields1);
        $this->getMeetingRoomService()->createMeetingRoom($fields2);
        $fields[0] = $fields1;
        $fields[1] = $fields2;
        $result = $this->getMeetingRoomService()->findMeetingRoomsByArrayToolkitColumn($fields, 'id');
        $result = array_keys($result);
        $this->assertEquals(2, count($result));
        $this->assertContains($fields1['id'], $result);
        $this->assertContains($fields2['id'], $result);
    }

    private function meetingRoomFields($name, $id)
    {
        return array(
            'id' => $id,
            'name' => $name,
            'remark' => '备注',
            'limitMin' => 2,
            'limitMax' => 25,
        );
    }

    protected function getMeetingRoomService()
    {
        return $this->createService('CustomBundle:Meeting:MeetingRoomService');
    }
}
