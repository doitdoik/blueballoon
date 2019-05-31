/* 테이블 삭제 */
drop table accommodation;
drop table attraction;
drop table authority;
drop table favorite;
drop table image;
drop table information;
drop table island;
drop table member;
drop table package;
drop table payment;
drop table qna_board;
drop table reply;
drop table review;
drop table ship;
drop table star;
drop table stay;
drop table temp_member;
drop table transport;

/* 시퀀스 삭제 */
drop sequence accom_seq;
drop sequence attraction_seq;
drop sequence board_seq;
drop sequence image_seq;
drop sequence info_seq;
drop sequence island_seq;
drop sequence pay_seq;
drop sequence pkg_seq;
drop sequence qna_seq;
drop sequence reply_seq;
drop sequence review_seq;
drop sequence ship_seq;
drop sequence stay_seq;
drop sequence trans_seq;

/* 테이블 생성 + pk지정 */

create table member(
mem_id varchar2(12),
mem_email varchar2(30),
mem_pwd varchar2(60),
mem_gender number(1),
mem_birth_date date,
mem_tel varchar2(11),
mem_enabled number(1),
mem_name nvarchar2(10),
mem_brand varchar2(50),
mem_licence varchar2(10),
constraint member_pk_mem_id primary key(mem_id)
);

create table temp_member(
temp_id varchar2(12),
temp_email varchar2(30),
temp_pwd varchar2(60),
temp_gender number(1),
temp_birth_date date,
temp_tel varchar2(11),
temp_name nvarchar2(10),
temp_brand varchar2(50),
temp_licence varchar2(10),
constraint temp_member_pk_temp_id primary key(temp_id)
);
 
create table authority(
mem_id varchar2(12),
auth_name varchar2(20)
);

create table star(
accom_num number(4),
star_score number(1)
);

create table ship(
ship_num varchar2(4),
mem_brand varchar2(50),
ship_name varchar2(50),
ship_max_cap number(4),
is_num varchar2(4),
mem_id varchar2(12),
ship_week_price number(7),
ship_wknd_price number(7),
ship_content clob,
ship_departure varchar2(10),
image_num number(7),
ship_addr varchar2(100),
constraint ship_pk_ship_num primary key(ship_num)
); 

create table accommodation(
accom_num number(4),
accom_max_cap number(3),
accom_addr varchar2(100),
mem_brand varchar2(50),
is_num number(4),
image_num number(7),
accom_week_price number(7),
accom_wknd_price number(7),
accom_content clob,
mem_id varchar2(12),
constraint accommodation_pk_accom_num primary key(accom_num)
);

create table transport(
trans_num number(4),
ship_num number(4),
trans_date date,
trans_can_cap number(4),
constraint transport_pk_trans_num primary key(trans_num)
);

create table stay(
stay_num number(4),
accom_num number(4),
stay_date date,
stay_can_cap number(3),
mem_id varchar2(12),
constraint stay_pk_stay_num primary key(stay_num)
);
    
create table island(
is_num number(4),
is_name varchar2(30),
is_star number(1),
accom_num number(4),
attr_num number(7),
trans_num number(4),
is_info clob,
image_num number(7),
constraint island_pk_is_num primary key(is_num)
);

create table qna_board(
qna_num number(7),
qna_title varchar2(50),
qna_content clob,
qna_write_date date,
reply_num number(7),
mem_id varchar2(12),
constraint qna_board_pk_qna_num primary key(qna_num)
);

create table image(
image_num number(4),
image_name varchar2(50),
constraint image_pk_image_num primary key(image_num)
);

create table payment(
pay_num number(4),
pkg_num number(4),
mem_id varchar2(12),
pay_total number(7),
pay_date date,
pay_state number(1),
pay_people_cnt number(2),
constraint payment_pk_pay_num primary key(pay_num)
);

create table package(
pkg_num number(4),
stay_num number(4),
trans_num number(4),
pkg_name varchar2(50),
pkg_is_admin number(1),
image_num number(4),
constraint package_pk_pkg_num primary key(pkg_num)
);

create table information(
info_num number(7),
info_title varchar2(50),
info_content clob,
info_write_date date,
image_num number(7),
constraint information_pk_info_num primary key(info_num)
);

create table review(
rev_num number(7),
rev_title varchar2(50),
rev_content clob,
rev_write_date date,
reply_num number(7),
mem_id varchar2(12),
image_num number(7),
rev_good_cnt number(4),
rev_read_cnt number(5),
reply_cnt number(4),
constraint review_pk_rev_num primary key(rev_num)
);

create table favorite(
mem_id varchar2(12),
attr_num number(7),
constraint favorite_pk primary key(mem_id, attr_num)
);

create table attraction(
attr_num number(7),
mem_id varchar2(12),
attr_read_cnt number(4),
attr_title varchar2(50),
attr_content clob,
image_num number(7),
attr_is_favorite number(1),
is_num number(4),
constraint attraction_pk_attr_num primary key(attr_num)
);

create table reply(
reply_number number(7),
reply_date date,
reply_content clob,
reply_mem_id varchar2(12),
mem_brand varchar2(50),
qna_num number(7),
rev_num number(7),
constraint reply_pk_reply_number primary key(reply_number)
);

/* 시퀀스 생성 */

create sequence accom_seq minvalue 1;
create sequence attraction_seq minvalue 1;
create sequence board_seq minvalue 1;
create sequence image_seq minvalue 1;
create sequence info_seq minvalue 1;
create sequence island_seq minvalue 1;
create sequence pay_seq minvalue 1;
create sequence pkg_seq minvalue 1;
create sequence qna_seq minvalue 1;
create sequence reply_seq minvalue 1;
create sequence review_seq minvalue 1;
create sequence ship_seq minvalue 1;
create sequence stay_seq minvalue 1;
create sequence trans_seq minvalue 1;

select * from tab;