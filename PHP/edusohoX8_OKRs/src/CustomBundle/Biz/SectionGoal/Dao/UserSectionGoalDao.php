<?php

namespace CustomBundle\Biz\SectionGoal\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface UserSectionGoalDao extends GeneralDaoInterface
{
    public function deleteUserSectionGoals($sectionGoalId);

    public function addUpdate($sectionGoalId, $userId);

    public function findAllNotConfirmBySectionGoalId($sectionGoalId);

    public function findAllNotSelfRatedBySectionGoalId($sectionGoalId);

    public function deleteUpdate($sectionGoalId, $userId);
}
