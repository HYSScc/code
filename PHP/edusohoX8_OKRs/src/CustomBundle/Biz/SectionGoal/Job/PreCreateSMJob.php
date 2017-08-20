<?php

namespace CustomBundle\Biz\SectionGoal\Job;

use Biz\Crontab\Service\Job;

class PreCreateSMJob extends BaseJob implements Job
{
    protected $size = 100;

    public function execute($params)
    {
        $sectionGoalId = $params['id'];
        $sectionGoal = $this->getSectionGoalService()->getSectionGoal($sectionGoalId);
        $this->addOneDayBeforeJob($sectionGoal);
        $this->addThreeDaysBeforeJob($sectionGoal);
        $this->addSevenDaysBeforeJob($sectionGoal);
    }

    protected function addSevenDaysBeforeJob($params)
    {
        try {
            $this->getLogger()->addInfo('开始添加7天前子任务，参数：', $params);
            $job = array(
                'name' => 'SevenDaysBeforeJob',
                'cycle' => 'once',
                'nextExcutedTime' => time(),
                'jobClass' => 'CustomBundle\\Biz\\SectionGoal\\Job\\SevenDaysBeforeJob',
                'targetType' => 'okrs',
                'targetId' => 0,
                'creatorId' => 0,
                'createdTime' => time(),
                'jobParams' => $params,
            );
            $this->getCrontabService()->createJob($job);
        } catch (\Exception $e) {
            $this->getLogger()->addError('添加7天前定时子任务异常：'.$e->getMessage(), $job);
        }
    }

    protected function addThreeDaysBeforeJob($params)
    {
        try {
            $this->getLogger()->addInfo('开始添加3天前子任务，参数：', $params);
            $job = array(
                'name' => 'ThreeDaysBeforeJob',
                'cycle' => 'once',
                'nextExcutedTime' => time(),
                'jobClass' => 'CustomBundle\\Biz\\SectionGoal\\Job\\ThreeDaysBeforeJob',
                'targetType' => 'okrs',
                'targetId' => 0,
                'creatorId' => 0,
                'createdTime' => time(),
                'jobParams' => $params,
            );
            $this->getCrontabService()->createJob($job);
        } catch (\Exception $e) {
            $this->getLogger()->addError('添加3天前定时子任务异常：'.$e->getMessage(), $job);
        }
    }

    protected function addOneDayBeforeJob($params)
    {
        try {
            $this->getLogger()->addInfo('开始添加1天前子任务，参数：', $params);
            $job = array(
                'name' => 'OneDaysBeforeJob',
                'cycle' => 'once',
                'nextExcutedTime' => time(),
                'jobClass' => 'CustomBundle\\Biz\\SectionGoal\\Job\\OneDaysBeforeJob',
                'targetType' => 'okrs',
                'targetId' => 0,
                'creatorId' => 0,
                'createdTime' => time(),
                'jobParams' => $params,
            );
            $this->getCrontabService()->createJob($job);
        } catch (\Exception $e) {
            $this->getLogger()->addError('添加1天前定时子任务异常：'.$e->getMessage(), $job);
        }
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }
}
