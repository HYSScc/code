<?php

namespace CustomBundle\Biz\Goal\Dao\Impl;

use CustomBundle\Biz\Goal\Dao\GoalDao;
use Codeages\Biz\Framework\Dao\GeneralDaoImpl;

class GoalDaoImpl extends GeneralDaoImpl implements GoalDao
{
    protected $table = 'goal';

    public function findBySectionGoalIdAndUserId($sectionGoalId, $userId)
    {
        return $this->findByFields(array('sectionGoalId' => $sectionGoalId, 'userId' => $userId));
    }

    public function updateGoal($goalId, $fields)
    {
        return $this->updateById($goalId, $fields);
    }

    public function findByUserIds($userIds)
    {
        return $this->findInField('userId', $userIds);
    }

    public function findBySectionId($sectionGoalId)
    {
        $files = array('sectionGoalId' => $sectionGoalId);
        return $this->findByFields($files);
    }

    public function declares()
    {
        return array(
            'timestamps' => array(
                'createdTime',
                'updatedTime',
            ),
            'conditions' => array(
                'id = :id',
                'sectionGoalId = :sectionGoalId',
                'name = :name',
                'createdTime = :createdTime',
                'updatedTime = :updatedTime',
                'adjustReason = :adjustReason',
                'approvingKrInfo = :approvingKrInfo',
            ),
        );
    }

}