CREATE USER 'username'@'localhost' IDENTIFIED BY 'P@33W0rd';
-- SELECT `user`, `host` FROM `mysql`.`user`;


CREATE TABLE Room (
	room_id INT NOT NULL AUTO_INCREMENT UNIQUE,
	room_num VARCHAR(50),
	building_name VARCHAR(50),
	PRIMARY KEY (room_id)
);

CREATE TABLE Professor (
	professor_id INT NOT NULL AUTO_INCREMENT UNIQUE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	PRIMARY KEY (professor_id)
);

-- assume every term one room goes to one section.
CREATE TABLE ClassSection (
	section_id INT NOT NULL AUTO_INCREMENT UNIQUE, -- like a section id
	course_id INT,
	year YEAR,
	term VARCHAR(10) CHECK (term in ("SPRING", "FALL", "SUMMER", "WINTER")),
	room_id INT NOT NULL,
	professor_id INT NOT NULL,
	PRIMARY KEY (section_id),
	FOREIGN KEY (room_id) REFERENCES Room(room_id),
	FOREIGN KEY (professor_id) REFERENCES Professor(professor_id),
	FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Course ( -- 1, SWE/CSC322
	course_id INT NOT NULL AUTO_INCREMENT UNIQUE,
	course_num INT NOT NULL, -- 336, 322 in CSC
	department VARCHAR(50), -- like CSC, ANTH
	title VARCHAR(50),
	PRIMARY KEY (course_num, department)
);

INSERT INTO Room VALUES
	(1, "A");

SELECT * FROM Room;

-- DROP TABLE Course;
-- DROP TABLE Professor;
-- DROP TABLE ClassSection;



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

SHOW GRANTS FOR 'username'@'localhost';