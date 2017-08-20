<?php

namespace CustomBundle\Biz\Mail\Template;

use Topxia\Service\Common\ServiceKernel;

class EmailOthersRatingWarnTemplate
{
    public function parse($options)
    {
        $email = $this->getSettingService()->get('email', array());
        $body = $email['othersRatingWarnBody'];
        $body = $this->strpos($body, '*nickname*', $options['nickname']);
        $body = $this->strpos($body, '*sectionGoal*', $options['sectionGoal']);
        $body = $this->strpos($body, '*Rating*', $options['username']);
        $body = $this->strpos($body, '*sectionGoaUrl*', $options['url']);

        return array(
            'title' => $email['othersRatingWarnTitle'],
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
//'Hi, *nickname*。您未对*Rating*的阶段性目标*sectionGoa*进行他评,请尽快前往完成评价！传送门： *sectionGoaUrl*
//[如果以上链接无法点击,请将上面的地址复制到你的浏览器(如IE)的地址栏中打开.]（这是一封自动产生的email，请勿回复。）'
