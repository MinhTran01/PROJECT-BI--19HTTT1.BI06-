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