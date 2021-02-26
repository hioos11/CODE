use jspstudy;

create table tb_board(
	b_idx bigint auto_increment primary key, 
    b_userid varchar(20) not null,
    b_name varchar(20) not null,
    b_title varchar(200) not null,
    b_hit bigint default 0,
    b_up bigint default 0,
	b_content text,
    b_regdate datetime default now()
);

select * from tb_board;

-- drop table tb_board;

create table tb_reply(
	re_idx bigint auto_increment primary key,
    re_userid varchar(20) not null,
    re_name varchar(20) not null,
    re_content varchar(1000) not null,
    re_regdate datetime default now(),
    re_boardIdx bigint not null,
    foreign key(re_boardIdx) references tb_board(b_idx)
);

select * from tb_reply;

-- limit 갯수(몇개의 데이터를 가져올지)
select * from tb_board limit 10; -- 10개의 데이터만 가져온다.
-- limit 시작인덱스, 갯수(데이터의 시작 점부터 갯수만큼 가져오기)
select * from tb_board limit 2,10;

-- 최신 10개 가져오기 (내림차순 정렬 후 10개 limit)
select * from tb_board order by b_idx desc limit 0,10;
select * from tb_board order by b_idx desc limit 10,10;


select count(b_idx) as total from tb_board;

desc tb_board;

-- 필드 추가
alter table tb_board add b_file varchar(100);

select * from tb_board order by b_idx desc;