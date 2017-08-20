<?php

namespace CustomBundle\Biz\Course\Service;

use Biz\System\Service\SettingService as BaseService;

interface SettingService extends BaseService
{
    public function setScore($score, $fields);
}