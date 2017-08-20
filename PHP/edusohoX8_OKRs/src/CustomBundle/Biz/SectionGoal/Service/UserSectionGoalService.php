<?php
namespace CustomBundle\Biz\SectionGoal\Service;

interface  UserSectionGoalService
{
    public function createUserSectionGoal($sectionGoal);

    public function deleteUserSectionGoals($sectionGoalId);

    public function getUserSectionGoal($id);

    public function findAllNotConfirmBySectionGoalId($sectionGoalId);

    public function findAllNotSelfRatedBySectionGoalId($sectionGoalId);
}
