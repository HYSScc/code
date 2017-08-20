<?php

namespace CustomBundle\Biz\Post\Service;

interface PostService 
{
    public function searchPosts(array $conditions, array $orderBys, $start, $limit);

    public function countPost(array $conditions);

    public function createPost($post);

    public function addPost($post);

    public function deletePost($ids);

    public function updatePost($post);

    public function searchPost($name);

    public function getPost($postId);

    public function findPost($ids);

    public function isManageUser(array $conditions);

    public function findPosts();
}
