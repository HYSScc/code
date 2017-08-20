<?php

namespace CustomBundle\Biz\Course\Service\Impl;

use CustomBundle\Biz\Course\Service\SettingService;
use Biz\System\Service\Impl\SettingServiceImpl as BaseServiceImpl;

class SettingServiceImpl  extends BaseServiceImpl implements  SettingService
{
    public function setScore($score, $fields)
    {
        for ($i = 0; $i < count($fields); $i++) {
            if (!empty($fields[$i])) {
                $score['num'.$i][0] = $fields[$i];
            } else {
                $score['num'.$i][0] = $score['num'.$i][1];
            }
        }
        return $score;
    }
}