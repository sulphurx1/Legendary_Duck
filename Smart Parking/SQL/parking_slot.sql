CREATE TABLE parking_slots (
location VARCHAR(50) NOT NULL,
slot_name VARCHAR(10) NOT NULL,
is_available BIT NOT NULL,
PRIMARY KEY (location, slot_name)
);

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