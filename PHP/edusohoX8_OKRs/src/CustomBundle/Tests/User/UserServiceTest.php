<?php

namespace CustomBundle\Test\User;

use Biz\BaseTestCase;
use Mockery;
 
class UserServiceTest extends BaseTestCase
{
    public function testCreateUser()
    {
        $user = array(
            'Email' => '1@qq.com',
            'nickname' => '1234',
            'orgId' => 1,
            'postId' => 1
        );
        $result = $this->getUserService()->createUser($user);
        $this->assertEquals($user['nickname'], $result['nickname']);
    }

    public function testGetUserId()
    {
        $user = array(
            'Email' => '1@qq.com',
            'nickname' => '1234',
            'orgId' => 1,
            'postId' => 1
        );
        $userResult = $this->getUserService()->createUser($user);
        $result = $this->getUserService()->getUserId($user['orgId'], $user['postId'], 1);
        $this->assertEquals(1, $result[0]);

        $result = $this->getUserService()->getUserId($user['orgId'], $user['postId'], 2);
        $this->assertEquals(1, $result[0]);
    }

    public function testGetUserIdByOrgAndMerge()
    {
        $user = array(
            'Email' => '1@qq.com',
            'nickname' => '1234',
            'orgId' => 1,
            'postId' => 1
        );
        $userResult = $this->getUserService()->createUser($user);
        $result = $this->getUserService()->getUserIdByOrgAndMerge(
            array('id' => $user['orgId']),
            $user['postId'],
            array()
            );
        $this->assertEquals(2, $result[0]);
    }


    public function testFindUsersByArrayToolkitColumn()
    {
        $user1 = $this->createUser('user1');
        $user2 = $this->createUser('user2');
        $user3 = $this->createUser('user3');
        $users[0] = $user1;
        $users[1] = $user2;
        $users[2] = $user3;
        $foundUsers = $this->getUserService()->findUsersByArrayToolkitColumn($users, 'id');

        $foundUserIds = array_keys($foundUsers);
        $this->assertEquals(3, count($foundUserIds));
        $this->assertContains($user1['id'], $foundUserIds);
        $this->assertContains($user2['id'], $foundUserIds);
    }

    protected function createUser($user)
    {
        $userInfo = array();
        $userInfo['email'] = "{$user}@{$user}.com";
        $userInfo['nickname'] = "{$user}";
        $userInfo['password'] = "{$user}";
        $userInfo['loginIp'] = '127.0.0.1';

        return $this->getUserService()->register($userInfo);
    }

    protected function getUserService()
    {
        return $this->createService('CustomBundle:User:UserService');
    }
}

