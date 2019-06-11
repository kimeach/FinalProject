select * from item;
select * from company_member;
select * from item where authNum = 1;
select * from item where authNum = 1 and autoNum= 1;

select * from company_member where authNum between 1 and 10 order by authNum asc;

	select count(*) from item where authNum = '1' and itemSelect = '전세';
	