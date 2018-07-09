-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;

-- 테이블 삭제
drop table tb_user purge;

drop table tb_code_table purge;

drop table tb_code_board purge;
drop table tb_code_comment purge;
drop table tb_code_file purge;

drop table tb_qna_board purge;
drop table tb_qna_comment purge;
drop table tb_qna_file purge;

drop table tb_attendance purge;

drop table tb_news purge;

drop table tb_document purge;
--------------------------------------------------------------------
-- fk 항목에는 on delete cascade on update cascade 옵션 붙이기
--------------------------------------------------------------------
-- 회원정보 테이블
--------------------------------------------------------------------
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
--------------------------------------------------------------------
-- 코드테이블
--------------------------------------------------------------------
create table tb_code_table (
    `rank_code`      char(2)        not null    comment '등급코드', 
    `rank_name`      varchar(30)    not null    comment '등급명', 
    `stsfc_code`     char(2)        not null    comment '만족도코드', 
    `stsfc_step`     varchar(30)    not null    comment '만족도', 
    `language_code`  char(2)        not null    comment '언어코드', 
    `language_name`  varchar(30)    not null    comment '언어명' 
);

alter table tb_code_table comment '코드테이블';
--------------------------------------------------------------------
-- 코드공유 게시판 테이블
--------------------------------------------------------------------
create table tb_code_board (
    `no`             int(10)          auto_increment primary key                        comment '글번호', 
    `group_no`       int(10)          not null                                          comment '글그룹번호', 
    `group_order`    int(10)          default 0                                          comment '그룹내에서순서', 
    `depth`          int(10)          default 0                                          comment '답글의깊이', 
    `id`             varchar(30)      comment '아이디' references  `tb_user` (`id`) on delete cascade on update cascade, 
    `language_code`  char(2)          comment '언어종류'       references tb_code_board (language_code)  on delete cascade on update cascade, 
    `title`          varchar(100)     not null                                          comment '제목', 
    `content`        varchar(4000)    not null                                          comment '내용', 
    `reg_date`       datetime         default now()                                     comment '등록일', 
    `view_cnt`       int(10)          default 0                                         comment '조회수', 
    `like_cnt`       int(10)          default 0                                         comment '추천수'
) default charset=utf8;

alter table tb_code_board comment '코드공유게시판';
--------------------------------------------------------------------
-- 코드공유게시판 댓글 테이블
--------------------------------------------------------------------
create table tb_code_comment (
    `no`           int(10)          comment '글번호' references tb_code_board (no)  on delete cascade on update cascade, 
    `id`           varchar(30)      comment '아이디' references tb_user (id)  on delete cascade on update cascade, 
    `content`      varchar(4000)    not null                       comment '댓글내용', 
    `comment_no`   int(10)          auto_increment primary key     comment '댓글번호', 
    `reg_date`     datetime         default now()                  comment '댓글등록일', 
    `group_no`     int(10)          not null                       comment '댓글그룹번호', 
    `group_order`  int(10)          default 0                      comment '그룹내에서순서', 
    `depth`        int(10)          default 0                      comment '댓글의깊이'
) default charset=utf8;

alter table tb_code_comment comment '코드공유게시판 댓글';
--------------------------------------------------------------------
-- 코드공유 게시판 첨부파일 테이블
--------------------------------------------------------------------
create table tb_code_file (
    `file_no`      int(10)         primary key    comment '파일번호', 
    `no`           int(10)         comment '글번호' references tb_code_board (no)  on delete cascade on update cascade, 
    `file_path`    varchar(100)    not null    comment '파일경로', 
    `ori_name`     varchar(100)    not null    comment '원본이름', 
    `system_name`  varchar(100)    not null    comment '시스템이름', 
    `file_size`    int(10)         not null    comment '파일크기' 
) default charset=utf8;

alter table tb_news comment '코드공유 게시판 첨부파일';
--------------------------------------------------------------------
-- Q&A 게시판 테이블
--------------------------------------------------------------------
create table tb_qna_board (
    `no`             int(10)          auto_increment primary key        comment '글번호', 
    `group_no`       int(10)          not null           comment '글그룹번호', 
    `group_order`    int(10)          default 0          comment '그룹내에서순서', 
    `depth`          int(10)          default 0          comment '답글의깊이', 
    `id`             varchar(30)      comment '아이디'        references tb_user (id)  on delete cascade on update cascade, 
    `language_code`  char(2)          comment '언어종류'       references tb_code_board (language_code)  on delete cascade on update cascade, 
    `title`          varchar(100)     not null           comment '제목', 
    `content`        varchar(4000)    not null           comment '내용', 
    `reg_date`       datetime         default now()      comment '등록일', 
    `view_cnt`       int(10)          default 0          comment '조회수', 
    `like_cnt`       int(10)          default 0          comment '추천수', 
    `stsfc_code`     char(2)          comment '만족도코드'      references tb_code_board (stsfc_code)  on delete cascade on update cascade
) default charset=utf8;

alter table tb_qna_board comment 'q&a게시판';
--------------------------------------------------------------------
-- Q&A게시판 댓글 테이블
--------------------------------------------------------------------
create table tb_qna_comment (
    `no`           int(10)          comment '글번호' references tb_qna_board (no)  on delete cascade on update cascade, 
    `id`           varchar(30)      comment '아이디' references tb_user (id)  on delete cascade on update cascade, 
    `content`      varchar(4000)    not null                      comment '댓글내용', 
    `comment_no`   int(10)          auto_increment primary key    comment '댓글번호', 
    `reg_date`     datetime         default now()                 comment '댓글등록일', 
    `group_no`     int(10)          not null                      comment '댓글그룹번호', 
    `group_order`  int(10)          default 0                     comment '그룹내에서순서', 
    `depth`        int(10)          default 0                     comment '댓글의깊이'
) default charset=utf8;

alter table tb_qna_comment comment 'Q&A게시판 댓글';
--------------------------------------------------------------------
-- Q&A 게시판 첨부파일 테이블
--------------------------------------------------------------------
create table tb_qna_file (
    `file_no`      int(10)         not null    comment '파일번호', 
    `no`           int(10)         comment '글번호' references tb_qna_board (no)  on delete cascade on update cascade, 
    `file_path`    varchar(100)    not null    comment '파일경로', 
    `ori_name`     varchar(100)    not null    comment '원본이름', 
    `system_name`  varchar(100)    not null    comment '시스템이름', 
    `file_size`    int(10)         not null    comment '파일크기', 
    primary key (file_no)
) default charset=utf8;

alter table tb_qna_file comment 'Q&A 게시판 첨부파일';
--------------------------------------------------------------------
-- IT News 테이블
--------------------------------------------------------------------
create table tb_news (
    `article_no`        int(10)          auto_increment primary key    comment '뉴스번호', 
    `article_type`      varchar(100)     not null    comment '뉴스종류', 
    `article_title`     varchar(100)     not null    comment '뉴스제목', 
    `article_summary`   varchar(4000)    not null    comment '뉴스요약', 
    `article_content`   varchar(4000)    not null    comment '뉴스내용', 
    `article_reporter`  varchar(100)     not null    comment '뉴스기자', 
    `article_thumb`     varchar(100)     not null    comment '뉴스썸네일', 
    `article_url`       varchar(100)     not null    comment '뉴스링크', 
    `article_date`      varchar(100)     not null    comment '뉴스날짜'
);

alter table tb_news comment 'it뉴스 테이블';
--------------------------------------------------------------------
-- IT News 게시판 댓글 테이블
--------------------------------------------------------------------
create table tb_news_comment (
    `article_no`  int(10)         comment '뉴스번호' references tb_news (article_no)  on delete cascade on update cascade, 
    `comment_no`  int(10)         not null    comment '댓글번호', 
    `id`          varchar(30)     comment '아이디' references tb_user (id)  on delete cascade on update cascade,
    `content`     varchar(400)    not null    comment '댓글내용'
) default charset=utf8;

alter table tb_news_comment comment 'it 뉴스 댓글 테이블';
--------------------------------------------------------------------
-- 출석체크 테이블
--------------------------------------------------------------------
create table tb_attendance (
    `att_id`    int(10)        auto_increment primary key    comment '출석체크번호', 
    `id`        varchar(30)    comment '아이디' references tb_user (id)  on delete cascade on update cascade, 
    `att_date`  datetime       default now()    comment '출석체크한날'
) default charset=utf8;

alter table tb_attendance comment '출석체크 테이블';
--------------------------------------------------------------------
-- 내문서 테이블
--------------------------------------------------------------------
create table tb_document (
    `no`           int(10)          auto_increment primary key    comment '파일번호', 
    `id`           varchar(30)     comment '아이디' references tb_user (id)  on delete cascade on update cascade, 
    `file_path`    varchar(100)    not null    comment '파일경로', 
    `ori_name`     varchar(100)    not null    comment '원본이름', 
    `system_name`  varchar(100)    not null    comment '시스템이름', 
    `file_size`    int(10)         not null    comment '파일크기'
) default charset=utf8;

alter table tb_document comment '내문서(클라우드)';
--------------------------------------------------------------------
	
commit;
