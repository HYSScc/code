<?php

namespace CustomBundle\Security\Provider;

use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;
use Symfony\Component\Ldap\Exception\ConnectionException;
use Symfony\Component\Ldap\LdapClientInterface;
use Biz\User\CurrentUser;
use Biz\Role\Util\PermissionBuilder;
use Topxia\Service\Common\ServiceKernel;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\User\User;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * LdapUserProvider is a simple user provider on top of ldap.
 *
 * @author Grégoire Pineau <lyrixx@lyrixx.info>
 * @author Charles Sarrazin <charles@sarraz.in>
 */
class LdapUserProvider implements UserProviderInterface
{
    private $ldap;
    private $baseDn;
    private $searchDn;
    private $searchPassword;
    private $defaultRoles;
    private $defaultSearch;
    protected $container;

    public function __construct(LdapClientInterface $ldap, $baseDn, $searchDn = null, $searchPassword = null, array $defaultRoles = array(), $uidKey = 'sAMAccountName', $filter = '({uid_key}={username})',Container $container)
    {
        $this->ldap = $ldap;
        $this->baseDn = $baseDn;
        $this->searchDn = $searchDn;
        $this->searchPassword = $searchPassword;
        $this->defaultRoles = $defaultRoles;
        $this->defaultSearch = str_replace('{uid_key}', $uidKey, $filter);
        $this->container = $container;
    }

    /**
     * {@inheritdoc}
     */
    public function loadUserByUsername($username)
    {
        try {
            $this->ldap->bind($this->searchDn, $this->searchPassword);
            $username = $this->ldap->escape($username, '', LDAP_ESCAPE_FILTER);
            $query = str_replace('{username}', $username, $this->defaultSearch);
            $search = $this->ldap->find($this->baseDn, $query);
        } catch (ConnectionException $e) {
            throw new UsernameNotFoundException(sprintf('User "%s" not found.', $username), 0, $e);
        }

        if (!$search) {
            throw new UsernameNotFoundException(sprintf('User "%s" not found.', $username));
        }

        if ($search['count'] > 1) {
            throw new UsernameNotFoundException('More than one user found');
        }

        $request = $this->container->get('request');

        $user = $this->getUserService()->getUserByLoginField($username);

        if (empty($user)) {
            $mail = $search[0]['mail'][0];
            $truename = empty($search[0]['displayname'][0]) ? $username : $search[0]['displayname'][0];
            $employeeId = $search[0]['initials'][0];
            $user = array(
                'email' => $mail,
                'nickname' => $username,
                'type' => 'ldap',
                'roles' => array('ROLE_USER'),
                'setup' => '1',
                'employeeId' => $employeeId,
            );

            $user = $this->getUserService()->register($user, 'ldap');
            $this->getUserService()->updateUserProfile($user['id'], array($truename));
        }
        $user['currentIp'] = $request->getClientIp();
        $currentUser = new CurrentUser();
        $currentUser->fromArray($user);
        $currentUser->setPermissions(PermissionBuilder::instance()->getPermissionsByRoles($currentUser->getRoles()));
        ServiceKernel::instance()->setCurrentUser($currentUser);

        return $currentUser;
    }


    public function loadUser($username, $user)
    {
        $password = isset($user['userpassword']) ? $user['userpassword'] : null;

        $roles = $this->defaultRoles;

        return new User($username, $password, $roles);
    }

    /**
     * {@inheritdoc}
     */
    public function refreshUser(UserInterface $user)
    {
        if (!$user instanceof CurrentUser) {
            throw new UnsupportedUserException(sprintf('Instances of "%s" are not supported.', get_class($user)));
        }

        return $this->loadUserByUsername($user['nickname']);
    }

    /**
     * {@inheritdoc}
     */
    public function supportsClass($class)
    {
        return $class === 'Symfony\Component\Security\Core\User\User';
    }

    protected function getUserService()
    {
        return ServiceKernel::instance()->createService('User:UserService');
    }
}
