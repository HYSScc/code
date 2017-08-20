<?php

use Phpmig\Migration\Migration;

class GoalAddUserId extends Migration
{
    /**
     * Do the migration
     */
    public function up()
    {
        $biz = $this->getContainer();
        $biz['db']->exec("
            ALTER TABLE `goal` ADD COLUMN `userId` text DEFAULT NULL COMMENT '用户'"
        );
    }

    /**
     * Undo the migration
     */
    public function down()
    {

    }
}
