<?php
namespace CustomBundle\Biz\SectionGoal\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\SectionGoal\Service\UserSectionGoalService;
use AppBundle\Common\ArrayToolkit;

class UserSectionGoalServiceImpl extends BaseService implements UserSectionGoalService{

    public function createUserSectionGoal($sectionGoal)
    {
        if (!$this->hasSectionGoalCreateRole()) {
            throw $this->createAccessDeniedException('You have no access to Section Goal Management');
        }
        return $this->getUserSectionGoalDao()->create($sectionGoal);
    }

    public function deleteUserSectionGoals($sectionGoalId)
    {
        if (!$this->hasSectionGoalCreateRole()) {
            throw $this->createAccessDeniedException('You have no access to Section Goal Management');
        }

        $result= $this->getUserSectionGoalDao()->deleteUserSectionGoals($sectionGoalId);

        return $result;
    }

    public function getUserSectionGoal($id)
    {
        return $this->getUserSectionGoalDao()->get($id);
    }

    public function findAllNotConfirmBySectionGoalId($sectionGoalId)
    {
        return $this->getUserSectionGoalDao()->findAllNotConfirmBySectionGoalId($sectionGoalId);
    }

    public function findAllNotSelfRatedBySectionGoalId($sectionGoalId)
    {
        return $this->getUserSectionGoalDao()->findAllNotSelfRatedBySectionGoalId($sectionGoalId);
    }

    public function hasSectionGoalCreateRole()
    {
        $user = $this->getCurrentUser();
        if (!$user->isLogin()) {
            return false;
        }

        return $user->hasPermission('admin_section_goal_create');
    }

    public function deleteUpdate($sectionGoalId, $userId)
    {
        return $this->getUserSectionGoalDao()->deleteUpdate($sectionGoalId, $userId);
    }

    public function addUpdate($sectionGoalId, $userId)
    {
        return $this->getUserSectionGoalDao()->addUpdate($sectionGoalId, $userId);
    }


    protected function getUserSectionGoalDao()
    {
        return $this->createDao('CustomBundle:SectionGoal:UserSectionGoalDao');
    }
}
