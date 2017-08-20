<?php

namespace CustomBundle\Biz\SectionGoal\Job;

use Biz\Crontab\Service\Job;

class SevenDaysBeforeJob extends BaseJob implements Job
{
    protected $size = 100;

    public function execute($params)
    {
        $params['beforeDays'] = 'seven';
        $this->addConfirmJob($params);
        $this->addOtherRatedJob($params);
        $this->addSelfRatedJob($params);
    }

    protected function addConfirmJob($params)
    {
        try {
            $this->getLogger()->addInfo('开始添加确认子任务，参数：', $params);
            $job = array(
                'name' => 'ConfirmJob',
                'cycle' => 'once',
                'nextExcutedTime' =>  strtotime(date('Y-m-d', strtotime('-7 day', $params['confirmEndTime']))),
                'jobClass' => 'CustomBundle\\Biz\\SectionGoal\\Job\\ConfirmJob',
                'targetType' => 'okrs',
                'targetId' => 0,
                'creatorId' => 0,
                'createdTime' => time(),
                'jobParams' => $params,
            );
            $this->getCrontabService()->createJob($job);
        } catch (\Exception $e) {
            $this->getLogger()->addError('添加确认定时子任务异常：'.$e->getMessage(), $job);
        }
    }

    protected function addSelfRatedJob($params)
    {
        try {
            $this->getLogger()->addInfo('开始添加自评子任务，参数：', $params);
            $job = array(
                'name' => 'SelfRatedJob',
                'cycle' => 'once',
                'nextExcutedTime' => strtotime(date('Y-m-d', strtotime('-7 day', $params['selfRatingEndTime']))),
                'jobClass' => 'CustomBundle\\Biz\\SectionGoal\\Job\\SelfRatedJob',
                'targetType' => 'okrs',
                'targetId' => 0,
                'creatorId' => 0,
                'createdTime' => time(),
                'jobParams' => $params,
            );
            $this->getCrontabService()->createJob($job);
        } catch (\Exception $e) {
            $this->getLogger()->addError('添加自评定时子任务异常：'.$e->getMessage(), $job);
        }
    }

    protected function addOtherRatedJob($params)
    {
        try {
            $this->getLogger()->addInfo('开始添加他评子任务，参数：', $params);

            $job = array(
                'name' => 'OtherRatedJob',
                'cycle' => 'once',
                'nextExcutedTime' => strtotime(date('Y-m-d', strtotime('-7 day', $params['othersRatingEndTime']))),
                'jobClass' => 'CustomBundle\\Biz\\SectionGoal\\Job\\OtherRatedJob',
                'targetType' => 'okrs',
                'targetId' => 0,
                'creatorId' => 0,
                'createdTime' => time(),
                'jobParams' => $params,
            );
            $this->getCrontabService()->createJob($job);
        } catch (\Exception $e) {
            $this->getLogger()->addError('添加他评子任务异常：'.$e->getMessage(), $job);
        }
    }
}
