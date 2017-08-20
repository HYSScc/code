<?php

namespace CustomBundle\Tests\SectionGoal\Dao;

use Biz\BaseTestCase;

class UserSectionGoalDaoTest extends BaseTestCase
{
    public function testDeleteUserSectionGoals()
    {
        $expected = array(
            'userId' => 1,
            'status' => '1',
            'sectionGoalId' => 1,
            'isSelfRated' => '0',
            'isGoalsCreated' => '0'
        );
        $result = $this->getUserSectionGoalDao()->create($expected);
        $this->getUserSectionGoalDao()->deleteUserSectionGoals(1);
        $result = $this->getUserSectionGoalDao()->get(1);
        $this->assertNull($result);
    }

    public function testFindAllNotConfirmBySectionGoalId()
    {
        $fields = array(
            'userId' => 1,
            'status' => 1,
            'sectionGoalId' => 1,
            'isSelfRated' => 1,
            'isGoalsCreated' => 1
        );

        $this->getUserSectionGoalDao()->create($fields);
        $fields = array(
            'userId' => 1,
            'status' => 1,
            'sectionGoalId' => 1,
            'isSelfRated' => 1,
            'isGoalsCreated' => 0
        );
        $this->getUserSectionGoalDao()->create($fields);
        $result = $this->getUserSectionGoalDao()->findAllNotConfirmBySectionGoalId(1);

        $this->assertEquals(1, count($result));

    }

    public function testFindAllNotSelfRatedBySectionGoalId()
    {
        $fields = array(
            'userId' => 1,
            'status' => 1,
            'sectionGoalId' => 1,
            'isSelfRated' => 1,
            'isGoalsCreated' => 1
        );

        $this->getUserSectionGoalDao()->create($fields);
        $fields = array(
            'userId' => 1,
            'status' => 1,
            'sectionGoalId' => 1,
            'isSelfRated' => 0,
            'isGoalsCreated' => 1
        );
        $this->getUserSectionGoalDao()->create($fields);
        $result = $this->getUserSectionGoalDao()->findAllNotSelfRatedBySectionGoalId(1);

        $this->assertEquals(1, count($result));

    }

    public function testDeleteUpdate()
    {
        $fields = array(
            'userId' => 1,
            'status' => 1,
            'sectionGoalId' => 1,
            'isSelfRated' => 1,
            'isGoalsCreated' => 1
        );
        $this->getUserSectionGoalDao()->create($fields);
        $result = $this->getUserSectionGoalDao()->deleteUpdate($fields['sectionGoalId'], $fields['userId']);
        $this->assertEquals(0, $result['isGoalsCreated']);
    }

    public function testAddUpdate()
    {
        $fields = array(
            'userId' => 1,
            'status' => 1,
            'sectionGoalId' => 1,
            'isSelfRated' => 1,
            'isGoalsCreated' => 0
        );
        $this->getUserSectionGoalDao()->create($fields);
        $result = $this->getUserSectionGoalDao()->addUpdate($fields['sectionGoalId'], $fields['userId']);
        $this->assertEquals(0, $result['isSelfRated']);
    }

    protected function getUserSectionGoalDao()
    {
        return $this->createDao('CustomBundle:SectionGoal:UserSectionGoalDao');
    }
}
