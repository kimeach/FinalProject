
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
-- authNum이 id가 되는지? id는 따로 없음? 핸드폰번호 10->12(수정요망. 짧음), 비번은??

---- 의뢰 게시판 (생성완료 0525)
create table order_board(
articleNO number(10) primary key,
parentNO number(10) default 0,
place1 varchar2(10),
place2 varchar2(10),
place3 varchar2(10),
title varchar2(500) not null,
content varchar2(4000),
imageFileName varchar2(30),
writeDate date default sysdate not null,
id varchar2(10),
authNum varchar2(50),
constraint fk_board_id foreign key(id) references General_Member(id) on delete cascade,
constraint fk_board_authNum foreign key(authNum) references Company_Member(authNum) on delete cascade
);

create table order_board3(
articleNO number(10) primary key,
parentNO number(10) default 0,
place1 varchar2(10),
place2 varchar2(10),
place3 varchar2(10),
title varchar2(500) not null,
content varchar2(4000),
imageFileName varchar2(30),
writeDate date default sysdate not null,
id varchar2(10),
authNum varchar2(50)
);

alter table order_board2 rename to order_board3;

-----------------------0608

drop table order_board2;

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


---------- 테스트 멤버/ 게시글 입력(완료0525)
select * from General_Member;
select * from Company_Member;

insert into General_Member values('hong','홍길동','1234','1234','hong@naver.com','','2019-01-02');
insert into General_Member values('kang','강감찬','1234','1234','kim@daum.net','','2019-03-02');
insert into General_Member values('lee','이순신','1234','1234','lee@gmail.com','',sysdate);

insert into Company_Member values('','01234','','강남부동산','0112345678','','','gangnam@naver.com','','강남역,논현역','91422348','2018-04-01');
insert into Company_Member values('','01698','','여의도부동산','0108889999','0701845785','','yyd@hanmail.net','','여의도역,국회의사당역,여의나루역','92415148','2019-01-25');


--테스트 데이터 (0525 완료)
insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(5,0,'서울시','강남구','논현동','테스트글입니다.','테스트글입니다.',null,'2019-05-20' ,'hong',null);

insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(4,0,'경기도','수원시',null,'안녕하세요.','상품후기입니다.',null,'2019-05-15','hong',null);
insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(7,4,'경기도','수원시',null,'ㄴ답변입니다..','상품후기에 대한 답변입니다.',null,sysdate,null,'91422348');

insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(3,0,null,null,null,'강남까지 30분 이내 원룸 찾습니다.','강남까지 30분 이내 원룸 찾습니다.',null,'2019-04-01','lee',null);
insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(8,3,null,null,null,'ㄴ월세25~100까지 있습니다.','상품좋습니다.',null,sysdate,null,'92415148');

insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(6,0,'서울시','관악구',null,'반전세 보증금 2000 / 월세15 찾습니다.','김유신 테스트글입니다.',null,'2019-05-24','kang',null);
insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(2,0,null,null,null,'한강뷰 주변 원룸/오피스텔 시세 얼마할까요?','테스트글입니다.',null,'2019-01-30','lee',null);
insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(1,0,'서울시',null,null,'시청역 근처 오피스텔, 월세 50 찾습니다.','테스트글입니다.',null,'2018-12-24','kang',null);

insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(9,0,'서울시','강남구','논현동','테스트글입니다.','테스트글입니다.',null,sysdate,'hong',null);
insert into order_board2(articleNo,parentNo, place1, place2, place3, title, content, imageFileName, writedate, id, authNum)
values(10,9,'서울시','강남구','논현동','테스트답글입니다.','테스트답글입니다.',null,sysdate,'kang',null);

select * from order_board2;
drop table order_board;
alter table order_board2 rename column sido to gugun;
alter table order_board2 rename column place2 to gugun;
alter table order_board2 rename column place1 to sido;


ALTER TABLE 테이블명 RENAME COLUMN 원래컬럼명 TO 바꿀컬럼명;
alter table place_board rename column plcae1 to place1;



ALTER TABLE order_board2 MODIFY sido VARCHAR2(20);
ALTER TABLE order_board2 MODIFY gugun VARCHAR2(20);

-- 지역 csv import완료(sql developer이용, 6/3)
select * from place_board;

----- SQL 검산

	update order_board2
			set id='ㅁㄴ', title='파일첨부 테스트2 수정', content='22'
			, imageFileName = NULL
			where articleNO = '38' ;

select * from place_board;


			select rownum, a.*
			from	 (select *
						from order_board2
						start with parentNO=0
						connect by prior articleNO=parentNO
						order siblings by articleNO desc) a
			where rownum between 1*11-10 and 1*10 ;
			
			select a.*
			from	 (select rownum rn, order_board2.*
						from order_board2
						start with parentNO=0
						connect by prior articleNO=parentNO
						order siblings by articleNO desc) a
			where rn between 11 and 11+10
			;
-----------


drop sequence seq_no;

create sequence seq_no 
increment by 1
start with 10;

select * from articleNO;

SELECT seq_no.currval FROM DUAL;
SELECT articleNo.CURRVAL FROM DUAL;
select * from seq_no;


----- order board2(groupNO 추가 0608)

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

delete from order_board2 where articleNO between 184 and 186;

select * from order_board2;

insert into (select level, articleNO, groupNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum
				 	from order_board2) 
values('1', '188', '188', '0', '경상남도', '거제시', '답글', '답글', sysdate, null, '해삼', null);

insert into order_board2(level, articleNO, groupNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum) 
values(1, 188, 188, '경상남도', '거제시' '답글', '답글', sysdate, null, '해삼', null);
-----------

articleNo number(10) primary key,
parentNo number(10) default 0,
title varchar2(500) not null,
content varchar2(4000),
imageFileName varchar2(30),
writedate date default sysdate not null,
id varchar2(10),
constraint fk_board_id foreign key(id)
references t_member(id)
);
-----------------------------------

------컬럼 글자수 변경
ALTER TABLE order_board2 MODIFY sido VARCHAR2(20);
ALTER TABLE order_board2 MODIFY gugun VARCHAR2(20);

ALTER TABLE order_board2 ADD column (board_level number(5) default 1);


---------------
select  * from order_board2;
select level, articleNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum
			from order_board2;

insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','서울특별시','용산구',seq_no.nextval,'ABC', null, sysdate,'Zzz',null);
insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','강원도','춘천시',seq_no.nextval,'테스터', null, sysdate,'테스터',null);
insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','제주도','서귀포시',seq_no.nextval,'가나다', null, sysdate,'가나다',null);
insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','경기도','고양시',seq_no.nextval,'ABC', null, sysdate,'DEF',null);
insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','경기도','수원시',seq_no.nextval,'테스터', null, sysdate,'Oracle',null);
insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','부산광역시','부산진구',seq_no.nextval,'가나다', null, sysdate,'홍길동',null);
insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','서울특별시','강남구',seq_no.nextval,'ABC', null, sysdate,'lol',null);
insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','경기도','남양주시',seq_no.nextval,'테스터', null, sysdate,'강감찬',null);
insert into order_board2(articleNo, parentNo, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values(seq_no.nextval,'0','제주도','제주시',seq_no.nextval,'가나다', null, sysdate,'일이삼',null);

delete from order_board2 where articleNO=187; between 181 and 182;


	insert into order_board2(level, articleNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum) 
					values(0+1, seq_no.nextval, 189,'[서울시]', '[용산구]', '답변', '답변', sysdate, null, 'aaa', null);
				
--------------------------

					------- addReply(0606)

insert into order_board2(level, articleNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum) 
values(#{level}.nextval, seq_no.nextval, '151', '96', '[제주도]','[서귀포시]', '답글', '답글', sysdate, null, 'EEE' , null);

select a.level
from(select level, articleNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum
from order_board2
	start with parentNO=0 
			connect by prior articleNO=parentNO
			order siblings by articleNO desc
where articleNO = 96 ;	

select *
from order_board2
where articleNO=150 ;

select max(level)+1
				from order_board2
				where articleNO= 156;

	start with parentNO=0 
			connect by prior articleNO=parentNO
			order siblings by articleNO desc
			
select *
from (select level, articleNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum 
			from order_board2)
where articleNO=151	;
	
select max(level)+1
from (select level, articleNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum 
				from order_board2)
where articleNO= 155;
------ 계층형 쿼리 참고
select level,
          eno,
          ename,
          lpad(' ',4*(level-1))||level
  from employee
 start with manager is null
  connect by prior eno = manager
  order siblings by eno desc;
  
  
 select * from t_board
 where articleNO in(
 select articleNO from t_board
 start with articleNO = 14
 connect by prior articleNO=parentNO
 
 )
 
 ------------------------
	select level, articleNO, parentNO, title, content, writeDate, imageFileName, id, authNum
			from order_board
			start with parentNO=0
			connect by prior articleNO=parentNO
			order siblings by articleNO desc
	
-- 계층형 쿼리 참고
select level,
          eno,
          ename,
          lpad(' ',4*(level-1))||level
  from employee
 start with manager is null
  connect by prior eno = manager
  order siblings by eno desc;
  
  
 select * from t_board
 where articleNO in(
 select articleNO from t_board
 start with articleNO = 14
 connect by prior articleNO=parentNO
 
 )
 -----
 

			select level, articleNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum
			from order_board2
			where id like '%a%'				
			start with parentNO=0
			connect by prior articleNO=parentNO
			order siblings by articleNO desc;
		
	