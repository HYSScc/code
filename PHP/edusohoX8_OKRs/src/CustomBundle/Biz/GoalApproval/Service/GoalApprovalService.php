<?php

namespace CustomBundle\Biz\GoalApproval\Service;

interface GoalApprovalService
{

    public function searchHistories($goalIds, $status, $start, $limit);

    public function classifyUpdateHistory($oldInfo, $newInfo);

    public function classifyAddHistory($newInfo);

    public function classifyDeleteHistory($oldInfo, $newInfo);

    public function countHistory($status);

    public function updateHistoryByStatus($id, $status, $reason);

    public function getHistory($id);

    public function createHistory($history);

    public function addHistoryByAdjust($goalId, $oldInfo, $newInfo, $adjustReason);

    public function searchHistoryByGoalId($goalId);

    public function updateHistoryByAdjust($id, $fields);
}

