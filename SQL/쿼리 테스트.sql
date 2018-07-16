-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;
select * from tb_qna_board;

-- 테이블 삭제
drop table tb_user purge;
drop table tb_news purge;

delete from tb_user
	where id = 'id1';
	
-- insert 유저 (비번은 암호화되서 들어가야 하기때문에 회원가입을 통해 데이터 생성 요망!!)
insert into tb_user (
	id, name, nick_name, password, email, birthday
) values (
	'sun', '김선영', '떠뇽', '1111', 'sun@daum.net', '19990000'
);

-- delete 유저
delete from tb_user
	where id = 'sun';

-- update 유저
update tb_user
		set auth = 'S'
		where id = 'admin';
		
-- update 답글여부
update tb_qna_board
	set answer_at = 'Y'
	where no = 38;

-- 문의글 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board;
	
-- 문의글에 대한 답변 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board
	where answer_at = 'Y';
	
select *
	from tb_code_board
	order by group_no desc, group_order asc;

select language_name as name, language_code as code
   	from tb_language_code
   	order by language_code;	

   	
   	
 commit;
