<?php

namespace CustomBundle\Biz\GoalApproval\Dao\Impl;

use CustomBundle\Biz\GoalApproval\Dao\GoalApprovalDao;
use Codeages\Biz\Framework\Dao\GeneralDaoImpl;

class GoalApprovalDaoImpl extends GeneralDaoImpl implements GoalApprovalDao
{
    protected $table = 'goal_approval_history';

    public function findByGoalIds($goalId)
    {
    	return $this->findInField('goalId', array($goalId));
    }

    public function declares()
    {
        return array(
            'timestamps' => array(
                'createdTime',
                'updatedTime',
            ),
            'orderbys' => array(
                'id',
            ),
            'conditions' => array(
                'goalId in (:goalId)',
                'id = :id',
                'createdTime = :createdTime',
                'updatedTime = :updatedTime',
                'oldInfo = :oldInfo',
                'newInfo = :newInfo',
                'status = :status',
                'adjustReason = :adjustReason',
                'rejectReason = :rejectReason',
            ),
        );
    }
}