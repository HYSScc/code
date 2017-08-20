<?php

namespace CustomBundle\Tests\Unit\GoalApproval;

use Biz\BaseTestCase;

class SendApprovalMessageServiceTest extends BaseTestCase
{
    public function testSendApprovalMessage()
    {
        $fromId = 1;
        $toId = 2;
        $message = $this->getSendApprovalMessageService()->sendApprovalMessage(
            'reject',
            $fromId,
            $toId,
            '11'
        );
        $this->assertEquals('抱歉您的调整申请被拒绝，原因为11。', $message['content']);

        $result = $this->getSendApprovalMessageService()->sendApprovalMessage(
            'audit',
            $fromId,
            $toId,
            '11'
        );
        $this->assertEquals('您的调整申请被同意。', $result['content']);

        $result = $this->getSendApprovalMessageService()->sendApprovalMessage(
            '11',
            $fromId,
            $toId,
            '11'
        );
        $this->assertEquals(false, $result);
    }

    protected function getSendApprovalMessageService()
    {
        return $this->createService('CustomBundle:GoalApproval:SendApprovalMessageService');
    }
}