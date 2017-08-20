<?php

namespace CustomBundle\Controller\Admin;

use Symfony\Component\HttpFoundation\Request;
use AppBundle\Controller\BaseController;
use AppBundle\Common\Paginator;
use Topxia\Service\Common\ServiceKernel;

class SectionGoalController extends BaseController
{
    public function indexAction(Request $request)
    {
        $conditions = $request->query->all();

        $sectionGoalCount = $this->getSectionGoalService()->countSectionGoals($conditions);
        $paginator = new Paginator(
            $this->get('request'),
            $sectionGoalCount,
            20
        );

        $sectionGoals = $this->getSectionGoalService()->searchSectionGoals(
            $conditions,
            array('createdTime' => 'DESC'),
            $paginator->getOffsetCount(),
            $paginator->getPerPageCount()
        );

        return $this->render('@Custom/admin/section-goal/index.html.twig',
            array(
                'sectionGoals' => $sectionGoals,
                'paginator' => $paginator,
            ));
    }

    public function createAction(Request $request)
    {
        if ($request->getMethod() === 'POST') {
            $sectionGoal = $request->request->all();
            $params = $this->getSectionGoalService()->createSectionGoal($sectionGoal);

            $this->getCrontabService()->createJob(array(
                'name' => 'PreCreateSMJob',
                'cycle' => 'once',
                'jobClass' => 'CustomBundle\\Biz\\SectionGoal\\Job\\PreCreateSMJob',
                'jobParams' => $params,
                'nextExcutedTime' => time(),
                'createdTime' => time(),
            ));
        }

        return $this->render('@Custom/admin/section-goal/section-goal-create-modal.html.twig', array());
    }

    public function updateAction(Request $request, $id)
    {
        $sectionGoal = $this->getSectionGoalService()->getSectionGoal($id);
        if (empty($sectionGoal)) {
            throw $this->createNotFoundException();
        }
        if ($request->getMethod() === 'POST') {
            $fields = $request->request->all();
            $result = $this->getSectionGoalService()->updateSectionGoal($id, $fields);

            return $this->createJsonResponse($result);
        }

        return $this->render('@Custom/admin/section-goal/section-goal-create-modal.html.twig', array('sectionGoal' => $sectionGoal));
    }

    public function deleteAction(Request $request, $id)
    {
        $sectionGoal = $this->getSectionGoalService()->getSectionGoal($id);
        if (empty($sectionGoal)) {
            throw $this->createNotFoundException();
        }
        $result = $this->getSectionGoalService()->deleteSectionGoal($id);

        return $this->createJsonResponse($result);
    }

    public function nameCheckAction(Request $request, $id)
    {
        $name = $request->query->get('value');
        $result = $this->getSectionGoalService()->getSectionGoal($id);

        if ($result['name'] === $name) {
            list($result, $message) = array('success', '');
        } else {
            list($result, $message) = $this->getSectionGoalService()->checkName($name);
        }

        return $this->validateResult($result, $message);
    }

    protected function validateResult($result, $message)
    {
        if ($result === 'success') {
            $response = array('success' => true, 'message' => '');
        } else {
            $response = array('success' => false, 'message' => $message);
        }

        return $this->createJsonResponse($response);
    }

    protected function getSectionGoalService()
    {
        return $this->getBiz()->service('CustomBundle:SectionGoal:SectionGoalService');
    }

    protected function getCrontabService()
    {
        return ServiceKernel::instance()->getBiz()->service('Crontab:CrontabService');
    }

    private function getSettingService()
    {
        return ServiceKernel::instance()->getBiz()->service('System:SettingService');
    }
}
