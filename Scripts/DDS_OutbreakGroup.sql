create database BI06_DDS_OutbreakGroup
go
use BI06_DDS_OutbreakGroup
go

create table Dim_Date (
    date_id int identity(1,1) primary key,
    calendar_year int not null,
    calendar_month int not null
)

create table Dim_Geography (
    geography_id int identity(1,1) primary key,
	phu_id_nds int not null,
    city_name nvarchar(100),
    phu_group_name nvarchar(100),
    phu_name nvarchar(100)
)

create table Dim_OutbreakGroup(
    outbreak_group_id int identity(1,1) primary key,
    outbreak_group_name varchar(100)
)

create table Fact_Outbreak(
    outbreak_id int identity(1,1) primary key,
    date_id int not null,
    geography_id int not null,
    outbreak_group_id int not null,
    number_of_outbreak bigint not null
)

alter table Fact_Outbreak add 
    constraint FK_Fact_Outbreak_Dim_Date    		foreign key (date_id)        		references Dim_Date (date_id),
    constraint FK_Fact_Outbreak_Dim_Geography   	foreign key (geography_id)      	references Dim_Geography (geography_id),
    constraint FK_Fact_Outbreak_Dim_OutbreakGroup   foreign key (outbreak_group_id)     references Dim_OutbreakGroup (outbreak_group_id)
   
