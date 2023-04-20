SELECT 
	sum(total) as gran_total 
FROM 
	tableName WHERE tableName_pk in ${lst:tableName_pk@query-tableName.sql}