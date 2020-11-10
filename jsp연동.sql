CREATE TABLE users(
    id VARCHAR2(30) not null,
    pw VARCHAR2(30) not null,
    name VARCHAR2(30) not null,
    email VARCHAR2(30),
    address VARCHAR2(100),
    regdate date default sysdate
);
alter table users add CONSTRAINT users_pk PRIMARY key (id);

select * from users;



---------------------------------------------board table �����---------------------------------------------

CREATE TABLE board(
    bno NUMBER(10,0) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(2000),
    regdate DATE DEFAULT sysdate,
    hit NUMBER(10,0) DEFAULT 0
);
ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY (bno);

CREATE SEQUENCE board_seq START WITH 1 INCREMENT BY 1 NOCACHE;

select * from board;

desc users;

select * from board order by bno DESC;


---------����¡-----------------------------------------------------------------------------------------------------

DECLARE
    var1 number := board_seq.nextval;
begin
    while var1 <= 300
    loop
        insert into board(bno, writer, title, content) values( board_seq.nextval, 'test', 'test', 'test');
        insert into board(bno, writer, title, content) values( board_seq.nextval, 'admin', 'admin', 'admin');
        insert into board(bno, writer, title, content) values( board_seq.nextval, 'test02', 'test02', 'test02');
        
        var1 := var1 + 1;
    end loop;
    commit;
end;

select count(*) from board;

select * from board order by bno;


-- 1. ���� ���� �������� �����ؼ� ��ȸ
-- 2. rownum�� ���ؼ� ��ȸ
-- 3. rownum�� ������
select *
from (
    select rownum rn, 
             bno,
             writer,
             title,
             content,
             regdate,
             hit
    from (select * 
             from board 
             order by bno desc)
) where rn > 10 and rn <=20;


-- ȸ�� ���̺� ���� --
create table users (
    id VARCHAR2(50) PRIMARY KEY,
    pw VARCHAR2(50) not null,
    name VARCHAR2(50) not null,
    phoneNumber VARCHAR2(50) not null,
    email VARCHAR2(100) not null,
    basicAddress VARCHAR2(200) not null,
    detailAddress VARCHAR2(200) not null,
    regdate date DEFAULT sysdate
);

s

DROP table bbs;
-- �Խ��� ���̺� ���� --
create table bbs (
    bno number(20,0) PRIMARY KEY,
    writer VARCHAR2(50) not null,
    title VARCHAR2(100) not null,
    content VARCHAR2(2000),
    regdate DATE DEFAULT sysdate
);

create SEQUENCE bbs_seq START with 1 INCREMENT by 1 NOCACHE;

select * from bbs;

ALTER TABLE bbs
ADD (id VARCHAR2(50));


��ó: https://hyeonstorage.tistory.com/292 [������ �ϰ� �;��]

DECLARE
    var1 number := bbs_seq.nextval;
begin
    while var1 <= 300
    loop
        insert into bbs(bno, writer, title, content) values( bbs_seq.nextval, 'test1', 'test1', 'test1');
        insert into bbs(bno, writer, title, content) values( bbs_seq.nextval, 'test02', 'test02', 'test02');
        insert into bbs(bno, writer, title, content) values( bbs_seq.nextval, 'test3', 'test3', 'test3');
        insert into bbs(bno, writer, title, content) values( bbs_seq.nextval, 'test04', 'test04', 'test04');
        var1 := var1 + 1;
    end loop;
    commit;
end;

 insert into bbs(bno, writer, title, content) values( bbs_seq.nextval, 'test1', 'test1', 'test1');
        insert into bbs(bno, writer, title, content) values( bbs_seq.nextval, 'test02', 'test02', 'test02');
        insert into bbs(bno, writer, title, content) values( bbs_seq.nextval, 'test3', 'test3', 'test3');
        insert into bbs(bno, writer, title, content) values( bbs_seq.nextval, 'test04', 'test04', 'test04');
commit;


select *
from (
    select rownum rn, 
             bno,
             writer,
             title,
             content,
             regdate
    from (select * 
             from bbs 
             where writer='test1'
             order by bno desc)
) where rn > 0 and rn <=10;
--�̰Ŵ�
select *
from(
    select rownum rn , 
         bno,
         writer,
         title,
         content,
         regdate
    from (select 
                bno, 
                writer, 
                title, 
                content, 
                b.regdate 
            from bbs b 
            join users u 
            on b.writer = u.id 
            where id='qqq111' 
            order by bno desc)
            ) where rn > 0 and rn <=10;

select bno, writer, title, content, b.regdate from bbs b join users u on b.writer = u.id where id='qqq111' order by bno desc;

select * from bbs;
select * from users;

select * from bbs b left join 
users u on u.name = b.writer;