CREATE USER 'username'@'localhost' IDENTIFIED BY 'P@33W0rd';
-- SELECT `user`, `host` FROM `mysql`.`user`;


CREATE TABLE Room (
	id INT NOT NULL AUTO_INCREMENT,
	room_num VARCHAR(50),
	building_name VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE Professor (
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE Class (
	id INT NOT NULL AUTO_INCREMENT,
	year YEAR,
	term VARCHAR(50), -- only SPRING, FALL, SUMMER and WINTER
	course_id INT,
	start_time TIME, -- constraints for diff class in same room at same time
	end_time TIME,
	room_id INT NOT NULL, -- maybe could be NULL since online classes idk
	professor_id INT NOT NULL,
	PRIMARY KEY (id, year, term),
	FOREIGN KEY (room_id) REFERENCES Room(id),
	FOREIGN KEY (professor_id) REFERENCES Professor(id),
	FOREIGN KEY (course_id) REFERENCES Course(id)
);

CREATE TABLE Course ( -- 1, SWE/CSC322
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50)
);

INSERT INTO Room VALUES
	(1, "A");

SELECT * FROM Room;



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