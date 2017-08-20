<?php
/**
 * Created by PhpStorm.
 * User: ccl
 * Date: 17-8-9
 * Time: 下午9:46
 */
namespace CustomBundle\Tests\UserSectionGoal\Dao;

use Biz\BaseTestCase;

class UserSectionGoalDaoTest extends BaseTestCase
{
    public function testSearchUserSectionGoals()
    {
        $goal = array(
            'id' => '1',
            'userId' => '2',
            'sectionGoalId' => '3'
        );
        $userIds = array(2);
        $isSelfRated = '0';
        $start = '0';
        $limit = '20';
        $goal = $this->getUserSectionGoalDao()->create($goal);
        $result = $this->getUserSectionGoalDao()->findUserSectionGoals($userIds, $isSelfRated, $start, $limit);
        $this->assertEquals($goal['userId'], $result[0]['userId']);
    }

    public function getUserSectionGoalDao()
    {
        return $this->createDao('CustomBundle:UserSectionGoal:UserSectionGoalDao');
    }
}