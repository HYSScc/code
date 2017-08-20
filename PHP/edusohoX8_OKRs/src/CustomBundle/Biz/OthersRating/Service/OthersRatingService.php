<?php

namespace CustomBundle\Biz\OthersRating\Service;

interface OthersRatingService
{
    public function findByKeyResultId($keyResultId);
    
    public function createOtherRating($otherRating);

    public function findAllNotOtherRatedBySectionGoalId($sectionGoalId);

    public function findAllOthersRatings();

}