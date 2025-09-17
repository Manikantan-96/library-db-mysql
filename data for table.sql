-- data.sql
USE library_db;

-- Members
INSERT INTO members (member_name, email, phone) VALUES
('Mani', 'mani@example.com', '9876500001'),
('Kantan', 'kantan@example.com', '9876500002'),
('Anitha', 'anitha@example.com', '9876500003'),
('Ravi', 'ravi@example.com', '9876500004');

-- Books
INSERT INTO books (title, author, genre, available_copies) VALUES
('Java Fundamentals', 'James Gosling', 'Programming', 5),
('DBMS Concepts', 'Elliot T.', 'Database', 3),
('Spring Boot Guide', 'P. Dev', 'Programming', 4),
('Python Crash Course', 'Eric Matthes', 'Programming', 2),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fiction', 3);

-- Borrow records (some returned, some not)
INSERT INTO borrow (member_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2025-09-01', NULL),
(1, 2, '2025-09-05', '2025-09-10'),
(2, 2, '2025-09-07', NULL),
(3, 4, '2025-09-12', NULL),
(1, 5, '2025-07-20', '2025-08-01');


---
