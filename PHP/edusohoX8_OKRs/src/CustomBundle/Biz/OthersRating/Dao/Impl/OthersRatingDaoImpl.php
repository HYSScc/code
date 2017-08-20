<?php

namespace CustomBundle\Biz\OthersRating\Dao\Impl;

use CustomBundle\Biz\OthersRating\Dao\OthersRatingDao;
use Codeages\Biz\Framework\Dao\GeneralDaoImpl;

class OthersRatingDaoImpl extends GeneralDaoImpl implements OthersRatingDao
{
    protected $table = 'others_rating';

    public function findByKeyResultId($keyResultId)
    {
        return $this->findByFields($keyResultId);
    }

    public function findAllNotOtherRatedBySectionGoalId($sectionGoalId)
    {
        $sql = "SELECT * FROM {$this->table} WHERE sectionGoalId = ? AND score = -1";

        return $this->db()->fetchAll($sql, array($sectionGoalId)) ?: array();
    }

    public function declares()
    {
        return array(
            'timestamps' => array(
                'createdTime',
                'updatedTime',
            ),
            'conditions' => array(
                'keyResultId = :keyResultId',
                'createdTime = :createdTime',
                'updatedTime = :updatedTime',
            ),
        );
    }
}