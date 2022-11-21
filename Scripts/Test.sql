select count(*) from Cases_Report;

use BI06_METADATA
update Data_Flow
set LSET = '10-10-1990';

use BI06_STAGE;
EXEC sp_MSForEachTable 'truncate table ?';

use BI06_STAGE;
EXEC sp_MSForEachTable 'select * from ?';

use BI06_STAGE;
select * from Cases_Report
select * from Vaccines_By_Age_PHU
