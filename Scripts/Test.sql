select count(*) from Cases_Report;

use BI06_METADATA
select * from Data_Flow;
update Data_Flow
set LSET = '1-1-1990';

use BI06_STAGE;
EXEC sp_MSForEachTable 'truncate table ?';

use BI06_STAGE;
EXEC sp_MSForEachTable 'select * from ?';

use BI06_STAGE;
select * from Cases_Report
select * from Compile_COVID19_Case_Details
select * from Ongoing_Outbreaks_PHU
select * from PHU
select * from PHU_Group
select * from Vaccines_By_Age_PHU

use BI06_NDS;
alter table CITY 
	drop constraint FK_CITY_PHU_GROUP;
truncate table PHU_GROUP;
alter table CITY add 
    constraint FK_CITY_PHU_GROUP     foreign key (PHU_group_id)     references PHU_GROUP (PHU_group_id)

commit
alter table PHU 
	drop constraint FK_PHU_CITY;
truncate table city;
alter table PHU add 
    constraint FK_PHU_CITY       	foreign key (city_id)		references CITY (city_id);

truncate table [VACCINE_BY_AGE];

/*SELECT *
FROM
(
  SELECT 'Durham Region', 'Whitby'
    UNION ALL SELECT 'Fergus', 'Guelph'
 ) D (city_stage, city_nds)
*/


