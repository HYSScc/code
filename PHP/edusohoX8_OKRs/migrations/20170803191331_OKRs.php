<?php

use Phpmig\Migration\Migration;

class OKRs extends Migration
{
    public function up()
    {
        $biz = $this->getContainer();
        $biz['db']->exec("
            CREATE TABLE `section_goal` (
              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
              `year` year(4) UNSIGNED NOT NULL COMMENT '年份', 
              `name` varchar(255) NOT NULL DEFAULT '' COMMENT '阶段目标名',
              `startTime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
              `confirmEndTime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '确认截止时间',
              `adjustStartTime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '调整开始时间',
              `adjustEndTime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '调整结束时间',
              `selfRatingEndTime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '自评截止时间',
              `othersRatingEndTime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '他评截止时间',
              `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='阶段目标';
            
            CREATE TABLE `user_section_goal` (
              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
              `sectionGoalId` int(10) NOT NULL COMMENT '阶段目标id',
              `userId` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
              `status` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 不禁用;1 禁用',
              `isSelfRated` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 未自评;1 已自评',
              `isGoalsCreated` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 未创建;1 已创建',
              `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户阶段目标';

            CREATE TABLE `goal` (
              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
              `sectionGoalId` int(10) NOT NULL COMMENT '阶段目标id',
              `name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户目标名',
              `adjustReason` varchar(255) NOT NULL DEFAULT '' COMMENT '调整理由，有此值说明在审核中', 
              `approvingKrInfo` varchar(255) NOT NULL DEFAULT 'json格式显示目标下的KR',
              `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
            CREATE TABLE `key_result` (
              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
              `goalId` int(10) UNSIGNED NOT NULL COMMENT '目标id',
              `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'KR名',
              `selfScore` float(10,1) NOT NULL DEFAULT -1.0 COMMENT '-1分表示未评',
              `othersScore` float(10,1) NOT NULL DEFAULT -1.0 COMMENT '-1分表示仍有人未评论',
              `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
            CREATE TABLE `key_result_comment` (
              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
              `keyResultId` int(10) UNSIGNED NOT NULL COMMENT 'KR结果id',
              `description` text COMMENT '进展描述',
              `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进展情况';          
              
            CREATE TABLE `others_rating` (
              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
              `sectionGoalId` int(10) NOT NULL COMMENT '阶段目标id',
              `keyResultId` int(10) NOT NULL COMMENT 'KRid',
              `goalId` int(10) NOT NULL COMMENT '目标id',
              `userId` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
              `score` float(10,1) NOT NULL DEFAULT -1.0 COMMENT '-1分表示未评',
              `inviteId` int(10) UNSIGNED NOT NULL COMMENT '邀请人ID',
              `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='他评';       
            
            CREATE TABLE `post` (
              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
              `code` varchar(255) NOT NULL DEFAULT '' COMMENT '岗位编码',
              `name` varchar(255) NOT NULL DEFAULT '' COMMENT '岗位名',
              `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='他评';             
                       
            CREATE TABLE `goal_approval_history` (
              `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
              `goalId` int(10) UNSIGNED NOT NULL,
              `oldInfo` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'json格式',
              `newInfo` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'json格式',
              `status` varchar(32) DEFAULT 'notAudit' COMMENT '审核状态  notAudit|pass|reject',
              `adjustReason` varchar(255) NOT NULL DEFAULT '' COMMENT '调整理由',
              `rejectReason` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '驳回理由',
              `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;   
        ");

        $biz['db']->exec("
            ALTER TABLE `user` 
            ADD COLUMN `postId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '岗位id',
            ADD COLUMN `employeeId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '工号';  
        ");
    }

    /**
     * Undo the migration.
     */
    public function down()
    {
        $biz = $this->getContainer();
        $biz['db']->exec('DROP TABLE IF EXISTS `section_goal`');
        $biz['db']->exec('DROP TABLE IF EXISTS `user_section_goal`');
        $biz['db']->exec('DROP TABLE IF EXISTS `goal`');
        $biz['db']->exec('DROP TABLE IF EXISTS `key_result`');
        $biz['db']->exec('DROP TABLE IF EXISTS `key_result_comment`');
        $biz['db']->exec('DROP TABLE IF EXISTS `others_rating`');
        $biz['db']->exec('DROP TABLE IF EXISTS `post`');
        $biz['db']->exec('DROP TABLE IF EXISTS `goal_approval_history`');
        $biz['db']->exec('ALTER TABLE `user` DROP COLUMN `postId`, DROP COLUMN `employeeId`');
    }
}
