<?php

namespace CustomBundle\Tests\SectionGoal;

use Biz\BaseTestCase;

class SectionGoalServiceTest extends BaseTestCase
{
    public function testFindGoalsBySectionGoals()
    {
        $sectionGoal = array(
            'name' => '第一季度',
            'userId' => '1',
            'year' => '2018',
            'id' => '1',
            'startTime' => '2017-08-11 11:30',
            'confirmEndTime' => '2017-08-11 11:30',
            'adjustStartTime' => '2017-08-11 11:30',
            'adjustEndTime' => '2017-08-11 11:30',
            'selfRatingEndTime' => '2017-08-11 11:30',
            'othersRatingEndTime' => '2017-08-11 11:30'
        );
        $sectionGoal = $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $goal = array(
            'sectionGoalId' => $sectionGoal['id'],
            'name' => '走路',
            'adjustReason' => 'nothing',
            'approvingKrInfo' => '',
            'userId' => '1',
            'id' => '1'
        );
        $goal = $this->getGoalDao()->create($goal);
        $result = $this->getSectionGoalService()->findGoalsBySectionGoals(array('0' => $sectionGoal), $goal['userId']);
        $this->assertEquals(array('sectionGoal' => $sectionGoal, 'goals' => array('0' => $goal)), $result[0]);
    }

    public function testCreateSectionGoal()
    {
        $sectionGoal1 = $this->sectionGoalFields('第一季度', 'thisYear', 1);
        $sectionGoal2 = $this->sectionGoalFields('第一季度', 'nextYear', 1);
        $result1 = $this->getSectionGoalService()->createSectionGoal($sectionGoal1);
        $result2 = $this->getSectionGoalService()->createSectionGoal($sectionGoal2);
        $this->assertEquals($sectionGoal1['name'], $result1['name']);
        $this->assertEquals($sectionGoal2['name'], $result2['name']);
        $this->assertEquals(date('Y', time()), $result1['year']);
        $this->assertEquals(date('Y', time()) + 1, $result2['year']);
    }

    public function testFindSectionGoalByYear()
    {
        $sectionGoal = array(
            'name' => '第一季度',
            'userId' => '1',
            'year' => '2018',
            'id' => '1',
            'startTime' => '2017-08-11 11:30',
            'confirmEndTime' => '2017-08-11 11:30',
            'adjustStartTime' => '2017-08-11 11:30',
            'adjustEndTime' => '2017-08-11 11:30',
            'selfRatingEndTime' => '2017-08-11 11:30',
            'othersRatingEndTime' => '2017-08-11 11:30'
        );
        $sectionGoal = $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $result = $this->getSectionGoalService()->findSectionGoalByYear($sectionGoal['year']);
        $this->assertEquals($sectionGoal['name'], $result[0]['name']);
    }

    /**
     *@expectedException \Codeages\Biz\Framework\Service\Exception\InvalidArgumentException
     **/
    public function testCreateSectionGoalWithoutFields()
    {
        $sectionGoal = array(
            'startTime' => '2017-08-11 11:30',
            'confirmEndTime' => '2017-08-11 11:30',
            'adjustStartTime' => '2017-08-11 11:30',
            'adjustEndTime' => '2017-08-11 11:30',
            'selfRatingEndTime' => '2017-08-11 11:30',
            'name' => '第一季度',
            'othersRatingEndTime' => '2017-08-11 11:30'
        );
        $result = $this->getSectionGoalService()->createSectionGoal($sectionGoal);
    }

    public function testUpdateSectionGoal()
    {
        $sectionGoal = $this->sectionGoalFields('第一季度', 'thisYear', 1);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $sectionGoal['name'] = '第二季度';
        $result = $this->getSectionGoalService()->updateSectionGoal($sectionGoal['id'], $sectionGoal);
        $this->assertEquals($sectionGoal['name'], $result['name']);
    }

    public function testGetSectionGoal()
    {
        $sectionGoal = $this->sectionGoalFields('第一季度', 'thisYear', 1);
        $result = $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $result = $this->getSectionGoalService()->getSectionGoal($sectionGoal['id']);
        $this->assertEquals($sectionGoal['name'], $result['name']);
    }

    public function testDeleteSectionGoal()
    {
        $sectionGoal = $this->sectionGoalFields('第一季度', 'thisYear', 1);
        $result = $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $result = $this->getSectionGoalService()->deleteSectionGoal($sectionGoal['id']);
        $result = $this->getSectionGoalService()->getSectionGoal($sectionGoal['id']);

        $this->assertNull($result);
    }

    public function testGetByName()
    {
        $sectionGoal = $this->sectionGoalFields('第一季度', 'thisYear', 1);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $result = $this->getSectionGoalService()->getByname($sectionGoal['name']);
        $this->assertEquals($sectionGoal['name'], $result['name']);
    }

    public function testCheckName()
    {
        $sectionGoal = $this->sectionGoalFields('第一季度', 'thisYear', 1);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $this->getSectionGoalService()->checkName('第一季度');
        $sectionGoal = $this->getSectionGoalService()->getSectionGoal(1);
        $this->assertEquals('第一季度', $sectionGoal['name']);
    }

    public function testCountSectionGoals()
    {
        $sectionGoal1 = $this->sectionGoalFields('第一季度', 'thisYear', 1);
        $sectionGoal2 = $this->sectionGoalFields('第一季度', 'nextYear', 2);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal1);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal2);
        $conditions = array(
            'name' => '第一季度',
        );
        $result = $this->getSectionGoalService()->countSectionGoals($conditions);
        $this->assertEquals(2, $result);
    }

    public function testSearchSectionGoals()
    {
        $sectionGoal1 = $this->sectionGoalFields('第一季度', 'thisYear', 1);
        $sectionGoal2 = $this->sectionGoalFields('第一季度', 'nextYear', 2);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal1);
        $this->getSectionGoalService()->createSectionGoal($sectionGoal2);
        $conditions = array(
            'name' => '第一季度',
        );
        $sectionGoals = $this->getSectionGoalService()->searchSectionGoals($conditions, null, 0, 10);

        $this->assertEquals(2, count($sectionGoals));
        $this->assertEquals($sectionGoal1['name'], $sectionGoals[0]['name']);
    }

    public function testIsInAdjustingTime()
    {
        $sectionGoal = array(
            'id' => '1',
            'year' => '2017',
            'startTime' => date('YmdHis', time()-1000),
            'confirmEndTime' => date('YmdHis', time()+1000),
            'name' => '第一季度',
            'userId' => '1',
            'adjustStartTime' => '2017-08-11 11:30',
            'adjustEndTime' => '2017-08-11 11:30',
            'selfRatingEndTime' => '2017-08-11 11:30',
            'othersRatingEndTime' => '2017-08-11 11:30'
        );
        $sectionGoal = $this->getSectionGoalService()->createSectionGoal($sectionGoal);
        $result = $this->getSectionGoalService()->inAdjustingTime($sectionGoal['id']);
        $this->assertEquals(true, $result);
    }

    private function sectionGoalFields($name, $year, $id)
    {
        return array(
            'id' => $id,
            'year' => $year,
            'startTime' => '2017-08-11 11:30',
            'confirmEndTime' => '2017-08-11 11:30',
            'adjustStartTime' => '2017-08-11 11:30',
            'adjustEndTime' => '2017-08-11 11:30',
            'selfRatingEndTime' => '2017-08-11 11:30',
            'name' => $name,
            'othersRatingEndTime' => '2017-08-11 11:30',
        );
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }

    protected function getGoalDao()
    {
        return $this->createDao('CustomBundle:Goal:GoalDao');
    }
}
