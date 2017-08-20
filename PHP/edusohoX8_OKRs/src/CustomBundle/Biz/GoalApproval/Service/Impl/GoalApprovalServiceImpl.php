<?php

namespace CustomBundle\Biz\GoalApproval\Service\Impl;

use Biz\BaseService; 
use CustomBundle\Biz\GoalApproval\Service\GoalApprovalService;

class GoalApprovalServiceImpl extends BaseService implements  GoalApprovalService
{
    public function searchHistories($goalIds, $status, $start, $limit)
    {
        $existedStatus = array('notAudit', 'audit', 'reject', 'all');
        if (!in_array($status, $existedStatus)) {
            $status = 'notAudit';
        }
        if ($status == 'all') {
            $status = '';
        }
        if (!empty($goalIds)) {
            return $this->getGoalApprovalDao()->search(
                array('goalId' => $goalIds, 'status' =>$status),
                array('id' => 'ASC'),
                $start,
                $limit
            );
        } else {
            return array();
        }
    }

    public function countHistory($status)
    {
        $existedStatus = array('notAudit', 'audit', 'reject', 'all');
        if (!in_array($status, $existedStatus)) {
            $status = 'notAudit';
        }
        if ($status == 'all') {
            $status = '';
        }
        return $this->getGoalApprovalDao()->count(array('status' => $status));
    }

    public function getHistory($id)
    {
        return $this->getGoalApprovalDao()->get($id);
    }

    public function classifyUpdateHistory($oldInfo, $newInfo)
    {
        $oldInfo = json_decode($oldInfo, true);
        $newInfo = json_decode($newInfo, true);
        $updateInfo = array();
        if (!empty($newInfo)) {
            foreach ($newInfo as $info) {
                if (!empty($info['id'] && !empty($info['name']))) {
                    foreach ($oldInfo as $secondInfo) {
                        if ($secondInfo['id'] == $info['id']) {
                            $secondInfo['newName'] = $info['name'];
                            array_push($updateInfo, $secondInfo);
                        }
                    }
                }
            }
        }
        return $updateInfo;
    }

    public function classifyAddHistory($newInfo)
    {
        $newInfo = json_decode($newInfo, true);
        $addIndo = array();
        if (!empty($newInfo)) {
            foreach ($newInfo as $info) {
                if (empty($info['id'])) {
                    array_push($addIndo, $info);
                }
            }
        }
        return $addIndo;
    }

    public function classifyDeleteHistory($oldInfo, $newInfo)
    {
        $oldInfo = json_decode($oldInfo, true);
        $newInfo = json_decode($newInfo, true);
        $deleteInfo = array();
        if (!empty($newInfo)) {
            foreach ($newInfo as $info) {
                if (empty($info['name'])) {
                    foreach ($oldInfo as $secondInfo) {
                        if ($secondInfo['id'] == $info['id']) {
                            array_push($deleteInfo, $secondInfo);
                        }
                    }
                }
            }
        }
        return $deleteInfo;
    }

    public function updateHistoryByStatus($id, $status, $reason)
    {
        if ($status == 'reject') {
            return $this->getGoalApprovalDao()->update($id, array('status' => $status, 'rejectReason' => $reason));
        } elseif ($status == 'audit') {
            return $this->getGoalApprovalDao()->update($id, array('status' => $status));
        } else {
            return false;
        }
    }

    public function addHistoryByAdjust($goalId, $oldInfo, $newInfo, $adjustReason)
    {
        $fields = array(
            'goalId' => $goalId,
            'oldInfo' => $oldInfo,
            'newInfo' => $newInfo,
            'status' => 'notAudit',
            'adjustReason' => $adjustReason,
            'rejectReason' => '',
        );
        return $this->getGoalApprovalDao()->create($fields);
    }


    public function createHistory($history)
    {
        return $this->getGoalApprovalDao()->create($history);
    }

    public function searchHistoryByGoalId($goalId)
    {
        return $this->getGoalApprovalDao()->findByGoalIds($goalId);
    }

    public function updateHistoryByAdjust($id, $fields)
    {
        return $this->getGoalApprovalDao()->update($id, $fields);
    }

    protected function getGoalApprovalDao()
    {
        return $this->createDao('CustomBundle:GoalApproval:GoalApprovalDao');
    }
}