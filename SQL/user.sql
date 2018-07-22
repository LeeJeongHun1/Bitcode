create table tb_user (
    `id`         varchar(30)    primary key    comment '아이디', 
    `name`       varchar(30)    not null       comment '이름', 
    `nick_name`  varchar(30)    not null       comment '닉네임', 
    `password`   varchar(200)    not null       comment '비밀번호', 
    `email`      varchar(50)    not null       comment '이메일', 
    `point`      int(10)        default 0      comment '포인트', 
    `auth`       char(1)        not null       comment '권한', 
    `birthday`   varchar(8)     not null       comment '생년월일'
) default charset=utf8;

alter table tb_user comment '회원정보';
-----------------------------------------------------------------------------------------------------
--  유저

select * from tb_user;

-----------------------------------------------------------------------------------------------------
INSERT INTO tb_user(id, name, nick_name, password, email, point, auth, birthday)
	VALUES('id1', 'hong', 'hongGilDong', 'id1', 'hong@naver.com', 10, 'U', 19880101);

	
select * from tb_qna_board;

	select s.stsfc_step, q.no, q.id, q.title, q.content
	from tb_stsfc_code s
	inner 
	join tb_qna_board q
	on q.stsfc_code = s.stsfc_code
	where id = 'yoo';
		  
INSERT INTO tb_qna_board(id, name, nick_name, password, email, point, auth, birthday)
	VALUES('id2', '홍길동', '길동이', 'id2', 'hong2@naver.com', 10, 'U', 19880102);
		 
		select *
		from tb_qna_board q
		inner
		join tb_language_code c
		on
		q.language_code = c.language_code
		inner 
		join tb_user u
		on q.id = u.id
		where q.id = 'yoo';		 
   
 select * from tb_user
 	where id = 'id3';
 	
 	
update tb_qna_board
   set stsfc_code = 13
 where id = 'yoo' and
 	   no = 206;
 
 delete from tb_qna_board
 	where id = 'yoo';
-----------------------------------------------------------------------------------------------------
--delete 유저
delete from tb_qna_board
	where id = 'yoo';

	
select * from tb_user
	where id = 'yoo';

-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;

-- 테이블 삭제
drop table tb_user purge;
drop table tb_news purge;
--
delete from tb_attendance
	where att_id = 72;
	
--
delete from tb_attendance
	where id = 'wldus';	

select * from tb_attendance;

		select *
		  from tb_attendance
		 where id = 'id1'; 

INSERT INTO tb_attendance(att_id, id, att_date)
	VALUES(67, 'id1', 20180719);
	
	
INSERT INTO tb_stsfc_code(stsfc_code, stsfc_step)
	VALUES(13, '만족');
------------------------------------------------------------------------------------------------------
-- 출석체크 테이블
--------------------------------------------------------------------
create table tb_attendance (
    `att_id`    int(10)        auto_increment primary key    comment '출석체크번호', 
    `id`        varchar(30)    comment '아이디' references tb_user (id)  on delete cascade on update cascade, 
    `att_date`  datetime       default now()    comment '출석체크한날'
) default charset=utf8;

alter table tb_attendance comment '출석체크 테이블';

--------------------------------------------------------------------
create table tb_stsfc_code (
    `stsfc_code`  char(2)        primary key    comment '만족도코드', 
    `stsfc_step`  varchar(30)    not null    comment '만족도' 
) default charset=utf8;

alter table tb_stsfc_code comment '답변만족도 코드표';


commit;
