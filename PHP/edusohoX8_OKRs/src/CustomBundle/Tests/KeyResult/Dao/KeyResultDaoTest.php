<?php

namespace CustomBundle\Tests\KeyResult\Dao;

use Biz\BaseTestCase;

class KeyResultDaoTest extends BaseTestCase
{
    public function testFindKeyResult()
    {
        $keyResult = array(
            'goalId' => '1',
            'name' => '吃水果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $keyResult = $this->getKeyResultDao()->create($keyResult);
        $result = $this->getKeyResultDao()->findKeyResult($keyResult['goalId']);
        $this->assertEquals($keyResult['name'], $result[0]['name']);
    }

    public function testDeleteKeyResultByGoalId()
    {
        $keyResult = array(
            'goalId' => '1',
            'name' => '吃水果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $keyResult = $this->getKeyResultDao()->create($keyResult);
        $result = $this->getKeyResultDao()->deleteKeyResultByGoalId($keyResult['goalId']);
        $this->assertEquals(true, $result);
    }

    public function testUpdateKRName()
    {
        $keyResult = array(
            'goalId' => '1',
            'name' => '吃水果',
            'selfScore' => '0',
            'othersScore' => '0'
        );
        $keyResult = $this->getKeyResultDao()->create($keyResult);
        $fields = array('name' => '吃苹果');
        $result = $this->getKeyResultDao()->updateKRName($keyResult['id'], $fields);
        $this->assertEquals($fields['name'], $result['name']);
    }

    protected function getKeyResultDao()
    {
        return $this->createDao('CustomBundle:KeyResult:KeyResultDao');
    }

}