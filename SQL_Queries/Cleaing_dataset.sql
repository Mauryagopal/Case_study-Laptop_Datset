SELECT * FROM laptop.laptop_table;


create table laptop_backup Like laptop.laptop_table;

insert into laptop_backup 
select * from laptop.laptop_table;

select * from information_schema.Tables
where table_schema='laptop'
and table_name='laptop_table';

select * from laptop_table;

alter table laptop.laptop_table drop  column `Unnamed: 0`;

select * from laptop.laptop_table;

DELETE FROM laptop.laptop_table 
WHERE `index` IN (SELECT `index` FROM laptop.laptop_table
WHERE Company IS NULL AND TypeName IS NULL AND Inches IS NULL
AND ScreenResolution IS NULL AND Cpu IS NULL AND Ram IS NULL
AND Memory IS NULL AND Gpu IS NULL AND OpSys IS NULL AND
WEIGHT IS NULL AND Price IS NULL);

SELECT `index` FROM laptop.laptop_table
WHERE Company IS NULL AND TypeName IS NULL AND Inches IS NULL
AND ScreenResolution IS NULL AND Cpu IS NULL AND Ram IS NULL
AND Memory IS NULL AND Gpu IS NULL AND OpSys IS NULL AND
WEIGHT IS NULL AND Price IS NULL;

ALTER TABLE laptop.laptop_table CHANGE `index` id INT;

SHOW COLUMNS FROM laptop.laptop_table;

SELECT *
FROM laptop.laptop_table
WHERE Company IS NULL 
  AND TypeName IS NULL 
  AND Inches IS NULL
  AND ScreenResolution IS NULL 
  AND Cpu IS NULL 
  AND Ram IS NULL
  AND Memory IS NULL 
  AND Gpu IS NULL 
  AND OpSys IS NULL 
  AND Weight IS NULL 
  AND Price IS NULL;
  
SET SQL_SAFE_UPDATES = 0;

DELETE FROM laptop.laptop_table
WHERE Company IS NULL 
  AND TypeName IS NULL 
  AND Inches IS NULL
  AND ScreenResolution IS NULL 
  AND Cpu IS NULL 
  AND Ram IS NULL
  AND Memory IS NULL 
  AND Gpu IS NULL 
  AND OpSys IS NULL 
  AND Weight IS NULL 
  AND Price IS NULL;

SET SQL_SAFE_UPDATES = 1;  -- (turn it back on if you want)

  



SET SQL_SAFE_UPDATES = 0;
DELETE FROM laptop.laptop_table
WHERE Company IS NULL 
  AND TypeName IS NULL 
  AND Inches IS NULL
  AND ScreenResolution IS NULL 
  AND Cpu IS NULL 
  AND Ram IS NULL
  AND Memory IS NULL 
  AND Gpu IS NULL 
  AND OpSys IS NULL 
  AND Weight IS NULL 
  AND Price IS NULL;
  
SET SQL_SAFE_UPDATES = 1;

select count(*) from laptop.laptop_table;
select * from laptop.laptop_table;

create table laptop.laptop_unique as select distinct * from  laptop.laptop_table;

select * from laptop.laptop_table;

select count(*) from laptop.laptop_unique;

select distinct company from laptop_unique;

select distinct inches from laptop_unique;
UPDATE laptop_unique

SET Inches = REPLACE(Inches, ' inches', '');

update laptop_unique 
set inches = replace(inches, '?' ,'');

UPDATE laptop_unique
SET Inches = NULL
WHERE Inches = '';


alter table laptop_unique modify column Inches decimal(10,1);

select distinct ram from laptop_unique;

select replace(ram , 'GB', '') from laptop_unique;

select * from laptop_unique;

update laptop_unique 
set ram = replace(ram , 'GB' ,'');

alter table laptop_unique modify column ram INT;

select distinct weight from laptop_unique;

select * from laptop.laptop_unique;




update laptop_unique
set weight = replace(weight, 'kg' , '');


update laptop_unique
set weight = replace(weight, '?' , '');


 
update laptop_unique 
set weight =NULL
where weight = '';


alter table laptop_unique modify column weight decimal(10,1);

select opsys from laptop_unique;

select opsys ,
case
	when opsys like '%mac%' then 'macos'
    when opsys like 'windows%' then 'windows'
    when opsys like '%linux%' then 'linux'
    when opsys like 'NO OS' then 'N/A'
    else 'other'
end as 'os_brand'
from laptop_unique;

update laptop_unique
set opsys =case
	when opsys like '%mac%' then 'macos'
    when opsys like 'windows%' then 'windows'
    when opsys like '%linux%' then 'linux'
    when opsys like 'NO OS' then 'N/A'
    else 'other'
end;

select distinct gpu from laptop_unique;

alter table laptop_unique
add column gpu_brand varchar (255) after Gpu,
add column gpu_name varchar (255) after gpu_brand;

select * from laptop_unique;

select gpu , substring_index(gpu ,' ',1) from laptop_unique;

update laptop_unique
set gpu_brand=substring_index(gpu ,' ',1);

select replace(Gpu, gpu_brand, '') from laptop_unique;

update laptop_unique
set gpu_name=replace(Gpu, gpu_brand, '');

select * from laptop_unique;

alter table laptop_unique drop column gpu;

alter table laptop_unique
add column cpu_brand varchar(255) after cpu,
add column cpu_name varchar (255) after cpu_brand,
add column cpu_speed decimal(10,1) after cpu_name;

select substring_index(cpu ,' ',3) from laptop_unique;

update laptop_unique
set cpu_brand=substring_index(cpu ,' ',1);

select cpu_speed from laptop_unique;

select cast(replace(substring_index(cpu ,' ',-1),'Ghz','') as decimal(10 ,2)) from laptop_unique;

update laptop_unique
set cpu_speed=cast(replace(substring_index(cpu ,' ',-1),'Ghz','') as decimal(10 ,2));

select substring_index(replace(cpu,cpu_brand,''),' ',-1) from laptop_unique;

select replace(replace(cpu,cpu_brand,''),substring_index(replace(cpu,cpu_brand,''),' ',-1),'') from laptop_unique;

update laptop_unique
set cpu_name=replace(replace(cpu,cpu_brand,''),substring_index(replace(cpu,cpu_brand,''),' ',-1),'');

select * from laptop_unique;

alter table laptop_unique drop column cpu;

select distinct screenResolution from laptop_unique;

select screenResolution, substring_index(substring_index(screenResolution, ' ', -1),'x', -1) from laptop_unique;
select screenResolution, substring_index(substring_index(screenResolution, ' ', -1),'x', 1) from laptop_unique;

alter table laptop_unique 
add column resolution_width integer after screenResolution,
add column resolution_height integer after resolution_width;

update laptop_unique
set resolution_width=substring_index(substring_index(screenResolution, ' ', -1),'x', 1),
resolution_height=substring_index(substring_index(screenResolution, ' ', -1),'x', -1);

select * from laptop_unique;

select replace(ScreenResolution,substring_index(screenResolution, ' ', -1),'') from laptop_unique;

alter table laptop_unique add column touchscreen integer after resolution_height;

select ScreenResolution from laptop_unique
where ScreenResolution like '%touch%';

select ScreenResolution like '%touch%' from laptop_unique;

update laptop_unique
set touchscreen=ScreenResolution like '%touch%';

select * from laptop_unique;

alter table laptop_unique
drop column ScreenResolution;

select cpu_name,
substring_index(Trim(cpu_name),' ',2)
from laptop_unique;

update laptop_unique
set cpu_name=substring_index(Trim(cpu_name),' ',2);

select * from laptop_unique;

alter table laptop_unique
add column memory_type varchar(255) after memory,
add column primary_storage varchar(255) after memory,
add column secondar_storage varchar(255) after memory;

select Memory,
CASE
    WHEN Memory LIKE '%SSD%' AND Memory LIKE '%HDD%' THEN 'Hybrid'
    WHEN Memory LIKE '%SSD%' THEN 'SSD'
    WHEN Memory LIKE '%HDD%' THEN 'HDD'
    WHEN Memory LIKE '%Flash Storage%' THEN 'Flash Storage'
    WHEN Memory LIKE '%Hybrid%' THEN 'Hybrid'
    WHEN Memory LIKE '%Flash Storage%' AND Memory LIKE '%HDD%' THEN 'Hybrid'
    ELSE NULL
END as 'memory_type'
from laptop_unique;

update laptop_unique
set memory_type=CASE
    WHEN Memory LIKE '%SSD%' AND Memory LIKE '%HDD%' THEN 'Hybrid'
    WHEN Memory LIKE '%SSD%' THEN 'SSD'
    WHEN Memory LIKE '%HDD%' THEN 'HDD'
    WHEN Memory LIKE '%Flash Storage%' THEN 'Flash Storage'
    WHEN Memory LIKE '%Hybrid%' THEN 'Hybrid'
    WHEN Memory LIKE '%Flash Storage%' AND Memory LIKE '%HDD%' THEN 'Hybrid'
    ELSE NULL
END;

select * from laptop_unique;

select Memory,
regexp_substr(substring_index(Memory,'+',1),'[0-9]+'),
case 
	when memory like '%+%' then regexp_substr(substring_index(memory,'+',-1),'[0-9]+') 
    else 0
end
from laptop_unique;

update laptop_unique
set primary_storage=regexp_substr(substring_index(Memory,'+',1),'[0-9]+'),
secondar_storage=case 
	when memory like '%+%' then regexp_substr(substring_index(memory,'+',-1),'[0-9]+') 
    else 0
end;

select * from laptop_unique;

select 
primary_storage,
case when primary_storage <=2 then primary_storage*1024 else primary_storage end,
case when secondar_storage <=2 then secondar_storage*1024 else secondar_storage end
from laptop_unique;


update laptop_unique
set primary_storage=case when primary_storage <=2 then primary_storage*1024 else primary_storage end,
secondar_storage=case when secondar_storage <=2 then secondar_storage*1024 else secondar_storage end;

select * from laptop_unique;

alter table laptop_unique drop column Memory;

select * from laptop_unique;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'laptop_unique';

ALTER TABLE laptop_unique
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

select count(*) from laptop_unique;

-- EDA-----------











































