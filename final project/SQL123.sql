use hcproject;

-- KPI2 profit vs non-profit stats..
SELECT `Chain Organization`,
  sum(CASE WHEN `Profit or Non-Profit` = "profit" THEN 1 ELSE 0 END) AS total_profit, 
  sum(CASE WHEN `Profit or Non-Profit`= "non-profit" THEN 1 ELSE 0 END) AS total_non_profit,
  count(*) as total_records
FROM dialysis_1_1 group by `Chain Organization` order by total_profit desc;


-- KPI6 Average Payment Reduction Rate
select ROUND(AVG(`PY2020 Payment Reduction Percentage`*100),2) AS `Avg Payment Reduction Rate (%)` FROM dialysis_2_1;

-- KPI4 # of_Dialysis_Stations stats..
select `Chain Organization`, count(`# of Dialysis Stations`) as `# of Dialysis Stations` 
from dialysis_1_1 group by `Chain Organization` order by `# of Dialysis Stations` desc;

-- KPI3 Total Perfomance Score..
SELECT `Ownership as of December 31, 2018`, Round(avg(`Total Performance Score`),1) as `Avg Total Performance Score`  from dialysis_2_1 
 group by `Ownership as of December 31, 2018` order by avg(`Total Performance Score`) desc;

-- KPI1 No of Patients across various Summaries..
SELECT COUNT(`Number of patients included in the transfusion summary`) AS `Transfusion summary`,
sum(`Number of patients in hypercalcemia summary` ) AS `Hypercalcemia summary`,
sum(`Number of patients in Serum phosphorus summary`) AS `Serum phosphorus summary`,
sum(`Number of patients included in hospitalization summary`	) AS `Hospitalization summary`,
sum(`Number of Patients included in survival summary`	) AS `Survival summary`,
sum(`Number of Patients included in fistula summary`) AS `Fistula summary`,
sum(`Number of patients in long term catheter summary`	) AS `Long term catheter summary`,
sum(`Number of patients in nPCR summary`	) AS `nPCR summary`
FROM dialysis_1_3;

-- KPI5 No of Category Text As Expected..

SELECT 
  COUNT(CASE WHEN `Patient Transfusion category text` = 'As Expected' THEN 1 END) AS `Transfusion Category Count`,
  COUNT(CASE WHEN `Patient hospitalization category text` = 'As Expected' THEN 1 END) AS `Hospitalization Category Count`,
  COUNT(CASE WHEN `Patient Survival Category Text` = 'As Expected' THEN 1 END) AS `Survival Category Count`,
  COUNT(CASE WHEN `Patient Infection category text` = 'As Expected' THEN 1 END) AS `Infection Category Count`,
  COUNT(CASE WHEN `Fistula Category Text` = 'As Expected' THEN 1 END) AS `Fistula Category Count`,
  COUNT(CASE WHEN `SWR category text` = 'As Expected' THEN 1 END) AS `SWR Category Count`,
  COUNT(CASE WHEN `PPPW category text` = 'As Expected' THEN 1 END) AS `PPPW Category Count`
FROM dialysis_1_2;