<?php

namespace CustomBundle\Biz\KeyResult\Dao\Impl;

use CustomBundle\Biz\KeyResult\Dao\KeyResultDao;
use Codeages\Biz\Framework\Dao\GeneralDaoImpl;

class KeyResultDaoImpl extends GeneralDaoImpl implements KeyResultDao
{
    protected $table = 'key_result';

    public function findKeyResult($goalId)
    {
        return $this->findByFields(array('goalId' => $goalId));
    }

    public function deleteKeyResultByGoalId($goalId)
    {
        return $this->db()->delete($this->table(), array('goalId' => $goalId));
    }

    public function updateKRName($KRId, $fields)
    {
        return $this->updateById($KRId, $fields);
    }
    
    public function declares()
    {
        return array(
            'timestamps' => array(
                'createdTime',
                'updatedTime',
            ),
            'conditions' => array(
                'goalId = :goalId',
                'id = :id',
                'name = :name',
                'createdTime = :createdTime',
                'updatedTime = :updatedTime',
            ),
        );
    }
}