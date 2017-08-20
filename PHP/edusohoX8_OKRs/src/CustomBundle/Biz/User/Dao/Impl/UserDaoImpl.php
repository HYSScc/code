<?php

namespace CustomBundle\Biz\User\Dao\Impl;

use Biz\User\Dao\Impl\UserDaoImpl as BaseUserDaoImpl;
use CustomBundle\Biz\User\Dao\UserDao;

class UserDaoImpl extends BaseUserDaoImpl implements UserDao
{
    public function declares()
    {
        return array(
            'serializes' => array(
                'roles' => 'delimiter',
            ),
            'orderbys' => array(
                'id',
                'createdTime',
                'updatedTime',
                'promotedTime',
                'promoted',
                'promotedSeq',
                'nickname',
            ),
            'timestamps' => array(
                'createdTime',
                'updatedTime',
            ),
            'conditions' => array(
                'mobile = :mobile',
                'promoted = :promoted',
                'roles LIKE :roles',
                'password = :password',
                'roles = :role',
                'UPPER(nickname) LIKE :nickname',
                'nickname = :nickName',
                'type = :Type',
                'id = :id',
                'loginIp = :loginIp',
                'createdIp = :createdIp',
                'approvalStatus = :approvalStatus',
                'UPPER(email) LIKE :email',
                'level = :level',
                'salt = :salt',
                'email = :Email',
                'createdTime >= :startTime',
                'createdTime <= :endTime',
                'updatedTime >= :updatedTime_GE',
                'approvalTime >= :startApprovalTime',
                'approvalTime <= :endApprovalTime',
                'loginTime >= :loginStartTime',
                'loginTime <= :loginEndTime',
                'locked = :locked',
                'level >= :greatLevel',
                'UPPER(verifiedMobile) LIKE :verifiedMobile',
                'type LIKE :type',
                'id IN ( :userIds)',
                'inviteCode = :inviteCode',
                'inviteCode != :NoInviteCode',
                'id NOT IN ( :excludeIds )',
                'orgCode PRE_LIKE :likeOrgCode',
                'orgCode = :orgCode',
                'orgId = :orgId',
                'postId = :postId',
                'postId != :noPostId', 
            ),
        );
    }
}


