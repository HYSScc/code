<?php

namespace CustomBundle\Biz\Goal\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\Goal\Service\GoalService;
use CustomBundle\Biz\Goal\Dao\GoalDao;
use AppBundle\Common\ArrayToolkit;

class GoalServiceImpl extends BaseService implements GoalService
{
    public function findGoalsBySectionId($sectionGoalId)
    {
        return $this->getGoalDao()->findBySectionId($sectionGoalId);
    }

    public function getGoal($id)
    {
        return $this->getGoalDao()->get($id);
    }

    public function addGoal($id, $sectionGoalId, $goalName)
    {
        if ($this->getSectionGoalService()->inAdjustingTime($sectionGoalId)) {
            $fields = array(
                'sectionGoalId' => $sectionGoalId,
                'name' => $goalName,
                'adjustReason' => '',
                'approvingKrInfo' => '',
                'userId' => $id
            );
            $result = $this->getGoalDao()->create($fields);
            $this->getUserSectionGoalService()->addUpdate($sectionGoalId, $id);
            return $result;
        } else {
            return false;
        }
    }

    public function findGoalsBySectionGoal($sectionGoalId, $userId)
    {
        return $this->getGoalDao()->findBySectionGoalIdAndUserId($sectionGoalId, $userId);
    }

    public function updateGoalName($goalId, $goalName)
    {
        $sectionGoalId = $this->getSectionGoalIdByGoal($goalId);
        if ($this->getSectionGoalService()->inAdjustingTime($sectionGoalId)) {
            $fields = array('name' => $goalName);
            return $this->getGoalDao()->updateGoal($goalId, $fields);
        } else {
            return false;
        }
    }

    public function updataGoal($id, $field)
    {
        return $this->getGoalDao()->update($id, $field);
    }

    public function deleteGoal($goalId)
    {
        $goal = $this->getGoal($goalId);
        $sectionGoalId = $this->getSectionGoalIdByGoal($goalId);
        if ($this->getSectionGoalService()->inAdjustingTime($sectionGoalId)) {
            $result = $this->getGoalDao()->delete($goalId);
            $this->getKeyResultService()->deleteKeyResultByGoalId($goalId);
            $goals = $this->findGoalsBySectionGoal($sectionGoalId, $goal['userId']);
            if (count($goals) == 0) {
                $this->getUserSectionGoalService()->deleteUpdate($sectionGoalId, $goal['userId']);
            }
            return $result;
        } else {
            return false;
        }
    }

    public function addKrToGoal($goalId, $krName, $krReason)
    {   
        $this->addHistoryThroughAdd($goalId, $krName, $krReason);
        $sectionGoalId = $this->getSectionGoalIdByGoal($goalId);
        $adjustingTime = $this->getSectionGoalService()->inAdjustTime($sectionGoalId);
        if ($adjustingTime) {
            $goalInfo = $this->getGoalById($goalId);
            $reason = $goalInfo['adjustReason'] . '' . $krReason;
            $approvingKrInfo = $goalInfo['approvingKrInfo'];
            $jsonToArray = json_decode($approvingKrInfo, true);
            if (empty($jsonToArray)) {
                $jsonToArray = array('0' => array('id' => '', 'name' => $krName));
                $result = json_encode($jsonToArray);
                $fields = array(
                    'adjustReason' => $reason,
                    'approvingKrInfo' => $result,
                );
                return $this->getGoalDao()->update($goalId, $fields);
            } else {
                foreach ($jsonToArray as $number => $krs) {
                    if ($number === sizeof($jsonToArray) - 1) {
                        $number = $number++;
                        $krArray = array($number => array('id' => '', 'name' => $krName));
                        $arr = array_merge($jsonToArray, $krArray);
                        $result = json_encode($arr);
                        $fields = array(
                            'adjustReason' => $reason,
                            'approvingKrInfo' => $result,
                        );
                        return $this->getGoalDao()->update($goalId, $fields);
                    }
                }
            }  
        } else {
            return false;
        }
    }

    public function updateKrToGoal($krId, $krName, $krReason)
    {  
        $this->addHistoryThroughUpdate($krId, $krName, $krReason);
        $sectionGoalId = $this->getSectionGoalIdByKR($krId);
        $adjustingTime = $this->getSectionGoalService()->inAdjustTime($sectionGoalId); 
        if ($adjustingTime) {   
            $krInfo = $this->getKeyResultDao()->get($krId);
            $goalInfo = $this->getGoalById($krInfo['goalId']);
            $reason = $goalInfo['adjustReason'] . '' . $krReason;
            $approvingKrInfo = $goalInfo['approvingKrInfo'];
            $jsonToArray = json_decode($approvingKrInfo, true);
            if (empty($jsonToArray)) {
                $jsonToArray = array( 0 => array('id' => $krId, 'name' => $krName));
                $result = json_encode($jsonToArray);
                $fields = array(
                    'adjustReason' => $reason,
                    'approvingKrInfo' => $result,
                );
                return $this->getGoalDao()->update($krInfo['goalId'], $fields);
            } else {
                foreach ($jsonToArray as $number => $krs) {
                    if ($number === sizeof($jsonToArray) - 1) {
                        $number = $number++;
                        $krArray = array($number => array('id' => $krId,'name' => $krName));
                        $arr = array_merge($jsonToArray, $krArray);
                        $result = json_encode($arr);
                        $fields = array(
                            'adjustReason' => $reason,
                            'approvingKrInfo' => $result,
                        );
                        return $this->getGoalDao()->update($krInfo['goalId'], $fields);
                    }
                } 
            } 
        } else {
            return false;
        }
    }

    public function deleteKrToGoal($krId, $krReason)
    {
        $this->addHistoryThroughDelete($krId, $krReason);
        $sectionGoalId = $this->getSectionGoalIdByKR($krId);
        $adjustingTime = $this->getSectionGoalService()->inAdjustTime($sectionGoalId);
        if ($adjustingTime) {
            $krInfo = $this->getKeyResultDao()->get($krId);
            $goalInfo = $this->getGoalById($krInfo['goalId']);
            $reason = $goalInfo['adjustReason'] . '' . $krReason;
            $approvingKrInfo = $goalInfo['approvingKrInfo'];
            $jsonToArray = json_decode($approvingKrInfo, true);
            if (empty($jsonToArray)) {
                $jsonToArray = array( 0 => array('id' => $krId, 'name' => ''));
                $result = json_encode($jsonToArray);
                $fields = array(
                    'adjustReason' => $reason,
                    'approvingKrInfo' => $result,
                );
                return $this->getGoalDao()->update($krInfo['goalId'], $fields);
            } else {
                foreach ($jsonToArray as $number => $krs) {
                    if ($number === sizeof($jsonToArray) - 1) {
                        $number = $number++;
                        $krArray = array($number => array('id' => $krId, 'name' => ''));
                        $arr = array_merge($jsonToArray, $krArray);
                        $result = json_encode($arr);
                        $fields = array(
                            'adjustReason' => $reason,
                            'approvingKrInfo' => $result,
                        );
                        return $this->getGoalDao()->update($krInfo['goalId'], $fields);
                    }
                }
            }  
        } else {
            return false;
        }
    }

    public function addHistoryThroughAdd($goalId, $krName, $krReason)
    {
        $sectionGoalId = $this->getSectionGoalIdByGoal($goalId);
        $adjustingTime = $this->getSectionGoalService()->inAdjustTime($sectionGoalId);
        if ($adjustingTime) {
            $history = $this->getGoalApprovalService()->searchHistoryByGoalId($goalId);
            if (empty($history)) {
                $jsonKrsOldInfo = $this->getJsonKrsByGoalId($goalId);
                $jsonKrsNewInfo = json_encode(array( '0' => array('id' => '', 'name' => $krName)));
                return $this->getGoalApprovalService()->addHistoryByAdjust($goalId, $jsonKrsOldInfo, $jsonKrsNewInfo, $krReason);
            } else {
                $reason = $history[0]['adjustReason'] . '' . $krReason;
                $jsonToArray = json_decode($history[0]['newInfo'], true);
                foreach ($jsonToArray as $number => $krs) {
                    if ($number === sizeof($jsonToArray) - 1) {
                        $number = $number++;
                        $krArray = array($number => array('id' => '', 'name' => $krName));
                        $arr = array_merge($jsonToArray, $krArray);
                        $newInfo = json_encode($arr);
                        $fields = array(
                            'adjustReason' => $reason,
                            'newInfo' => $newInfo,
                        );
                        return $this->getGoalApprovalService()->updateHistoryByAdjust($history[0]['id'], $fields);
                    }
                }
            }   
        }
    }

    public function addHistoryThroughUpdate($krId, $krName, $krReason)
    {
        $sectionGoalId = $this->getSectionGoalIdByKR($krId);
        $adjustingTime = $this->getSectionGoalService()->inAdjustTime($sectionGoalId); 
        if ($adjustingTime) {
            $krInfo = $this->getKeyResultDao()->get($krId);
            $history = $this->getGoalApprovalService()->searchHistoryByGoalId($krInfo['goalId']);
            if (empty($history)) {
                $jsonKrsOldInfo = $this->getJsonKrsByGoalId($krInfo['goalId']);
                $jsonKrsNewInfo = json_encode(array('0' => array('id' => $krId, 'name' => $krName)));
                return $this->getGoalApprovalService()->addHistoryByAdjust($krInfo['goalId'], $jsonKrsOldInfo, $jsonKrsNewInfo, $krReason);
            } else {
                $reason = $history[0]['adjustReason'] . '' . $krReason;
                $jsonToArray = json_decode($history[0]['newInfo'], true);
                foreach ($jsonToArray as $number => $krs) {
                    if ($number === sizeof($jsonToArray) - 1) {
                        $number = $number++;
                        $krArray = array($number => array('id' => $krId, 'name' => $krName));
                        $arr = array_merge($jsonToArray, $krArray);
                        $newInfo = json_encode($arr);
                        $fields = array(
                            'adjustReason' => $reason,
                            'newInfo' => $newInfo,
                        );
                        return $this->getGoalApprovalService()->updateHistoryByAdjust($history[0]['id'], $fields);
                    }
                }    
            }  
        }   
    }

    public function addHistoryThroughDelete($krId, $krReason)
    {
        $sectionGoalId = $this->getSectionGoalIdByKR($krId);
        $adjustingTime = $this->getSectionGoalService()->inAdjustTime($sectionGoalId);
        if ($adjustingTime) {
            $krInfo = $this->getKeyResultDao()->get($krId);
            $history = $this->getGoalApprovalService()->searchHistoryByGoalId($krInfo['goalId']);
            if (empty($history)) {
                $jsonKrsOldInfo = $this->getJsonKrsByGoalId($krInfo['goalId']);
                $jsonKrsNewInfo = json_encode(array( '0' => array('id' => $krId, 'name' => '')));
                return $this->getGoalApprovalService()->addHistoryByAdjust($krInfo['goalId'], $jsonKrsOldInfo, $jsonKrsNewInfo, $krReason);
            } else {
                $reason = $history[0]['adjustReason'] . '' . $krReason;
                $jsonToArray = json_decode($history[0]['newInfo'], true);
                foreach ($jsonToArray as $number => $krs) {
                    if ($number === sizeof($jsonToArray) - 1) {
                        $number = $number++;
                        $krArray = array($number => array('id' => $krId, 'name' => ''));
                        $arr = array_merge($jsonToArray, $krArray);
                        $newInfo = json_encode($arr);
                        $fields = array(
                            'adjustReason' => $reason,
                            'newInfo' => $newInfo,
                        );
                        return $this->getGoalApprovalService()->updateHistoryByAdjust($history[0]['id'], $fields);
                    }
                }    
            }
        }
    }

    private function getJsonKrsByGoalId($goalId)
    {   
        $krsInfo = $this->getKeyResultDao()->findKeyResult($goalId);
        $krs = array();
        foreach ($krsInfo as $number => $krs) {
            $kr = array($number => array('id' => $krs['id'], 'name' => $krs['name']));
            $krs = array_merge($krs, $kr);
        }
        return json_encode($krs);
    }

    public function getGoalById($id)
    {
        return $this->getGoalDao()->get($id);
    }

    public function getSectionGoalIdByKR($KRid)
    {
        $KR = $this->getKeyResultDao()->get($KRid);
        $goalId = $KR['goalId'];
        return $this->getSectionGoalIdByGoal($goalId);
    }

    public function getSectionGoalIdByGoal($goalId)
    {
        $goal = $this->getGoalDao()->get($goalId);
        return $goal['sectionGoalId'];
    }

    public function findGoalsByUserIds($userIds)
    {
        $goals = $this->getGoalDao()->findByUserIds($userIds);
        $goalIds = ArrayToolkit::column($goals, 'id');
        return $goalIds;
    }

    protected function getGoalDao()
    {
        return $this->createDao('CustomBundle:Goal:GoalDao');
    }

    protected function getKeyResultService()
    {
        return $this->createService('CustomBundle:KeyResult:KeyResultService');
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }


    protected function getUserSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:UserSectionGoalService');
    }

    protected function getKeyResultDao()
    {
        return $this->createDao('CustomBundle:KeyResult:KeyResultDao');
    }

    protected function getGoalApprovalService()
    {
        return $this->createService('CustomBundle:GoalApproval:GoalApprovalService');
    }
}