CREATE SCHEMA patients;
CREATE TABLE patients.station (
	snumber INT PRIMARY KEY,
	sname TEXT
);

CREATE TABLE patients.station_personell (
	persnumber INT PRIMARY KEY,
	pname TEXT,
	snumber INT REFERENCES patients.station (snumber)
);

CREATE TABLE patients.caregiver (
	persnumber INT PRIMARY KEY REFERENCES patients.station_personell(persnumber), 
	cname TEXT, 
	snumber INT REFERENCES patients.station (snumber),
	qualification TEXT
);

CREATE TABLE patients.doctor (
	persnumber INT PRIMARY KEY REFERENCES patients.station_personell(persnumber), 
	cname TEXT, 
	snumber INT REFERENCES patients.station (snumber),
	area TEXT,
	drank TEXT
);

CREATE TABLE patients.room (
	rnumber INT PRIMARY KEY,
	beds INT,
	snumber INT REFERENCES patients.station(snumber)
);

CREATE TABLE patients.patient(
	pnumber INT PRIMARY KEY, 
	pname TEXT, 
	disease TEXT,
	admission_room_number INT REFERENCES patients.room (rnumber),
	doctor_number INT REFERENCES patients.doctor (persnumber)
);
 