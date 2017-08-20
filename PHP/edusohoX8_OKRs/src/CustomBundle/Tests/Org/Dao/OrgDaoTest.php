<?php
/**
 * Created by PhpStorm.
 * User: ccl
 * Date: 17-8-9
 * Time: 下午9:29
 */
namespace CustomBundle\Resources\Tests\Org\Dao;

use Biz\BaseTestCase;
use CustomBundle\Biz\Org\Dao\Impl\OrgDaoImpl;

class OrgDaoTest extends BaseTestCase
{
    function testFindOrgs()
    {
        $Org = array(
            'id' => '1',
            'name' => 'cxl',
            'createdUserId' => '3',
            'code' => 'cxl',
        );
        $org = $this->getOrgDao()->create($Org);
        $results = $this->getOrgDao()->findAll();
        $this->assertEquals($Org['name'], $results[0]['name']);
    }

    protected function getOrgDao()
    {
        return $this->createDao('CustomBundle:Org:OrgDao');
    }
}