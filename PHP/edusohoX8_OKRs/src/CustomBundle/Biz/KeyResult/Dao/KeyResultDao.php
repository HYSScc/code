<?php

namespace CustomBundle\Biz\KeyResult\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface KeyResultDao extends GeneralDaoInterface
{
    public function findKeyResult($goalId);

    public function deleteKeyResultByGoalId($goalId);

    public function updateKRName($KRId, $fields);
}