<?php

namespace CustomBundle\Biz\Org\Dao\Impl;

use Biz\Org\Dao\Impl\OrgDaoImpl as BaseOrgDaoImpl;
use CustomBundle\Biz\Org\Dao\OrgDao;

class OrgDaoImpl extends BaseOrgDaoImpl implements OrgDao
{
    public function findAll()
    {
        $sql = "select * from {$this->table} ";
        $stmt = $this->db()->query($sql);
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}