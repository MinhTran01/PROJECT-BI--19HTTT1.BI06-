create database BI06_DDS_VaccinatedCase
go

use BI06_DDS_VaccinatedCase
go

create table Dim_Date (
    date_id int identity(1,1) primary key,
    calendar_year int not null,
    calendar_month int not null
)

create table Dim_AgeGroup (
    age_group_id int identity(1,1) primary key,
    age_group_name varchar(50)
)

create table Fact_VaccinatedCase
(
    case_id int identity(1,1) primary key,
    date_id int not null,
    age_group_id int not null,
    atleast_one_dose_cumulative int not null,
    second_dose_cumulative int not null,
    fully_vaccinated_cumulative int not null,
    third_dose_cumulative int not null,
)

-- Add foreign keys
alter table Fact_VaccinatedCase add 
    constraint FK_FACT_VACCINATEDCASE_DATE      			foreign key (date_id)        		references Dim_Date (date_id),
    constraint FK_FACT_VACCINATEDCASE_AGE_GROUP     		foreign key (age_group_id)      	    references Dim_AgeGroup (age_group_id)