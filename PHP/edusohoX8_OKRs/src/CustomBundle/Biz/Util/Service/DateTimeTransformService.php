<?php

namespace CustomBundle\Biz\Util\Service;

interface DateTimeTransformService
{
    public function transformDateAndTimeToStr($date, $time);
}