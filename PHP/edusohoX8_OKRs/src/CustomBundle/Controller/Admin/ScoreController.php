<?php
namespace CustomBundle\Controller\Admin;

use AppBundle\Controller\Admin\BaseController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use CustomBundle\Biz\Course\Service\SettingService;

class ScoreController extends BaseController
{
    public function getScoreAction(Request $request)
    {
        if ($request->getMethod() == 'POST') {
            $fields = $request->request->all();
            $score = $this->getSettingService()->get('score', array());
            $score = $this->getSettingService()->setScore($score, $fields);
            $this->getSettingService()->set('score', $score);
            $this->setFlashMessage('success', '评分设置已保存');
        }
        $score = $this->getSettingService()->get('score', array());
        return $this->render('CustomBundle:custom:score.html.twig', array(
            'score' => $score
        )); 
    }

    /**
     * @return \CustomBundle\Biz\Course\Service\SettingService
     */
    protected function getSettingService()
    {
        return $this->createService('CustomBundle:Course:SettingService');
    }
    
}
