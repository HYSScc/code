<?php

namespace CustomBundle\Tests\OthersRating;

use Biz\BaseTestCase;
use CustomBundle\Biz\OthersRating\Service\OthersRatingDao;

class OthersRatingDaoTest extends BaseTestCase
{
    public function testFindByKeyResultId()
    {
        $rating = array(
            'userId' => 1,
            'keyResultId' => '1',
            'sectionGoalId' => 1,
            'score' => '2',
            'inviteId' => 2
        );
         $this->getOthersRatingDao()->create($rating);
         $saveRating =$this->getOthersRatingDao()->findByKeyResultId($rating);
        $this->assertEquals($rating['score'], $saveRating[0]['score']);
    }

    public function testFindAllNotOtherRatedBySectionGoalId()
    {
        $fields = array(
            'sectionGoalId' => 1,
            'keyResultId' => '1',
            'userId' => '1',
            'score' => '2',
            'inviteId' => 2
        );
        $this->getOthersRatingDao()->create($fields);
        $fields = array(
            'sectionGoalId' => 1,
            'keyResultId' => '1',
            'userId' => '1',
            'score' => '-1',
            'inviteId' => 2
        );
        $this->getOthersRatingDao()->create($fields);

        $result = $this->getOthersRatingDao()->findAllNotOtherRatedBySectionGoalId(1);
        $this->assertEquals(1, count($result));
    }

    protected function getOthersRatingDao()
    { 
        return $this->createDao('CustomBundle:OthersRating:OthersRatingDao');
    }
}