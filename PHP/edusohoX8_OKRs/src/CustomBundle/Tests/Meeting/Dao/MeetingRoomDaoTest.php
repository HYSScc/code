<?php

namespace CustomBundle\Tests\Meeting\Dao;

use Biz\BaseTestCase;

class MeetingRoomDaoTest extends BaseTestCase
{
    public function testGetByName()
    {
        $fields = array(
            'name' => 'testName',
            'remark' => '备注',
            'limitMin' => 2,
            'limitMax' => 25,
        );
        $result = $this->getMeetingRoomDao()->create($fields);
        $this->getMeetingRoomDao()->getByName($fields['name']);
        $this->assertEquals($fields['name'], $result['name']);
    }

    public function testFindByIds()
    {
        $fields1 = array(
            'name' => 'testName1',
            'remark' => '备注',
            'limitMin' => 2,
            'limitMax' => 25,
        );
        $fields2 = array(
            'name' => 'testName',
            'remark' => '备注',
            'limitMin' => 2,
            'limitMax' => 25,
        );
        $this->getMeetingRoomDao()->create($fields1);
        $this->getMeetingRoomDao()->create($fields2);
        $result = $this->getMeetingRoomDao()->findByIds(array(1, 2));
        $this->assertEquals($fields1['name'], $result[0]['name']);
        $this->assertEquals($fields2['name'], $result[1]['name']);
    }

    protected function getMeetingRoomDao()
    {
        return $this->createDao('CustomBundle:Meeting:MeetingRoomDao');
    }
}
