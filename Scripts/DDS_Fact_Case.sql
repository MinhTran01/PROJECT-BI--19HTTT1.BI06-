create database BI06_DDS_Case
go

use BI06_DDS_Case
go

create table Dim_Date (
    date_id int identity(1,1) primary key,
    calendar_year int not null,
    calendar_month int not null,
    calendar_quarter int not null,
    calendar_day int not null
)

create table Dim_CaseStatus (
    case_status_id int identity(1,1) primary key,
    case_status_name varchar(50)
)

create table Dim_Geography (
    geography_id int identity(1,1) primary key,
    city_name nvarchar(100),
    phu_group_name nvarchar(100),
    phu_name nvarchar(100)
)

create table Dim_Gender (
    gender_id int identity(1,1) primary key,
    gender_name varchar(50)
)

create table Dim_AgeGroup (
    age_group_id int identity(1,1) primary key,
    age_group_name varchar(50)
)

create table Dim_CaseAcquisition (
    case_acquisition_id int identity(1,1) primary key,
	case_acquisition_name varchar(100)
)

create table Fact_Case 
(
    case_id int identity(1,1) primary key,
    number_of_case bigint not null,

    date_id int not null,
    case_status_id int not null,
    geography_id int not null,
    gender_id int not null,
    age_group_id int not null,
    case_acquisition_id int not null
)



-- Add foreign keys
alter table Fact_Case add 
    constraint FK_FACT_CASE_DATE      			foreign key (date_id)        		references Dim_Date (date_id),
    constraint FK_FACT_CASE_CASE_STATUS 		foreign key (case_status_id)    references Dim_CaseStatus (case_status_id),
    constraint FK_FACT_CASE_CASE_GEOGRAPHY 		foreign key (geography_id)    references Dim_Geography (geography_id),
    constraint FK_FACT_CASE_AGE_GROUP     		foreign key (age_group_id)      	    references Dim_AgeGroup (age_group_id),
    constraint FK_FACT_CASE_GENDER       		foreign key (gender_id)        		references Dim_Gender (gender_id),
    constraint FK_FACT_CASE_CASE_ACQUISITION    foreign key (case_acquisition_id)	references Dim_CaseAcquisition (case_acquisition_id)
   