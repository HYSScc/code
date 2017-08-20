<?php

namespace src\CustomBundle\Tests\Score;

use Biz\BaseTestCase;
use CustomBundle\Biz\Course\Service\SettingService;

class SettingServiceTest extends BaseTestCase
{
    public function testSetScore()
    {
        $score = array(
            'num0' => array(1, 1),
            'num1' => array(2, 2),
            'num2' => array(3, 3)
        );
        $fields = array(0, 1, 2,);
        $score = $this->getSettingService()->setScore($score, $fields);
        
        $this->assertEquals(1, $score['num1'][0]);
    }

    protected function getSettingService()
    {
        return $this->createService('CustomBundle:Course:SettingService');
    }
}