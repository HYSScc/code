<?php

namespace CustomBundle\Biz\Goal\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface GoalDao extends GeneralDaoInterface
{
    public function findBySectionGoalIdAndUserId($sectionGoalId, $userId);

    public function updateGoal($goalId, $fields);

    public function findByUserIds($userIds);

    public function findBySectionId($sectionGoalId);
}