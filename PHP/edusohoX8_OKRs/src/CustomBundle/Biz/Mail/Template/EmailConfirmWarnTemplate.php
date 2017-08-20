<?php

namespace CustomBundle\Biz\Mail\Template;

use Topxia\Service\Common\ServiceKernel;

class EmailConfirmWarnTemplate
{
    public function parse($options)
    {
        $email = $this->getSettingService()->get('email', array());
        $body = $email['confirmWarnBody'];
        $body = $this->strpos($body, '*nickname*', $options['nickname']);
        $body = $this->strpos($body, '*sectionGoal*', $options['sectionGoal']);

        return array(
            'title' => $email['confirmWarnTitle'],
            'body' => $body,
        );
    }

    protected function getSettingService()
    {
        return ServiceKernel::instance()->createService('System:SettingService');
    }

    protected function strpos($str, $needle, $filed)
    {
        if (strpos($str, $needle)) {
            return str_replace($needle, $filed, $str);
        }

        return $str;
    }
}
