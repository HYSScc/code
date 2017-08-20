<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration,
    Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your need!
 */
class Version20131225141008 extends AbstractMigration
{
    public function up(Schema $schema)
    {
        // this up() migration is autogenerated, please modify it to your needs
    	$this->addSql("
			CREATE TABLE `money_record` (
			  `id` int(10) unsigned NOT NULL,
			  `title` VARCHAR( 64 ) NOT NULL ,
			  `userId` int(10) unsigned NOT NULL,
			  `type` enum('income','payout') NOT NULL COMMENT '记录类型',
			  `transactionNo` varchar(128) NOT NULL COMMENT '交易号',
			  `transactionTime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易时间/消费时间',
			  `amount` float(10,2) NOT NULL COMMENT '充值金额/消费金额',
			  `status` enum('created','finished') NOT NULL DEFAULT 'created',
			  `createdTime` int(10) unsigned NOT NULL,
			  PRIMARY KEY (`id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
    }

    public function down(Schema $schema)
    {
        // this down() migration is autogenerated, please modify it to your needs
    }
}
