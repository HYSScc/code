<?php

namespace CustomBundle\Tests\OthersRating;

use Biz\BaseTestCase; 
use CustomBundle\Biz\OthersRating\Service\NoticeMessageService;
use Mockery;

class NoticeMessageServiceTest extends BaseTestCase
{
    public function testFindUsers()
    {
        $userInfo = array(
            'nickname' => 'test_nickname',
            'password' => 'test_password',
            'email' => 'test_email@email.com',
        );
        $registeredUser = $this->getUserService()->register($userInfo);
        $userIds = array(1, 2);
        $users = $this->getNoticeMessageService()->findUsers($userIds);
        $this->assertEquals($registeredUser['id'], $users[1]['id']);
    }

    public function testGetSenderUser()
    {
        $default = array(
            'welcome_enabled' => 'opened',
            'welcome_sender' => 'admin',
            'welcome_methods' => array(),
            'welcome_title' => '欢迎加入{{sitename}}',
            'welcome_body' => '您好{{nickname}}，我是{{sitename}}的管理员，欢迎加入{{sitename}}，祝您学习愉快。如有问题，随时与我联系。',
        );
        $this->getSettingService()->set('auth', $default);

        $test = $this->getNoticeMessageService()->getSenderUser();

        $this->assertEquals(1, $test['id']);
    }

    public function testFindOthersRatingBodys()
    {
        $userInfo = array(
            'nickname' => 'test_nickname',
            'password' => 'test_password',
            'email' => 'test_email@email.com',
        );
        $registeredUser = $this->getUserService()->register($userInfo);

        $default = array(
            'register_mode' => 'email',
            'email_activation_title' => '请激活您的{{sitename}}帐号',
            'welcome_enabled' => 'opened',
            'welcome_sender' => 'admin',
            'welcome_methods' => array(),
            'welcome_title' => '欢迎加入{{sitename}}',
            'welcome_body' => '您好{{nickname}}，我是{{sitename}}的管理员，欢迎加入{{sitename}}，祝您学习愉快。如有问题，随时与我联系。',
            'others_rating_title' => '他评邀请',
            'others_rating_body' => '{{nickname}}邀请你对他的{{sectionGoalName}}做他评'
        );
        $this->getSettingService()->set('auth', $default);

        $sectionGoals = array(array('name' => '第一'), array('name' => '第二'));

        $test = $this->getNoticeMessageService()->findOthersRatingBodys(array(1, 2), $sectionGoals);
        $this->assertEquals('admin邀请你对他的第一做他评', $test[0]);
    }

    public function testSendNoticeMessage()
    {
        $senderUser = array('id' => 1);
        $users = array(array('id' => 2), array('id' => 3));
        $othersRatingBodys = array('1', '2');
        $time = 1111111111;
        $sectionGoals = array($time, $time);
        $test = $this->getNoticeMessageService()->sendNoticeMessage($senderUser, $users, $othersRatingBodys, $sectionGoals);
        $this->assertEquals(true, $test);
    }

    public function testFindSectionGoals()
    {
        $sectionGoalIds = array(1, 2);
        $this->mockBiz('CustomBundle:SectionGoal:SectionGoalService', array(
            array('functionName' => 'getSectionGoal', 'returnValue' => 'aa')
        ));
        $result = array('aa', 'aa');
        $test = $this->getNoticeMessageService()->findSectionGoals($sectionGoalIds);
        $this->assertEquals($result, $test);
    }

    protected function getUserService()
    {
        return $this->createService('User:UserService');
    }

    protected function getNoticeMessageService()
    {
        return $this->createService('CustomBundle:OthersRating:NoticeMessageService');
    }

    protected function getSettingService()
    {
        return $this->createService('System:SettingService');
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }
}