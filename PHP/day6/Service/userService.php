<?php

namespace Acme\Service;

use Acme\DAO\mySql;

class userService
{   // PDO对象
    private $pdo;

    // 获取PDO对象
    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function listUsers()
    {

        $mysql = new mySql();
        $sql = $mysql -> sqlList();

        $stmt = $this ->pdo ->DB() ->prepare($sql);
        $stmt ->execute();

        $users = $stmt ->fetchAll();

        return $users;
    }

    public function addUser($user)
    {
        $mysql = new mySql();
        $sql = $mysql -> sqlAdd();

        $stmt = $this ->pdo ->DB() ->prepare($sql);
        $stmt -> execute(
            array(
                $user['username'],
                $user['sex'],
                $user['age'],
                $user['info']
            )
        );

    }

    public function modifyUser($modifyUser)
    {
        $mysql = new mySql();
        $sql = $mysql -> sqlModify();

        $stmt = $this ->pdo ->DB() ->prepare($sql);
        $stmt -> execute(
            array(
                $modifyUser['username'],
                $modifyUser['sex'],
                $modifyUser['age'],
                $modifyUser['info'],
                $modifyUser['id']
            )
        );

    }

    public function delUser($delUserId)
    {
        $mysql = new mySql();
        $sql = $mysql -> sqlDel();

        $stmt = $this ->pdo -> DB() ->prepare($sql);
        $stmt -> execute(array($delUserId));

    }

    // 根据id查询要修改的信息
    public function getUserById($id)
    {
        $mysql = new mySql();
        $sql = $mysql -> sqlGetUserById();

        $stmt = $this ->pdo ->DB() ->prepare($sql);
        $stmt -> execute(array($id));

        $users = $stmt ->fetch();

        return $users;
    }

    public function getPage($userName, $pagenow)
    {   
        $pageSize = 7;   //每页显示的数量
        $pageCount = 0;  //分页数
        $rowCount = 0;   //数据行数
        $pageNow = 1;    //当前显示第几页
        $pre = 0;        //当前页的第一行 

        //如果有pageNow就使用，没有就默认第一页。
        if (!empty($pagenow)){
            $pageNow = $pagenow;
            $pre = ($pageNow - 1) * $pageSize;
        }


        // 执行sql语句，并返回所有的数据
        $mysql = new mySql();

        if($userName == null)
        {
            $sql = $mysql -> sqlList();
            
        }else{

            $sql = $mysql -> sqlFindUserByName($userName);
        }
        
        $stmt = $this ->pdo ->DB() ->prepare($sql);
        $stmt ->execute();

        $users = $stmt ->fetchAll();

        // 返回数据行数
        $rowCount = Count($users);

        //计算共有多少页，ceil取进1
        $pageCount = ceil(($rowCount/$pageSize));


        // 执行sql语句，并返回分页的数据
        $pageMysql = new mySql();
        $pageSql = $pageMysql -> sqlGetPage($userName, $pre, $pageSize);

        $st = $this ->pdo ->DB() ->prepare($pageSql);
        $st ->execute();

        $pageUsers = $st ->fetchAll();


        $arr = array($pageUsers, $pageCount, $pageNow);

        return $arr;

    }

}