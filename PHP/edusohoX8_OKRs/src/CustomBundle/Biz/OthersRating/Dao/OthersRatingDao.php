<?php

namespace CustomBundle\Biz\OthersRating\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface OthersRatingDao extends GeneralDaoInterface
{
    public function findByKeyResultId($keyResultId);

    public function findAllNotOtherRatedBySectionGoalId($sectionGoalId);
}
