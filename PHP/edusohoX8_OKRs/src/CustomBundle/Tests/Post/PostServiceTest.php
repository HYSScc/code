<?php
 namespace CustomBundle\Test\Post;

use Biz\BaseTestCase;
use Mockery;
 
class PostServiceTest extends BaseTestCase
{
    public function testSearchPosts()
    {
        $result = $this->getPostService()->createPost(array('name' => 'CEO', 'code' => '1'));
        $posts = $this->getPostService()->searchPosts(array('name' => $result['name']),array('id' => 'ASC'), 0, 10);
        $post = $posts[0];
        $this->assertEquals($post['id'], $result['id']);
        $this->assertEquals($post['name'], $result['name']);
        $this->assertEquals($post['code'], $result['code']);
    }

    public function testCountPost()
    {
        $result = $this->getPostService()->createPost(array('name' => 'COO', 'code' => '2'));
        $count = $this->getPostService()->countPost(array('name' => $result['name']));
        $this->assertEquals(1, $count);
    }

    public function testCreatePost()
    {
        $post = array();
        $post['name'] = 'a';
        $post['code'] = '1';
        $result = $this->getPostService()->createPost($post);
        $this->assertEquals($post['name'], $result['name']);
    }

    public function testAddPost()
    {
        $code = '001';
        $name = 'CTO';
        $post = array(
            'code' => $code,
            'name' => $name
        );

        $postResult = $this->getPostService()->addPost($post);
        $this->assertEquals($post['name'], $postResult['name']);
    }

    public function testUpdatePost()
    {   
        $post = array(
            'code' => '004',
            'name' => 'CTO',
        );
        $this->getPostService()->addPost($post);
        $id = 1;
        $name = 'CTOO';
        $fields = array(
            'id' => $id,
            'name' => $name
        );
        $postResult = $this->getPostService()->updatePost($fields);
        $this->assertEquals($fields['name'], $postResult['name']);
    }

    public function testSearchPost()
    {
        $post = array(
            'code' => '004',
            'name' => 'CTO',
        );
        $this->getPostService()->addPost($post);
        $name = 'CTO';
        $postResult = $this->getPostService()->searchPost($name);
        $this->assertEquals($name, $postResult[0]['name']);
    }

    public function testDeletePost()
    {
        $post = array(
            'code' => '004',
            'name' => 'CTO',
        );
        $this->getPostService()->addPost($post);
        $id = '1';
        $ids = array(
            'id' => $id
        );
        $firstPost = array(
            'code' => '11',
            'name' => 'CEO'
        );
        $postResult = $this->getPostService()->createPost($firstPost);
        $result = $this->getPostService()->deletePost($ids);
        $this->assertEquals(true, $result);
    }

    public function testIsManageUser()
    {
        $result = $this->getPostService()->isManageUser(array('code' => '11'));
        $this->assertEquals(false, $result);
        
        $firstPost = array(
            'code' => '11',
            'name' => '部门经理'
        );
        $postResult = $this->getPostService()->createPost($firstPost);
        $result = $this->getPostService()->isManageUser(array('code' => '11'));
        $this->assertEquals(true, $result);

        $secondPost = array(
            'code' => '1',
            'name' => '11'
        );
        $postResult = $this->getPostService()->createPost($secondPost);
        $result = $this->getPostService()->isManageUser(array('code' => '1'));
        $this->assertEquals(false, $result);
    }

    function testFindPosts()
    {
        $code = '004';
        $name = 'CTO';
        $post = array(
            'code' => $code,
            'name' => $name
        );
        $postResult = $this->getPostService()->addPost($post);
        $results = $this->getPostService()->findPosts();

        $this->assertEquals($post['name'],$results[0]['name']);
    }

    protected function getPostService()
    {
        return $this->getBiz()->service('CustomBundle:Post:PostService');
    }
}