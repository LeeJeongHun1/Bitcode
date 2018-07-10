-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;

-- 테이블 삭제
drop table tb_user purge;
drop table tb_news purge;

delete from tb_user
	where id = 'id1';
	
-- insert 유저
insert into tb_user (
	id, name, nick_name, password, email, birthday
) values (
	'sun', '김선영', '떠뇽', '1111', 'sun@daum.net', '19990000'
);

-- delete 유저
delete from tb_user
	where id = 'sun';

commit;
