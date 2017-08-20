<?php

use Phpmig\Migration\Migration;

class OrgManage extends Migration
{
    /**
     * Do the migration
     */
    public function up()
    {
        $biz = $this->getContainer();
        $biz['db']->exec("
            ALTER TABLE `org` ADD COLUMN `managerIds` text DEFAULT NULL COMMENT '管理员Ids'");
    }

    /**
     * Undo the migration
     */
    public function down()
    {
    }
}
