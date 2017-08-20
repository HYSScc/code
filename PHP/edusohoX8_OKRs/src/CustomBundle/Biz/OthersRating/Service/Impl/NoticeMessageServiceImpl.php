<?php

namespace CustomBundle\Biz\OthersRating\Service\Impl;

use CustomBundle\Biz\OthersRating\Service\NoticeMessageService;
use Biz\BaseService;
use AppBundle\Common\ArrayToolkit;
use Topxia\Service\Common\ServiceKernel;

class NoticeMessageServiceImpl extends BaseService implements NoticeMessageService
{
    public function findUsers($userIds)
    {
        $users = array();
        for ($index = 0; $index < count($userIds); ++$index) {
            $users[$index] = $this->getUserService()->getUser($userIds[$index]);
        }
        return $users;
    }

    public function getSenderUser()
    {
        $auth = $this->getSettingService()->get('auth', array());

        if (empty($auth['welcome_enabled'])
            || $auth['welcome_enabled'] != 'opened'
            || empty($auth['welcome_sender'])) {
            return;
        }
        $senderUser = $this->getUserService()->getUserByNickname($auth['welcome_sender']);

        return $senderUser;
    }

    public function findOthersRatingBodys($inviteIds, $sectionGoals)
    {
        $users = $this->findUsers($inviteIds);//邀请人
        $othersRatingBodys = array();
        for ($index = 0; $index < count($inviteIds); ++$index) {
            $othersRatingBodys[$index] = $this->getWelcomeBody($users[$index], $sectionGoals[$index]['name']);

            if (empty($othersRatingBodys)) {
                return;
            }
        }
        return $othersRatingBodys;
    }

    public function sendNoticeMessage($senderUser, $users, $othersRatingBodys, $sectionGoals)
    {
        $now = time();
        $day = 86400;
        for ($index = 0; $index < count($users); ++$index) {
            $sendNoticeMessageEndTime = $sectionGoals[$index]['selfRatingEndTime'] + $day;
            if ($sectionGoals[$index]['selfRatingEndTime'] <= $now && $now < $sendNoticeMessageEndTime) {
                if ($senderUser['id'] != $users[$index]['id']) {

                    $this->getMessageService()->sendMessage(
                        $senderUser['id'],
                        $users[$index]['id'],
                        $othersRatingBodys[$index]
                    );
                }
            }
        }
        return true;
    }

    public function getWelcomeBody($user, $sectionGoalName)
    {
        $valuesToBeReplace = array('{{nickname}}', '{{sectionGoalName}}');
        $valuesToReplace = array($user['nickname'], $sectionGoalName);

        $auth = $this->getSettingService()->get('auth', array());
        $othersRatingBody = '';
        if (!empty($auth) && isset($auth['others_rating_body'])) {
            $othersRatingBody = $auth['others_rating_body'];
        }

        $othersRatingBody = str_replace($valuesToBeReplace, $valuesToReplace, $othersRatingBody);

        return $othersRatingBody;
    }

    public function findSectionGoals($sectionGoalIds)
    {
        $sort = array();
        $start = 0;
        $sectionGoals = array();
        for ($index = 0; $index < count($sectionGoalIds); ++$index) {
            $sectionGoals[$index] = $this->getSectionGoalService()->getSectionGoal($sectionGoalIds[$index]);
        }
        return $sectionGoals;
    }

    /**
     * @return UserService
     */
    protected function getUserService()
    {
        return $this->getKernel()->createService('User:UserService');
    }

    public function getKernel()
    {
        return ServiceKernel::instance();
    }

    protected function getSettingService()
    {
        return $this->getKernel()->createService('System:SettingService');
    }

    protected function getMessageService()
    {
        return $this->getKernel()->createService('User:MessageService');
    }

    protected function getSectionGoalService()
    {
        return $this->getKernel()->createService('CustomBundle:SectionGoal:SectionGoalService');
    }
}