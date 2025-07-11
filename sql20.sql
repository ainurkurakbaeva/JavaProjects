select grade,
case 
        WHEN grade = 'B+' THEN 'GREAT'
        WHEN grade = 'B'  THEN 'GOOD'
        WHEN grade = 'C+' THEN 'AVERAGE'
        WHEN grade = 'C'  THEN 'BELOW AVERAGE'
        WHEN grade = 'F'  THEN 'FAIL'
		ELSE 'UNKNOWN' END AS grade_desc 
		from students;

