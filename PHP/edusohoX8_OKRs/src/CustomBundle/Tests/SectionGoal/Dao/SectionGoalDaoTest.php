<?php

namespace CustomBundle\Tests\SectionGoal\Dao;

use Biz\BaseTestCase;

class SectionGoalDaoTest extends BaseTestCase
{
    public function testGetByName()
    {
        $sectionGoal = array(
            'id' => 1,
            'year' => 2017,
            'startTime' => '1111111111',
            'confirmEndTime' => '1111111111',
            'adjustStartTime' => '1111111111',
            'adjustEndTime' => '1111111111',
            'selfRatingEndTime' => '1111111111',
            'name' => '第一季度',
            'othersRatingEndTime' => '1111111111'
        );
        $result = $this->getSectionGoalDao()->create($sectionGoal);
        $this->getSectionGoalDao()->getByName($sectionGoal['name']);
        $this->assertEquals($sectionGoal['name'], $result['name']);
    }

    public function testGetByYear()
    {
        $sectionGoal = array(
            'year' => '2017',
            'name' => '减肥',
            'startTime' => '0',
            'confirmEndTime' => '0'
        );
        $sectionGoal = $this->getSectionGoalDao()->create($sectionGoal);
        $result = $this->getSectionGoalDao()->getByYear($sectionGoal['year']);
        $this->assertEquals($sectionGoal['name'], $result[0]['name']);
    }

    protected function getSectionGoalDao()
    {
        return $this->createDao('CustomBundle:SectionGoal:SectionGoalDao');
    }
}
