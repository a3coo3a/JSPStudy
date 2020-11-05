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



---------------------------------------------board table 만들기---------------------------------------------

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


---------페이징-----------------------------------------------------------------------------------------------------

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


-- 1. 가장 안쪽 구문에서 정렬해서 조회
-- 2. rownum을 구해서 조회
-- 3. rownum로 조건절
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
