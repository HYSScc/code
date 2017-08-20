<?php

namespace CustomBundle\Tests\OthersRating;

use Biz\BaseTestCase; 
use CustomBundle\Biz\OthersRating\Service\OthersRatingService;
 
class OthersRatingServiceTest extends BaseTestCase
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
        $this->getOthersRatingService()->createOtherRating($rating);
        $saveRating =$this->getOthersRatingService()->findByKeyResultId($rating);
        $this->assertEquals($rating['score'], $saveRating[0]['score']);
    }

    public function testCreateOtherRating()
    {
        $rating = array(
            'userId' => 1,
            'keyResultId' => '1',
            'sectionGoalId' => 1,
            'score' => '2',
            'inviteId' => 2
        );
        $saveRating = $this->getOthersRatingService()->createOtherRating($rating);
        $this->assertEquals($rating['score'], $saveRating['score']);
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
        $this->getOthersRatingService()->createOtherRating($fields);
        $fields = array(
            'sectionGoalId' => 1,
            'keyResultId' => '1',
            'userId' => '1',
            'score' => '-1',
            'inviteId' => 2
        );
        $this->getOthersRatingService()->createOtherRating($fields);

        $result = $this->getOthersRatingService()->findAllNotOtherRatedBySectionGoalId(1);
        $this->assertEquals(1, count($result));
    }

    public function testFindAllOthersRatings()
    {
        $rating = array(
            'sectionGoalId' => 1,
            'keyResultId' => '1',
            'score' => '2',
            'userId' => '1',
            'inviteId' => 2
        );
        $this->getOthersRatingService()->createOtherRating($rating);
        $saveRating =$this->getOthersRatingService()->findAllOthersRatings();
        $this->assertEquals($rating['score'], $saveRating[0]['score']);
    }

    protected function getOthersRatingService()
    {
        return $this->getBiz()->service('CustomBundle:OthersRating:OthersRatingService');
    }
}