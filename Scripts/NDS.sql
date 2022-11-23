create database NDS
go
use NDS
go

-- Dropping tables : 
IF EXISTS (SELECT * FROM GENDER) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM CASE_ACQUISITION) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM PROVINCE) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM AGE_GROUP) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM CASE_REPORT) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM PHU) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM VACCINE_BY_AGE) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM PHU_GROUP) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM CITY) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM ONGOING_OUTBREAKS_PHU) DROP TABLE GENDER
GO

IF EXISTS (SELECT * FROM OUTBREAK_GROUP) DROP TABLE GENDER
GO


-- Definition for tables: 
create table GENDER
(
	gender_id int identity(1,1) not null primary key,
	gender_name varchar(50),
	create_date datetime,
	update_date datetime
)
go

create table CASE_ACQUISITION
(
	case_acquisition_id int identity(1,1) not null primary key,
	case_acquisition_name varchar(100),
	create_date datetime,
	update_date datetime
)
go

create table PROVINCE
(
	province_id int identity(1,1) not null primary key,
	province_name varchar(100),
	create_date datetime,
	update_date datetime
)
go

create table AGE_GROUP
(
	age_group_id int identity(1,1) not null primary key,
	age_group_name varchar(100),
	create_date datetime,
	update_date datetime
)
go

create table CASE_REPORT
(
	case_report_id int identity(1,1) not null primary key,
	case_report_nk int,
	reported_date datetime,
	PHU_id int,
	age_group_id int,
	gender_id int,
	case_acquisition_id int,
	province_id int,
	case_status varchar(50),
	outcome varchar(50),
	speimen_date datetime,
	test_reported_date datetime,
	accurate_episode_date datetime,
	outbreak_related varchar(50),
	create_date datetime,
	update_date datetime
)
go

create table PHU
(
	PHU_id int identity(1,1) not null primary key,
	PHU_nk int, 
	reporting_PHU nvarchar(100),
	reporting_PHU_Address nvarchar(100),
	reporting_PHU_Website nvarchar(250),
	reporting_PHU_Latitude float,
	reporting_PHU_Longitude float,
	city_id int,
	create_date datetime,
	update_date datetime
)
go

create table VACCINE_BY_AGE
(
	vaccine_by_age_id int identity(1,1) not null primary key,
	report_date datetime,
	PHU_id int, 
	age_group_id int,
	atleast_one_dose_cumulative int,
	second_dose_cumulative int,
	fully_vaccinated_cumulative int,
	third_dose_cumulative int,
	create_date datetime,
	update_date datetime
)
go

create table PHU_GROUP
(
	PHU_group_id int identity(1,1) not null primary key,
	PHU_group_name nvarchar(100),
	create_date datetime,
	update_date datetime
)
go

create table CITY
(
	city_id int identity(1,1) not null primary key,
	city_name nvarchar(100),
	PHU_group_id int,
	create_date datetime,
	update_date datetime
)
go

create table ONGOING_OUTBREAKS_PHU
(
	ongoing_outbreaks_phu_id int identity(1,1) not null primary key,
	PHU_id int,
	outbreak_group_id int,
	reported_date datetime,
	number_ongoing_outbreaks int,
	create_date datetime,
	update_date datetime
)
go

create table OUTBREAK_GROUP
(
	outbreak_group_id int identity(1,1) not null primary key,
	outbreak_group_name varchar(100),
	create_date datetime,
	update_date datetime
)
go

-- Add foreign keys
alter table CASE_REPORT add 
    constraint FK_CASE_REPORT_PHU       			foreign key (PHU_id)        		references PHU (PHU_id),
    constraint FK_CASE_REPORT_AGE_GROUP     		foreign key (age_group_id)      	references AGE_GROUP (age_group_id),
    constraint FK_CASE_REPORT_GENDER       			foreign key (gender_id)        		references GENDER (PHU_id),
    constraint FK_CASE_REPORT_CASE_ACQUISITION      foreign key (case_acquisition_id)	references CASE_ACQUISITION (case_acquisition_id),
    constraint FK_CASE_REPORT_PROVINCE      		foreign key (province_id)        	references PROVINCE (province_id)

alter table PHU add 
    constraint FK_PHU_CITY       	foreign key (city_id)		references CITY (city_id)

alter table VACCINE_BY_AGE add 
    constraint FK_VACCINE_BY_AGE_PHU       			foreign key (PHU_id)        		references PHU (PHU_id),
    constraint FK_VACCINE_BY_AGE_AGE_GROUP     		foreign key (age_group_id)      	references AGE_GROUP (age_group_id)

alter table ONGOING_OUTBREAKS_PHU add 
    constraint FK_ONGOING_OUTBREAKS_PHU_PHU       			foreign key (PHU_id)        		references PHU (PHU_id),
    constraint FK_ONGOING_OUTBREAKS_PHU_OUTBREAK_GROUP     	foreign key (outbreak_group_id)     references OUTBREAK_GROUP (outbreak_group_id)
