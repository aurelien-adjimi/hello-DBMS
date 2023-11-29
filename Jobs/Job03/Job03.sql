/*1.*/
SELECT * FROM students 

/*2.*/
SELECT * FROM students WHERE age > 20

/*3.*/
SELECT * FROM students ORDER BY 
	CASE grade 
		WHEN 'A+' THEN 1
		WHEN 'A' THEN 2
		WHEN 'B+' THEN 3
		WHEN 'B' THEN 4
		WHEN 'C+' THEN 5
		WHEN 'C' THEN 6
		
		ELSE 7
	END ASC;
	
SELECT * FROM students ORDER BY 
	CASE grade 
		WHEN 'A+' THEN 1
		WHEN 'A' THEN 2
		WHEN 'B+' THEN 3
		WHEN 'B' THEN 4
		WHEN 'C+' THEN 5
		WHEN 'C' THEN 6
		
		ELSE 7
	END DESC;