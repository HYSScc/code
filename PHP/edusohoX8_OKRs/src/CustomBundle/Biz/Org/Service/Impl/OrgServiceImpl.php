<?php

namespace CustomBundle\Biz\Org\Service\Impl;

use Biz\Org\Service\Impl\OrgServiceImpl as BaseOrgServiceImpl;
use CustomBundle\Biz\Org\Service\OrgService;
use AppBundle\Common\ArrayToolkit;
use CustomBundle\Biz\Org\Dao\OrgDao;

class OrgServiceImpl extends BaseOrgServiceImpl implements OrgService
{

    public function findOrgs()
    {
        return $this->getOrgDao()->findAll();
    }

    public function createOrg($org)
    {
        $user = $this->getCurrentUser();

        $org = ArrayToolkit::parts($org, array('name', 'code', 'parentId', 'description', 'managerIds'));

        if (!ArrayToolkit::requireds($org, array('name', 'code'))) {
            throw $this->createServiceException('缺少必要字段,添加失败');
        }

        $org['createdUserId'] = $user['id'];

        $org = $this->getOrgDao()->create($org);

        $parentOrg = $this->updateParentOrg($org);

        $org = $this->updateOrgCodeAndDepth($org, $parentOrg);

        return $org;
    }

    public function checkBeforeGet($id)
    {
        $org = $this->getOrg($id);

        if (empty($org)) {
            throw $this->createServiceException($this->getServiceKernel()->trans('组织机构不存在'));
        }

        return $org;
    }

    public function getOrgId($depth)
    {
        return $this->searchOrgs(array('depth' =>$depth), array(), 0, PHP_INT_MAX);
    }

    private function updateParentOrg($org)
    {
        $parentOrg = null;

        if (isset($org['parentId']) && $org['parentId'] > 0) {
            $parentOrg = $this->getOrgDao()->get($org['parentId']);
            $this->getOrgDao()->wave(array($parentOrg['id']), array('childrenNum' => +1));
        }

        return $parentOrg;
    }

    private function updateOrgCodeAndDepth($org, $parentOrg)
    {
        $fields = array();

        if (empty($parentOrg)) {
            $fields['orgCode'] = $org['id'].'.';
            $fields['depth'] = 1;
        } else {
            $fields['orgCode'] = $parentOrg['orgCode'].$org['id'].'.';
            $fields['depth'] = $parentOrg['depth'] + 1;
        }

        return $this->getOrgDao()->update($org['id'], $fields);
    }

    public function updateOrg($id, $fields)
    {
        $org = $this->checkBeforeProccess($id);

        $fields = ArrayToolkit::parts($fields, array('name', 'code', 'parentId', 'description', 'managerIds'));

        if (!ArrayToolkit::requireds($fields, array('name', 'code'))) {
            throw $this->createServiceException($this->getServiceKernel()->trans('缺少必要字段,添加失败'));
        }

        $org = $this->getOrgDao()->update($id, $fields);

        return $org;
    }

    private function checkBeforeProccess($id)
    {
        $org = $this->getOrg($id);

        if (empty($org)) {
            throw $this->createServiceException($this->getServiceKernel()->trans('组织机构不存在,更新失败'));
        }

        return $org;
    }

    public function getOrgDao()
    {
        return $this->createDao('CustomBundle:Org:OrgDao');
    }
}
