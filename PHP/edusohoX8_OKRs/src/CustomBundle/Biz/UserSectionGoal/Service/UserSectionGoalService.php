<?php

namespace CustomBundle\Biz\UserSectionGoal\Service;

interface UserSectionGoalService
{
    public function findUserSectionGoals($usersInfo, $isSelfRated, $start, $limit);

    public function countUsersSectionGoal($conditions);

    public function searchUserSectionGoals($conditions, $orderbys, $start, $limit);

    public function regroupObject($userSectionGoals);

    public function createUserSectionGoal($userSectionGoal);
}