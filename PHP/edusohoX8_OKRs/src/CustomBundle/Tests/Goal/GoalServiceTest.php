<?php

namespace CustomBundle\Tests\Goal;

use Biz\BaseTestCase;

class GoalServiceTest extends BaseTestCase
{
    public function testAddGoal()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $startTime = date('YmdHis', time()-1000);
        $confirmEndTime = date('YmdHis', time()+1000);
        $sectionGoal = $this->sectionGoalFields($goal['sectionGoalId'], $startTime, $confirmEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $result = $this->getGoalService()->addGoal($goal['userId'], $goal['sectionGoalId'], $goal['name']);
        $this->assertEquals($goal['name'], $result['name']);
    }

    public function testFindGoalsBySectionGoal()
    {
        $goal = array(
            'sectionGoalId' => '2',
            'name' => '走路',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '1'
        );
        $this->getGoalDao()->create($goal);
        $result = $this->getGoalService()->findGoalsBySectionGoal($goal['sectionGoalId'], $goal['userId']);
        $this->assertEquals($goal['name'], $result[0]['name']);
    }

    public function testDeleteGoal()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '走路',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '1'
        );
        $startTime = date('YmdHis', time()-1000);
        $confirmEndTime = date('YmdHis', time()+1000);
        $sectionGoal = $this->sectionGoalFields($goal['sectionGoalId'], $startTime, $confirmEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $goal = $this->getGoalDao()->create($goal);
        $result = $this->getGoalService()->deleteGoal($goal['id']);
        $this->assertEquals(true, $result);
    }

    public function testUpdateGoalName()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '走路',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '1'
        );
        $startTime = date('YmdHis', time()-1000);
        $confirmEndTime = date('YmdHis', time()+1000);
        $sectionGoal = $this->sectionGoalFields($goal['sectionGoalId'], $startTime, $confirmEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $goal = $this->getGoalDao()->create($goal);
        $newName = '跑步';
        $result = $this->getGoalService()->updateGoalName($goal['id'], $newName);
        $this->assertEquals($newName, $result['name']);
    }

    public function testGetSectionGoalIdByGoal()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '走路',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '1',
            'id' => '1'
        );
        $startTime = date('YmdHis', time());
        $confirmEndTime = date('YmdHis', time());
        $sectionGoal = $this->sectionGoalFields($goal['sectionGoalId'], $startTime, $confirmEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $this->getGoalDao()->create($goal);
        $result = $this->getGoalService()->getSectionGoalIdByGoal($goal['id']);
        $this->assertEquals($goal['sectionGoalId'], $result);
    }

    private function sectionGoalFields($id, $startTime, $confirmEndTime)
    {
        return array(
            'id' => $id,
            'year' => '2017',
            'startTime' => $startTime,
            'confirmEndTime' => $confirmEndTime,
            'adjustStartTime' => '2017-08-11 11:30',
            'adjustEndTime' => '2017-08-11 11:30',
            'selfRatingEndTime' => '2017-08-11 11:30',
            'name' => '第一季度',
            'othersRatingEndTime' => '2017-08-11 11:30'
        );
    }

    public function testFindGoalsBySectionId()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $sectionGoalId = 1;
        $goal = $this->getGoalDao()->create($goal);
        $result = $this->getGoalService()->findGoalsBySectionId($sectionGoalId);
        $this->assertEquals($goal['sectionGoalId'], $result[0]['sectionGoalId']);
    }

    private function sectionGoalFieldsAdjust($id, $adjustStartTime, $adjustEndTime)
    {
        return array(
            'id' => $id,
            'year' => '2017',
            'startTime' => '2017-08-11 11:30',
            'confirmEndTime' => '2017-08-11 11:30',
            'adjustStartTime' => $adjustStartTime,
            'adjustEndTime' => $adjustEndTime,
            'selfRatingEndTime' => '2017-08-11 11:30',
            'name' => '第一季度',
            'othersRatingEndTime' => '2017-08-11 11:30'
        );
    }

    public function testAddKrToGoal()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => '',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $sectionGoalId = 1;
        $adjustStartTime = date('YmdHis', strtotime("-1 day"));
        $adjustEndTime = date('YmdHis', strtotime("+1 day"));
        $sectionGoal = $this->sectionGoalFieldsAdjust($sectionGoalId, $adjustStartTime, $adjustEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $this->getGoalDao()->create($goal);
        $adjustGoalId = 1;
        $adjustKrName = '跑步三公里';
        $adjustReason = '跑你个鬼！';
        $result = $this->getGoalService()->addKrToGoal($adjustGoalId, $adjustKrName, $adjustReason);
        $this->assertEquals($adjustReason, $result['adjustReason']);
    }

    public function testUpdateKrToGoal()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => '',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $kr = array(
            'goalId' => '1',
            'name' => '跑步三公里',
            'selfScore' => '-1',
            'othersScore' => '-1',
        );
        $sectionGoalId = 1;
        $adjustStartTime = date('YmdHis', strtotime("-1 day"));
        $adjustEndTime = date('YmdHis', strtotime("+1 day"));
        $sectionGoal = $this->sectionGoalFieldsAdjust($sectionGoalId, $adjustStartTime, $adjustEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $this->getGoalDao()->create($goal);
        $this->getKeyResultDao()->create($kr);
        $krId = 1;
        $adjustKrName = '跑个死！';
        $adjustReason = '跑步不累的啊。';
        $result = $this->getGoalService()->updateKrToGoal($krId, $adjustKrName, $adjustReason);
        $this->assertEquals($adjustReason, $result['adjustReason']);
    }

    public function testDeleteKrToGoal()
    {
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $goal = $this->getGoalDao()->create($goal);
        $result = $this->getGoalService()->getGoal(1);
        $this->assertEquals($goal['name'], $result['name']);
    }

    public function testUpdataGoal()
    {
    	$goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => '',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $kr = array(
            'goalId' => '1',
            'name' => '跑步三公里',
            'selfScore' => '-1',
            'othersScore' => '-1',
        );
        $sectionGoalId = 1;
        $adjustStartTime = date('YmdHis', strtotime("-1 day"));
        $adjustEndTime = date('YmdHis', strtotime("+1 day"));
        $sectionGoal = $this->sectionGoalFieldsAdjust($sectionGoalId, $adjustStartTime, $adjustEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $this->getGoalDao()->create($goal);
        $this->getKeyResultDao()->create($kr);
        $krId = 1;
        $adjustReason = '跑步不累的啊。';
        $result = $this->getGoalService()->deleteKrToGoal($krId, $adjustReason);
        $this->assertEquals($adjustReason, $result['adjustReason']);
    }

    public function testAddHistoryThroughAdd()
    {
        $sectionGoalId = 1;
        $adjustStartTime = date('YmdHis', strtotime("-1 day"));
        $adjustEndTime = date('YmdHis', strtotime("+1 day"));
        $sectionGoal = $this->sectionGoalFieldsAdjust($sectionGoalId, $adjustStartTime, $adjustEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => '',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $kr = array(
            'goalId' => '1',
            'name' => '跑步三公里',
            'selfScore' => '-1',
            'othersScore' => '-1',
        );
        $this->getGoalDao()->create($goal);
        $this->getKeyResultDao()->create($kr);
        $goalId = 1;
        $krName = '跑步三公里';
        $krReason = '跑你个鬼！';
        $result = $this->getGoalService()->addHistoryThroughAdd($goalId, $krName, $krReason);
        $this->assertEquals($krReason, $result['adjustReason']);
    }

    public function testAddHistoryThroughUpdate()
    {
        $sectionGoalId = 1;
        $adjustStartTime = date('YmdHis', strtotime("-1 day"));
        $adjustEndTime = date('YmdHis', strtotime("+1 day"));
        $sectionGoal = $this->sectionGoalFieldsAdjust($sectionGoalId, $adjustStartTime, $adjustEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => '',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $result = $this->getGoalService()->updataGoal(1, $goal);
        $this->assertEquals($goal['adjustReason'], $result['adjustReason']);
    }

    public function testAddHistoryThroughDelete()
    {
        $sectionGoalId = 1;
        $adjustStartTime = date('YmdHis', strtotime("-1 day"));
        $adjustEndTime = date('YmdHis', strtotime("+1 day"));
        $sectionGoal = $this->sectionGoalFieldsAdjust($sectionGoalId, $adjustStartTime, $adjustEndTime);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $goal = array(
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => '',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
        $kr = array(
            'goalId' => '1',
            'name' => '跑步三公里',
            'selfScore' => '-1',
            'othersScore' => '-1',
        );
        $this->getGoalDao()->create($goal);
        $this->getKeyResultDao()->create($kr);
        $krId = 1;
        $krReason = '跑步不累的啊。';
        $result = $this->getGoalService()->addHistoryThroughDelete($krId, $krReason);
        $this->assertEquals($krReason, $result['adjustReason']);
    }

    protected function getGoalService()
    {
        return $this->createService('CustomBundle:Goal:GoalService');
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }

    protected function getGoalDao()
    {
        return $this->createDao('CustomBundle:Goal:GoalDao');
    }

    protected function getKeyResultDao()
    {
        return $this->createDao('CustomBundle:KeyResult:KeyResultDao');
    }
}