<?php

namespace CustomBundle\Biz\UserSectionGoal\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\UserSectionGoal\Service\UserSectionGoalService;
use CustomBundle\Biz\UserSectionGoal\Dao\UserSectionGoalDao;

class UserSectionGoalServiceImpl extends BaseService implements UserSectionGoalService
{
    public function findUserSectionGoals($usersInfo, $isSelfRated, $start, $limit)
    {
        $userIds = array();
        if (count($usersInfo) != 0) {
            for ($i = 0; $i <count($usersInfo); $i++) {
                $userId = $usersInfo[$i]['id'];
                $userIds[] = $userId;
            }
        } else {
            $userIds = array();
        }
        return $this->getUserSectionGoalDao()->findUserSectionGoals($userIds, $isSelfRated, $start, $limit);
    }

    public function createUserSectionGoal($userSectionGoal)
    {
        return $this->getUserSectionGoalDao()->create($userSectionGoal);
    }

    public function searchUserSectionGoals($conditions, $orderbys, $start, $limit)
    {
        return $this->getUserSectionGoalDao()->search($conditions, $orderbys, $start, $limit);
    }

    public function countUsersSectionGoal($conditions)
    {
        return $this->getUserSectionGoalDao()->count($conditions);
    }

    public function regroupObject($userSectionGoals)
    {
        $Objects = array();
        for ($i = 0; $i < count($userSectionGoals); $i++) {
            $userId = $userSectionGoals[$i]['userId'];
            $sectionGoalId = $userSectionGoals[$i]['sectionGoalId'];
            $sectionGoal = $this->getSectionGoalService()->getSectionGoal($sectionGoalId);
            $sectionGoalName = $sectionGoal['name'];
            $userInfo = $this->getUserService()->getUser($userId);
            $goals = $this->getGoalService()->findGoalsBySectionGoal($sectionGoalId, $userId);
            $post = $this->getPostService()->getPost($userInfo['postId'], '');
            $postName = $post['name'];
            $Object = array(
                'sectionGoal' => $sectionGoalName,
                'userInfo' => $userInfo,
                'postName' => $postName,
                'goals' => $goals
            );
            $Objects[] = $Object;
        }
        return $Objects;
    }

    protected function getUserSectionGoalDao()
    {
        return $this->createDao('CustomBundle:UserSectionGoal:UserSectionGoalDao');
    }

    protected function getUserService()
    {
        return $this->createService('CustomBundle:User:UserService');
    }

    protected function getGoalService()
    {
        return $this->createService('CustomBundle:Goal:GoalService');
    }

    protected function getPostService()
    {
        return $this->createService('CustomBundle:Post:PostService');
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }
}
