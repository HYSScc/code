<?php

namespace CustomBundle\Biz\Post\Service\Impl;

use Biz\BaseService; 
use CustomBundle\Biz\Post\Service\PostService;
use CustomBundle\Biz\Post\Dao\PostDao;

class PostServiceImpl extends BaseService implements  PostService
{
    public function searchPosts(array $conditions, array $orderBys, $start, $limit)
    {
        return $this->getPostDao()->search($conditions, $orderBys, $start, $limit);
    }

    public function countPost(array $conditions)
    {
        return $this->getPostDao()->count($conditions);
    }

    public function createPost($post)
    {
        return $this->getPostDao()->create($post);
    }

    public function addPost($post)
    {
        return $this->getPostDao()->addPost($post);
    }

    public function deletePost($ids)
    {
        foreach ($ids as $id) {
            $this->getPostDao()->deletePost($id);
        }
        return true;
    }

    public function updatePost($post)
    {
        return $this->getPostDao()->updatePost($post);
    }

    public function searchPost($name)
    {
        return $this->getPostDao()->searchPost($name);
    }

    public function findPost($ids)
    {
        foreach ($ids as $id) {
            return $this->getPostDao()->findPost($id);
        }
    }

    public function isManageUser(array $conditions)
    {
        $result = $this->getPostDao()->search($conditions, array(), 0, PHP_INT_MAX);
        if (empty($result)) {
            return false;
        } else {
            if ($result[0]['name'] != '部门经理') {
                return false;
            } else {
                return true;
            }
        }
    }

    public function findPosts()
    {
        return $this->getPostDao()->findAll();
    }

    public function getPost($postId)
    {
        return $this->getPostDao()->get($postId);
    }

    protected function getPostDao()
    {
        return $this->createDao('CustomBundle:Post:PostDao');
    }
}