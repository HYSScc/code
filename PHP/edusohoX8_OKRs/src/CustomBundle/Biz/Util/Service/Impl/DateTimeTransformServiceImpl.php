<?php

namespace CustomBundle\Biz\Util\Service\Impl;

use Biz\BaseService;
use CustomBundle\Biz\Util\Service\DateTimeTransformService;

class DateTimeTransformServiceImpl extends BaseService implements DateTimeTransformService
{
    public function transformDateAndTimeToStr($date, $time)
    {
        return strtotime(date('Y-m-d H:i', strtotime($date . ' ' . $time)));
    }
}