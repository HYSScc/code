<?php

namespace  CustomBundle\Biz\PhpMailer;

use CustomBundle\Biz\PhpMailer\phpmailer\PHPMailer;
use Topxia\Service\Common\ServiceKernel;

/*发送邮件方法
 *@param  $Mail： 其中字段’to‘接收人'CcPerson'Array抄送人‘template’Array模板返回的数据{‘title’,'body'}
 *@return bool true:发送成功 false:发送失败
 */

class Mail
{
    public function sendMail($Mail)
    {
        $email = $this->getSettingService()->get('email', array());

        $mail = new PHPMailer();

        $mail->isSMTP();

        $mail->SMTPAuth = true;

        $mail->Host = 'smtp.exmail.qq.com';

        $mail->SMTPSecure = 'ssl';

        $mail->Port = 465;

        $mail->Hostname = 'http://www.eudsoho.com';

        $mail->CharSet = 'UTF-8';

        $mail->FromName = 'edusoho';

        $mail->Username = $email['email'];

        $mail->Password = $email['password'];

        $mail->From = $email['email'];
        $mail->isHTML(true);

        $mail->addAddress($Mail['to'], 'eduosoho在线通知');

        if (!empty($Mail['CcPerson'])) {
            foreach ($Mail['CcPerson'] as $Cc) {
                $mail->addAddress($Cc, 'eduosoho在线通知');
            }
        }

        $mail->Subject = $Mail['template']['title'];
        $mail->Body = $Mail['template']['body'];
        $status = $mail->send();

        if ($status) {
            return true;
        } else {
            return false;
        }
    }

    protected function getSettingService()
    {
        return ServiceKernel::instance()->createService('System:SettingService');
    }
}
