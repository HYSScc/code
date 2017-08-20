<?php

use Phpmig\Migration\Migration;

class Meeting extends Migration
{
    /**
     * Do the migration
     */
    public function up()
    {
        $biz = $this->getContainer();
        $biz['db']->exec("
           CREATE TABLE `meeting_room` (
              `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
              `name` VARCHAR(45) NOT NULL COMMENT '会议室名称',
              `limitMax` INT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '人数上限',
              `limitMin` INT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '人数下限',
              `remark` VARCHAR(225) DEFAULT NULL COMMENT '备注',
              `createdTime` INT(10) UNSIGNED NOT NULL DEFAULT 0,
              `updatedTime` INT(10) UNSIGNED NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
              )ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议室';
            CREATE TABLE `meeting_record` (
              `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
              `name` VARCHAR(45) NOT NULL COMMENT '会议标题',
              `meetingRoomId` INT(10) UNSIGNED NOT NULL COMMENT '会议室ID',
              `organizerId` INT(10) UNSIGNED NOT NULL COMMENT '发起者',
              `startTime` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
              `endTime` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
              `sort` BIGINT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '特殊排序',
              `introduction` text,
              `meetingDate` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会议日期',
              `createdTime` INT(10) UNSIGNED  NOT NULL DEFAULT 0,
              `updatedTime` INT(10) UNSIGNED  NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
              )ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议记录';
            CREATE TABLE `meeting_record_statistic` (
              `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
              `meetingRoomId` INT(10) UNSIGNED NOT NULL COMMENT '会议室ID',
              `meetingRecordId` VARCHAR(45) NOT NULL COMMENT '会议记录ID',
              `meetingRoomStatisticCode` INT(10) UNSIGNED NOT NULL COMMENT '会议室统计编码',
              `meetingDate` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会议日期',
              `period` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '时间段 9:00~9:30编码为18;18:00～深夜为0',
              `organizerId` INT(10) UNSIGNED NOT NULL COMMENT '发起者',
              `organizerName` VARCHAR(45) NOT NULL COMMENT '发起者姓名',
              `createdTime` INT(10) UNSIGNED  NOT NULL DEFAULT 0,
              `updatedTime` INT(10) UNSIGNED  NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
              )ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议记录统计';   
        ");
    }

    /**
     * Undo the migration
     */
    public function down()
    {
        $biz = $this->getContainer();
        $biz['db']->exec('DROP TABLE IF EXISTS `meeting_room`');
        $biz['db']->exec('DROP TABLE IF EXISTS `meeting_record`');
    }
}
