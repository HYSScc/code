<?php

namespace CustomBundle\Biz\SectionGoal\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface SectionGoalDao extends GeneralDaoInterface
{
    public function getByName($name);

    public function getByYear($year);
}
