<?php

namespace CustomBundle\Biz\SectionGoal\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\SectionGoal\Service\SectionGoalService;
use AppBundle\Common\ArrayToolkit;
use Topxia\Service\Common\ServiceKernel;

class SectionGoalServiceImpl extends BaseService implements SectionGoalService
{
    public function findSectionGoalByYear($year)
    {
        return $this->getSectionGoalDao()->getByYear($year);
    }

    public function createSectionGoal($sectionGoal)
    {
        $this->validateSectionGoalFields($sectionGoal);
        $sectionGoal = $this->filterFields($sectionGoal);
        $sectionGoal = $this->conversionTime($sectionGoal, array());

        if ($sectionGoal['year'] === 'thisYear') {
            $sectionGoal['year'] = date('Y', time());
        } else {
            $sectionGoal['year'] = date('Y', time()) + 1;
        }

        if (!$this->hasSectionGoalCreateRole()) {
            throw $this->createAccessDeniedException('You have no access to Section Goal Management');
        }

        $result = $this->getSectionGoalDao()->create($sectionGoal);
        $this->createUserSectionGoal($result['id']);

        return $result;
    }

    public function updateSectionGoal($id, $sectionGoal)
    {
        $result = $this->getSectionGoal($id);
        $sectionGoal['year'] = $result['year'];
        $sectionGoal = $this->conversionTime($sectionGoal, array());
        $sectionGoal = $this->filterFields($sectionGoal);
        if (!$this->hasSectionGoalCreateRole()) {
            throw $this->createAccessDeniedException('You have no access to Section Goal Management');
        }

        return $this->getSectionGoalDao()->update($id, $sectionGoal);
    }

    public function deleteSectionGoal($id)
    {
        if (!$this->hasSectionGoalCreateRole()) {
            throw $this->createAccessDeniedException('You have no access to Section Goal Management');
        }

        $result = $this->getSectionGoalDao()->delete($id);
        $this->deleteUserSectionGoal($id);

        return $result;
    }

    public function getSectionGoal($id) 
    {
        return $this->getSectionGoalDao()->get($id);
    }

    public function getByName($name)
    {
        return $this->getSectionGoalDao()->getByName($name);
    }

    public function checkName($name)
    {
        $sectionGoal = $this->getByName($name);

        if ($sectionGoal) {
            return array('error_duplicate', $this->getKernel()->trans('名称已存在!'));
        }

        return array('success', '');
    }

    public function countSectionGoals(array $conditions)
    {
        return $this->getSectionGoalDao()->count($conditions);
    }

    public function searchSectionGoals($conditions, $sort, $start, $limit)
    {
        return $this->getSectionGoalDao()->search($conditions, $sort, $start, $limit);
    }

    protected function validateSectionGoalFields($fields)
    {
        if (!ArrayToolkit::requireds($fields,
            array(
                'year',
                'startTime',
                'confirmEndTime',
                'adjustStartTime',
                'adjustEndTime',
                'selfRatingEndTime',
                'name',
                'othersRatingEndTime',
            ))
        ) {
            throw $this->createInvalidArgumentException('Lack of required fields');
        }
    }

    protected function createUserSectionGoal($id)
    {
        $users = $this->getUserService()->searchUsers(array(), array(), 0, PHP_INT_MAX);
        foreach ($users as $user) {
            $userSectionGoal = array(
                'userId' => $user['id'],
                'status' => $user['locked'], 
                'sectionGoalId' => $id,
                'isSelfRated' => '0',
                'isGoalsCreated' => '0',
            );
            $this->getUserSectionGoalService()->createUserSectionGoal($userSectionGoal);
        }
    }

    protected function deleteUserSectionGoal($id)
    {
        $this->getUserSectionGoalService()->deleteUserSectionGoals($id);
    }

    protected function conversionTime($data, $sectionGoal)
    {
        $timeFields = array(
            'startTime',
            'confirmEndTime',
            'adjustStartTime',
            'adjustEndTime',
            'selfRatingEndTime',
            'othersRatingEndTime',
        );

        foreach ($timeFields as & $timeField) {
            if (array_key_exists($timeField, $data)) {
                $data[$timeField] = strtotime($data[$timeField]);
            } else {
                $data[$timeField] = $sectionGoal[$timeField];
            }
        }

        return $data;
    }

    public function hasSectionGoalCreateRole()
    {
        $user = $this->getCurrentUser();
        if (!$user->isLogin()) {
            return false;
        }

        return $user->hasPermission('admin_section_goal_create');
    }

    protected function filterFields($fields)
    {
        return ArrayToolkit::parts(
            $fields,
            array(
                'year',
                'startTime',
                'confirmEndTime',
                'adjustStartTime',
                'adjustEndTime',
                'selfRatingEndTime',
                'name',
                'othersRatingEndTime',
            )
        );
    }

    public function findGoalsBySectionGoals($sectionGoals, $userId)
    {
        $allGoals = array();
        for ($i = 0; $i < count($sectionGoals); $i++) {
            $sectionGoalId = $sectionGoals[$i]['id'];
            $sectionGoal = $this->getSectionGoal($sectionGoalId);
            $goals = $this->getGoalService()->findGoalsBySectionGoal($sectionGoalId, $userId);
            $goalArray = array(
                'sectionGoal' => $sectionGoal,
                'goals' => $goals
            );
            $allGoals[] = $goalArray;
        }
        return $allGoals;
    }

    public function inAdjustingTime($sectionGoalId)
    {
        $sectionGoal = $this->getSectionGoalDao()->get($sectionGoalId);
        $startTime = $sectionGoal['startTime'];
        $confirmEndTime = $sectionGoal['confirmEndTime'];
        if ($startTime < time() && time() < $confirmEndTime) {
            return true;
        } else {
            return false;
        }
    }

    public function inAdjustTime($sectionGoalId)
    {
        $sectionGoal = $this->getSectionGoalDao()->get($sectionGoalId);
        $adjustStartTime = $sectionGoal['adjustStartTime'];
        $adjustEndTime = $sectionGoal['adjustEndTime'];
        return $adjustStartTime < time() && time() < $adjustEndTime;
    }

    protected function getKernel()
    {
        return ServiceKernel::instance();
    }

    protected function getSectionGoalDao()
    {
        return $this->createDao('CustomBundle:SectionGoal:SectionGoalDao');
    }

    protected function getUserSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:UserSectionGoalService');
    }

    protected function getUserService()
    {
        return $this->createService('User:UserService');
    }

    protected function getGoalService()
    {
        return $this->createService('CustomBundle:Goal:GoalService');
    }
}
