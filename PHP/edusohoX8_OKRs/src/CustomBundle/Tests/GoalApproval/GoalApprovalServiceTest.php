<?php

namespace CustomBundle\Tests\GoalApproval;

use Biz\BaseTestCase;

class GoalApprovalServiceTest extends BaseTestCase
{
    public function testSearchHistories()
    {
        $history = array(
            'goalId' => 1,
            'oldInfo' => '[{"id":"1","name":"11"},{"id":"2","name":"22"}]',
            'newInfo' => '[{"id":"1","name":"2"},{"id":"2","name":""},{"id":"","name":"11"}]',
            'status' => 'notAudit',
            'adjustReason' => '11'
        );
        $historyResult = $this->getGoalApprovalService()->createHistory($history);
        $result = $this->getGoalApprovalService()->searchHistories(array(1), 'all', 0, PHP_INT_MAX);
        $this->assertEquals($history['goalId'], $result[0]['goalId']);

        $result = $this->getGoalApprovalService()->searchHistories(array(1), '11', 0, PHP_INT_MAX);
        $this->assertEquals($history['goalId'], $result[0]['goalId']);

        $result = $this->getGoalApprovalService()->searchHistories(array(), '11', 0, PHP_INT_MAX);
        $this->assertEquals(array(), $result);
    }

    public function testCountHistory()
    {
        $history = array(
            'goalId' => 1,
            'oldInfo' => '[{"id":"1","name":"11"},{"id":"2","name":"22"}]',
            'newInfo' => '[{"id":"1","name":"2"},{"id":"2","name":""},{"id":"","name":"11"}]',
            'status' => 'notAudit',
            'adjustReason' => '11'
        );
        $historyResult = $this->getGoalApprovalService()->createHistory($history);
        $result = $this->getGoalApprovalService()->countHistory('all');
        $this->assertEquals(1, $result);

        $result = $this->getGoalApprovalService()->countHistory('11');
        $this->assertEquals(1, $result);
    }

    public function testGetHistory()
    {
        $history = array(
            'goalId' => 1,
            'oldInfo' => '[{"id":"1","name":"11"},{"id":"2","name":"22"}]',
            'newInfo' => '[{"id":"1","name":"2"},{"id":"2","name":""},{"id":"","name":"11"}]',
            'status' => 'notAudit',
            'adjustReason' => '11'
        );
        $historyResult = $this->getGoalApprovalService()->createHistory($history);
        $result = $this->getGoalApprovalService()->getHistory(1);
        $this->assertEquals($history['goalId'], $result['goalId']);
    }

    public function testClassifyUpdateHistory()
    {
        $oldInfo = '[{"id":"1","name":"11"},{"id":"2","name":"22"}]';
        $newInfo = '[{"id":"1","name":"2"},{"id":"2","name":""},{"id":"","name":"11"}]';
        $result = $this->getGoalApprovalService()->classifyUpdateHistory($oldInfo, $newInfo);
        $this->assertEquals(1, $result[0]['id']);
    }

    public function testClassifyAddHistory()
    {
        $newInfo = '[{"id":"1","name":"2"},{"id":"2","name":""},{"id":"","name":"11"}]';
        $result = $this->getGoalApprovalService()->classifyAddHistory($newInfo);
        $this->assertEquals('11', $result[0]['name']);
    }

    public function testClassifyDeleteHistory()
    {
        $oldInfo = '[{"id":"1","name":"11"},{"id":"2","name":"22"}]';
        $newInfo = '[{"id":"1","name":"2"},{"id":"2","name":""},{"id":"","name":"11"}]';
        $result = $this->getGoalApprovalService()->classifyDeleteHistory($oldInfo, $newInfo);
        $this->assertEquals('2', $result[0]['id']);
    }

    public function testUpdateHistoryByStatus()
    {
        $history = array(
            'goalId' => 1,
            'oldInfo' => '[{"id":"1","name":"11"},{"id":"2","name":"22"}]',
            'newInfo' => '[{"id":"1","name":"2"},{"id":"2","name":""},{"id":"","name":"11"}]',
            'status' => 'notAudit',
            'adjustReason' => '11'
        );
        $historyResult = $this->getGoalApprovalService()->createHistory($history);
        $result = $this->getGoalApprovalService()->updateHistoryByStatus(1, 'reject', '11');
        $this->assertEquals('reject', $result['status']);

        $result = $this->getGoalApprovalService()->updateHistoryByStatus(1, 'audit', '11');
        $this->assertEquals('audit', $result['status']);

        $result = $this->getGoalApprovalService()->updateHistoryByStatus(1, '11', '11');
        $this->assertEquals(false, $result);
    }

    public function testCreateHistory()
    {
        $history = array(
            'goalId' => 1,
            'oldInfo' => '[{"id":"1","name":"11"},{"id":"2","name":"22"}]',
            'newInfo' => '[{"id":"1","name":"2"},{"id":"2","name":""},{"id":"","name":"11"}]',
            'status' => 'notAudit',
            'adjustReason' => '11'
        );
        $historyResult = $this->getGoalApprovalService()->createHistory($history);
        $this->assertEquals($history['goalId'], $historyResult['goalId']);
    }

	public function testAddHistoryByAdjust()
	{
		$fields = array(
			'goalId' => '1',
			'oldInfo' => json_encode(array('0' => array('id' => '1', 'name' => 'KR1'))),
			'newInfo' => json_encode(array('id' => '1', 'name' => 'KR!')),
			'status' => 'notAudit',
			'adjustReason' => '编辑!',
			'rejectReason' => '',
		);
		$result = $this->getGoalApprovalDao()->create($fields);
		$this->assertEquals($fields['adjustReason'], $result['adjustReason']);
	}

    public function testSearchHistoryByGoalId()
    {
        $fields = array(
            'goalId' => '1',
            'oldInfo' => json_encode(array('0' => array('id' => '1', 'name' => 'KR1'))),
            'newInfo' => json_encode(array('id' => '1', 'name' => 'KR!')),
            'status' => 'notAudit',
            'adjustReason' => '编辑!',
            'rejectReason' => '',
        );
        $this->getGoalApprovalDao()->create($fields);
        $goalId = 1;
        $result = $this->getGoalApprovalService()->searchHistoryByGoalId($goalId);
        $this->assertEquals($fields['goalId'], $result[0]['goalId']);
    }

    public function testUpdateHistoryByAdjust()
    {
        $fields = array(
            'goalId' => '1',
            'oldInfo' => json_encode(array('0' => array('id' => '1', 'name' => 'KR1'))),
            'newInfo' => json_encode(array('id' => '1', 'name' => 'KR!')),
            'status' => 'notAudit',
            'adjustReason' => '编辑!',
            'rejectReason' => '',
        );
        $this->getGoalApprovalDao()->create($fields);
        $history = $this->getGoalApprovalService()->SearchHistoryByGoalId($fields['goalId']);
        $field = array(
            'adjustReason' => '测试！！！',
            'newInfo' => json_encode(array('id' => '1', 'name' => 'KR!')),
        );
        $result = $this->getGoalApprovalService()->updateHistoryByAdjust($history[0]['id'], $field);
    }

    protected function getGoalApprovalService()
    {
        return $this->createService('CustomBundle:GoalApproval:GoalApprovalService');
    }

    protected function getGoalApprovalDao()
    {
        return $this->createDao('CustomBundle:GoalApproval:GoalApprovalDao');
    }
}