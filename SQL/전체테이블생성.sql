-- 전체 탭 조회
show tables;

-- 특정 테이블 조회
select * from b;

--------------------------------------------------------------------
-- 게시글 시퀀스

--------------------------------------------------------------------

-- fk 항목에는 on delete cascade 옵션 붙이기

-- 컬럼 데이터 타입 변경 예
-- alter table tb_board_code modify(board_type varchar2(30));
-- alter table tb_user_chat modify(chat_send_time date default sysdate);

-- 컬럼 수정 예
-- alter table tb_user_type modify(height varchar2(30) null);
-- alter table tb_user_type modify(id varchar2(30) references tb_user(id) on delete cascade primary key);
-- alter table tb_board_list modify(club_maker varchar2(30) references tb_user(id) on delete cascade);
-- alter table tb_board_like_cnt modify(no number(6) references tb_board(no) on delete cascade);

-- 컬럼 추가 예
-- alter table tb_user add(image_path varchar2(100));
-- alter table tb_user_msg add(send_del_yn char(1) default 'N');

--------------------------------------------------------------------
-- tb_user
--------------------------------------------------------------------


commit;
