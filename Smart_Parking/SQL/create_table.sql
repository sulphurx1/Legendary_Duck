CREATE TABLE employee_login (
employee_id VARCHAR(15) PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
password varbinary(256)
);

CREATE TABLE employee (
employee_id VARCHAR(15) PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
employee_email VARCHAR(50),
employee_vehicle_type VARCHAR(20),
employee_project VARCHAR(50),
FOREIGN KEY (employee_id) REFERENCES employee_login(employee_id)
);

CREATE TABLE parking_slots (
location VARCHAR(50) NOT NULL,
slot_name VARCHAR(10) NOT NULL,
is_available BIT NOT NULL,
PRIMARY KEY (location, slot_name)
);

CREATE TABLE reservation (
  reservation_id INT PRIMARY KEY IDENTITY(1,1),
  employee_id VARCHAR(15),
  reservation_date DATE,
  reservation_time_in TIME,
  reservation_time_out TIME,
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);
