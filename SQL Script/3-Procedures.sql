
Use PostGradOffice




SELECT * FROM THESIS 
select * from examinerevaluatedefense
select * from examiner
go
create proc studentRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@Gucian bit,
@email varchar(50),
@address varchar(50)
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
if(@Gucian=1)
insert into GucianStudent(id,firstName,lastName,faculty,address)
values(@id,@first_name,@last_name,@faculty,@address)
else
insert into NonGucianStudent(id,firstName,lastName,faculty,address)
values(@id,@first_name,@last_name,@faculty,@address)
end
go
create proc supervisorRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@email varchar(50)
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
declare @name varchar(50)
set @name = CONCAT(@first_name,@last_name)
insert into Supervisor(id,name,faculty) values(@id,@name,@faculty)
end
go
Create proc userLogin
@id int,
@password varchar(20),
@success bit output
as
begin
if exists(
select ID,password
from PostGradUser
where id=@id and password=@password)
set @success =1
else
set @success=0
end
go

Create proc getIDbyEmail
@email varchar(30),
@id int output
as
select @id = p.id from PostGradUser p
where p.email = @email

go
Create proc checkId
@id int,
@profile int output
as
if exists( select s.id from GucianStudent s
			where s.id = @id)
			set @profile = 1
else if exists(select ns.id from NonGucianStudent ns
			where ns.id = @id)
			set @profile = 2
else if exists(select sp.id from Supervisor sp
			where sp.id = @id)
			set @profile = 3
else if exists(select e.id from Examiner e
			where e.id = @id)
			set @profile = 4
else	set @profile = 0
go
create proc addMobile
@ID varchar(20),
@mobile_number varchar(20)
as
begin
if @ID is not null and @mobile_number is not null
begin
--check Gucian student or not
if(exists(select * from GucianStudent where id=@ID))
insert into GUCStudentPhoneNumber values(@ID,@mobile_number)
if(exists(select * from NonGucianStudent where id=@ID))
insert into NonGUCStudentPhoneNumber values(@ID,@mobile_number)
end
end
go
CREATE Proc AdminListSup
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
go
CREATE Proc AdminViewSupervisorProfile
@supId int
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
WHERE @supId = s.id
go
CREATE Proc AdminViewAllTheses
As
Select
serialNumber,field,type,title,startDate,endDate,defenseDate,years,grade,payment_id,noOfExtensions
From Thesis
go
CREATE Proc AdminViewOnGoingTheses
@thesesCount int output
As
Select @thesesCount=Count(*)
From Thesis
where endDate > Convert(Date,CURRENT_TIMESTAMP)
go
select * from gucianregisterthesis
select * from NonGUCianRegisterThesis
select * from NonGucianStudent
select * from thesis
select * from Supervisor
select* from GucianStudent
go
CREATE Proc AdminViewStudentThesisBySupervisor
As
Select s.firstname,s.lastname,t.title,gs.firstName
From Thesis t inner join GUCianRegisterThesis sr on t.serialNumber=sr.thesisSerialNumber
inner join Supervisor s on s.id=sr.supervisor_id inner join GucianStudent gs on sr.GUCianID=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
union
Select s.firstname,s.lastname,t.title,gs.firstName
From Thesis t inner join NonGUCianRegisterThesis sr on t.serialNumber=sr.thesisSerialNumber
inner join Supervisor s on s.id=sr.supervisor_id inner join NonGucianStudent gs on sr.nongucianID=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
go
go
CREATE Proc AdminListNonGucianCourse
@courseID int
As
if(exists(select * from Course where id=@courseID))
Select ng.firstName,ng.lastName,c.code,n.grade
From NonGucianStudentTakeCourse n inner join Course c on n.cid=c.id inner join NonGucianStudent ng
on ng.id=n.sid
where n.cid=@courseID
go
CREATE Proc AdminUpdateExtension
@ThesisSerialNo int
As
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
declare @noOfExtensions int
select @noOfExtensions=noOfExtensions from Thesis where serialNumber=@ThesisSerialNo
update Thesis
set noOfExtensions=@noOfExtensions+1
where serialNumber=@ThesisSerialNo
end




go
create Proc AdminIssueThesisPayment
@ThesisSerialNo int,
@amount decimal,
@noOfInstallments int,
@fundPercentage decimal,
@flag int output
As
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo and payment_id = null))
begin
set @flag =1
insert into Payment(amount,noOfInstallments,fundPercentage)
values(@amount,@noOfInstallments,@fundPercentage)
declare @id int
SELECT @id=SCOPE_IDENTITY()
update Thesis
set payment_id=@id
where serialNumber=@ThesisSerialNo
end
else if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
	set @flag = 2
else set @flag = 0

go
CREATE Proc AdminViewStudentProfile
@sid int
As
if(exists(select * from GucianStudent where id=@sid))
Select u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,s.address,s.GPA
from PostGradUser u inner join GucianStudent s on u.id=s.id
WHERE @sid = s.id
else if(exists(select * from NonGucianStudent where id=@sid))
Select u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,s.address,s.GPA
from PostGradUser u inner join NonGucianStudent s on u.id=s.id
WHERE @sid = s.id
go
CREATE Proc AdminIssueInstallPayment
@paymentID int,
@InstallStartDate date
As
if(exists(select * from Payment where id=@paymentID))
begin
declare @numOfInst int
select @numOfInst=noOfInstallments
from Payment
where id=@paymentID
declare @payAmount int
select @payAmount=amount
from Payment
where id=@paymentID
DECLARE @Counter INT
SET @Counter=1
WHILE (@counter<=@numOfInst)
BEGIN
 declare @instdate date
 set @instdate=@InstallStartDate
 declare @instAmount int
 set @instAmount=@payAmount/@numOfInst
 if(@counter=1)
 insert into
Installment(date,paymentId,amount,done)values(@InstallStartDate,@paymentID,@instAmount,0)
 else
 begin
 set @instdate=DATEADD(MM, 6, @instdate);
 insert into
Installment(date,paymentId,amount,done)values(@instdate,@paymentID,@instAmount,0)
 end
 SET @counter=@counter+1
END
end
go
CREATE Proc AdminListAcceptPublication
As
select t.serialNumber,p.title
from ThesisHasPublication tp inner join Thesis t on tp.serialNo=t.serialNumber
inner join Publication p on p.id=tp.pubid
where p.accepted=1
go
CREATE Proc AddCourse
@courseCode varchar(10),
@creditHrs int,
@fees decimal
As
insert into Course values(@fees,@creditHrs,@courseCode)
go
CREATE Proc linkCourseStudent
@courseID int,
@studentID int
As
if(exists(select * from Course ) and exists(select * from NonGucianStudent where id=@studentID))
insert into NonGucianStudentTakeCourse(sid,cid,grade)values(@studentID,@courseID,null)
go
CREATE Proc addStudentCourseGrade
@courseID int,
@studentID int,
@grade decimal
As
if(exists(select * from NonGucianStudentTakeCourse where sid=@studentID and cid=@courseID))
update NonGucianStudentTakeCourse
set grade =@grade
where cid=@courseID and sid=@studentID
go
CREATE Proc ViewExamSupDefense
@defenseDate datetime
As
select s.serial_no,ee.date,e.name,sup.name
from ExaminerEvaluateDefense ee inner join examiner e on ee.examinerId=e.id
inner join GUCianStudentRegisterThesis s on ee.serialNo=s.serial_no
inner join Supervisor sup on sup.id=s.supid
go
go
CREATE Proc ViewSupStudentsYears
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select s.firstName,s.lastName,t.years
from GUCianStudentRegisterThesis sr inner join GucianStudent s on sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
union
select s.firstName,s.lastName,t.years
from NonGUCianStudentRegisterThesis sr inner join NonGucianStudent s on sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
end
go
CREATE Proc SupViewProfile
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select u.id,u.email,u.password,s.name,s.faculty
from PostGradUser u inner join Supervisor s on u.id=s.id
end
go
---------------------------------------
create proc UpdateSupProfile
@supervisorID int, @name varchar(20), @faculty varchar(20)
as
update Supervisor
set name = @name, faculty = @faculty
where id = @supervisorID
go
create proc ViewAStudentPublications
@StudentID int
as
select P.*
from GUCianStudentRegisterThesis GUC
inner join Thesis T
on GUC.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where GUC.sid = @StudentID
union all
select P.*
from NonGUCianStudentRegisterThesis NON
inner join Thesis T
on NON.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where NON.sid = @StudentID
exec viewAStudentPublications 6
go
create proc AddDefenseGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
as
insert into Defense values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
go
create proc AddDefenseNonGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
as
declare @idOfStudent int
select @idOfStudent = sid
from NonGUCianStudentRegisterThesis
where serial_no = @ThesisSerialNo
if(not exists(select grade
from NonGucianStudentTakeCourse
where sid = @idOfStudent and grade < 50))
begin
insert into Defense values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
end
select * from postgraduser inner join examiner on postgraduser.id=examiner.id
go
create proc examinerRegister
@ExaminerName varchar(20),@Password varchar(30),
@National bit, @fieldOfWork varchar(20), @email varchar(50)
as
insert into PostGradUser values(@email,@Password)
declare @id int
set @id = SCOPE_IDENTITY()
insert into Examiner values(@id,@ExaminerName,@fieldOfWork,@National)
go
create proc AddExaminer
@ThesisSerialNo int , @DefenseDate Datetime , @ExaminerName varchar(20),@Password varchar(30),
@National bit, @fieldOfWork varchar(20)
as
insert into PostGradUser values(@ExaminerName,@Password)
declare @id int
set @id = SCOPE_IDENTITY()
insert into Examiner values(@id,@ExaminerName,@fieldOfWork,@National)
insert into ExaminerEvaluateDefense values(@DefenseDate,@ThesisSerialNo,@id,null)
go
drop proc CAncelThesis
go
create proc AddGrade
@ThesisSerialNo int
as
declare @grade decimal(4,2)
select @grade = grade
from Defense
where serialNumber = @ThesisSerialNo
update Thesis
set grade = @grade
where serialNumber = @ThesisSerialNo
go
create proc AddDefenseGrade
@ThesisSerialNo int , @DefenseDate Datetime , @grade decimal(4,2)
as
update Defense
set grade = @grade
where serialNumber = @ThesisSerialNo and date = @DefenseDate
select * from defense
select * from examinerevaluatedefense
go
create proc AddCommentsGrade
@ThesisSerialNo int , @DefenseDate Datetime , @comments varchar(300)
as
update ExaminerEvaluateDefense
set comment = @comments
where serialNo = @ThesisSerialNo and date = @DefenseDate



declare @bit bit
exec CheckDefense 3, "2021-9-99", @bit output
print @bit
select * from ExaminerEvaluateDefense
select * from defense

go
create proc viewMyProfile
@studentId int
as
if(exists(
select * from GucianStudent where id = @studentId
))
begin
select G.*,P.email
from GucianStudent G
inner join PostGradUser P
on G.id = P.id
where G.id = @studentId
end
else
begin
select N.*,P.email
from NonGucianStudent N
inner join PostGradUser P
on N.id = P.id
where N.id = @studentId
end
go
create proc editMyProfile
@studentID int, @firstName varchar(20), @lastName varchar(20), @password varchar(30), @email
varchar(50)
, @address varchar(50), @type varchar(3)
as
update GucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type = @type
where id = @studentID
update NonGucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type = @type
where id = @studentID
update PostGradUser
set email = @email, password = @password
where id = @studentID

--------EXAMINER---------
go
create proc CheckDefense
@ThesisSerialNo int , @DefenseDate Datetime, @success bit output
as
if exists(select * from ExaminerEvaluateDefense E where E.serialNo=@ThesisSerialNo and E.date=@DefenseDate )
set @success =1
else 
set @success=0
go
create proc editExaminerName
@id int, @name varchar(20)
as
update Examiner 
set name = @name 
where @id = id
go
create proc editExaminerField
@id int, @fieldOfWork varchar(20)
as
update Examiner 
set fieldOfWork = @fieldOfWork 
where @id = id
go
create proc editExaminerEmail
@id int, @email varchar(50)
as
update PostGradUser
set email=@email
where @id=id
go 
create proc editExaminerPassword
@id int,@password varchar(20)
as
update PostGradUser
set password = @password
where @id = id

go 
create proc examinerAttendedDefense
@id int
as
select T.title as THESIS_TITLE, S.name as SUPERVISOR_NAME, GS.firstName as STUDENT_NAME
from ExaminerEvaluateDefense EV inner join GUCianStudentRegisterThesis GRT on EV.serialNo=GRT.serial_no
								inner join Thesis T on EV.serialNo=T.serialNumber
								inner join GucianStudent GS on GRT.sid = GS.id
								inner join Supervisor S on GRT.supid=S.id
			where EV.examinerID = @id
	UNION
select T.title, S.name, NGS.firstName
from ExaminerEvaluateDefense EV inner join NonGUCianStudentRegisterThesis NGRT on EV.serialNo=NGRT.serial_no
								inner join Thesis T on EV.serialNo=T.serialNumber
								inner join NonGucianStudent NGS on NGRT.sid = NGS.id
								inner join Supervisor S on NGRT.supid=S.id
			where EV.examinerID = @id

go 
create proc searchThesis
@searchkey varchar(100)
as
select * from Thesis T where CHARINDEX(@searchkey,T.title)>0
go
create proc addUndergradID
@studentID int, @undergradID varchar(10)
as
update GucianStudent
set undergradID = @undergradID
where id = @studentID
go
create proc ViewCoursesGrades
@studentID int
as
select grade
from NonGucianStudentTakeCourse 
where sid = @studentID
go
create proc ViewCoursePaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of Payment',P.fundPercentage as 'Percentage of
fund for payment', P.noOfInstallments as 'Number of installments',
I.amount as 'Installment Amount',I.date as 'Installment date', I.done as 'Installment done or not'
from NonGucianStudentPayForCourse NPC
inner join Payment P
on NPC.paymentNo = P.id and NPC.sid = @studentID
inner join Installment I
on I.paymentId = P.id
go
create proc ViewThesisPaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of Payment', P.fundPercentage as
'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as 'Installment done or not'
from GUCianStudentRegisterThesis G
inner join Thesis T
on G.serial_no = T.serialNumber and G.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
union
select P.id as 'Payment Number',P.amount as 'Amount of Payment', P.fundPercentage as
'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as 'Installment done or not'
from NonGUCianStudentRegisterThesis NG
inner join Thesis T
on NG.serial_no = T.serialNumber and NG.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
go
create proc ViewUpcomingInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date > CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
go
create proc ViewMissedInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date < CURRENT_TIMESTAMP and
I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
go
create proc AddProgressReport
@thesisSerialNo int, @progressReportDate date, @studentID int,@progressReportNo int
as
declare @gucian int
if(exists(
select id
from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
insert into GUCianProgressReport
values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
end
else
begin
insert into NonGUCianProgressReport
values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
end
go
create proc FillProgressReport
@thesisSerialNo int, @progressReportNo int, @state int, @description varchar(200),@studentID int
as
declare @gucian bit
if(exists(
select * from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
update GUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no = @progressReportNo
end
else
begin
update NonGUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no = @progressReportNo
end
go
create proc ViewEvalProgressReport
@thesisSerialNo int, @progressReportNo int,@studentID int
as
select eval
from GUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no = @progressReportNo
union
select eval
from NonGUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no = @progressReportNo
go
create proc addPublication
@title varchar(50), @pubDate datetime, @host varchar(50), @place varchar(50), @accepted bit
as
insert into Publication values(@title,@pubDate,@place,@accepted,@host)
go
create proc linkPubThesis
@PubID int, @thesisSerialNo int
as
insert into ThesisHasPublication values(@thesisSerialNo,@PubID)
go
create trigger deleteSupervisor
on Supervisor
instead of delete
as
delete from GUCianProgressReport where supid in (select id from deleted)
delete from NonGUCianProgressReport where supid in (select id from deleted)
delete from GUCianStudentRegisterThesis where supid in (select id from deleted)
delete from NonGUCianStudentRegisterThesis where supid in (select id from deleted)
delete from Supervisor where id in (select id from deleted)
delete from PostGradUser where id in (select id from deleted)
select * from Examiner

select * from examiner
select * from postgraduser
select * from nonGUCianProgressReport
declare @success bit
exec SupervisorChooseProgressReport







GO
create proc supervisorListProgressReport
@studentId int
as
select GS.firstName as firstName,Gs.lastName as lastName, GPR.progressReportNumber as progressReportNumber, GPR.date as date, GPR.description,
GPR.evaluation as evaluation,GPR.state, GPR.thesisSerialNumber, T.title as ThesisTitle
from GUCianProgressReport GPR inner join GucianStudent GS on GPR.student_id=GS.id inner join thesis T on T.serialNumber=GPR.thesisSerialNumber where GPR.student_id=@studentId
UNION
select NGS.firstName as firstName, NGS.lastName as lastName, NGPR.progressReportNumber as progressReportNumber, NGPR.date as date, NGPR.description,
NGPR.evaluation as evaluation, NGPR.state, NGPR.thesisSerialNumber, T.title as ThesisTitle
from NonGUCianProgressReport NGPR inner join NonGucianStudent NGS on NGPR.student_id=NGS.id inner join thesis T on T.serialNumber=NGPR.thesisSerialNumber where NGPR.student_id=@studentId



GO
create proc viewAllProgressReports
as
select GPR.student_Id as studentId,GPR.progressReportNumber,GPR.date,GS.firstName,GS.lastName from GUCianProgressReport GPR inner join GucianStudent GS on GPR.student_id=GS.id where GPR.supervisor_id is null
Union
select NGPR.student_Id as studentId,NGPR.progressReportNumber,NGPR.date,NGS.firstName,NGS.lastName from NonGUCianProgressReport NGPR inner join NonGucianStudent NGS on NGPR.student_id=NGS.id where NGPR.supervisor_id is null



GO
create proc SupervisorChooseProgressReport
@studentId int,@progressReportNumber int,@supervisorId int,@success bit output
as
if exists(select * from GUCianProgressReport where @studentId=student_id and @progressReportNumber=progressReportNumber)
begin
update GUCianProgressReport set supervisor_id = @supervisorId where student_id=@studentId and @progressReportNumber=progressReportNumber
set @success =1
end
else
set @success=0
if exists(select * from nonGUCianProgressReport where @studentId=student_id and @progressReportNumber=progressReportNumber)
begin 
update NonGUCianProgressReport set supervisor_id = @supervisorId where student_id=@studentId and @progressReportNumber=progressReportNumber
set @success = 1
end
else
set @success=0



GO
CREATE Proc SupervisorViewMyStudents
@id int
As
Select s.firstname as SupervisorFirstname,s.lastname as SupervisorLastName,t.title as ThesisTitle,t.years as Years,gs.firstName as StudentFirstName,gs.lastName as StudentLastName,gs.id as StudentId,t.serialNumber as thesisSerialNumber
From Thesis t inner join GUCianRegisterThesis sr on t.serialNumber=sr.thesisSerialNumber
inner join Supervisor s on s.id=sr.supervisor_id inner join GucianStudent gs on sr.GUCianID=gs.id
where s.id = @id
union
Select s.firstname as SupervisorFirstname,s.lastname as SupervisorLastName,t.title as ThesisTitle,t.years as Years,gs.firstName as StudentFirstName,gs.lastName as StudentLastName,gs.id as StudentId,t.serialNumber as thesisSerialNumber
From Thesis t inner join NonGUCianRegisterThesis sr on t.serialNumber=sr.thesisSerialNumber
inner join Supervisor s on s.id=sr.supervisor_id inner join NonGucianStudent gs on sr.nongucianID=gs.id
where s.id = @id



GO
create proc SupervisorAddDefense
@thesisSerialNumber int,@examinerId int,@defenseDate date,@defenseLocation varchar(50),@comment varchar(300)
as
insert into Defense values(@thesisSerialNumber,@defenseDate,@defenseLocation,null)
insert into ExaminerEvaluateDefense values(@DefenseDate,@ThesisSerialNumber,@examinerId,@comment)



GO
create proc getExaminers
as 
select E.id as examinerId,E.name as examinerName from Examiner E



GO
create proc CancelThesis
@ThesisSerialNo int,@successBit bit output
as
if(exists(
select *
from GUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
))
begin
declare @gucianEval int
set @gucianEval = (
select top 1 evaluation
from GUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
order by progressReportNumber desc
)
if(@gucianEval = 0)
begin
delete from Thesis where serialNumber = @ThesisSerialNo
set @successBit = 1
end
end
else
begin
declare @nonGucianEval int
set @nonGucianEval = (
select top 1 evaluation
from NonGUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
order by progressReportNumber desc
)
if(@nonGucianEval = 0)
begin
delete from Thesis where serialNumber = @ThesisSerialNo
set @successBit = 1
end
end



GO
CREATE Proc EvaluateReport
@supervisorID int,
@thesisSerialNo int,
@progressReportNo int,
@evaluation int
As
if(exists(select * from Thesis where serialNumber=@thesisSerialNo ))
begin
if(exists(select * from GUCianRegisterThesis where thesisSerialNumber=@thesisSerialNo and
supervisor_id=@supervisorID))
begin
declare @gucSid int
select @gucSid=GUCianID
from GUCianRegisterThesis
where thesisserialnumber=@thesisSerialNo
update GUCianProgressReport
set evaluation=@evaluation
where student_id=@gucSid and thesisSerialNumber=@thesisSerialNo and progressReportNumber=@progressReportNo
end
else if(exists(select * from NonGUCianRegisterThesis where thesisSerialNumber=@thesisSerialNo and
supervisor_id=@supervisorID))
begin
declare @nonGucSid int
select @nonGucSid=NonGUCianID
from NonGUCianRegisterThesis
where thesisSerialNumber=@thesisSerialNo
update NonGUCianProgressReport
set evaluation=@evaluation
where student_id=@nonGucSid and thesisSerialNumber=@thesisSerialNo and progressreportnumber=@progressReportNo
end
end



GO
create proc SupervisorEvaluateReport
@studentId int,@progressReportNumber int,@grade int,@success bit output
as
set @success=0
if exists(select * from GUCianProgressReport where @studentId=student_id and @progressReportNumber=progressReportNumber)
begin
update GUCianProgressReport set evaluation=@grade where @studentId=student_id and @progressReportNumber=progressReportNumber
set @success=1
end
else
if exists(select * from nonGUCianProgressReport where @studentId=student_id and @progressReportNumber=progressReportNumber)
begin
update nonGUCianProgressReport set evaluation=@grade where @studentId=student_id and @progressReportNumber=progressReportNumber
set @success=1
end
select * from GUCianProgressReport
declare @succ bit
exec SupervisorEvaluateReport 2,2,7,@succ output
print @succ




create proc editSupervisorPassword
@id int,@oldpassword varchar(20),@newpassword varchar(20),@success bit output
as
declare @currentPassword varchar(20)
set @currentPassword = (
select top 1 password
from PostGradUser
where @id=id
)
if(@oldpassword=@currentPassword)
begin
set @success=1
update PostGradUser
set password = @newpassword
where @id = id
end
else
set @success=0








go
select * from Thesis
select * from ExaminerEvaluateDefense
drop proc editSupervisorPassword
select * from GUCianRegisterThesis
select * from nonGUCianProgressReport
select * from defense
insert into GUCianRegisterThesis values(1,11,7),(3,11,8)
insert into nonGUCianRegisterThesis values(6,11,9),(7,11,6)
update NonGUCianProgressReport set supervisor_id=11 where student_id=6
insert into NonGUCianProgressReport (
        student_id,
        date,
        evaluation,
        state,
        thesisSerialNumber
    ) values(10,'2022-7-8',9,4,10)

exec SupViewProfile 11

select * from PostGradUser
select * from nonGucianprogressreport
exec viewAllProgressReports
select * from  nonGUCianProgressReport
exec EvaluateReport 11, 1, 1, 7


select * from NonGUCianRegisterThesis
update nongucianregisterthesis set supervisor_id=11 where nongucianid=10