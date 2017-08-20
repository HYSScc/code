<?php

namespace CustomBundle\Tests\SectionGoal;

use Biz\BaseTestCase;

class UserSectionGoalServiceTest extends BaseTestCase
{
    public function testCreateUserSectionGoal()
    {
        $userSectionGoal = $this->userSectionGoalFields(1, 1);
        $result = $this->getUserSectionGoalService()->createUserSectionGoal($userSectionGoal);
        $this->assertEquals($userSectionGoal['userId'], $result['userId']);
    }

    public function testGetSectionGoal()
    {
        $userSectionGoal = $this->userSectionGoalFields(1, 1);
        $result = $this->getUserSectionGoalService()->createUserSectionGoal($userSectionGoal);
        $result = $this->getUserSectionGoalService()->getUserSectionGoal(1);
        $this->assertEquals($userSectionGoal['sectionGoalId'], $result['sectionGoalId']);
    }

    public function testDeleteSectionGoal()
    {
        $userSectionGoal = $this->userSectionGoalFields(1, 1);
        $result = $this->getUserSectionGoalService()->createUserSectionGoal($userSectionGoal);
        $result = $this->getUserSectionGoalService()->deleteUserSectionGoals(1);
        $result = $this->getUserSectionGoalService()->getUserSectionGoal(1);

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

        $this->getUserSectionGoalService()->createUserSectionGoal($fields);
        $fields = array(
            'userId' => 1,
            'status' => 1,
            'sectionGoalId' => 1,
            'isSelfRated' => 1,
            'isGoalsCreated' => 0
        );
        $this->getUserSectionGoalService()->createUserSectionGoal($fields);
        $result = $this->getUserSectionGoalService()->findAllNotConfirmBySectionGoalId(1);

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

        $this->getUserSectionGoalService()->createUserSectionGoal($fields);
        $fields = array(
            'userId' => 1,
            'status' => 1,
            'sectionGoalId' => 1,
            'isSelfRated' => 0,
            'isGoalsCreated' => 1
        );
        $this->getUserSectionGoalService()->createUserSectionGoal($fields);
        $result = $this->getUserSectionGoalService()->findAllNotSelfRatedBySectionGoalId(1);

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
        $this->getUserSectionGoalService()->createUserSectionGoal($fields);
        $result = $this->getUserSectionGoalService()->deleteUpdate($fields['sectionGoalId'], $fields['userId']);
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
        $this->getUserSectionGoalService()->createUserSectionGoal($fields);
        $result = $this->getUserSectionGoalService()->addUpdate($fields['sectionGoalId'], $fields['userId']);
        $this->assertEquals(0, $result['isSelfRated']);
    }

    private function userSectionGoalFields($userId, $sectionGoalId)
    {
        return array(
            'userId' => $userId,
            'status' => '1',
            'sectionGoalId' => $sectionGoalId,
            'isSelfRated' => '0',
            'isGoalsCreated' => '0'
        );
    }

    protected function getUserSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:UserSectionGoalService');
    }
}
