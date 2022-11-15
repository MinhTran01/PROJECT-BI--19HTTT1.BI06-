create database BI06_STAGE
go
use BI06_STAGE
go
--

create table Compile_COVID19_Case_Details
(  
	objectID int not null primary key,
	row_id int,
	date_reported datetime,
	heath_region varchar(100),
	age_group varchar(50),
	gender varchar(50),
	exposure varchar(50),
	case_status varchar(50),
	province varchar(100)
)
go

create table Cases_Report
(  
	id int identity(1,1) primary key, -- khóa tự tăng
	outcome varchar(50),
	age varchar(50),
	gender varchar(50),
	reporting_PHU varchar(100),
	speimen_date datetime,
	caseReported_date datetime,
	PHU_City varchar(100),
	testReported_date datetime,
	caseAcquisition_info varchar(150),
	accurateEpisode_date datetime,
	PHU_Address varchar(250),
	PHU_Website varchar(250),
	outbreakRelated varchar(50),
	PHU_Latitude float,
	PHU_Longitude float,
	PHU_PostalCode varchar(50)
)
go

create table Vaccines_By_Age_PHU
(  
	id int identity(1,1) primary key, 
	reportdate datetime,
	PHU_ID int, 
	agegroup varchar(50),
	atleast_one_dose_cumulative int,
	second_dose_cumulative int,
	fully_vaccinated_cumulative int,
	third_dose_cumulative int
)
go

create table PHU
(
	PHU_ID int not null primary key,
	reporting_PHU varchar(100),
	reporting_PHU_Address varchar(250),
	reporting_PHU_City varchar(100),
	reporting_PHU_Postal_Code varchar(50),
	reporting_PHU_Website varchar(250),
	reporting_PHU_Latitude float,
	reporting_PHU_Longitude float
)
go

create table Ongoing_Outbreaks_PHU
(
	id int identity(1,1) primary key,
	reportdate datetime,
	PHU_Num int,
	outbreak_group varchar(100),
	number_ongoing_outbreaks int
)
go

create table PHU_Group
(
	id int identity(1,1) primary key, 
	PHU_Group varchar(100),
	PHU_Region varchar(100)
)
go


-- Drop Table
--drop table dbo.Cases_Report;
--drop table dbo.Compile_COVID19_Case_Details;
--drop table dbo.Ongoing_Outbreaks_PHU;
--drop table dbo.PHU;
--drop table dbo.PHU_Group;
--drop table dbo.Vaccines_By_Age_PHU;
