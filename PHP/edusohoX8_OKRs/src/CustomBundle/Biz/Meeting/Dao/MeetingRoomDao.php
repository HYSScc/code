<?php

namespace CustomBundle\Biz\Meeting\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface MeetingRoomDao extends GeneralDaoInterface
{
    public function getByName($name);

    public function findByIds(array $ids);
}
