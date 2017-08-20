<?php

namespace CustomBundle\Biz\GoalApproval\Service\Impl;

use Biz\BaseService; 
use CustomBundle\Biz\GoalApproval\Service\SendApprovalMessageService;

class SendApprovalMessageServiceImpl extends BaseService implements  SendApprovalMessageService
{
    public function sendApprovalMessage($status, $fromId, $toId, $reason)
    {
        if ($status == 'reject') {
            $content = "抱歉您的调整申请被拒绝，原因为{$reason}。";
            return $this->getMessageService()->sendMessage($fromId, $toId, $content);
        } elseif ($status == 'audit') {
            $content = '您的调整申请被同意。';
            return $this->getMessageService()->sendMessage($fromId, $toId, $content);
        } else {
            return false;
        }
    }

    protected function getMessageService()
    {
        return $this->createService('User:MessageService');
    }
}