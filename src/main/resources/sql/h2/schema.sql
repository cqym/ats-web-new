--drop table if exists ss_task;
--drop table if exists ss_user;
--drop table if exists ss_module;

create table ss_task (
	id bigint generated by default as identity,
	title varchar(128) not null,
	description varchar(255),
	user_id bigint not null,
    primary key (id)
);

create table ss_user (
	id bigint generated by default as identity,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null,
	primary key (id)
);

create table ss_module (
	id bigint generated by default as identity,
	title varchar(128) not null,
	client_type varchar(50),
	request_cmd varchar(255),
	response_cmd varchar(255),
	create_date timestamp,
	update_date timestamp,
	user_id bigint not null,
    primary key (id)
);