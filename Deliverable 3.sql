use master
go
use HospitalManagementSystem
go

Select* from [appointment]
Select* from [department]
Select* from [Diagnosis]
Select* from [Doctor]
Select* from [HospitalBed]
Select* from [laboratory]
Select* from [Patient]
Select* from [operation]
Select* from [Payment]
Select* from [qualification]

insert into [Patient] values('Gul Khan', '1359-217644', 21, 0923472911, 'Male'),
							('Sami Malik','1352-212345', 45, 0937623411, 'Male'),
							('Komal Satar', '1356-982344', 30, 0923297311, 'Male'),
							('Farooq Afzal', '1376-212638', 28, 0927634721, 'Male'),
							('Amna Faisal', '1326-982344', 35, 0923243311, 'Female')

insert into [Doctor] values
('Shmas khan', 1, 44, 'Male'),
('Ali malik', 2, 41, 'Male'),
('Umer nameem', 3, 39, 'Male'),
('Junaid farooq', 4, 54, 'Male')


insert into [department] values
(1, 'Orthopaedics'),
(2, 'Chest & Vascular'),
(3, 'Psychiatry'),
(4,'Dental Surgery.'),
(5, 'Emergency')

insert into HospitalBed values
(NULL, 1, 1), (NULL, 2,1), (Null,3, 1), (NULL, 4, 1),
(NULL, 5, 2) 

insert into laboratory values
(1, 'Saliva Test'),
(2, 'Endoscopy'),
(3, 'AIDS Test'),
(4, 'Blood Test')

insert into [qualification] values
(1, 'MBBS', 'GP'),
(2, 'MBBS', 'Cardiologist'),
(3, 'MBBS', 'Dermatologist'),
(4, 'BDS', 'dentist');

--------------------------------------------------------------------------------------------------
						--Edit Doctor Profile

--trigger
create trigger update_DoctorID on Doctor
instead of insert, update
as begin 

	declare @ID int
	select @ID = ID from inserted
	if(exists(select ID from Doctor where ID = @ID))
	begin 
		print 'ID already exists. Choose a unique ID.'
	end
end


Alter table qualification add constraint FK_Doctor foreign key (DoctorID) 
references Doctor(ID) on update cascade on delete cascade

create procedure Edit_Profile_Name @newname varchar(20), @ID int, @newAge int, @newGender varchar,
@newEd varchar(20), @newDesig varchar(20)
as begin
	if(exists(select ID from Doctor where ID = @ID))
	begin
		update Doctor set [Name] = @newname where ID = @ID
		update Doctor set Age = @newAge where ID = @ID
		update Doctor set Gender = @newGender where ID = @ID
		update qualification set education = @newEd where DoctorID = @ID
		update qualification set designation = @newDesig where DoctorID = @ID
	end
end

drop procedure Edit_Profile_Name

exec Edit_Profile_Name 'Shamas Khan', 'Shamas Khan',Null ,NULL,44,46,NULL,NULL,NULL,NULL,'GP','General Practitioner'

exec Edit_Profile_Name Null, Null,2 ,4,NUll,NUll,NULL,NULL,NULL,NULL,NUll, NULL

Select* from Doctor
Select* from qualification


---------------------------------------------------------------------------------------------------
								--add operation

Select* from [Patient]
Select* from [operation]
Select* from [department]

create procedure Add_Operation @doctorID int, @CNIC varchar(20), @DeptID varchar(20)
as begin
	if(exists(Select ID from Doctor where ID = @doctorID) AND 
	exists(Select CNIC from Patient where CNIC = @CNIC) AND
	exists(Select depID from department where depID = @deptID))
	begin
		insert into operation values (@doctorID, @CNIC, @DeptID)
	end
end

create procedure Remove_Operation @CNIC varchar(20)
as begin
	if(exists(Select CNIC from Patient where CNIC = @CNIC))
	begin
		delete from operation where PatientCNIC = @CNIC
	end
end
	
	
---------------------------------------------------------------------------------------------------
								--add diagnosis

create procedure Add_Diagnosis @CNIC varchar(20), @illness varchar(20), @testID int
as begin
	if(exists(Select CNIC from Patient where CNIC = @CNIC) AND exists(Select testID from laboratory where testID = @testID))
	begin	
		insert into diagnosis values (@CNIC, @illness, @testID)
	end
end
	
create procedure Remove_Diagnosis @CNIC varchar(20), @illness varchar(20)
as begin
	if(exists(Select CNIC from Diagnosis where CNIC = @CNIC) AND exists(Select illness from Diagnosis where illness = @illness))
	begin	
		delete from diagnosis where CNIC = @CNIC AND illness = @illness
	end
end

drop procedure Add_Diagnosis

exec Add_Diagnosis '1326-982344', 'diabetes', 4
Select* from [Diagnosis]
Select* from laboratory

create view doctor_list
as
select * from Doctor join qualification on Doctor.ID = qualification.DoctorID

create view bed_available
as
select * from HospitalBed where CNIC is Null

create view department_list
as
select * from department


create procedure doctor_book @doctor varchar(20),@due_date date, @due_time nvarchar(10), @dept int, @id_doc int output
as begin
select @id_doc = ID from Doctor where name = @doctor
if (@id_doc in (select DoctorID from appointment))
begin
if (@due_date = (select [date] from appointment where DoctorID = @id_doc) and @due_time = (select [time] from appointment where DoctorID = @id_doc) )
begin
print 'Please select a different time or date'
end
else
begin
insert into appointment (DoctorID, PatientCNIC, date,time, departmentID) values (@id_doc, @cnic, @due_date, @due_time, @dept)
end
end
else
begin
insert into appointment (DoctorID, PatientCNIC, date,time, departmentID) values (@id_doc, @cnic, @due_date, @due_time, @dept)
end
end

 
create procedure book_room @bed_no int, @room_no int, @cnic varchar(20) output
as begin 
select @cnic = CNIC from HospitalBed where BedNumber = @bed_no and RoomNum = @room_no
if (@cnic = null)
begin
update HospitalBed set CNIC = @cnc where BedNumber = @bed_no and RoomNum = @room_no
end
else
begin
print'You cannot choose these beds'
end
end
