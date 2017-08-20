<?php

namespace CustomBundle\Biz\UserSectionGoal\Dao\Impl;

use Codeages\Biz\Framework\Dao\GeneralDaoImpl;
use CustomBundle\Biz\UserSectionGoal\Dao\UserSectionGoalDao;
use Codeages\Biz\Framework\Context\Biz;

class UserSectionGoalDaoImpl extends GeneralDaoImpl implements UserSectionGoalDao
{
    protected $table = 'user_section_goal';

    public function findUserSectionGoals($userIds, $isSelfRated, $start, $limit)
    {
        $results = array();
        if (count($userIds) == 0) {
            $results = array();
        } else {
            if($isSelfRated == '') {
                $conditions = array(
                    'status' => '0',
                    'userIds' => $userIds
                );
                $results = $this->search($conditions, array(), $start, $limit);
            } else {
                $conditions = array(
                    'status' => '0',
                    'userIds' => $userIds,
                    'isSelfRated' => $isSelfRated
                );
                $results = $this->search($conditions, array(), $start, $limit);
            }
        }
        return $results;
    }

    public function declares()
    {
        return array(
            'orderbys' => array(
                'id',
                'createdTime',
                'updatedTime',
            ),
            'conditions' => array(
                'userId  IN ( :userIds)',
                'isSelfRated = :isSelfRated',
                'sectionGoalId = :sectionGoalId',
                'status = :status',
            )
        );
    }
}