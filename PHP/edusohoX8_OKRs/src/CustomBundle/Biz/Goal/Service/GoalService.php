<?php

namespace CustomBundle\Biz\Goal\Service;

interface GoalService
{
    public function getGoal($id);

    public function addGoal($id, $sectionGoalId, $goalName);

    public function findGoalsBySectionGoal($sectionGoalId, $userId);

    public function updateGoalName($goalId, $goalName);

    public function deleteGoal($goalId);

    public function findGoalsByUserIds($userIds);

    public function updataGoal($id, $field);

    public function findGoalsBySectionId($sectionGoalId);

    public function getSectionGoalIdByGoal($goalId);

    public function addKrToGoal($goalId, $krName, $krReason);

    public function updateKrToGoal($krId, $krName, $krReason);

    public function deleteKrToGoal($krId, $krReason);

    public function addHistoryThroughAdd($goalId, $krName, $krReason);

    public function addHistoryThroughUpdate($krId, $krName, $krReason);

    public function addHistoryThroughDelete($krId, $krReason);
}