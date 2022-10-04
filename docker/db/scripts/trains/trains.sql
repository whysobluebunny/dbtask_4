CREATE SCHEMA trains;
CREATE TABLE trains.city (
	cname TEXT,
	region TEXT,
	PRIMARY KEY(cname, region)
);

CREATE TABLE trains.station (
	sname TEXT PRIMARY KEY,
	tracks TEXT,
	city_name TEXT,
	city_region TEXT,
	FOREIGN KEY (city_name, city_region) REFERENCES trains.city(cname, region)
);

CREATE TABLE trains.train (
	tnumber INT PRIMARY KEY,
	length INT,
	start_station_name TEXT REFERENCES trains.station(sname),
	end_station_name TEXT REFERENCES trains.station(sname)
);

CREATE TABLE trains.connected (
	from_station_name TEXT REFERENCES trains.station(sname),
	to_station_name TEXT REFERENCES trains.station(sname),
	train_number INT REFERENCES trains.train(tnumber),
	arrival TIMESTAMP,
	departure TIMESTAMP,
	PRIMARY KEY (from_station_name, to_station_name, train_number)
);