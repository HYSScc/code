<?php

namespace CustomBundle\Tests\Goal\Dao;

use Biz\BaseTestCase;

class GoalDaoTest extends BaseTestCase
{
    public function testFindBySectionGoalIdAndUserId()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '1'
        );
        $goal = $this->getGoalDao()->create($goal);
        $result = $this->getGoalDao()->findBySectionGoalIdAndUserId($goal['sectionGoalId'], $goal['userId']);
        $this->assertEquals($goal['name'], $result[0]['name']);
    }

    public function testUpdateGoal(){
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $goal = $this->getGoalDao()->create($goal);
        $newName = array('name' => '走路');
        $result = $this->getGoalDao()->updateGoal($goal['id'], $newName);
        $this->assertEquals($newName['name'], $result['name']);
    }

    public function testFindBySectionId()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $goal = $this->getGoalDao()->create($goal);
        $result = $this->getGoalDao()->findBySectionId($goal['sectionGoalId']);
        $this->assertEquals($goal, $result[0]);
    }

    public function testFindByUserIds()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $goal = $this->getGoalDao()->create($goal);
        $result = $this->getGoalDao()->findByUserIds(array(2));
        $this->assertEquals($goal['name'], $result[0]['name']);
    }

    protected function getGoalDao()
    {
        return $this->createDao('CustomBundle:Goal:GoalDao');
    }
}