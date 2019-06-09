			
-- 회원가입 Member DB ( Company_Member에 authNum을 primary key로 설정해놓은거밖에 없어요 변경사항!!)
create table General_Member(
id varchar2(30) not null primary key,
name varchar2(20),
pwd varchar2(50),
pwd_confirm varchar2(50),
email varchar2(40),
email2 varchar2(80),
joinDate date default sysdate 
);


create table Company_Member(
imageFile varchar2(80),
zipCode varchar2(80),
address varchar2(80),
name varchar2(30),
phone1 varchar2(10),
phone2 varchar2(10),
phone3 varchar2(10),
email varchar2(40),
email2 varchar2(80),
mainDeal varchar2(60)not null,
authNum varchar2(50) primary key,
joinDate date default sysdate 
);
-- authNum이 id가 되는지? id는 따로 없는지? 핸드폰번호 10->12(수정요망. 짧음)

---- 의뢰 게시판 

create table order_board2(
levelNO	number(5) default 0,
articleNO number(10) primary key,
groupNO number(10),
parentNO number(10) default 0,
sido varchar2(20),
gugun varchar2(20),
id varchar2(10),
authNum varchar2(50),
title varchar2(500) not null,
content varchar2(4000),
imageFileName varchar2(30),
writeDate date default sysdate not null
);

select * from order_board2;


---------- articleNO 시퀀스 +1 되도록 설정하기

drop sequence seq_no;

create sequence seq_no 
increment by 1
start with 1#{마지막글};

select * from articleNO;

SELECT seq_no.currval FROM DUAL;
SELECT articleNo.CURRVAL FROM DUAL;
select * from seq_no;

------------------ order board2(groupNO 추가 0608)

insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0','서울시','용산구',seq_no.nextval, seq_no.nextval, null, sysdate,'ABC',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0', '제주도','서귀포시',seq_no.nextval, seq_no.nextval, null, sysdate,'가나다',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0','부산광역시','해운대구',seq_no.nextval, seq_no.nextval, null, sysdate,'홍길동',null);


select levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum
from order_board2
start with parentNO=0
connect by prior articleNO=parentNO
order siblings by articleNO desc
								
------- searchList SQL 검사(0605)
				select a.*
				from	 (select rownum rn, order_board2.*
								from order_board2
								start with parentNO=0
								connect by prior articleNO=parentNO
								order siblings by articleNO desc) a 
			where id like '%서울%' or title like '%서울%' or content like '%서울%'
						 or sido like '%서울%' or gugun like '%서울%' ;


 