<?php

namespace Acme\DAO;

class pdoObject
{
    // 创建对象
    private static $pdo = null;

    // 私有化构造方法
    private function __contruct()
    {
    }

    // 返回一个共有静态方法获取自身的对象
    public static function getPdo(){
        
        if(self::$pdo == null){

            self::$pdo = new pdoObject();

        }

        return self::$pdo; 
    }


    public function DB()
    {
        $setting = parse_ini_file("dataConfig.ini");

        try
        {
            $db = new \PDO("$setting[database_driver]:host=$setting[database_host];dbname=$setting[database_name]", 
                           "$setting[database_user]", 
                           "$setting[database_password]");
            $db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $db->exec('set names utf8');

        }catch (PDOException $e)
        {
            echo $e -> getMessage();
            echo $e -> getFile();
            echo $e -> getLine();
            echo $e -> getCode();
        }

        return $db;
    }

}

