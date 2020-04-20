
/* Drop Tables */

DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE crawlreview CASCADE CONSTRAINTS;
DROP TABLE skinphoto CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE productinfo CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_cart_cartno;
DROP SEQUENCE SEQ_cart_selectno;
DROP SEQUENCE SEQ_customer_custno;
DROP SEQUENCE SEQ_productinfo_productno;
DROP SEQUENCE SEQ_reply_replyno;
DROP SEQUENCE SEQ_review_reviewno;
DROP SEQUENCE SEQ_selectproduct_selectno;
DROP SEQUENCE SEQ_skinphoto_photono;




/* Create Sequences */

CREATE SEQUENCE SEQ_cart_cartno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_cart_selectno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_customer_custno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_productinfo_productno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reply_replyno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_review_reviewno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_selectproduct_selectno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_skinphoto_photono INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE cart
(
	-- 시퀀스를 사용한다
	-- 기본키가 없기 때문에 인조키 기능을 한다.
	selectno number NOT NULL,
	-- 시퀀스 사용
	productno number NOT NULL,
	-- 회원번호 시퀀스 사용
	-- 소셜로그인 회원은 아이디랑 비밀번호가 없기때문에 이걸 기본키로 사용한다.
	custno number NOT NULL,
	productname varchar2(100) NOT NULL,
	productimg varchar2(400) NOT NULL,
	price number NOT NULL,
	color varchar2(4000) NOT NULL,
	amount number NOT NULL,
	cartdate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (selectno)
);


CREATE TABLE crawlreview
(
	reviewer varchar2(400) NOT NULL,
	grade number NOT NULL,
	review varchar2(4000) NOT NULL,
	-- 시퀀스 사용
	productno number NOT NULL
);


CREATE TABLE customer
(
	-- 회원번호 시퀀스 사용
	-- 소셜로그인 회원은 아이디랑 비밀번호가 없기때문에 이걸 기본키로 사용한다.
	custno number NOT NULL,
	-- 아이디 소셜로그인 회원은 null
	custid varchar2(25),
	-- 비밀번호 소셜로그인 회원은 null
	custpwd varchar2(25),
	-- 이름 (닉네임)
	custname varchar2(25) NOT NULL,
	-- 남자 / 여자로 구분
	custgender varchar2(10) NOT NULL,
	-- 이메일
	custemail varchar2(40),
	-- 10~20, 20~30 등 연령대로 구분
	custage varchar2(30),
	-- 핸드폰번호 000-0000-0000 형식으로 사용한다
	custphone varchar2(30) NOT NULL,
	-- 주소
	custaddress varchar2(300),
	-- 가입일 sysdate 사용
	custregdate date DEFAULT sysdate,
	-- 이메일인증을위한키 인증되면 Y으로 바꿔준다
	custkey varchar2(10),
	-- 민감성, 복합성, 지성 등 피부타입 선택
	skintype varchar2(20),
	-- 프로필사진
	profilephoto varchar2(100),
	PRIMARY KEY (custno)
);


CREATE TABLE productinfo
(
	-- 시퀀스 사용
	productno number NOT NULL,
	-- 상품 이름
	productname varchar2(100) NOT NULL,
	-- 상품사진 url
	productimg varchar2(400) NOT NULL,
	-- 상품 가격
	price number NOT NULL,
	-- 상품설명
	expr varchar2(4000) NOT NULL,
	-- 성분
	ingredient varchar2(4000) NOT NULL,
	-- 상품색상
	color varchar2(4000) NOT NULL,
	-- 상품카테고리
	cate varchar2(400) NOT NULL,
	-- 평점 0~10
	grade number DEFAULT 0,
	productvolume varchar2(20) NOT NULL,
	PRIMARY KEY (productno)
);


CREATE TABLE reply
(
	-- 댓글번호 시퀀스사용
	replyno number NOT NULL,
	replytext varchar2(2000) NOT NULL,
	replywriter varchar2(25) NOT NULL,
	replydate date DEFAULT sysdate,
	-- 글번호 시퀀스 사용
	reviewno number NOT NULL,
	PRIMARY KEY (replyno)
);


CREATE TABLE review
(
	-- 글번호 시퀀스 사용
	reviewno number NOT NULL,
	content varchar2(4000) NOT NULL,
	writer varchar2(25) NOT NULL,
	writedate date DEFAULT sysdate,
	originalfile varchar2(200),
	savedfile varchar2(200),
	-- 0~10
	reviewgrade number DEFAULT 0 NOT NULL,
	-- 글쓴이 연령대
	age varchar2(30),
	-- 글쓴이 성별
	gender varchar2(10),
	-- 글쓴이 프로필 사진
	profilephoto varchar2(100),
	-- 글쓴이 피부타입
	skintype varchar2(20),
	-- 시퀀스 사용
	productno number NOT NULL,
	PRIMARY KEY (reviewno)
);


CREATE TABLE skinphoto
(
	-- 사진번호 시퀀스 사용
	photono number NOT NULL,
	originalphoto varchar2(100) NOT NULL,
	savedphoto varchar2(100),
	-- 첨부된 파일에서 구글 비젼을 이용해 추출한 피부색(rgb값)
	skincolor varchar2(17),
	-- 사진이 저장된 날짜
	savedate date DEFAULT sysdate,
	-- 회원번호 시퀀스 사용
	-- 소셜로그인 회원은 아이디랑 비밀번호가 없기때문에 이걸 기본키로 사용한다.
	custno number NOT NULL,
	PRIMARY KEY (photono)
);



/* Create Foreign Keys */

ALTER TABLE cart
	ADD FOREIGN KEY (custno)
	REFERENCES customer (custno)
	ON DELETE CASCADE
;


ALTER TABLE skinphoto
	ADD FOREIGN KEY (custno)
	REFERENCES customer (custno)
	ON DELETE CASCADE
;


ALTER TABLE cart
	ADD FOREIGN KEY (productno)
	REFERENCES productinfo (productno)
	ON DELETE CASCADE
;


ALTER TABLE crawlreview
	ADD FOREIGN KEY (productno)
	REFERENCES productinfo (productno)
	ON DELETE CASCADE
;


ALTER TABLE review
	ADD FOREIGN KEY (productno)
	REFERENCES productinfo (productno)
	ON DELETE CASCADE
;


ALTER TABLE reply
	ADD FOREIGN KEY (reviewno)
	REFERENCES review (reviewno)
	ON DELETE CASCADE
;



/* Comments */

COMMENT ON COLUMN cart.selectno IS '시퀀스를 사용한다
기본키가 없기 때문에 인조키 기능을 한다.';
COMMENT ON COLUMN cart.productno IS '시퀀스 사용';
COMMENT ON COLUMN cart.custno IS '회원번호 시퀀스 사용
소셜로그인 회원은 아이디랑 비밀번호가 없기때문에 이걸 기본키로 사용한다.';
COMMENT ON COLUMN crawlreview.productno IS '시퀀스 사용';
COMMENT ON COLUMN customer.custno IS '회원번호 시퀀스 사용
소셜로그인 회원은 아이디랑 비밀번호가 없기때문에 이걸 기본키로 사용한다.';
COMMENT ON COLUMN customer.custid IS '아이디 소셜로그인 회원은 null';
COMMENT ON COLUMN customer.custpwd IS '비밀번호 소셜로그인 회원은 null';
COMMENT ON COLUMN customer.custname IS '이름 (닉네임)';
COMMENT ON COLUMN customer.custgender IS '남자 / 여자로 구분';
COMMENT ON COLUMN customer.custemail IS '이메일';
COMMENT ON COLUMN customer.custage IS '10~20, 20~30 등 연령대로 구분';
COMMENT ON COLUMN customer.custphone IS '핸드폰번호 000-0000-0000 형식으로 사용한다';
COMMENT ON COLUMN customer.custaddress IS '주소';
COMMENT ON COLUMN customer.custregdate IS '가입일 sysdate 사용';
COMMENT ON COLUMN customer.custkey IS '이메일인증을위한키 인증되면 Y으로 바꿔준다';
COMMENT ON COLUMN customer.skintype IS '민감성, 복합성, 지성 등 피부타입 선택';
COMMENT ON COLUMN customer.profilephoto IS '프로필사진';
COMMENT ON COLUMN productinfo.productno IS '시퀀스 사용';
COMMENT ON COLUMN productinfo.productname IS '상품 이름';
COMMENT ON COLUMN productinfo.productimg IS '상품사진 url';
COMMENT ON COLUMN productinfo.price IS '상품 가격';
COMMENT ON COLUMN productinfo.expr IS '상품설명';
COMMENT ON COLUMN productinfo.ingredient IS '성분';
COMMENT ON COLUMN productinfo.color IS '상품색상';
COMMENT ON COLUMN productinfo.cate IS '상품카테고리';
COMMENT ON COLUMN productinfo.grade IS '평점 0~10';
COMMENT ON COLUMN reply.replyno IS '댓글번호 시퀀스사용';
COMMENT ON COLUMN reply.reviewno IS '글번호 시퀀스 사용';
COMMENT ON COLUMN review.reviewno IS '글번호 시퀀스 사용';
COMMENT ON COLUMN review.reviewgrade IS '0~10';
COMMENT ON COLUMN review.age IS '글쓴이 연령대';
COMMENT ON COLUMN review.gender IS '글쓴이 성별';
COMMENT ON COLUMN review.profilephoto IS '글쓴이 프로필 사진';
COMMENT ON COLUMN review.skintype IS '글쓴이 피부타입';
COMMENT ON COLUMN review.productno IS '시퀀스 사용';
COMMENT ON COLUMN skinphoto.photono IS '사진번호 시퀀스 사용';
COMMENT ON COLUMN skinphoto.skincolor IS '첨부된 파일에서 구글 비젼을 이용해 추출한 피부색(rgb값)';
COMMENT ON COLUMN skinphoto.savedate IS '사진이 저장된 날짜';
COMMENT ON COLUMN skinphoto.custno IS '회원번호 시퀀스 사용
소셜로그인 회원은 아이디랑 비밀번호가 없기때문에 이걸 기본키로 사용한다.';



