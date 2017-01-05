drop table if exists ss_task;
drop table if exists ss_user;
drop table if exists ss_module;
drop table if exists ss_xml_config_detail;
drop table if exists ss_xml_config;

create table ss_task (
	id bigint auto_increment,
	title varchar(128) not null,
	description varchar(255),
	user_id bigint not null,
    primary key (id)
) engine=InnoDB;

create table ss_user (
	id bigint auto_increment,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null default 0,
	primary key (id)
) engine=InnoDB;

create table ss_module (
	id bigint auto_increment,
	title varchar(128) not null,
	client_type varchar(50),
	request_cmd varchar(255),
	response_cmd varchar(255),
	create_date datetime,
	update_date datetime,
	user_id bigint not null,
    primary key (id)
) engine=InnoDB;


CREATE TABLE `ss_xml_config_detail` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	xml_config_id bigint(20) not null,
	order_num int(8) not null,
	`step_name` VARCHAR(128) NOT NULL,
	`description` VARCHAR(500) NULL DEFAULT NULL,
	`request_content` VARCHAR(500) NULL DEFAULT NULL,
	`response_content` VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

CREATE TABLE `ss_xml_config` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(128) NOT NULL,
	`description` VARCHAR(500) NULL DEFAULT NULL,
	`create_date` DATETIME NULL DEFAULT NULL,
	`update_date` DATETIME NULL DEFAULT NULL,
	`user_id` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;