<?php

namespace CustomBundle\Controller\Admin;

use AppBundle\Controller\BaseController;
use AppBundle\Controller\DefaultController as BaseDefaultController;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Common\Paginator;

class goalApprovalController extends BaseDefaultController
{
    public function indexAction(Request $request)
    {
        $COUNT = 20;
        $status = $request->query->get('status');
        $currentUser = $this->getCurrentUser();
        $user = $this->getUserService()->getUser($currentUser['id']);
        $historyCount = $this->getGoalApprovalService()->countHistory($status);
        $paginator = new Paginator(
            $this->get('request'),
            $historyCount,
            $COUNT
        );

        if (!$this->getPostService()->isManageUser(array('id' => $user['postId']))) {
            return $this->render('CustomBundle:admin/approval:index.html.twig', array(
                'histories' => array(),
                'paginator' => $paginator
            ));
        }

        $org = $this->getOrgService()->checkBeforeGet($user['orgId']);
        $userId = $this->getUserService()->getUserId($user['orgId'], $user['postId'], $org['depth']);
        $depth = $org['depth'] + 1;
        $orgs = $this->getOrgService()->getOrgId($depth);
        $userId = $this->getUserService()->getUserIdByOrgAndMerge($orgs, $user['postId'], $userId);
        $goalIds = $this->getGoalService()->findGoalsByUserIds($userId);
        $histories = $this->getGoalApprovalService()->searchHistories(
            $goalIds, 
            $status,
            $paginator->getOffsetCount(),
            $paginator->getPerPageCount()
        );

        return $this->render('CustomBundle:admin/approval:index.html.twig', array(
            'histories' => $histories,
            'paginator' => $paginator
        ));
    }

    public function editAction(Request $request)
    {
        $id = $request->query->get('id');
        $history = $this->getGoalApprovalService()->getHistory($id);
        $updateInfo = $this->getGoalApprovalService()->classifyUpdateHistory(
            $history['oldInfo'], 
            $history['newInfo']
        );
        $addInfo = $this->getGoalApprovalService()->classifyAddHistory($history['newInfo']);
        $deleteInfo = $this->getGoalApprovalService()->classifyDeleteHistory(
            $history['oldInfo'], 
            $history['newInfo']
        );
        return $this->render('CustomBundle:admin/approval:edit-goal-approval.html.twig', array(
            'updateInfo' => $updateInfo,
            'addInfo' => $addInfo,
            'deleteInfo' => $deleteInfo,
            'history' => $history
        ));
    }

    public function showAction(Request $request)
    {
        $id = $request->query->get('id');
        $history = $this->getGoalApprovalService()->getHistory($id);
        $updateInfo = $this->getGoalApprovalService()->classifyUpdateHistory(
            $history['oldInfo'], 
            $history['newInfo']
        );
        $addInfo = $this->getGoalApprovalService()->classifyAddHistory($history['newInfo']);
        $deleteInfo = $this->getGoalApprovalService()->classifyDeleteHistory(
            $history['oldInfo'], 
            $history['newInfo']
        );
        return $this->render('CustomBundle:admin/approval:show-goal-approval.html.twig', array(
            'updateInfo' => $updateInfo,
            'addInfo' => $addInfo,
            'deleteInfo' => $deleteInfo,
            'history' => $history
        ));
    }

    public function updateAction(Request $request, $id)
    {
        $file = $_GET;
        $history = $this->getGoalApprovalService()->getHistory($id);
        $updateInfo = $this->getGoalApprovalService()->classifyUpdateHistory(
            $history['oldInfo'], 
            $history['newInfo']
        );
        $addInfo = $this->getGoalApprovalService()->classifyAddHistory($history['newInfo']);
        $deleteInfo = $this->getGoalApprovalService()->classifyDeleteHistory(
            $history['oldInfo'], 
            $history['newInfo']
        );

        $this->getGoalApprovalService()->updateHistoryByStatus($id, $file['reply'], $file['rejectReason']);

        $goal = array('adjustReason' => '', 'approvingKrInfo' => '');
        $this->getGoalService()->updataGoal($history['goalId'], $goal);

        $this->getKeyResultService()->operateKRs(
            $updateInfo, 
            $addInfo, 
            $deleteInfo, 
            $history['goalId'], 
            $file['reply']
        );

        $user = $this->getCurrentUser();
        $toUser = $this->getGoalService()->getGoal($history['goalId']);
        $this->getSendApprovalMessageService()->sendApprovalMessage(
            $file['reply'], 
            $user['id'], 
            $toUser['userId'],
            $file['rejectReason']
        );
        return $this->indexAction($request);
    }

    protected function getPostService()
    {
        return $this->getBiz()->service('CustomBundle:Post:PostService');
    }

    protected function getOrgService()
    {
        return $this->getBiz()->service('CustomBundle:Org:OrgService');
    }

    protected function getUserService()
    {
        return $this->getBiz()->service('CustomBundle:User:UserService');
    }

    protected function getGoalService()
    {
        return $this->getBiz()->service('CustomBundle:Goal:GoalService');
    }

    protected function getGoalApprovalService()
    {
        return $this->getBiz()->service('CustomBundle:GoalApproval:GoalApprovalService');
    }

    protected function getKeyResultService()
    {
        return $this->getBiz()->service('CustomBundle:KeyResult:KeyResultService');
    }

    protected function getSendApprovalMessageService()
    {
        return $this->getBiz()->service('CustomBundle:GoalApproval:SendApprovalMessageService');
    }
}
