<?php

namespace CustomBundle\Biz\SectionGoal\Dao\Impl;

use CustomBundle\Biz\SectionGoal\Dao\UserSectionGoalDao;
use Codeages\Biz\Framework\Dao\GeneralDaoImpl;

class UserSectionGoalDaoImpl extends GeneralDaoImpl implements UserSectionGoalDao
{
    protected $table = 'user_section_goal';

    public function deleteUserSectionGoals($sectionGoalId)
    {
        return $this->db()->delete($this->table(), array('sectionGoalId' => $sectionGoalId));
    }

    public function addUpdate($sectionGoalId, $userId)
    {
        return $this->updateByConditions(
            array(
                'sectionGoalId' => $sectionGoalId,
                'userId' => $userId
            ),
            array('isSelfRated' => 0,
                'isGoalsCreated' => 1
            )
        );
    }

    public function deleteUpdate($sectionGoalId, $userId)
    {
        return $this->updateByConditions(
            array(
                'sectionGoalId' => $sectionGoalId,
                'userId' => $userId
            ),
            array(
                'isSelfRated' => 0,
                'isGoalsCreated' => 0
            )
        );
    }

    public function findAllNotConfirmBySectionGoalId($sectionGoalId)
    {
        $sql = "SELECT * FROM {$this->table()} WHERE sectionGoalId = ? AND isGoalsCreated = 0";

        return $this->db()->fetchAll($sql, array($sectionGoalId)) ?: array();
    }

    public function findAllNotSelfRatedBySectionGoalId($sectionGoalId)
    {
        $sql = "SELECT * FROM {$this->table()} WHERE sectionGoalId = ? AND isSelfRated = 0";

        return $this->db()->fetchAll($sql, array($sectionGoalId)) ?: array();
    }

    public function declares()
    {
        return array(
            'orderbys' => array(
                'createdTime',
                'updatedTime',
                'id'
            ),
            'timestamps' => array('createdTime', 'updatedTime'),
            'conditions' => array(
                'status = :status',
                'sectionGoalId = :sectionGoalId',
                'isSelfRated = :isSelfRated',
                'isSelfRated = :isSelfRated',
                'isGoalsCreated = :isGoalsCreated',
                'id IN (:ids)',
                'name LIKE :name',
                'createdTime = :createdTime'
            ),
        );
    }
}
