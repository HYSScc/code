<?php

namespace CustomBundle\Biz\KeyResult\Service;

interface KeyResultService
{   
    public function createKr($kr);
    
    public function findByGoalId($goalId);

    public function findKRsInfo($KRsInfo);

    public function addKeyResult($id, $name);

    public function updateKRs($KRs);

    public function addKRs($KRs, $goalId);

    public function deleteKRs($KRs);

    public function operateKRs($updateInfo, $addInfo, $deleteInfo, $goalId, $status);

    public function findKRs($goalId);

    public function deleteKeyResultByGoalId($goalId);

    public function deleteKeyResult($id);

    public function updateKRName($KRId, $editKRName);

    public function getKeyResult($KRId);
}