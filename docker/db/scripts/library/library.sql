CREATE SCHEMA mylibrary;
CREATE TABLE mylibrary.publisher (
	pname TEXT PRIMARY KEY,
	address TEXT
);

CREATE TABLE mylibrary.reader (
	reader_id INT PRIMARY KEY,
	first_name TEXT, 
	last_name TEXT, 
	birthday DATE,
	address TEXT
);

CREATE TABLE mylibrary.book (
	ISBN TEXT PRIMARY KEY,
	title TEXT,
	author TEXT,
	pub_year TEXT,
	page_num INT, 
	publisher_name TEXT REFERENCES mylibrary.publisher(pname)
);

CREATE TABLE mylibrary.category (
	cname TEXT PRIMARY KEY,
	parent_category_name TEXT REFERENCES mylibrary.category(cname)
);

CREATE TABLE mylibrary.book_category (
	ISBN TEXT REFERENCES mylibrary.book(ISBN),
	category_name TEXT REFERENCES mylibrary.category(cname),
	PRIMARY KEY (ISBN, category_name)
);

CREATE TABLE mylibrary.book_copy (
	ISBN TEXT REFERENCES mylibrary.book(ISBN),
	copy_number INT,
	PRIMARY KEY (ISBN, copy_number)
);

CREATE TABLE mylibrary.rent (
	reader_id INT,
	ISBN TEXT, 
	copy_number INT,
	return_date DATE,
	PRIMARY KEY (reader_id, ISBN, copy_number)
);