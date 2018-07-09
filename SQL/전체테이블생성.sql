-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;

--------------------------------------------------------------------
-- fk 항목에는 on delete cascade 옵션 붙이기

-- 컬럼 데이터 타입 변경 예
-- alter table tb_board modify(title varchar(30));
-- alter table tb_board modify(reg_date datetime default now());

-- 컬럼 수정 예
-- alter table tb_user_type modify(height varchar(30) null);
-- alter table tb_user_type modify(id varchar(30) references tb_user(id) on delete cascade primary key);
-- alter table tb_board_list modify(club_maker varchar(30) references tb_user(id) on delete cascade);
-- alter table tb_board_like_cnt modify(no int(6) references tb_board(no) on delete cascade);

-- 컬럼 추가 예
-- alter table tb_user add(image_path varchar2(100));
-- alter table tb_user_msg add(send_del_yn char(1) default 'N');
--------------------------------------------------------------------
-- 테이블 생성시 utf8 인코딩 설정해서 만들기 예시!
create table tb_board(
	no int(10) auto_increment primary key,
	writer varchar(30) not null,
	title varchar(300) not null,
	content varchar(1000) not null,
	reg_date datetime default now()
	) default charset=utf8;
--------------------------------------------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
commit;
