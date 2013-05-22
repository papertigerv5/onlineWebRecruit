-- MySql版

create database onlinehr;

use onlinehr;

-- 角色表(user_role)
create table user_role(
	role_id 	int(2)		auto_increment	comment '角色ID',
	role_name 	varchar(20)	not null comment '角色名称',
	insert_time	timestamp comment '记录插入时间',
	primary key(role_id)
);

-- 用户登录表(user_login)
create table user_login(
	user_account	varchar(20) not null comment '登录帐号',
	user_pass		varchar(30)	not null comment '登录密码',
	role_id	int(2)	not null comment '角户ID',
	user_statu		int(2) default 0 comment '帐号状态',
	last_login_time	timestamp comment '最后登录时间',
	primary key(user_account),
	foreign key(role_id) references user_role(role_id)
);

-- 个人用户信息(personal_user)
create table personal_user(
	user_account	varchar(20)	not null comment '用户帐号',
	user_name		varchar(20)	not null comment '姓名',
	user_sex		char(2) comment '性别',
	user_degree		char(2)	comment '学历',
	e_mail			varchar(30) comment '电子邮箱',
	birthday 		date	comment '出生日期',
	marriage		int(1)	comment '婚姻状况',
	province		varchar(20)	comment '所在省',
	city			varchar(20)	comment '所在市',
	address			varchar(100)	comment '具体地址',
	card_type		int(1)			comment '证件类型',
	card_number		varchar(15)		comment	'证件号码',
	oversea_assignment	int(1)		comment '海外工作经历',
	politics_statu	int(1)			comment '政治面貌',
	phone			varchar(13)		comment '手机号码',
	home_link		varchar(50)		comment '个人主页',
	insert_time		timestamp,
	primary key(user_account),
	foreign key(user_account) references user_login(user_account)
);

-- 企业用户信息(company_user)
create table company_user(
	company_account		varchar(20)	not null comment '企业用户帐号',
	company_name		varchar(100)	not null comment '公司名称',
	company_scale		char(2)	not null comment '公司规模',
	province			varchar(20)	not null comment '所在省',
	city				varchar(20)	not null comment '所在城市',
	addredd				varchar(100)	comment '具体地址',
	company_hr			varchar(20)	not null comment '联系人',
	company_mail		varchar(30)	not null comment '企业邮箱',
	company_phone		varchar(13)	not null comment '公司电话',
	company_homelink	varchar(50)	comment '企业主页',
	statu				int(1)	default 0 comment '状态',
	insert_time			timestamp comment '插入时间',
	primary key(company_account) ,
	foreign key(company_account) references user_login(user_account)
);

-- 职位类别(position_type)
create table position_type(
	position_id		int(3) auto_increment	not null comment '职位ID',
	position_name	varchar(50)	not null comment '职位名称',
	position_desc	varchar(100) comment '职位描述',
	insert_time		timestamp 	comment '记录插入时间',
	primary key(position_id)
);

-- 招聘信息(employment)
create table employment(
	employment_id	int(11) auto_increment	not null comment 'ID',
	company_account	varchar(20)	not null comment '企业帐号',
	position_id		int(3)	not null comment '职位ID',
	employment_desc	varchar(200)	not null comment '招聘信息描述',
	job_city		varchar(20)		not null comment '工作地点(城市)',
	insert_time		timestamp		comment '发布时间',
	primary key(employment_id),
	foreign key(company_account) references company_user(company_account)
);

-- 视频信息(video)
create table video(
	video_id	int(11)	auto_increment not null comment 'ID',
	video_type	int(2)	not null comment '视频类别',
	user_account	varchar(20)	comment '所属帐号',
	video_statu	int(2)	not null default 0 comment '视频状态',
	video_url	varchar(100) not null comment '视频路径',
	upload_time	timestamp	comment '上传时间',
	primary key(video_id),
	foreign key(user_account) references user_login(user_account)
);

