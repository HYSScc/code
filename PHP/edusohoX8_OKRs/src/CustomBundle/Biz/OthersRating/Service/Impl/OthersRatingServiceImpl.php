<?php

namespace CustomBundle\Biz\OthersRating\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\OthersRating\Service\OthersRatingService;

class OthersRatingServiceImpl  extends BaseService implements  OthersRatingService
{
    public function findByKeyResultId($keyResultId)
    {
        return $this->getOthersRatingDao()->findByKeyResultId($keyResultId);
    }

    public function createOtherRating($otherRating)
    {
        return $this->getOthersRatingDao()->create($otherRating);
    }

    public function findAllNotOtherRatedBySectionGoalId($sectionGoalId)
    {
        return $this->getOthersRatingDao()->findAllNotOtherRatedBySectionGoalId($sectionGoalId);
    }

    public function findAllOthersRatings()
    {
        $start = 0;
        return $this->getOthersRatingDao()->search(array(), array(), $start, PHP_INT_MAX);
    }

    protected function getOthersRatingDao()
    { 
        return $this->createDao('CustomBundle:OthersRating:OthersRatingDao');
    }
}