<?php

namespace Acme\Action;

use Acme\DAO\pdoObject;
use Acme\Service\userService;

class userController
{   
    // 显示
    public function listAction()
    {
        $userName = null;

        if (!empty($_GET['userName'])) {
            $userName = $_GET['userName'];
        }

        $pageNow = null;
        
        if (!empty($_GET['page'])) {
            $pageNow = $_GET['page'];
        }

        $arr = $this -> getUserService() -> getPage($userName, $pageNow);

        $userss = $arr[0];
        $pageCount = $arr[1];
        $pageNow = $arr[2];

        $this -> render("\list-view.html.twig", array(
            'pageCount' => $pageCount, 
            'pageNow' => $pageNow,
            'users' => $userss
            )
        ); 
    }

    // 添加
    public function addAction()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $file= $_POST;

            $this->getUserService()->addUser($file);
            
            echo json_encode( null );

        } 
    }

    // 删除
    public function delAction()
    {
        $id =$_REQUEST['id'];

        $this->getUserService()->delUser($id);

        echo json_encode( null );
    }

    // 修改
    public function modifyAction()
    {
        if($_SERVER['REQUEST_METHOD'] == 'POST') {

            $file = $_POST;

            $this->getUserService()->modifyUser($file);

            echo json_encode( null );

        }else{

            $id = $_GET['id'];

            $user = $this->getUserService()->getUserById($id);

            echo json_encode( $user );

        }
    }

    public function pageAction(){

        $userName = null;

        if (!empty($_GET['userName'])) {
            $userName = $_GET['userName'];
        }

        $pageNow = null;
        //如果有pageNow就使用，没有就默认第一页。
        if (!empty($_GET['page'])) {
            $pageNow = $_GET['page'];
        }

        $arr = $this -> getUserService() -> getPage($userName, $pageNow);

        $userss = $arr[0];
        $pageCount = $arr[1];
        $pageNow = $arr[2];

        echo json_encode( 
            array( 'pageCount' => $pageCount, 
                   'pageNow' => $pageNow,
                   'users' => $userss
            ) 
        );

    }

    // 获取模型方法(将PDO对象传人模型)
    private function getUserService()
    {
        $pdo = pdoObject::getPdo();

        $userService = new userService($pdo);

        return $userService;
    }

    // Twig    
    private function render($renderTwig,$data = array())
    {   // 查询视图地址
        $loader = new \Twig_Loader_Filesystem('UI'); 
        // 生成对象
        $twig = new \Twig_Environment($loader);
        // 跳转，传参
        echo $twig->render($renderTwig,$data);
    }
}

?>