<?php

namespace CustomBundle\Tests\KeyResult;

use Biz\BaseTestCase;

class KeyResultServiceTest extends BaseTestCase
{
    public function testAddKeyResult()
    {
        $keyResult = array(
            'goalId' => '1',
            'name' => '吃水果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $this->createSectionGoal($keyResult['goalId']);
        $result = $this->getKeyResultService()->addKeyResult($keyResult['goalId'], $keyResult['name']);
        $this->assertEquals($keyResult['name'], $result['name']);
    }

    public function testFindKRs()
    {
        $keyResult = array(
            'goalId' => '2',
            'name' => '吃苹果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $keyResult = $this->getKeyResultDao()->create($keyResult);
        $result = $this->getKeyResultService()->findKRs($keyResult['goalId']);
        $this->assertEquals($keyResult['name'], $result[0]['name']);
    }

    public function testDeleteKeyResult()
    {
        $keyResult = array(
            'goalId' => '2',
            'name' => '吃苹果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $this->createSectionGoal($keyResult['goalId']);
        $keyResult = $this->getKeyResultService()->addKeyResult($keyResult['goalId'], $keyResult['name']);
        $result = $this->getKeyResultService()->deleteKeyResult($keyResult['id']);
        $this->assertEquals(true, $result);
    }

    public function testDeleteKeyResultByGoalId()
    {
        $keyResult = array(
            'goalId' => '1',
            'name' => '吃苹果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $this->createSectionGoal($keyResult['goalId']);
        $keyResult = $this->getKeyResultService()->addKeyResult($keyResult['goalId'], $keyResult['name']);
        $result = $this->getKeyResultService()->deleteKeyResultByGoalId($keyResult['goalId']);
        $this->assertEquals(true, $result);
    }

    public function testUpdateKRName()
    {
        $keyResult = array(
            'goalId' => '1',
            'name' => '吃苹果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $this->createSectionGoal($keyResult['goalId']);
        $keyResult = $this->getKeyResultDao()->create($keyResult);
        $newName = '初次吃';
        $result = $this->getKeyResultService()->updateKRName($keyResult['id'], $newName);
        $this->assertEquals($newName, $result['name']);
    }

    public function testGetSectionGoalIdByKR()
    {
        $keyResult = array(
            'goalId' => '1',
            'name' => '吃苹果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $sectionGoal = $this->createSectionGoal($keyResult['goalId']);
        $keyResult = $this->getKeyResultDao()->create($keyResult);
        $result = $this->getKeyResultService()->getSectionGoalIdByKR($keyResult['id']);
        $this->assertEquals($sectionGoal['id'], $result);
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
            'othersRatingEndTime' => '2017-08-11 11:30',
        );
    }

    private function goalFields($goalId)
    {
        return array(
            'id' => $goalId,
            'sectionGoalId' => '1',
            'name' => '跑步',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '2'
        );
    }

    protected function createSectionGoal($goalId)
    {
        $goal = $this->goalFields($goalId);
        $goal = $this->getGoalDao()->create($goal);
        $startTime = date('YmdHis', time()-1000);
        $confirmEndTime = date('YmdHis', time()+1000);
        $sectionGoal = $this->sectionGoalFields($goal['sectionGoalId'], $startTime, $confirmEndTime);
        return $this->getSectionGoalService()->createSectionGoal($sectionGoal);
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }

    public function testCreateKR()
    {
        $kr = array(
            'goalId' => '1',
            'name' => 'test',
        );
        $saveKr=$this->getKeyResultService()->createKR($kr);
        $this->assertEquals($kr['name'], $saveKr['name']);
    }

    public function testFindByGoalId()
    {
        $kr = array(
            'goalId' => '1',
            'name' => 'test',
         );
        $this->getKeyResultService()->createKr($kr);
        $saveKr = $this->getKeyResultService()->findByGoalId($kr);
        $this->assertEquals($kr['name'], $saveKr[0]['name']);
    }
    
    public function testFindKRsInfo()
    {
        $KRsInfo=array(
            '0'=>array(
                'id' => '1',
                'goalId' => '1',
                'name' => 'test'
             )
        );
        $testKRsInfo=$this->getKeyResultService()->findKRsInfo($KRsInfo);
        $this->assertEquals($KRsInfo[0]['name'], $testKRsInfo[0]['KRsInfo']['name']);
    }

    public function testUpdateKRs()
    {
        $kr = array(
            'goalId' => '1',
            'name' => '11',
         );
        $kr = $this->getKeyResultService()->createKr($kr);
        $krs = array(array('id' => 1, 'newName' => '22'));
        $result = $this->getKeyResultService()->updateKRs($krs);
        $this->assertEquals(true, $result);

        $result = $this->getKeyResultService()->updateKRs(array());
        $this->assertEquals(false, $result);
    }

    public function testAddKRs()
    {
        $krs = array(array('name' => '11'));
        $goalId = 1;
        $result = $this->getKeyResultService()->addKRs($krs, $goalId);
        $this->assertEquals(true, $result);

        $result = $this->getKeyResultService()->addKRs(array(), $goalId);
        $this->assertEquals(false, $result);
    }

    public function testDeleteKRs()
    {
        $kr = array(
            'goalId' => '1',
            'name' => '11',
         );
        $kr = $this->getKeyResultService()->createKr($kr);
        $krs = array(array('id' => 1));
        $result = $this->getKeyResultService()->deleteKRs($krs);
        $this->assertEquals(true, $result);

        $result = $this->getKeyResultService()->deleteKRs(array());
        $this->assertEquals(false, $result);
    }

    public function testOperateKRs()
    {
        $kr = array(
            'goalId' => '1',
            'name' => '11',
         );
        $kr = $this->getKeyResultService()->createKr($kr);
        $updateKrs = array(array('id' => 1, 'newName' => '22'));
        $deleteKrs = array(array('id' => 1));
        $addKrs = array(array('name' => '11'));
        $goalId = 1;
        $result = $this->getKeyResultService()->operateKRs(
            $updateKrs, 
            $addKrs, 
            $deleteKrs, 
            $goalId, 
            'audit'
        );
        $this->assertEquals(true, $result);

        $result = $this->getKeyResultService()->operateKRs(
            $updateKrs, 
            $addKrs, 
            $deleteKrs, 
            $goalId, 
            'reject'
        );
        $this->assertEquals(false, $result);
    }

    protected function getKeyResultService()
    {
        return $this->createService('CustomBundle:KeyResult:KeyResultService');
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


