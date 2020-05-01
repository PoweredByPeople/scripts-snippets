# SQL to show only currently running queries. 

SELECT * FROM information_schema.processlist WHERE (INFO LIKE 'UPDATE %' OR 'SELECT %');
