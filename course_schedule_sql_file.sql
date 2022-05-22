USE course_schedule;

CREATE USER 'username'@'localhost' IDENTIFIED BY 'P@33W0rd';
-- SELECT `user`, `host` FROM `mysql`.`user`;


CREATE TABLE Room (
	room_id INT NOT NULL AUTO_INCREMENT UNIQUE,
	room_num INT,
	building_name VARCHAR(50),
	PRIMARY KEY (room_id)
);

CREATE TABLE Professor (
	professor_id INT NOT NULL AUTO_INCREMENT UNIQUE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	PRIMARY KEY (professor_id)
);

CREATE TABLE Course ( -- 1, SWE/CSC322
	course_id INT NOT NULL AUTO_INCREMENT UNIQUE,
	course_num INT NOT NULL, -- 336, 322 in CSC
	department VARCHAR(50), -- like CSC, ANTH
	title VARCHAR(50), -- like, Database Systems
	PRIMARY KEY (course_num, department)
);


-- assume every term one room goes to one section, and
-- start_time and end_time are the same for every days_of_the_week
-- Note: start_time, end_time, and days_of_the_week can be any values.

CREATE TABLE Class (
	section_id INT NOT NULL,
	room_id INT NOT NULL,
	course_id INT,
	year YEAR,
	term VARCHAR(10) CHECK (term in ("SPRING", "FALL", "SUMMER", "WINTER")),
	professor_id INT NOT NULL,
	start_time TIME,
	end_time TIME,
	days_of_the_week VARCHAR(6), -- MTWRFS = monday to saturday
	PRIMARY KEY (section_id, year, term, room_id),
	FOREIGN KEY (room_id) REFERENCES Room(room_id),
	FOREIGN KEY (professor_id) REFERENCES Professor(professor_id),
	FOREIGN KEY (course_id) REFERENCES Course(course_id)
);


-- Insert Examples:

-- INSERT INTO Course (course_num, department, title) VALUES (336, "CSC", "Database Systems");
-- INSERT INTO Room (room_num, building_name) VALUES (1, "NAC");
-- INSERT INTO Professor (first_name, last_name) VALUES ("A", "B");

-- INSERT INTO Class VALUES 
-- 	(0, 1, 1, "2022", "SPRING", 1, "12:00:00", "14:00:00", "TR");


-- SELECT * FROM Course;
-- SELECT * FROM Professor;
-- SELECT * FROM Room;
-- SELECT * FROM Class;


-- priviliges for Room
GRANT SELECT ON `course_schedule`.`Room` TO 'username'@'localhost';
GRANT INSERT ON `course_schedule`.`Room` TO 'username'@'localhost';
GRANT DELETE ON `course_schedule`.`Room` TO 'username'@'localhost';
GRANT UPDATE ON `course_schedule`.`Room` TO 'username'@'localhost';

-- priviliges for Class
GRANT SELECT ON `course_schedule`.`Class` TO 'username'@'localhost';
GRANT INSERT ON `course_schedule`.`Class` TO 'username'@'localhost';
GRANT DELETE ON `course_schedule`.`Class` TO 'username'@'localhost';
GRANT UPDATE ON `course_schedule`.`Class` TO 'username'@'localhost';

-- priviliges for Professor
GRANT SELECT ON `course_schedule`.`Professor` TO 'username'@'localhost';
GRANT INSERT ON `course_schedule`.`Professor` TO 'username'@'localhost';
GRANT DELETE ON `course_schedule`.`Professor` TO 'username'@'localhost';
GRANT UPDATE ON `course_schedule`.`Professor` TO 'username'@'localhost';

-- priviliges for Professor
GRANT SELECT ON `course_schedule`.`Professor` TO 'username'@'localhost';
GRANT INSERT ON `course_schedule`.`Professor` TO 'username'@'localhost';
GRANT DELETE ON `course_schedule`.`Professor` TO 'username'@'localhost';
GRANT UPDATE ON `course_schedule`.`Professor` TO 'username'@'localhost';

-- SHOW GRANTS FOR 'username'@'localhost';

-- DROP TABLE Class;
-- DROP TABLE Course;
-- DROP TABLE Professor;
-- DROP TABLE Room;
