<?php

namespace CustomBundle\Controller\Admin;

use AppBundle\Common\ArrayToolkit;
use AppBundle\Common\TreeToolkit;
use AppBundle\Controller\Admin\OrgManageController as BaseOrgController;
use Symfony\Component\HttpFoundation\Request;

class OrgManageController extends BaseOrgController
{
    public function indexAction(Request $request)
    {
        $user = $this->getUser();
        $org = $this->getOrgService()->getOrg($user['orgId']);
        $orgs = $this->getOrgService()->findOrgsByPrefixOrgCode();

        $treeOrgs = TreeToolkit::makeTree($orgs, 'seq', $org['parentId']);
        $userIds = ArrayToolkit::column($orgs, 'createdUserId');
        $createdUsers = $this->getUserService()->findUsersByIds($userIds);

        return $this->render(
            '@Custom/admin/org-manage/index.html.twig',
            array(
                'orgs' => $treeOrgs,
                'createdUsers' => $createdUsers
            )
        );
    }

    public function createAction(Request $request)
    {
        if ($request->getMethod() == 'POST') {
            $org = $request->request->all();
            $org['managerIds'] = join('.', isset($org['managerIds']) ? array_unique($org['managerIds']) : array());
            $this->getOrgService()->createOrg($org);

            return $this->redirect($this->generateUrl('admin_org'));
        }

        $parentId = $request->query->get('parentId', 0);
        $org = array('parentId' => $parentId);

        return $this->render('@Custom/admin/org-manage/modal.html.twig', array(
            'org' => $org
        ));
    }

    public function updateAction(Request $request, $id)
    {
        if ($request->getMethod() == 'POST') {
            $fields = $request->request->all();
            $fields['managerIds'] = join('.', isset($fields['managerIds']) ? array_unique($fields['managerIds']) : array());
            $this->getOrgService()->updateOrg($id, $fields);

            return $this->redirect($this->generateUrl('admin_org'));
        }

        $org = $this->getOrgService()->getOrg($id);

        if (!empty($org['managerIds'])) {
            $ids = explode('.', $org['managerIds']);

            $managers = $this->getUserService()->findUsersByIds($ids);
        }

        return $this->render(
            '@Custom/admin/org-manage/modal.html.twig',
            array(
                'org' => $org,
                'managers' => !empty($managers) ? $managers : array()
            )
        );
    }

    public function searchManagersAction(Request $request)
    {
        $name = $request->query->get('name');

        $users = $this->getUserService()->searchUsers(
            array('nickname' => $name),
            array('createdTime' => 'DESC'),
            0,
            PHP_INT_MAX
        );

        return $this->createJsonResponse($users);
    }

    protected function getOrgService()
    {
        return $this->createService('CustomBundle:Org:OrgService');
    }
}
