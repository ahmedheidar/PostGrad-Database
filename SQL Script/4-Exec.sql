
Use PostGradOffice

Exec StudentRegister 'karim' , 'ahmeddd' , '123' , 'Eng' , 1 , 'karim.ahmed@gmail.com' , 'kk'

Exec SupervisorRegister 'karim' , 'Ahmeddd' , '123' , 'Eng' , 'karim.gamal@gmail.com'

DECLARE @BTIT bit ;
Exec UserLogin 2 , 'kemzo123' , @BTIT OUTPUT
Print @BTIT 

exec AdminListSup

DECLARE @id int ;
Exec getIDbyEmail'ahmed_heiadr@gmail.com' , @id OUTPUT
Print @id 

DECLARE @issued int ;
Exec checkThesisPayment 1, @issued OUTPUT
Print @issued

Exec addMobile 13 , '010'
Exec addmobile 10 , '013'

Exec AdminListSup
Exec AdminViewAllTheses

DECLARE @c int ;
Exec AdminViewOnGoingTheses @c OUTPUT
Print @c 

Exec AdminViewSupervisorProfile 4

Exec AdminViewAllTheses

DECLARE @thesesCount int ;
Exec AdminViewOnGoingTheses @thesesCount OUTPUT
Print @thesesCount

Exec AdminViewStudentThesisBySupervisor

Exec AdminListNonGucianCourse 3

Exec AdminUpdateExtension 1

Exec AdminIssueThesisPayment 1 , 4832 , 3 , 19

Exec AdminViewStudentProfile 11

Exec AdminIssueInstallPayment 38 , '4-4-2021'

Exec AdminListAcceptPublication

Exec AddCourse 'CSEN301' , 6 , 1400

Exec linkCourseStudent 2 , 15

Exec addStudentCourseGrade 2 , 13 , 99

Exec ViewExamSupDefense '10-9-2021'

Exec EvaluateProgressReport 1 , 2 , 5 , 0

Exec ViewSupStudentsYears 11

Exec SupViewProfile 2

Exec UpdateSupProfile 2 , 'Karim MOHammed' , 'Pharmacy'

Exec ViewAStudentPublications 1

Exec AddDefenseGucian 13 , '2022-8-11' , 'Menofia'

Exec AddDefenseNonGucian 6,'2022-8-13' , 'Abbas'

Exec AddExaminer 15 , '5-5-2021' , 'Slim' , '123' , 0 , 'CS'

Exec CancelThesis 4

Exec AddGrade 3

Exec AddDefenseGrade 3 , '9-9-2021' , 30

Exec AddCommentsGrade 15 ,'2021-5-5' , 'Good Job'

Exec viewMyProfile 9

Exec editMyProfile 9 ,'Khadija','Tantawi','djdj1234', 'Khadija_Tantawi@gmail.com' ,'Cairo','Engineering'

Exec addUndergradID 21 , 9393

Exec ViewCoursesGrades 13

Exec ViewCoursePaymentsInstall 13

Exec ViewThesisPaymentsInstall 15

Exec ViewUpcomingInstallments 13

Exec ViewMissedInstallments 14

Exec AddProgressReport 3 , '1-7-2021' , 9 , 37

Exec FillProgressReport 4 , 6 , 0 , 'WAW' , 4

Exec ViewEvalProgressReport 11 , 3 , 11
 
Exec addPublication 'Energy' , '2022-10-9' , 'Berlin' , 'Mansora' , 0

Exec linkPubThesis 3 , 28


