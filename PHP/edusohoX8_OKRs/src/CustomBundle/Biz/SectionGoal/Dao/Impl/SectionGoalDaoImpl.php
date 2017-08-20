<?php

namespace CustomBundle\Biz\SectionGoal\Dao\Impl;

use CustomBundle\Biz\SectionGoal\Dao\SectionGoalDao;
use Codeages\Biz\Framework\Dao\GeneralDaoImpl;

class SectionGoalDaoImpl extends GeneralDaoImpl implements SectionGoalDao
{
    protected $table = 'section_goal';

    public function getByYear($year)
    {
        return $this->findByFields(array('year' => $year));
    }

    public function getByName($name)
    {
        return $this->getByFields(array('name' => $name));
    }

    public function declares()
    {
        return array(
            'orderbys' => array(
                'year',
                'startTime',
                'confirmEndTime',
                'adjustStartTime',
                'adjustEndTime',
                'createdTime',
                'selfRatingEndTime',
                'updatedTime',
                'id',
                'othersRatingEndTime',
            ),
            'timestamps' => array('createdTime', 'updatedTime'),
            'conditions' => array(
                'id = :id',
                'id IN (:ids)',
                'updatedTime >= :updatedTime_GE',
                'name LIKE :name',
                'startTime = :startTime',
                'confirmEndTime = :confirmEndTime',
                'adjustStartTime = :adjustStartTime',
                'adjustEndTime = :adjustEndTime',
                'createdTime = :createdTime',
                'selfRatingEndTime = :selfRatingEndTime',
                'othersRatingEndTime = :othersRatingEndTime',
            ),
        );
    }
}
