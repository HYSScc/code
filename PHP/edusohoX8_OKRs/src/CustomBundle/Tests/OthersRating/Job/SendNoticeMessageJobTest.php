<?php

namespace CustomBundle\Tests\OthersRating\Job;

use Biz\BaseTestCase;
use Topxia\Service\Common\ServiceKernel;
use CustomBundle\Biz\OthersRating\Job\SendNoticeMessageJob;

class SendNoticeMessageJobTest extends BaseTestCase
{
    public function testExecute()
    {
        $rating = array(
            'userId' => 1,
            'keyResultId' => '1',
            'sectionGoalId' => 1,
            'score' => '2',
            'inviteId' => 2
        );
        $rating1 = array(
            'userId' => 2,
            'keyResultId' => '1',
            'sectionGoalId' => 2,
            'score' => '2',
            'inviteId' => 2
        );
        $this->getOthersRatingService()->createOtherRating($rating);
        $this->getOthersRatingService()->createOtherRating($rating1);

        $sectionGoal = array(
            'name' => '第一季度',
            'year' => '2018',
            'id' => '1',
            'startTime' => '2017-08-11 11:30',
            'confirmEndTime' => '2017-08-11 11:30',
            'adjustStartTime' => '2017-08-11 11:30',
            'adjustEndTime' => '2017-08-11 11:30',
            'selfRatingEndTime' => '2017-08-11 11:30',
            'othersRatingEndTime' => '2017-08-11 11:30'
        );
        $sectionGoal1 = array(
            'name' => '第二季度',
            'year' => '2018',
            'id' => '2',
            'startTime' => '2017-08-11 11:30',
            'confirmEndTime' => '2017-08-11 11:30',
            'adjustStartTime' => '2017-08-11 11:30',
            'adjustEndTime' => '2017-08-11 11:30',
            'selfRatingEndTime' => '2017-08-11 11:30',
            'othersRatingEndTime' => '2017-08-11 11:30'
        );
        $sectionGoal = $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $sectionGoal1 = $this->getSectionGoalService()->createSectionGoal($sectionGoal1);

        $this->mockBiz('CustomBundle:OthersRating:NoticeMessageService', array(
            array('functionName' => 'findSectionGoals', 'returnValue' => array('aa', 'aa')),
            array('functionName' => 'findUsers', 'returnValue' => array('aa', 'aa')),
            array('functionName' => 'getSenderUser', 'returnValue' => array('aa', 'aa')),
            array('functionName' => 'findOthersRatingBodys', 'returnValue' => array('aa', 'aa')),
            array('functionName' => 'sendNoticeMessage', 'returnValue' => 'aa')
        ));

        $SendNoticeMessageJob = new SendNoticeMessageJob();
        $result = $SendNoticeMessageJob->execute('');
        $this->getNoticeMessageService()->shouldHaveReceived("sendNoticeMessage");
        $this->getNoticeMessageService()->shouldHaveReceived("findSectionGoals");
        $this->getNoticeMessageService()->shouldHaveReceived("findUsers");
        $this->getNoticeMessageService()->shouldHaveReceived("getSenderUser");
        $this->getNoticeMessageService()->shouldHaveReceived("sendNoticeMessage");
    }

    protected function getOthersRatingService()
    {
        return $this->createService('CustomBundle:OthersRating:OthersRatingService');
    }

    protected function getNoticeMessageService()
    {
        return $this->createService('CustomBundle:OthersRating:NoticeMessageService');
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }
}