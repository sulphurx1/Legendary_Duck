CREATE TABLE reservation_with_project (
   e_id VARCHAR(5),
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   arrival_time TIME,
   departure_time TIME,
   project_name VARCHAR(50),
   date DATE
);

INSERT INTO reservation_with_project (e_id, first_name, last_name, arrival_time, departure_time, project_name, date)
VALUES 
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'John', 'Doe', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Jane', 'Smith', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Bob', 'Johnson', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Alice', 'Williams', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'David', 'Brown', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   INSERT INTO reservation_with_project (e_id, first_name, last_name, arrival_time, departure_time, project_name, date)
VALUES 
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'John', 'Johnson', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Robert', 'Brown', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Michael', 'Taylor', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'William', 'Miller', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'David', 'Jones', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'James', 'Smith', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Richard', 'Garcia', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Charles', 'Davis', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Joseph', 'Rodriguez', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Thomas', 'Martinez', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Christopher', 'Hernandez', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE())),
   (CONCAT(CHAR(RAND()*26 + 65), CHAR(RAND()*26 + 65), CAST(RAND() * 1000 AS INT)), 'Paul', 'Gonzalez', CONVERT(time, DATEADD(minute, (RAND() * 120) - 60, '12:00')), CONVERT(time, DATEADD(minute, (RAND() * 240) + 60, '12:00')), 
   CASE CAST(RAND()*2 AS INT) 
        WHEN 0 THEN 'soufflet' 
        WHEN 1 THEN 'covea' 
        ELSE 'bytel' END,
   DATEADD(day, CAST(RAND()*30 AS INT), GETDATE()));
