
Use PostGradOffice

-- Payment data

SET IDENTITY_INSERT Payment  on;
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (1, 1000.50, 1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (2, 1300, 1, 5);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (3, 1500.25,1, 10);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (4, 800.50,1, 5);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (5, 900,1, 15);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (6, 1000,1, 5);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (7, 1200,1, 10);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (8, 1500,1, 15);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (9, 1000, 1, 10);

INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (10, 700,1, 5);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (11, 800,1, 20);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (12, 1000.50,1, 10);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (13, 750.25,1, 10);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (14, 900, 1, 5);

INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (15, 1000,1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (16, 1200,1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (17, 700,1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (18, 900.50 ,1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (19, 1000.50,1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (20, 1300, 1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (21, 800, 1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (22, 750, 1, 18.25);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (23, 1000.50, 1, 5);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (24, 800.50, 1, 5);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (25, 1100, 1, 5);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (26, 1400, 1, 15);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (27, 800, 1, 10);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (28, 750, 1, 0);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (29, 1000, 2, 5);
INSERT into Payment
    (id,amount,noOfInstallments
    
    ,fundPercentage)
VALUES
    (30, 1000, 2, 10);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (35, 2000, 2, 14);
INSERT into Payment
    (id,amount,noOfInstallments,fundPercentage)
VALUES
    (40, 3000, 2, 15);

SET IDENTITY_INSERT Payment  off;

-- SELECT * from Payment ;

Insert Into Installment
    (date, paymentId, amount, done)
Values 
    ('1-1-2020',1,1000.50,1),
    ('1-2-2020',2,1300,1),
    ('1-3-2020',3,1500,1),
    ('1-4-2020',4,800.50,1),
    ('1-5-2020',5,900,1),
    ('1-6-2020',6,1000,1),
    ('1-7-2020',7,1200,1),
    ('1-8-2020',8,1500,1),
    ('1-8-2020',9,1000,1),
    ('1-9-2020',10,700,1),
    ('2-1-2020',11,800,1),
    ('1-1-2022',12,1000.50,0),
    ('1-2-2022',13,750.25,0),
    ('1-3-2022',14,900,0),
    ('1-4-2022',15,1000,0),
    ('1-5-2022',16,1200,0),
    ('1-3-2021',17,700,1),
    ('1-4-2021',18,900.50,1),
    ('1-5-2021',19,1000.50,1),
    ('1-6-2021',20,1300,1),
    ('1-7-2021',21,800,1),
    ('1-8-2021',22,750,1),
    ('1-9-2021',23,1000.50,1),
    ('1-1-2023',24,800.50,0),
    ('2-1-2021',25,1100,1),
    ('3-1-2021',26,1400,1),
    ('4-1-2021',27,800,1),
    ('5-1-2021',28,750,1),
    ('6-1-2021',29,750,1),
    ('7-1-2022',29,250,0),
    ('8-1-2021',30,800,1),
    ('9-1-2022',30,200,0)

-- Select * From Installment

-- Thesis data

SET IDENTITY_INSERT Thesis  on;
INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (1, 'Engineering', 'Ms', 'Genetic Engineering', '2020-8-8', '2022-9-9', '2021-10-25', 90.5, 1, 2);
INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (2, 'Engineering', 'PhD', 'Power lines and electricity distribution', '2020-9-15', '2021-10-9', '2021-10-30', 80, 2, 1);
    
INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (3, 'Engineering', 'Ms', 'AC and DC motors and operations', '2019-7-8', '2021-7-13', '2021-8-2', 75.5, 3, 3);
    
INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (4, 'Engineering', 'PhD', 'Basics of Electronics Engineering', '2020-8-12', '2021-9-9', '2021-10-25', 95, 4, 1);
    
INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (5, 'Engineering', 'PhD', 'Generators and electric motors', '2019-8-10', '2021-9-11', '2021-10-30', 90.5, 5, 0);
INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (6, 'Engineering', 'Ms', 'Essentials for designing a functional software', '2019-7-10', '2021-7-11', '2021-7-30', 89, 6, 2);
    
INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (7, 'Engineering', 'PhD', 'Getting software design rights', '2020-7-12', '2021-9-11', '2021-10-30', 79, 7, 0);
    
    INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (8, 'Engineering', 'Ms', 'Effects of malware on software operation', '2020-12-10', '2021-12-12', '2021-12-25', 80, 8, 1);
    
    INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (9, 'Engineering', 'PhD', 'How algorithms improve test automation', '2019-9-15', '2021-9-27', '2021-10-15', 70, 9, 1);
    
    INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate
    
    ,defenseDate
    
    ,grade,payment_id,noOfExtensions)
VALUES
    (10, 'Engineering', 'Ms', 'Storage and industrial structures', '2020-8-17', '2021-9-19', '2021-10-5', 95, 10, 3);
    
INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (11, 'Management', 'PhD', 'How do hospitals acquire talent?', '2020-8-15', '2021-9-20', '2021-10-5', 77, 11, 2);
 INSERT into Thesis
    (serialNumber,field,type,title,startDate
    
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (12, 'Management', 'Ms', 'The main steps of product development', '2020-9-15', '2021-11-20', '2021-12-5', 99, 12, 3);
    
 
    INSERT into Thesis
    (serialNumber,field,type,title,startDate
    
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (13, 'Management', 'PhD', 'The influence of music during training', '2020-3-15', '2021-3-20', '2021-3-22', 65, 13, 0);
    
                
    INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (14, 'Management', 'Ms', 'The many benefits of salary bonuses', '2019-8-15', '2021-9-20', '2021-10-5', 87, 14, 2);
    
                
    INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (15, 'Management', 'PhD', 'iscussing safety issues in football.', '2020-8-22', '2021-9-27', '2021-10-7', 76, 15, 1);
    
     INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (16, 'Management', 'Ms', 'The recruitment process in the Al Etihad company.', '2020-8-23', '2021-9-1', '2021-9-5', 74, 16, 0);
    
                
    INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (17, 'Management', 'PhD', 'How do hospitals plan for biologic attacks?', '2020-8-22', '2021-9-23', '2021-10-1', 70, 17, 1);
    
                
    INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (18, 'Management', 'Ms', 'How is talent aligned to business', '2019-6-15', '2021-6-20', '2021-12-5', 97, 18, 2);
    
                
    INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (19, 'Management', 'PhD', 'The many benefits of salary bonuses', '2020-8-15', '2021-9-20', '2021-10-5', 70, 19, 2);
    
    INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (20, 'Management', 'Ms', 'Eliminating drug use at the workplace', '2020-10-15', '2021-10-20', '2021-11-5', 77, 20, 3);
    
                
                
    INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (21, 'pharmacy', 'Ms', 'A case study analysis of war against terror', '2020-7-16', '2021-7-20', '2021-8-5', 86, 21, 2);
    
INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (22, 'Law', 'PhD', 'A case study analysis of racial prejudice', '2020-10-12', '2021-10-2', '2021-11-1', 67, 22, 3);
    
                INSERT into Thesis
    (serialNumber,field,type,title,startDate
    
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (23, 'Law', 'Ms', 'Reviewing the need for the Gun Law', '2019-6-3', '2021-6-5', '2021-6-30', 95, 23, 1);
    
                INSERT into Thesis
    (serialNumber,field,type,title,startDate
    ,endDate
    ,defenseDate
    ,grade,payment_id,noOfExtensions)
VALUES
    (24, 'Law', 'PhD', 'Islamic Criminal law', '2020-10-15', '2021-10-20', '2021-11-5', 77, 24, 2);
    
                INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (25, 'Law', 'Ms', 'Sports law implications', '2019-11-12', '2021-11-20', '2021-12-1', 81, 25, 1);

               INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (26, 'pharmacy', 'PhD', 'History of Clinical Pharmacy', '2019-10-12', '2021-10-20', '2021-11-1', 86, 26, 1);
    
               INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (27, 'pharmacy', 'Ms', 'Pharmacy Private Label Products ', '2019-6-12', '2021-6-20', '2021-7-1', 77, 27, 2);
    
               INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (28, 'pharmacy', 'PhD', 'Motivation Cases in a Pharmacy Department', '2020-11-11', '2021-11-11', '2021-12-2', 90, 28, 0);
    
               INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (29, 'pharmacy', 'Ms', 'Strategies Used by Aid Pharmacy', '2020-6-12', '2021-6-20', '2021-7-3', 96, 29, 2);
    
               INSERT into Thesis
    (serialNumber,field,type,title,startDate,endDate,defenseDate,grade,payment_id,noOfExtensions)
VALUES
    (30, 'pharmacy', 'PhD', 'Sales and Inventory System of a Pharmacy', '2019-10-13', '2021-10-23', '2021-11-1', 68, 30, 3);

SET IDENTITY_INSERT Thesis  off;

-- SELECT * From Thesis ;

-- postgraduser data 


SET IDENTITY_INSERT PostGradUser on;

INSERT into PostGradUser (id,email,password)
VALUES(1,'ahmed_elkady@gmail.com','Aa112233')

INSERT into PostGradUser (id,email,password)
VALUES(2,'kareem_mohamed@gmail.com','kemzo123')

INSERT into PostGradUser (id,email,password)
VALUES(3,'kareem_heidar@gmail.com','heidaaaar')

INSERT into PostGradUser (id,email,password)
VALUES(4,'ahmed_heiadr@gmail.com','fcbayern8-2')

INSERT into PostGradUser (id,email,password)
VALUES(5,'roberto_joseph@gmail.com','Mohhaaimbot234')

INSERT into PostGradUser (id,email,password)
VALUES(6,'jannah_gabr@gmail.com','janjon123')

INSERT into PostGradUser (id,email,password)
VALUES(7,'ahmed_elsharoud@gmail.com','TKTKTK')

INSERT into PostGradUser (id,email,password)
VALUES(8,'hager_amer@gmail.com','SHJR12')

INSERT into PostGradUser (id,email,password)
VALUES(9,'Khadija_tantwi@gmail.com','djdj123')

INSERT into PostGradUser (id,email,password)
VALUES(10,'alaa_eldeen@gmail.com','california')

INSERT into PostGradUser (id,email,password)
VALUES(11,'amr_salem@gmail.com','zenab1122')

INSERT into PostGradUser (id,email,password)
VALUES(12,'maram_aly@gmail.com','fox1122')

INSERT into PostGradUser (id,email,password)
VALUES(13,'malak_wael@gmail.com','AaBb11223344')


INSERT into PostGradUser (id,email,password)
VALUES(14,'ahmed_Sayed@gmail.com','AaBb112233')

INSERT into PostGradUser (id,email,password)
VALUES(15,'mazen_hejazy@gmail.com','AaBb112233')

INSERT into PostGradUser (id,email,password)
VALUES(16,'mustafa_Sayed@gmail.com','1223344')

INSERT into PostGradUser (id,email,password)
VALUES(17,'kimo.mido@gmail.com','abc12345')

INSERT into PostGradUser (id,email,password)
VALUES(18,'candy.doggy@gmail.com','hawhaw123')

SET IDENTITY_INSERT PostGradUser off;

-- SELECT * FROM postgraduser

-- admin data 

Insert into Admin (id)
Values (17)
Insert into Admin (id)
Values (18)

-- SELECT * FROM admin

-- supervisor data

INSERT into supervisor(id,name,faculty)
values (1,'ahmed elkady','Engineering')


INSERT into supervisor(id,name,faculty)
values (2,'kareem mohamed','pharmacy')


INSERT into supervisor(id,name,faculty)
values (3,'kareem heidar','Management')


INSERT into supervisor(id,name,faculty)
values (4,'ahmed heidar','law')

-- SELECT * from supervisor

--examiner data

insert into Examiner (id,fieldOfWork,name,isNational) values (5,'Enigeering','roberto',1)
insert into Examiner (id,fieldOfWork,name,isNational) values (6,'Law','jannah',0)
insert into Examiner (id,fieldOfWork,name,isNational) values (7,'Management','sharoud',1)
insert into Examiner (id,fieldOfWork,name,isNational) values (8,'pharmacy','hager',0)

--gucian students data
 
 INSERT into GucianStudent (id,firstName,lastname,type,faculty,address,GPA,undergradID)
 VALUES(9,'kahdija' ,'tantawi','g','Enigeering','cairo',1.8,1223)


 INSERT into GucianStudent (id,firstName,lastname,type,faculty,address,GPA,undergradID)
 VALUES(10,'alaa' ,'eldeen','g','Law','alex',2.3,14647)

 
 INSERT into GucianStudent (id,firstName,lastname,type,faculty,address,GPA,undergradID)
 VALUES(11,'amr' ,'salem','g','Management','cairo',2,11444)


 INSERT into GucianStudent (id,firstName,lastname,type,faculty,address,GPA,undergradID)
 VALUES(12,'maram' ,'aly','g','pharmacy','alex',1.4,6868)

-- SELECT * FROM GucianStudent
 
-- nonGucian data

INSERT into NonGucianStudent (id,firstName,lastname,type,faculty,address,GPA)
VALUES(13,'malak' ,'wael','ng','Enigeering','cairo',1.5)

INSERT into NonGucianStudent (id,firstName,lastname,type,faculty,address,GPA)
VALUES(14,'ahmed' ,'sayed','ng','Law','alex',1.7)

INSERT into NonGucianStudent (id,firstName,lastname,type,faculty,address,GPA)
VALUES(15,'mazen' ,'hegazy','ng','Management','cairo',2.5)

INSERT into NonGucianStudent (id,firstName,lastname,type,faculty,address,GPA)
VALUES(16,'mustafa' ,'sayed','ng','pharmacy','alex',1.3)

-- SELECT * FROM NonGucianStudent

--gucian progress report data

INSERT into GUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,description,supid)
VALUES(9,1,'9-10-2020',0,1,3,'So Good',1) 


INSERT into GUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,description,supid)
VALUES(10,2,'8-3-2020',1,1,13,'So Bad',4)


INSERT into GUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,description,supid)
VALUES(11,3,'7-5-2020',2,0,11,'Gross',3)


INSERT into GUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,description,supid)
VALUES(12,4,'3-6-2020',3,1,30,'Perfectooo',2)

--nongucian progress report data

INSERT into NonGUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,description,supid)
VALUES(13,5,'5-8-2020',0,1,2,'Good',1)


INSERT into NonGUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,description,supid)
VALUES(14,6,'3-3-2020',1,1,23,'Bad',4)

INSERT into NonGUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,description,supid)
VALUES(15,7,'1-1-2020',2,0,6,'Amazing',3)


INSERT into NonGUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,description,supid)
VALUES(16,8,'4-3-2020',3,1,5,'WOW',2)

--courses data

SET IDENTITY_INSERT Course  on;

insert into  Course (id,fees,creditHours,code)
VALUES(1,1000,4,'1')


insert into  Course (id,fees,creditHours,code)
VALUES(2,2000,5,'2')

insert into  Course (id,fees,creditHours,code)
VALUES(3,3000,8,'3')

insert into  Course (id,fees,creditHours,code)
VALUES(4,4000,6,'4')

SET IDENTITY_INSERT Course  off;

--non gucian course data

insert into NonGucianStudentTakeCourse (sid,cid,grade) 
values (13,1,75) 


insert into NonGucianStudentTakeCourse (sid,cid,grade) 
values (14,2,40) 


insert into NonGucianStudentTakeCourse (sid,cid,grade) 
values (15,3,85) 


insert into NonGucianStudentTakeCourse (sid,cid,grade) 
values (16,4,95) 

--Defense data 

INSERT INTO Defense (serialNumber,date,location,grade)
VALUES(3,'9-9-2021','GUC',85)

INSERT INTO Defense (serialNumber,date,location,grade)
VALUES(13,'10-9-2021','GUC',90)

INSERT INTO Defense (serialNumber,date,location,grade)
VALUES(23,'11-9-2021','GUC',95)

INSERT INTO Defense (serialNumber,date,location,grade)
VALUES(28,'12-9-2021','GUC',99)

INSERT INTO Defense (serialNumber,date,location,grade)
VALUES(15,'5-5-2021','GUC',77)




--ExaminerEvaluateDefense data

INSERT INTO ExaminerEvaluateDefense (date,serialNo,examinerId,comment)
VALUES ('9-9-2021',3,5,'1st defense comment ')

INSERT INTO ExaminerEvaluateDefense (date,serialNo,examinerId,comment)
VALUES ('10-9-2021',13,6,'2nd defense comment ')

INSERT INTO ExaminerEvaluateDefense (date,serialNo,examinerId,comment)
VALUES ('11-9-2021',23,7,'3rd defense comment ')

INSERT INTO ExaminerEvaluateDefense (date,serialNo,examinerId,comment)
VALUES ('12-9-2021',28,8,'4th defense comment ')

--Publication Data

Insert Into Publication (title, dateOfPublication, place, accepted, host)
Values ('Water Energy','2021-11-11','Cairo',1,'Alex'),
       ('Nucleur Energy','2021-10-10','Mansora',0,'Alex')

Insert Into Publication (title, dateOfPublication, place, accepted, host)
Values ('Solar Energy','2021-12-12','Cairo',1,'Alex')

Insert Into Publication (title, dateOfPublication, place, accepted, host)
Values ('Fire Energy','2021-01-02','Cairo',0,'Alex')

--ThesisHasPublication

Insert Into ThesisHasPublication (serialNo,pubid)
Values (5,1),(6,2)

Insert Into ThesisHasPublication (serialNo,pubid)
Values (11,3)

--NonGucianPaymentCourse

Insert Into NonGucianStudentPayForCourse (sid, paymentNo, cid)
Values (13,35,1) ,(14,40,2)

--GUCianStudentRegisterThesis
Insert Into GUCianStudentRegisterThesis (sid, supid, serial_no)
Values (9 , 3 , 3) , (10 , 4 , 4)

--NonGUCianStudentRegisterThesis
Insert Into NonGUCianStudentRegisterThesis (sid, supid, serial_no)
Values (14 , 1 , 11) , (15 , 2 , 12)
