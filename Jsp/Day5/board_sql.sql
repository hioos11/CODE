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

drop table tb_board;

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