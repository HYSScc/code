<?php

namespace CustomBundle\Biz\GoalApproval\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface GoalApprovalDao extends GeneralDaoInterface
{
	public function findByGoalIds($goalId);
}