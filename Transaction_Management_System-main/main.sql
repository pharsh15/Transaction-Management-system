


create table account(act_no varchar2(10), act_name varchar2(10), act_balance number(10), act_dob date);

	create table account_branch(act_no varchar2(10), act_name varchar2(10), act_branch varchar2(10));

	create table account_city(act_no varchar2(10), act_name varchar2(10), act_city varchar2(10));

	insert into account values('21AC001','John','35000','12-JUL-2001');

	insert into account values('21AC002','Michael','30000','05-NOV-1993');

	insert into account values('21AC003','Charles','55000','12-DEC-1997');

	insert into account values('21AC004','Tom','46000','31-JAN-2000');

	insert into account values('21AC005','Charlie','37900','27-FEB-2002');

	insert into account values('21AC006','Jack','35060','01-JUL-1998');

	insert into account values('21AC007','Henry','12070','17-SEP-2001');

	insert into account values('21AC008','Joseph','17800','14-JUN-1994');

	insert into account values('21AC009','Harsh','65070','22-AUG-1995');

	insert into account values('21AC010','Shiv','35600','07-MAY-1999');

	insert into account_branch values('21AC001','John','Atlanta');

	insert into account_branch values('21AC002','Michael','Baton Rouge');

	insert into account_branch values('21AC003','Charles','Beaumont');

	insert into account_branch values('21AC004','Tom','Denver');

	insert into account_branch values('21AC005','Charlie','Georgia');

	insert into account_branch values('21AC006','Jack','Pensilvaniya');

	insert into account_branch values('21AC007','Henry','Colorado');

	insert into account_branch values('21AC008','Joseph','Dallas');

	insert into account_branch values('21AC009','Harsh','New jersey');

	insert into account_branch values('21AC010','Shiv','Los angles');

	insert into account_city values('21AC001','John','Boston');

	insert into account_city values('21AC002','Michael','Seatle');

	insert into account_city values('21AC003','Charles','Losiana');

	insert into account_city values('21AC004','Tom','California');

	insert into account_city values('21AC005','Charlie','Washington');

	insert into account_city values('21AC006','Jack','California');

	insert into account_city values('21AC007','Henry','Michigan');

	insert into account_city values('21AC008','Joseph','New york');

	insert into account_city values('21AC009','Harsh','Houston');

	insert into account_city values('21AC010','Shiv','Chicago');

	

	select * from account;

	select * from account_branch;

	select * from account_city;

	

	

	DECLARE

	xact_no account.act_no%type;

	xact_balance account.act_balance%type;

	opt number(1);

	deposit number(10);

	withdrawal number(10);

	

	BEGIN

	xact_no:= :Enter_Account_Number;

	opt:= :1Deposit_2Withdrawal_3Balance;

	select act_balance into xact_balance

	from account

	where act_no=xact_no ;

	

	IF( opt = 1 ) THEN

	deposit:= :Enter_Deposit_Amount;

	update account

	set act_balance=act_balance+deposit

	where act_no=xact_no ;

	

	xact_balance :=xact_balance +deposit;

	dbms_output.put_line('Rs. '||deposit||' has been creadited in your account');

	dbms_output.put_line('Your final balance is Rs. '||xact_balance );

	

	ELSIF( opt = 2 ) THEN

	withdrawal:= :Enter_Withdrawal_Amount;

	IF ( withdrawal<=xact_balance ) THEN

	update account

	set act_balance=act_balance-withdrawal

	where act_no=xact_no ;

	

	xact_balance:=xact_balance -withdrawal;

	dbms_output.put_line('Rs. '||withdrawal||' has been debited in your account');

	dbms_output.put_line('Your final balance is Rs.'||xact_balance );

	

	ELSE

	dbms_output.put_line('Your withdrawal amount is greater than balance');

	dbms_output.put_line('Your transaction failed');

	dbms_output.put_line('Your final balance is Rs.'||xact_balance );

	END IF;

	ELSE

	dbms_output.put_line('Your balance is Rs. '||xact_balance );

	END IF;

	

	

	END;

