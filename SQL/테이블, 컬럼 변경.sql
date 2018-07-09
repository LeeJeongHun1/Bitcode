-- 전체 테이블 조회
show tables;
--------------------------------------------------------------------

alter table tb_code_board change group_order group_order int(2) default 0 comment '글그룹번호';
alter table tb_code_board change depth depth int(2) default 0 comment '그룹내에서순서';

alter table tb_code_comment change group_order group_order int(2) default 0 comment '댓글그룹번호';
alter table tb_code_comment change depth depth int(2) default 0 comment '그룹내에서순서';

alter table tb_qna_board change group_order group_order int(2) default 0 comment '글그룹번호';
alter table tb_qna_board change depth depth int(2) default 0 comment '그룹내에서순서';

alter table tb_qna_comment change group_order group_order int(2) default 0 comment '댓글그룹번호';
alter table tb_qna_comment change depth depth int(2) default 0 comment '그룹내에서순서';


alter table tb_user change auth auth char(1) default 'U' comment '권한';

alter table tb_user change password password varchar(200) not null comment '비밀번호';

	
commit;
