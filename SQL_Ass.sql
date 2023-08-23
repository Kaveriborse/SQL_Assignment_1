drop database linkedIn;
drop table tools;
drop table product_info;
drop table product_info_likes;

create database linkedIn;
create table tools(
id int,
technology varchar(20)
);

insert into tools values
(1,"DS"),(1,"Tableau"),(1,"SQL"),(2,"R"),(2,"Power_BI"),(1,"Python");

select * from tools;

# List the Id which posess DS,Python,SQL,Tablueau all the skills
select id from tools where technology="DS" 
and id in(select id from tools where technology="Python") and technology="SQL" and technology="Tableau";

select id from tools where technology="DS"
and id in (
     select id from tools
	 where technology ="SQL"
		and id in(
        select id from tools
        where technology="Tableau"
			and id in(
            select id from tools
            where technology="Python"
            )
       )
);


drop table product_info;
drop table product_info_likes;

create table product_info(
prod_id int,
prod_name varchar(20)
);
insert into product_info values
(1001,"Blog"),(1002,"Youtube"),(1003,"Education");

select * from product_info;

create table product_info_likes(
user_id int,
prod_id int,
liked_date Date
);

insert into product_info_likes values
(1,1001,"2003-8-19"),(2,1003,"2023-8-18");

select * from product_info_likes;

# list the prod id which have 0 likes

select prod_id from product_info
where prod_id not in (SELECT prod_id FROM product_info_likes);

# OR
select product_info.prod_id from product_info left join product_info_likes 
on product_info.prod_id = product_info_likes.prod_id
where product_info_likes.prod_id is null;