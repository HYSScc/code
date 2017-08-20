<?php

namespace CustomBundle\Biz\User\Service\Impl;

use Biz\User\Service\Impl\UserServiceImpl as BaseUserService;
use CustomBundle\Biz\User\Service\UserService;
use AppBundle\Common\SimpleValidator;
use Codeages\Biz\Framework\Event\Event;
use AppBundle\Common\ArrayToolkit;

class UserServiceImpl extends BaseUserService implements UserService
{
    public function register($registration, $type = 'default')
    {
        $this->validateNickname($registration['nickname']);

        if (!$this->isNicknameAvaliable($registration['nickname'])) {
            throw $this->createInvalidArgumentException('Nickname Occupied');
        }

        if (!SimpleValidator::email($registration['email'])) {
            throw $this->createInvalidArgumentException('Invalid Email');
        }

        if (!$this->isEmailAvaliable($registration['email'])) {
            throw $this->createInvalidArgumentException('Email Occupied');
        }

        $user = array();

        if (isset($registration['verifiedMobile'])) {
            $user['verifiedMobile'] = $registration['verifiedMobile'];
        } else {
            $user['verifiedMobile'] = '';
        }

        $user['email'] = $registration['email'];
        $user['emailVerified'] = isset($registration['emailVerified']) ? $registration['emailVerified'] : 0;
        $user['nickname'] = $registration['nickname'];
        $user['roles'] = empty($registration['roles']) ? array('ROLE_USER') : $registration['roles'];
        $user['type'] = isset($registration['type']) ? $registration['type'] : $type;
        $user['createdIp'] = empty($registration['createdIp']) ? '' : $registration['createdIp'];
        $user['employeeId'] = empty($registration['employeeId']) ? 0 : $registration['employeeId'];
        if (isset($registration['guid'])) {
            $user['guid'] = $registration['guid'];
        }

        $user['createdTime'] = time();
        $user['registeredWay'] = isset($registration['registeredWay']) ? $registration['registeredWay'] : '';

        $thirdLoginInfo = $this->getSettingService()->get('login_bind', array());

        if (in_array($type, array('default', 'phpwind', 'discuz'))) {
            $user['salt'] = base_convert(sha1(uniqid(mt_rand(), true)), 16, 36);
            $user['password'] = $this->getPasswordEncoder()->encodePassword($registration['password'], $user['salt']);
            $user['setup'] = 1;
        } elseif (in_array($type, array('qq', 'weibo', 'renren', 'weixinweb', 'weixinmob')) && isset($thirdLoginInfo["{$type}_set_fill_account"]) && $thirdLoginInfo["{$type}_set_fill_account"]) {
            $user['salt'] = '';
            $user['password'] = '';
            $user['setup'] = 1;
        } elseif ($type === 'marketing') {
            $user['salt'] = base_convert(sha1(uniqid(mt_rand(), true)), 16, 36);
            $user['password'] = $this->getPasswordEncoder()->encodePassword($registration['password'], $user['salt']);
            $user['setup'] = 0;
        } else {
            $user['salt'] = '';
            $user['password'] = '';
            $user['setup'] = 0;
        }
        if (isset($registration['orgId'])) {
            $user['orgId'] = $registration['orgId'];
            $user['orgCode'] = $registration['orgCode'];
        }

        $user = $this->getUserDao()->create($user);

        if (!empty($registration['invite_code'])) {
            $inviteUser = $this->getUserDao()->getByInviteCode($registration['invite_code']);
        }

        if (!empty($inviteUser)) {
            $this->getInviteRecordService()->createInviteRecord($inviteUser['id'], $user['id']);
            $invitedCoupon = $this->getCouponService()->generateInviteCoupon($user['id'], 'register');

            if (!empty($invitedCoupon)) {
                $card = $this->getCardService()->getCardByCardId($invitedCoupon['id']);
                $this->getInviteRecordService()->addInviteRewardRecordToInvitedUser($user['id'], array('invitedUserCardId' => $card['cardId']));
            }

            $this->dispatchEvent(
                'user.register',
                new Event(array('userId' => $user['id'], 'inviteUserId' => $inviteUser['id']))
            );
        }

        if (isset($registration['mobile']) && $registration['mobile'] != '' && !SimpleValidator::mobile($registration['mobile'])) {
            throw $this->createInvalidArgumentException('Invalid Mobile');
        }

        if (isset($registration['idcard']) && $registration['idcard'] != '' && !SimpleValidator::idcard($registration['idcard'])) {
            throw $this->createInvalidArgumentException('Invalid ID number');
        }

        if (isset($registration['truename']) && $registration['truename'] != '' && !SimpleValidator::truename($registration['truename'])) {
            throw $this->createInvalidArgumentException('Invalid truename');
        }

        $profile = array();
        $profile['id'] = $user['id'];
        $profile['mobile'] = empty($registration['mobile']) ? '' : $registration['mobile'];
        $profile['idcard'] = empty($registration['idcard']) ? '' : $registration['idcard'];
        $profile['truename'] = empty($registration['truename']) ? '' : $registration['truename'];
        $profile['company'] = empty($registration['company']) ? '' : $registration['company'];
        $profile['job'] = empty($registration['job']) ? '' : $registration['job'];
        $profile['weixin'] = empty($registration['weixin']) ? '' : $registration['weixin'];
        $profile['weibo'] = empty($registration['weibo']) ? '' : $registration['weibo'];
        $profile['qq'] = empty($registration['qq']) ? '' : $registration['qq'];
        $profile['site'] = empty($registration['site']) ? '' : $registration['site'];
        $profile['gender'] = empty($registration['gender']) ? 'secret' : $registration['gender'];

        for ($i = 1; $i <= 5; ++$i) {
            $profile['intField'.$i] = empty($registration['intField'.$i]) ? null : $registration['intField'.$i];
            $profile['dateField'.$i] = empty($registration['dateField'.$i]) ? null : $registration['dateField'.$i];
            $profile['floatField'.$i] = empty($registration['floatField'.$i]) ? null : $registration['floatField'.$i];
        }

        for ($i = 1; $i <= 10; ++$i) {
            $profile['varcharField'.$i] = empty($registration['varcharField'.$i]) ? '' : $registration['varcharField'.$i];
            $profile['textField'.$i] = empty($registration['textField'.$i]) ? '' : $registration['textField'.$i];
        }

        $this->getProfileDao()->create($profile);

        $this->dispatchEvent('user.registered', new Event($user));

        return $user;
    }

    public function getUserId($orgId, $postId, $depth)
    {
        $userId = array();
        if ($depth == 1) {
            $users = $this->getUserDao()->search(
                array('orgId' => $orgId),
                array(), 
                0, 
                PHP_INT_MAX
            );
        } else {
            $users = $this->getUserDao()->search(
                array('orgId' => $orgId, 'noPostId' =>$postId),
                array(), 
                0, 
                PHP_INT_MAX
            );
        }
        $userId = ArrayToolkit::column($users, 'id');
        return $userId;
    }

    public function getUserIdByOrgAndMerge($orgs, $postId, $userIds)
    {
        $userId = array();
        $users = array();
         if (!empty($orgs)) {
            foreach ($orgs as $org) {
                $user = $this->getUserDao()->search(
                    array('orgId' => $org['id'], 'postId' =>$postId), 
                    array(), 
                    0, 
                    PHP_INT_MAX
                );
                $users = array_merge($users, $user);
            }
            $userId = ArrayToolkit::column($users, 'id');
        }
        $userId = array_merge($userId, $userIds);
        return $userId;
    }

    public function createUser($user)
    {
        return $this->getUserDao()->create($user);
    }
    
    public function findUsersByArrayToolkitColumn(array $array, $key)
    {
        $keys = ArrayToolkit::column($array, $key);
        return $this->findUsersByIds($keys);
    }

    protected function getUserDao()
    {
        return $this->createDao('CustomBundle:User:UserDao');
    }

}
