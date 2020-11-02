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