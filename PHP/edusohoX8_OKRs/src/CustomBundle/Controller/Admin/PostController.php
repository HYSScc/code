<?php

namespace CustomBundle\Controller\Admin;

use AppBundle\Controller\BaseController;
use AppBundle\Controller\DefaultController as BaseDefaultController;
use CustomBundle\Biz\Course\Service\CourseService;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Common\Paginator;

class PostController extends BaseDefaultController
{
    public function manageAction(Request $request)
    {
        $COUNT = 20;
        $conditions = $request->query->all();      
        $postCount = $this->getPostService()->countPost($conditions);
        $paginator = new Paginator(
            $this->get('request'),
            $postCount,
            $COUNT
        );
        
        $post = $this->getPostService()->searchPosts(
            $conditions,
            array('id' => 'ASC'),
            $paginator->getOffsetCount(),
            $paginator->getPerPageCount()
        );
        return $this->render('CustomBundle:post:index.html.twig', array(
            'post' => $post, 
            'paginator' => $paginator,
            'postCount' => $postCount
        ));
    }

    protected function getPostService()
    {
        return $this->getBiz()->service('CustomBundle:Post:PostService');
    }
}
