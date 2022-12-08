create database BI06_METADATA
go
use BI06_METADATA
go

create table Data_Flow
(  
id int IDENTITY(1, 1) NOT NULL,
  table_name varchar(50) NULL,
  LSET datetime NULL
)
go

create table DDS
(  
	id int IDENTITY(1, 1) NOT NULL,
  table_name varchar(50) NULL,
  LSET datetime NULL
)
go

insert into Data_Flow values
('Cases_Report', '10-10-2020'),
('Compile_COVID19_Case_Details', '10-10-2020'),
('Vaccines_By_Age_PHU', '10-10-2020'),
('PHU', '10-10-2020'),
('Ongoing_Outbreaks_PHU', '10-10-2020'),
('PHU_Group', '10-10-2020')
go

insert into DDS values
('Compile_case_details','1-1-1990'),
('Dim_Geography','1-1-1990'),
('Dim_Gender','1-1-1990'),
('Dim_AgeGroup','1-1-1990'),
('Dim_CaseAcquisition','1-1-1990'),
('Vaccine_By_Age','1-1-1990')
go
