<?php

namespace CustomBundle\Biz\Meeting\Dao\Impl;

use Codeages\Biz\Framework\Dao\GeneralDaoImpl;
use CustomBundle\Biz\Meeting\Dao\MeetingRoomDao;

class MeetingRoomDaoImpl extends GeneralDaoImpl implements MeetingRoomDao
{
    protected $table = 'meeting_room';

    public function getByName($name)
    {
        return $this->getByFields(array('name' => $name));
    }

    public function findByIds(array $ids)
    {
        return $this->findInField('id', $ids);
    }

    public function declares()
    {
        return array(
            'orderbys' => array(
                'createdTime',
                'updatedTime',
                'id',
            ),
            'timestamps' => array('createdTime', 'updatedTime'),
            'conditions' => array(
                'id =:id',
                'id IN (:ids)',
                'name LIKE :name',
                'createdTime = :createdTime',
            ),
        );
    }
}
