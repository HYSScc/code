<?php

namespace CustomBundle\Biz\GoalApproval\Service;

interface SendApprovalMessageService
{
    public function sendApprovalMessage($status, $fromId, $toId, $reason);
}
