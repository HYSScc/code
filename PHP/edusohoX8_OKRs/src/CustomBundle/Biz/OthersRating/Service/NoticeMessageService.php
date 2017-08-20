<?php

namespace CustomBundle\Biz\OthersRating\Service;

interface NoticeMessageService
{
    public function findUsers($userIds);
    public function getSenderUser();
    public function findOthersRatingBodys($userIds, $sectionGoals);
    public function getWelcomeBody($users, $sectiongoalname);
    public function sendNoticeMessage($senderUser, $users, $othersRatingBodys, $sectionGoals);
    public function findSectionGoals($sectionGoalIds);
}