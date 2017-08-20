<?php

namespace CustomBundle\Tests\UserSectionGoal;

use Biz\BaseTestCase;

class UserSectionGoalServiceTest extends BaseTestCase
{

    public function testSearchUserSectionGoals()
    {
        $UserSectionGoal = array(
            'id' => '1',
            'userId' => '2',
            'sectionGoalId' => '33'
        );

        $userInfos = array(
            array('id' => '1'),
            array('id' => '2')
        );
        $isSelfRated = '';
        $start = 0;
        $limit = 20;
        $goal = $this->getUserSectionGoalService()->createUserSectionGoal($UserSectionGoal);
        $result = $this->getUserSectionGoalService()->findUserSectionGoals($userInfos, $isSelfRated, $start, $limit);
        $this->assertEquals($UserSectionGoal['userId'], $result[0]['userId']);
    }

    public function testCreateUserSectionGoal()
    {
        $UserSectionGoal = array(
            'id' => '1',
            'userId' => '2',
            'sectionGoalId' => '33'
        );

        $goal = $this->getUserSectionGoalService()->createUserSectionGoal($UserSectionGoal);
        $this->assertEquals($UserSectionGoal['id'], $goal['id']);
    }

    public function testCountUsersSectionGoal()
    {
        $conditions = array('status' => 0);

        $UserSectionGoal = array(
            'id' => '1',
            'userId' => '2',
            'sectionGoalId' => '33'
        );

        $goal = $this->getUserSectionGoalService()->createUserSectionGoal($UserSectionGoal);
        $result = $this->getUserSectionGoalService()->countUsersSectionGoal($conditions);
        $this->assertEquals(1, $result);
    }

    public function testFindUserSectionGoals()
    {
        $conditions = array(
            'status' => 0
        );
        $UserSectionGoal = array(
            'id' => '1',
            'userId' => '2',
            'sectionGoalId' => '33'
        );
        $start = 0;
        $limit = 20;
        $goal = $this->getUserSectionGoalService()->createUserSectionGoal($UserSectionGoal);
        $result = $this->getUserSectionGoalService()->searchUserSectionGoals($conditions, array(), $start, $limit);
        $this->assertEquals(2, $result[0]['userId']);
    }

    public function testRegroupObject()
    {
        $userSectionGoals = array(
            array(
                'userId' => '2',
                'sectionGoalId' => '1'
            )
        );
        $UserSectionGoal = array(
            'id' => '1',
            'userId' => '2',
            'sectionGoalId' => '1'
        );
        $goal = $this->getUserSectionGoalService()->createUserSectionGoal($UserSectionGoal);
        $result = $this->getUserSectionGoalService()->regroupObject($userSectionGoals);
        $this->assertEquals('', $result[0]['userInfo']['id']);
    }

    public function getUserSectionGoalService()
    {
        return $this->createService('CustomBundle:UserSectionGoal:UserSectionGoalService');
    }
}
