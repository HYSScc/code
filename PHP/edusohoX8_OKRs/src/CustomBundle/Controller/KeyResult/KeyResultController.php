<?php

namespace CustomBundle\Controller\KeyResult; 
use  AppBundle\Controller\BaseController;
use Symfony\Component\HttpFoundation\Request;

class KeyResultController extends BaseController
{
    public function showKRsAction(Request $request, $goalId)
    {   
        $conditions=array('goalId' =>$goalId);
        $KRsInfo = $this->getKeyResultService()->findByGoalId($conditions);
        $goal = $this->getGoalService()->getGoal($goalId);
        $goalName = $goal['name'];
        $KRs = $this->getKeyResultService()->findKRsInfo($KRsInfo);
        return $this->render(
            '@Custom/keyResult/show-krs-model.html.twig',
            array(
                'KRs' => $KRs,
                'goalName' => $goalName
             )
         );
    }

    protected function tryGetUser($id)
    {
        $user = $this->getUserService()->getUser($id);

        if (empty($user)) {
            throw $this->createNotFoundException();
        }

        return $user;
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