<?php

namespace CustomBundle\Biz\UserSectionGoal\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface UserSectionGoalDao extends GeneralDaoInterface
{
    public function findUserSectionGoals($userIds, $isSelfRated, $start, $limit);
}