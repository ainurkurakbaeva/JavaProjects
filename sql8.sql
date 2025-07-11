select table_name, column_name 
from information_schema.columns 
where column_name = 'department_id'
and table_schema = 'public'

SELECT table_name, column_name
FROM information_schema.columns
WHERE data_type = 'json'
  AND table_schema = 'public';
