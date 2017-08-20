<?php

namespace CustomBundle\Biz\Post\Test;

use Biz\BaseTestCase;
use CustomBundle\Biz\Post\Dao\PostDao;

class PostDaoTest extends BaseTestCase
{
    public function testAddPost()
    {
        $code = '004';
        $name = 'CTO';
        $post = array(
            'code' => $code,
            'name' => $name
        );
        $postResult = $this->getPostDao()->addPost($post);
        $this->assertEquals($post['name'],$postResult['name']);
    }

    public function testUpdatePost()
    {
        $post = array(
            'code' => '004',
            'name' => 'CTO',
        );
        $this->getPostDao()->addPost($post);
        $id = 1;
        $name = 'CTOO';
        $fields = array(
            'id' => $id,
            'name' => $name
        );
        $result = $this->getPostDao()->updatePost($fields);
        $this->assertEquals($name,$result['name']);
    }

    public function testSearchPost()
    {   
        $post = array(
            'code' => '004',
            'name' => 'CTO',
        );
        $this->getPostDao()->addPost($post);
        $name = 'CTO';
        $postResult = $this->getPostDao()->searchPost($name);
        $this->assertEquals($post['name'], $postResult[0]['name']);
    }

    public function testDeletePost()
    {
        $post = array(
            'code' => '004',
            'name' => 'CTO',
        );
        $this->getPostDao()->addPost($post);
        $id = '1';
        $result = $this->getPostDao()->deletePost($id );
        $this->assertEquals($id, $result);
    }

    protected function getPostDao()
    {
        return $this->createDao('CustomBundle:Post:PostDao');
    }

    function testFindPosts()
    {
        $code = '004';
        $name = 'CTO';
        $post = array(
            'code' => $code,
            'name' => $name
        );
        $postResult = $this->getPostDao()->addPost($post);
        $results = $this->getPostDao()->findAll();

        $this->assertEquals($post['name'],$results[0]['name']);
    }
}