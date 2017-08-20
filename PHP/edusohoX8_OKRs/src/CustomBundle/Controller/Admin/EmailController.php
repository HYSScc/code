<?php

namespace CustomBundle\Controller\Admin;

use AppBundle\Controller\Admin\BaseController;
use Symfony\Component\HttpFoundation\Request;

class EmailController extends BaseController
{
    public function indexAction(Request $request)
    {
        if ($request->getMethod() == 'POST') {
            $fields = $request->request->all();
            $this->getSettingService()->set('email', $fields);
            $this->setFlashMessage('success', '邮箱设置已保存');
        }
        $email = $this->getSettingService()->get('email', array());

        return $this->render('@Custom/admin/email/index.html.twig', array(
            'email' => $email,
        ));
    }

    protected function getSettingService()
    {
        return $this->createService('System:SettingService');
    }
}
