<?php

namespace CustomBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Controller\BaseController;

class OKRsController extends BaseController
{
    public function indexAction(Request $request, $id)
    {
        $user = $this->getUserService()->getUser($id);
        return $this->render('CustomBundle:okrs:index.html.twig', array(
            'user' => $user
        ));
    }

    public function showOkrsAction(Request $request, $id)
    {
        $user = $this->tryGetUser($id);
        $sectionGoals = $this->getSectionGoalService()->findSectionGoalByYear(date('Y',time()));
        $result = $this->getSectionGoalService()->findGoalsBySectionGoals($sectionGoals, $id);
        return $this->render('@Custom/krs-manage/index.html.twig', array(
            'user' => $user,
            'type' => 'okrs',
            'result' => $result
        ));
    }

    public function addGoalAction(Request $request, $id)
    {
        if ($request->getMethod() == 'POST') {
            $sectionGoalId = $request->query->get('sectionGoalId');
            $goalName = $request->request->get('goalName');
            $result = $this->getGoalService()->addGoal($id, $sectionGoalId, $goalName);
            return $this->createJsonResponse($result);
        }

        $sectionGoalId = $request->query->get('sectionGoalId');
        $goals = sizeof($this->getGoalService()->findGoalsBySectionGoal($sectionGoalId, $id));
        $goal = array(
            'sectionGoalId' => $sectionGoalId,
            'userId' => $id
        );
        return $this->render('@Custom/krs-manage/goal-modal.html.twig', array(
            'goal' => $goal,
            'goals' => $goals
        ));

    }

    public function addKeyResultsAction(Request $request, $id)
    {
        if ($request->getMethod() == 'POST') {
            $goalId = $request->query->get('goalId');
            $KRsName = $request->request->get('KRsName');
            $result = $this->getKeyResultService()->addKeyResult($goalId, $KRsName);
            return $this->createJsonResponse($result);
        }

        $goalId = $request->query->get('goalId');
        $keyResults = sizeof($this->getKeyResultService()->findKRs($goalId));
        $keyResult = array('goalId' => $goalId);
        return $this->render('@Custom/krs-manage/keyResult-modal.html.twig', array(
            'userId' => $id,
            'keyResult' => $keyResult,
            'keyResults' => $keyResults
        ));
    }

    public function selectSectionGoalAction(Request $request, $id)
    {
        $user = $this->tryGetUser($id);
        $year = $request->query->get('year');
        $sectionGoals = $this->getSectionGoalService()->findSectionGoalByYear($year);
        $result = $this->getSectionGoalService()->findGoalsBySectionGoals($sectionGoals, $id);
        return $this->render('@Custom/krs-manage/index.html.twig', array(
            'user' => $user,
            'type' => 'okrs',
            'result' => $result,
        ));
    }

    public function selectGoalAction(Request $request, $id)
    {
        $sectionGoalId = $request->query->get('sectionGoalId');
        $goalResult = $this->getGoalService()->findGoalsBySectionGoal($sectionGoalId, $id);
        return $this->createJsonResponse($goalResult);
    }

    public function selectKRsAction(Request $request)
    {
        $goalId = $request->query->get('goalId');
        $goal = $this->getGoalService()->getGoal($goalId);
        $KRsResult = $this->getKeyResultService()->findKRs($goalId);
        return $this->createJsonResponse(
            array('KRsResult' => $KRsResult, 'goal' => $goal)
        );
    }

    public function editGoalAction(Request $request, $id)
    {
        if ($request->getMethod() == 'POST') {
            $goalId = $request->query->get('goalId');
            $goalName = $request->request->get('goalName');
            $editGoal = $this->getGoalService()->updateGoalName($goalId, $goalName);
            return $this->createJsonResponse($editGoal);
        }

        $goalId = $request->query->get('goalId');
        $goal = $this->getGoalService()->getGoal($goalId);
        return $this->render('@Custom/krs-manage/goal-modal.html.twig', array(
            'goal' => $goal
        ));

    }

    public function deleteGoalAction(Request $request)
    {
        $goalId = $request->query->get('goalId');
        $result = $this->getGoalService()->deleteGoal($goalId);
        return $this->createJsonResponse($result);
    }

    public function editKRAction(Request $request, $id)
    {
        if ($request->getMethod() == 'POST') {
            $KRId = $request->query->get('KRId');
            $editKRName = $request->request->get('KRName');
            $result = $this->getKeyResultService()->updateKRName($KRId, $editKRName);
            return $this->createJsonResponse($result);
        }
        $KRId = $request->query->get('KRId');
        $keyResult = $this->getKeyResultService()->getKeyResult($KRId);
        return $this->render('@Custom/krs-manage/keyResult-modal.html.twig', array(
            'keyResult' => $keyResult,
            'userId' => $id
        ));
    }

    public function deleteKRAction(Request $request)
    {
        $KRId = $request->query->get('KRId');
        $result = $this->getKeyResultService()->deleteKeyResult($KRId);
        return $this->createJsonResponse($result);
    }

    public function addKrToGoalAction(Request $request)
    {
        $goalId = $request->query->get('goalId');
        $krName = $request->query->get('krsName');
        $krReason = $request->query->get('krsReason');
        $result = $this->getGoalService()->addKrToGoal($goalId, $krName, $krReason);
        return $this->createJsonResponse($result);
    }

    public function updateKrToGoalAction(Request $request)
    {
        $krId = $request->query->get('krId');
        $krName = $request->query->get('krName');
        $krReason = $request->query->get('krsReason');
        $result = $this->getGoalService()->updateKrToGoal($krId, $krName, $krReason);
        return $this->createJsonResponse($result);
    }

    public function deleteKrToGoalAction(Request $request)
    {
        $krId = $request->query->get('krId');
        $krReason = $request->query->get('krsReason');
        $result = $this->getGoalService()->deleteKrToGoal($krId, $krReason);
        return $this->createJsonResponse($result);
    }

    protected function tryGetUser($id)
    {
        $user = $this->getUserService()->getUser($id);
        if (empty($user)) {
            throw $this->createNotFoundException();
        }
        return $user;
    }

    protected function getUserService()
    {
        return $this->getBiz()->service('User:UserService');
    }

    protected function getSectionGoalService()
    {
        return $this->getBiz()->service('CustomBundle:SectionGoal:SectionGoalService');
    }

    protected function getGoalService()
    {
        return $this->getBiz()->service('CustomBundle:Goal:GoalService');
    }

    protected function getKeyResultService()
    {
        return $this->getBiz()->service('CustomBundle:KeyResult:KeyResultService');
    }
}
