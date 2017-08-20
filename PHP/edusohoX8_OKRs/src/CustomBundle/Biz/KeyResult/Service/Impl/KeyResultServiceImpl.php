<?php

namespace CustomBundle\Biz\KeyResult\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\KeyResult\Dao\KeyResultDao;
use CustomBundle\Biz\KeyResult\Service\KeyResultService;
use Topxia\Service\Common\ServiceKernel;

class KeyResultServiceImpl extends BaseService implements KeyResultService
{
    public function createKR($kr)
    {
        return $this->getKeyResultDao()->create($kr);
    }

    public function getKeyResult($KRId)
    {
        return $this->getKeyResultDao()->get($KRId);
    }

    public function findByGoalId($goalId)
    {   
        $start = 0;
        $limit = 5;
        $orderBys=array();
        return $this->getKeyResultDao()->search($goalId, $orderBys, $start, $limit);
    }

    public function findKRsInfo($KRsInfo)
    {   
        $KRs = array();
        foreach ($KRsInfo as $KRInfo) {
            $KRid = array('keyResultId' => $KRInfo[ 'id'] );
            $OthersRating = $this->getOthersRatingService()->findByKeyResultId($KRid);
            $othersScore = array();              
            for ($otherNumber = 0; $otherNumber < count($OthersRating); $otherNumber++) {
                $user = $this->getUserService()->getUser($OthersRating[$otherNumber]['userId']);   
                $userName=$user['nickname'];
                $score = $OthersRating[$otherNumber]['score'];
                $otherScore = array(
                    'userName' =>  $userName,
                    'score' => $score
                );
                array_push($othersScore, $otherScore);
            }
            $KR = array (
                'KRsInfo' => $KRInfo,
                'othersScore' => $othersScore
            );
            array_push($KRs, $KR);
        }
        return $KRs;
    }

    protected function getUserService()
    {
        return $this->createService('User:UserService');
    }

    public function addKeyResult($id, $name)
    {
        $sectionGoalId = $this->getGoalService()->getSectionGoalIdByGoal($id);
        $adjustingTime = $this->getSectionGoalService()->inAdjustingTime($sectionGoalId);
        if ($adjustingTime) {
            $fields = array(
                'goalId' => $id,
                'name' => $name,
            );
            return $this->getKeyResultDao()->create($fields);
        } else {
            return false;
        }
    }

    public function deleteKeyResult($id)
    {
        $sectionGoalId = $this->getSectionGoalIdByKR($id);
        $adjustingTime = $this->getSectionGoalService()->inAdjustingTime($sectionGoalId);
        if ($adjustingTime) {
            return $this->getKeyResultDao()->delete($id);
        } else {
            return false;
        }
    }

    public function deleteKeyResultByGoalId($goalId)
    {
        $sectionGoalId = $this->getGoalService()->getSectionGoalIdByGoal($goalId);
        $adjustingTime = $this->getSectionGoalService()->inAdjustingTime($sectionGoalId);
        if ($adjustingTime) {
            return $this->getKeyResultDao()->deleteKeyResultByGoalId($goalId);
        } else {
            return false;
        }
    }

    public function updateKRName($KRId, $editKRName)
    {
        $sectionGoalId = $this->getSectionGoalIdByKR($KRId);
        $adjustingTime = $this->getSectionGoalService()->inAdjustingTime($sectionGoalId);
        if ($adjustingTime) {
            $fields = array('name' => $editKRName);
            return $this->getKeyResultDao()->updateKRName($KRId, $fields);
        } else {
            return false;
        }
    }

    public function findKRs($goalId)
    {
        return $this->getKeyResultDao()->findKeyResult($goalId);
    }

    public function updateKRs($krs)
    {
        if (!empty($krs)) {
            foreach ($krs as $kr) {
                $this->getKeyResultDao()->update($kr['id'], array('name' => $kr['newName']));
            }
            return true;
        }
        return false;
    }

    public function addKRs($krs, $goalId)
    {
        if (!empty($krs)) {
            foreach ($krs as $kr) {
                $this->getKeyResultDao()->create(array('goalId' => $goalId, 'name' => $kr['name']));
            }
            return true;
        }
        return false;
    }

    public function deleteKRs($krs)
    {
        if (!empty($krs)) {
            foreach ($krs as $kr) {
                $this->getKeyResultDao()->delete($kr['id']);
            }
            return true;
        }
        return false;
    }

    public function operateKRs($updateInfo, $addInfo, $deleteInfo, $goalId, $status)
    {
        if ($status == 'audit') {
            $this->updateKRs($updateInfo);
            $this->addKRs($addInfo, $goalId);
            $this->deleteKRs($deleteInfo);
            return true;
        } else {
            return false;
        }
    }

    public function getSectionGoalIdByKR($KRid)
    {
        $KR = $this->getKeyResultDao()->get($KRid);
        $goalId = $KR['goalId'];
        return $this->getGoalService()->getSectionGoalIdByGoal($goalId);
    }

    protected function getKeyResultDao()
    {
        return $this->createDao('CustomBundle:KeyResult:KeyResultDao');
    }

    protected function getSectionGoalService()
    {
        return $this->createService('CustomBundle:SectionGoal:SectionGoalService');
    }

    protected function getGoalService()
    {
        return $this->createService('CustomBundle:Goal:GoalService');
    }

    protected function getOthersRatingService()
    {
        return $this->createService('CustomBundle:OthersRating:OthersRatingService');
    }
}