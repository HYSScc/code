<?php

namespace CustomBundle\Controller\Admin;

use AppBundle\Controller\BaseController;
use Symfony\Component\HttpFoundation\Request;
use CustomBundle\Biz\Post\Service\PostService;
use Biz\System\Service\SettingService;


class PostManagementController extends BaseController
{
	/**
     * @return 显示功能
     */
    public function indexAction(Request $request)
    {	
    	$name = '';

        if(isset($_GET['name'])) {
    		$name = $_GET['name'];
    	}

    	$post = $this->getPostService()->searchPost($name);
        return $this->render('CustomBundle:post:index.html.twig', array(
        	'post' => $post
        	)
        );
    }

    public function addPostAction(Request $request)
    {
        if ($request->getMethod() === 'POST') {
            $file= $_POST;
            $createdTime = time();
            $file['createdTime'] = $createdTime;
            $file['updatedTime'] = $createdTime;
            $this->getPostService()->addPost($file);      
        } 
        return $this->render($this->getCreateUserModal());
    }

    public function deletePostAction(Request $request)
    {
    	$ids = $request->request->get('ids');
    	$result = $this->getPostService()->deletePost($ids);

    	if ($result) {
            return $this->createJsonResponse(array('status' => 'failed'));
        } else {
            return $this->createJsonResponse(array('status' => 'success'));
        }
  
    } 

    public function updatePostAction(Request $request)
    {
        if ($request->getMethod() === 'POST') {
            $fileds = $request->request->all();
            $this->getPostService()->updatePost($fileds);
            return $this->indexAction($request);
        }

        $conditions = $request->query->all();
        $ids = $conditions;
    	$post = $this->getPostService()->findPost($ids);
    	return $this->render('CustomBundle:post:edit-modal.html.twig', array(
        	'post' => $post,
    	));
    }

    protected function getPostService()
    {
        return $this->createService('CustomBundle:Post:PostService');
    }

    /**
     * @return SettingService
     */
    protected function getSettingService()
    {
        return $this->createService('System:SettingService');
    }

    protected function getCreateUserModal()
    {
        $auth = $this->getSettingService()->get('auth');
        return 'CustomBundle:post:create-modal.html.twig';
    }

}
