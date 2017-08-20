<?php

namespace CustomBundle\Biz\OthersRating\Job;

use Biz\Crontab\Service\Job;
use AppBundle\Common\ArrayToolkit;
use Topxia\Service\Common\ServiceKernel;
use CustomBundle\Biz\OthersRating\Service\OthersRatingService;
use CustomBundle\Biz\OthersRating\Service\NoticeMessageService;

class SendNoticeMessageJob  implements Job
{
    public function execute($params)
    {
        $otherRatingList = $this->getOthersRatingService()->findAllOthersRatings();
        $sectionGoalIds = ArrayToolkit::column($otherRatingList, 'sectionGoalId');
        $userIds = ArrayToolkit::column($otherRatingList, 'userId');
        $inviteIds = ArrayToolkit::column($otherRatingList, 'inviteId');

        $sectionGoals = $this->getNoticeMessageService()->findSectionGoals($sectionGoalIds);
        $users = $this->getNoticeMessageService()->findUsers($userIds);
        $senderUser = $this->getNoticeMessageService()->getSenderUser();
        $othersRatingBodys = $this->getNoticeMessageService()->findOthersRatingBodys($inviteIds, $sectionGoals);
        $this->getNoticeMessageService()->sendNoticeMessage($senderUser, $users, $othersRatingBodys, $sectionGoals);
    }

    protected function getOthersRatingService()
    {
        return $this->getServiceKernel()->createService('CustomBundle:OthersRating:OthersRatingService');
    }

    protected function getNoticeMessageService()
    {
        return $this->getServiceKernel()->createService('CustomBundle:OthersRating:NoticeMessageService');
    }

    protected function getServiceKernel()
    {
        return ServiceKernel::instance();
    }

}