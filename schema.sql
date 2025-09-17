-- schema.sql
-- Create database and tables (safe to run repeatedly)
DROP DATABASE IF EXISTS library_db;
CREATE DATABASE library_db;
USE library_db;

-- Members table
CREATE TABLE IF NOT EXISTS members (
  member_id INT PRIMARY KEY AUTO_INCREMENT,
  member_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20)
);

-- Books table
CREATE TABLE IF NOT EXISTS books (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  author VARCHAR(100),
  genre VARCHAR(50),
  available_copies INT DEFAULT 1
);

-- Borrow table
CREATE TABLE IF NOT EXISTS borrow (
  borrow_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT NOT NULL,
  book_id INT NOT NULL,
  borrow_date DATE,
  return_date DATE,
  FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);

