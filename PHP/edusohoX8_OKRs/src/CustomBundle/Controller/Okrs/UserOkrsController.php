<?php

namespace CustomBundle\Controller\Okrs;

use AppBundle\Common\ArrayToolkit;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Controller\BaseController;
use AppBundle\Common\Paginator;

class UserOkrsController extends BaseController
{
    protected $orgId = '';
    protected $nickname = '';
    protected $postId = '';
    protected $isSelfRated = '';
    protected $UserSectionGoalCount = '';

    function showAction(Request $request, $id)
    {
        $this->nickname = $request->query->get('keyword');
        $this->postId = $request->query->get('postName');
        $this->isSelfRated = $request->query->get('isSelfRated');
        $this->orgId = $request->query->get('orgId');
        $user = $this->getUserService()->getUser($id);
        if ($this->nickname == null && $this->postId == null && $this->isSelfRated == null &&$this->orgId == null) {
            $conditions = array('status' => 0);
            $UserSectionGoalCount = $this->getUserSectionGoalService()->countUsersSectionGoal($conditions);
            $this->UserSectionGoalCount = $UserSectionGoalCount;
            $paginator = new Paginator(
                $this->get('request'),
                $UserSectionGoalCount,
                20
            );
            $userSectionGoals = $this->getUserSectionGoalService()->searchUserSectionGoals($conditions, array(), $paginator->getOffsetCount(), $paginator->getPerPageCount()
            );
            $Objects = $this->getUserSectionGoalService()->regroupObject($userSectionGoals);
        } else {
            $conditions = array(
                'status' => 0,
                'isSelfRated' => $this->isSelfRated,
            );
            $UserSectionGoalCount = $this->getUserSectionGoalService()->countUsersSectionGoal($conditions);
            $paginator = new Paginator(
                $this->get('request'),
                $UserSectionGoalCount,
                20
            );
            $conditions = array('nickname' => $this->nickname);
            if ($this->postId != '') {
                $conditions = array(
                    'nickname' => $this->nickname,
                    'postId' => $this->postId,
                );
            }
            if ($this->orgId != '') {
                $conditions = array(
                    'nickname' => $this->nickname,
                    'orgId' => $this->orgId
                );
            }
            if ($this->orgId != '' && $this->postId != '') {
                $conditions = array(
                    'nickname' => $this->nickname,
                    'postId' => $this->postId,
                    'orgId' => $this->orgId
                );
            }
            $usersInfo = $this->getUserService()->searchUsers($conditions, array(), 0, PHP_INT_MAX);
            $userSectionGoals = $this->getUserSectionGoalService()->findUserSectionGoals($usersInfo, $this->isSelfRated, $paginator->getOffsetCount(), $paginator->getPerPageCount());
            $Objects = $this->getUserSectionGoalService()->regroupObject($userSectionGoals);
        }
        return $this->render('CustomBundle:okrs:index-user-okrs.html.twig', array(
            'user' => $user,
            'objects' => $Objects,
            'paginator' => $paginator,
            'usersectiongoalcount' => $this->UserSectionGoalCount
        ));
    }

    function findSearchBoxInfoAction()
    {
        $posts = $this->getPostService()->findPosts();
        $orgs = $this->getOrgService()->findOrgs();
        $Object = array(
            'posts' => $posts,
            'orgs' => $orgs,
        );
        return new Response(json_encode($Object, JSON_UNESCAPED_UNICODE));
    }

    protected function getUserService()
    {
        return $this->getBiz()->service('CustomBundle:User:UserService');
    }

    protected function getUserSectionGoalService()
    {
        return $this->getBiz()->service('CustomBundle:UserSectionGoal:UserSectionGoalService');
    }

    protected function getGoalService()
    {
        return $this->getBiz()->service('CustomBundle:Goal:GoalService');
    }

    protected function getPostService()
    {
        return $this->getBiz()->service('CustomBundle:Post:PostService');
    }

    protected function getSectionGoalService()
    {
        return $this->getBiz()->service('CustomBundle:SectionGoal:SectionGoalService');
    }

    protected function getOrgService()
    {
        return $this->getBiz()->service('CustomBundle:Org:OrgService');
    }

}