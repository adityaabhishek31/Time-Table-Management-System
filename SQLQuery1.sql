
CREATE TABLE timetable
(
Day VARCHAR(15)  NOT NULL,
 	PNo INT NOT NULL,
 	Start_time TIME NOT NULL,
 	 End_time TIME NOT NULL ,
 	PRIMARY KEY (Day,PNo,Start_time,End_time),
 	CHECK (Start_time < End_time));
 
CREATE TABLE sem_class
(	Sem INT NOT NULL CHECK(sem<=8),
  	Section CHAR NOT NULL,
  Room_No VARCHAR(12) NOT NULL,
  Year INT NOT NULL,
 	PRIMARY KEY (Sem,Section,Room_No));
 
CREATE TABLE course
(	C_Code VARCHAR(10) NOT NULL,
 	C_Name VARCHAR(15) NOT NULL,
 	Credits INT NOT NULL CHECK(Credits<=4),
 	PRIMARY KEY (C_Code),
UNIQUE (C_Name));
 
CREATE TABLE lecturer
(	Initials VARCHAR(10) NOT NULL,
 	Name VARCHAR(15) NOT NULL,
  	Dept VARCHAR(15) NOT NULL,
  	C_Code VARCHAR(10) NOT NULL,
 	PRIMARY KEY (Initials),
 	FOREIGN KEY (C_Code) REFERENCES course(C_Code)
 	ON DELETE CASCADE   ON UPDATE CASCADE);
 
CREATE TABLE assign_to
(	Initials VARCHAR(10) NOT NULL ,
 	C_Code VARCHAR(10) NOT NULL,
 	Sem INT NOT NULL CHECK(sem<=8),
 	Section CHAR NOT NULL,
 	Room_No VARCHAR(12) NOT NULL,
  	Day VARCHAR(15)  NOT NULL,
 	 PNo INT NOT NULL,
  	Start_time TIME NOT NULL ,
 	 End_time TIME NOT NULL ,
 	PRIMARY KEY (Initials,Sem,Section,Room_No,Day,PNo,Start_time,End_time),
 	FOREIGN KEY (Initials) REFERENCES lecturer(Initials)
 	ON DELETE CASCADE   ON UPDATE CASCADE,
  	FOREIGN KEY (Sem,Section,Room_No) REFERENCES sem_class(Sem,Section,Room_No)
  	ON DELETE CASCADE   ON UPDATE CASCADE,
  	FOREIGN KEY (Day,PNo,Start_time,End_time) REFERENCES timetable(Day,PNo,Start_time,End_time)
  	ON DELETE CASCADE   ON UPDATE CASCADE,
  	FOREIGN KEY (C_Code) REFERENCES course(C_Code));
 
CREATE TABLE offers
(	Initials VARCHAR(10) NOT NULL,
 	C_Code VARCHAR(10) NOT NULL,
  	Sem INT NOT NULL CHECK(sem<=8),
 	Section CHAR NOT NULL,
 	Room_No VARCHAR(12) NOT NULL,
 	PRIMARY KEY (Initials,C_Code,Sem,Section,Room_No),
 	FOREIGN KEY (Initials) REFERENCES lecturer(Initials),
  	FOREIGN KEY (C_Code) REFERENCES course(C_Code),
  	FOREIGN KEY (Sem,Section,Room_No) REFERENCES sem_class(Sem,Section,Room_No));
 
CREATE TABLE Holiday
(  	Initials VARCHAR(10) NOT NULL,
   	Name VARCHAR(15) NOT NULL,
   	Startdate DATE NOT NULL,
   	EndDate DATE NOT NULL,
   	days_off INTEGER NOT NULL,
   	PRIMARY KEY(Initials, Name),
   	FOREIGN KEY(Initials) REFERENCES lecturer(Initials));
