create database HospitalManagementSystem
go 

use HospitalManagementSystem
go 

create table Patient(
[Name] varchar (20) not null,
CNIC nvarchar(20) primary key, 
Age int not null,
contact varchar(20),
Gender varchar(7), check (Gender ='Male' or Gender = 'Female'))

create table Doctor(
[Name] varchar (20) not null, 
ID int primary key, 
Age int not null, 
Gender varchar(7), check (Gender ='Male' or Gender = 'Female'))

create table Diagnosis(
CNIC nvarchar (20) foreign key references Patient(CNIC), 
Illness varchar (40),
testID int foreign key references laboratory(testID))

create table HospitalBed (
CNIC nvarchar (20) foreign key references Patient(CNIC), 
BedNumber int primary key, 
RoomNum int )

create table Payment(
CNIC nvarchar (20) foreign key references Patient (CNIC), 
creditcard nvarchar (20), 
[status] varchar , check ([status] in ('Approved', 'Not Approved')))

create table qualification (
DoctorID int foreign key references Doctor(ID), 
education varchar(30), 
designation varchar(20) not null)

create table operation (
DoctorID int foreign key references Doctor(ID), 
PatientCNIC nvarchar(20) foreign key references Patient(CNIC),
departmentID int foreign key references department(depID))

create table department(
depID int not NULL primary key,
depName varchar(20) )

create table appointment(
DoctorID int foreign key references Doctor(ID),
PatientCNIC nvarchar(20) foreign key references Patient(CNIC),
[date] date,
[time] time,
departmentID int foreign key references department(depID),
unique(DoctorID,[date],[time])
)

create table laboratory(
testID int primary key,
testName varchar(20),
)
