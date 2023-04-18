INSERT INTO employee (employee_id, employee_email, first_name, last_name, employee_vehicle_type, employee_project)
SELECT 
  employee_id,
  CONCAT(first_name, '.', last_name, '@example.com'),
  first_name,
  last_name,
  CASE ABS(CHECKSUM(NEWID(), RAND())) % 3 
    WHEN 0 THEN 'small' 
    WHEN 1 THEN 'medium'
    ELSE 'large'
  END AS employee_vehicle_type,
  CASE ABS(CHECKSUM(NEWID(), RAND())) % 3
    WHEN 0 THEN 'bytel'
    WHEN 1 THEN 'covea'
    ELSE 'soufflet'
  END AS employee_project
FROM employee_login
WHERE NOT EXISTS (SELECT 1 FROM employee WHERE employee.employee_id = employee_login.employee_id)
ORDER BY NEWID();

INSERT INTO reservation (employee_id, reservation_date, reservation_time_in, reservation_time_out)
SELECT 
  employee_id,
  DATEADD(day, ABS(CHECKSUM(NEWID())) % 365, '2022-01-01'), 
  DATEADD(minute, ABS(CHECKSUM(NEWID())) % 1440, '00:00:00'),
  DATEADD(minute, ABS(CHECKSUM(NEWID())) % 1440 + 60, '00:00:00')
FROM (
  SELECT TOP 50 employee_id
  FROM employee
  ORDER BY NEWID()
) AS t
CROSS JOIN (SELECT TOP 50 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn FROM sys.objects) AS x;

INSERT INTO parking_slots (location, slot_name, is_available)
SELECT 'Nexteracom', 'A', 1 UNION ALL
SELECT 'Nexteracom', 'B', 1 UNION ALL
SELECT 'Nexteracom', 'C', 1 UNION ALL
SELECT 'Nexteracom', 'D', 1 UNION ALL
SELECT 'Nexteracom', 'E', 1 UNION ALL
SELECT 'Nexteracom', 'F', 1 UNION ALL
SELECT 'Nexteracom', 'G', 1 UNION ALL
SELECT 'Nexteracom', 'H', 1 UNION ALL
SELECT 'Nexteracom', 'I', 1 UNION ALL
SELECT 'Nexteracom', 'J', 1 UNION ALL
SELECT 'Next Tower', 'A', 1 UNION ALL
SELECT 'Next Tower', 'B', 1 UNION ALL
SELECT 'Next Tower', 'C', 1 UNION ALL
SELECT 'Next Tower', 'D', 1 UNION ALL
SELECT 'Next Tower', 'E', 1 UNION ALL
SELECT 'Next Tower', 'F', 1 UNION ALL
SELECT 'Next Tower', 'G', 1 UNION ALL
SELECT 'Next Tower', 'H', 1 UNION ALL
SELECT 'Next Tower', 'I', 1 UNION ALL
SELECT 'Next Tower', 'J', 1;

INSERT INTO employee_login (employee_id, first_name, last_name, password)
SELECT TOP 30
  LEFT(CONVERT(VARCHAR(36), NEWID()), 8),
  first_names.value,
  last_names.value,
  CONVERT(VARBINARY(256), 'password')
FROM 
  (VALUES ('John'), ('Jane'), ('Robert'), ('Mary'), ('David'), ('Amanda'), ('Steven'), ('Karen'), ('Michael'), ('Emily'), ('Jessica'), ('Christopher'), ('Samantha'), ('Daniel'), ('Elizabeth'), ('Matthew'), ('Ashley'), ('William'), ('Olivia'), ('Tyler'), ('Hannah'), ('James'), ('Megan'), ('Nicholas')) first_names(value),
  (VALUES ('Smith'), ('Johnson'), ('Williams'), ('Jones'), ('Brown'), ('Garcia'), ('Miller'), ('Davis'), ('Rodriguez'), ('Martinez'), ('Hernandez'), ('Lopez'), ('Gonzalez'), ('Perez'), ('Taylor'), ('Anderson'), ('Wilson'), ('Jackson'), ('Lee'), ('Lewis'), ('Green'), ('Campbell'), ('Hall'), ('Turner')) last_names(value)
ORDER BY NEWID();
