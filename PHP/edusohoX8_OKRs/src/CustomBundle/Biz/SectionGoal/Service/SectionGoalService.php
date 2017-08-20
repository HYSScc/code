<?php

namespace CustomBundle\Biz\SectionGoal\Service;

interface SectionGoalService
{
    public function createSectionGoal($sectionGoal);

    public function countSectionGoals(array $conditions);

    public function getSectionGoal($id);

    public function searchSectionGoals($conditions, $sort, $start, $limit);

    public function updateSectionGoal($id, $sectionGoal);

    public function deleteSectionGoal($id);

    public function getByName($name);

    public function checkName($name);

    public function findSectionGoalByYear($year);

    public function findGoalsBySectionGoals($sectionGoals, $userId);
}
