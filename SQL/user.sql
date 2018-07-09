create table tb_user (
    `id`         varchar(30)    primary key    comment '아이디', 
    `name`       varchar(30)    not null       comment '이름', 
    `nick_name`  varchar(30)    not null       comment '닉네임', 
    `password`   varchar(30)    not null       comment '비밀번호', 
    `email`      varchar(50)    not null       comment '이메일', 
    `point`      int(10)        default 0      comment '포인트', 
    `auth`       char(1)        not null       comment '권한', 
    `birthday`   varchar(8)     not null       comment '생년월일'
) default charset=utf8;

alter table tb_user comment '회원정보';
-----------------------------------------------------------------------------------------------------
-- insert 유저
-----------------------------------------------------------------------------------------------------






-----------------------------------------------------------------------------------------------------

-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;

-- 테이블 삭제
drop table tb_user purge;
drop table tb_news purge;



------------------------------------------------------------------------------------------------------
-- 출석체크 테이블
--------------------------------------------------------------------
create table tb_attendance (
    `att_id`    int(10)        auto_increment primary key    comment '출석체크번호', 
    `id`        varchar(30)    comment '아이디' references tb_user (id)  on delete cascade on update cascade, 
    `att_date`  datetime       default now()    comment '출석체크한날'
) default charset=utf8;

alter table tb_attendance comment '출석체크 테이블';





commit;
