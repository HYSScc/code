<?php

namespace CustomBundle\Resources\Tests\Org;

use Biz\BaseTestCase;

class OrgServiceTest extends BaseTestCase
{
    public function testUpdateOrg()
    {
        $org = $this->mookOrg($name = 'edusoho');
        $org = $this->getOrgService()->createOrg($org);
        $this->assertEquals('edusoho', $org['name']);

        $org['managerIds'] = '4.5';
        $updateOrg = $this->getOrgService()->updateOrg($org['id'], $org);
        $this->assertEquals('4.5', $updateOrg['managerIds']);
    }

    public function testCreateOrg()
    {
        $org = $this->mookOrg($name = 'edusoho');
        $org = $this->getOrgService()->createOrg($org);

        $this->assertEquals('edusoho', $org['name']);
    }

    public function testCheckBeforeGet()
    {
        $org = $this->mookOrg($name = 'edusoho');
        $org = $this->getOrgService()->createOrg($org);
        $result = $this->getOrgService()->checkBeforeGet(1);
        $this->assertEquals('edusoho', $result['name']);
    }

    public function testGetOrgId()
    {
        $org = $this->mookOrg($name = 'edusoho');
        $org['depth'] = 1;
        $org = $this->getOrgService()->createOrg($org);
        $result = $this->getOrgService()->getOrgId(1);
        $this->assertEquals('edusoho', $result[0]['name']);
    }

    function testFindOrgs()
    {
        $org = $this->mookOrg($name = 'edusoho');
        $org = $this->getOrgService()->createOrg($org);

        $results = $this->getOrgService()->findOrgs();
        $this->assertEquals('edusoho', $results[0]['name']);
    }

    private function mookOrg($name)
    {
        $org = array();
        $org['name'] = $name;
        $org['code'] = $name;
        $org['managerIds'] = 4;

        return $org;
    }

    public function getOrgService()
    {
        return $this->createService('CustomBundle:Org:OrgService');
    }
}
