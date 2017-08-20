<?php

namespace CustomBundle\Biz\Post\Dao;

use Codeages\Biz\Framework\Dao\GeneralDaoInterface;

interface PostDao extends GeneralDaoInterface
{
    public function addPost($post);

    public function deletePost($id);

    public function updatePost($post);

    public function searchPost($name);

    public function findPost($id);

    public function findAll();
}