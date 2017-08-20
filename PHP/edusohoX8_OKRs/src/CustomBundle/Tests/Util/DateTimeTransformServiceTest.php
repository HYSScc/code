<?php

namespace CustomBundle\Tests\Util;

use Biz\BaseTestCase;

class DateTimeTransformServiceTest extends BaseTestCase
{
    public function testTransformDateAndTimeToStr()
    {
        $date = '2015-08-06';
        $time = '10:00';
        $ans = $this->getUtilService()->transformDateAndTimeToStr($date, $time);
        $this->assertEquals(1438826400, $ans);
    }

    protected function getUtilService()
    {
        return $this->createService('CustomBundle:Util:DateTimeTransformService');
    }
}