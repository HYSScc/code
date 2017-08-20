<?php

namespace CustomBundle\Biz\User\Service;

use Biz\User\Service\UserService as BaseUserService;

interface UserService extends BaseUserService
{
    public function register($registration, $type = 'default');

    public function getUserId($orgId, $postId, $depth);

    public function getUserIdByOrgAndMerge($orgs, $postId, $userIds);

    public function createUser($user);

    public function findUsersByArrayToolkitColumn(array $array, $key);
}
