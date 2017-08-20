<?php

namespace CustomBundle\Biz\Post\Dao\Impl;

use CustomBundle\Biz\Post\Dao\PostDao;
use Codeages\Biz\Framework\Dao\GeneralDaoImpl;

class PostDaoImpl extends GeneralDaoImpl implements PostDao
{
    protected $table = 'post';

    public function addPost($post)
    {
        return $this->create($post);
    }

    public function deletePost($id)
    {
        return $this->delete($id);
    }

    public function updatePost($post)
    {
        return $this->updateById($post['id'], $post);
    }

    public function findPost($id)
    {
        return $this->get($id);
    }

    public function findAll()
    {
        $sql = "select * from {$this->table} ";
        $stmt = $this->db()->query($sql);
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function searchPost($name)
    {
        $sql = "SELECT * FROM {$this->table} WHERE name like '%$name%' ";
        return $this->db()->fetchAll($sql);
    }

    public function declares()
    {
        return array(
            'orderbys' => array(
                'id',
                'createdTime',
                'updatedTime',
                'name',
                'code',
            ),
            'timestamps' => array(
                'createdTime',
                'updatedTime',
            ),
            'conditions' => array(
                'name LIKE :name',
                'id = :id',
                'code = :code',
                'level = :level',
                'createdTime = :createdTime',
                'updatedTime = :updatedTime',
            ),
        );
    }
}