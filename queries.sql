-- queries.sql
USE library_db;

-- Q1: Show all members who borrowed books (member + title)
SELECT m.member_name, b.title
FROM members m
JOIN borrow bo ON m.member_id = bo.member_id
JOIN books b ON bo.book_id = b.book_id;

-- Q2: Most borrowed book (title and count)
SELECT COUNT(bo.book_id) AS borrowed_count, b.title
FROM borrow bo
JOIN books b ON bo.book_id = b.book_id
GROUP BY b.book_id
ORDER BY borrowed_count DESC
LIMIT 1;

-- Q3: Members who borrowed more than 1 book
SELECT m.member_id, m.member_name, COUNT(bo.borrow_id) AS books_borrowed
FROM members m
JOIN borrow bo ON m.member_id = bo.member_id
GROUP BY m.member_id
HAVING books_borrowed > 1;

-- Q4: Books that are never borrowed
SELECT b.*
FROM books b
LEFT JOIN borrow bo ON b.book_id = bo.book_id
WHERE bo.book_id IS NULL;

-- Q5: Top 2 most popular genres (by borrow count)
SELECT b.genre, COUNT(*) AS times_borrowed
FROM borrow bo
JOIN books b ON bo.book_id = b.book_id
GROUP BY b.genre
ORDER BY times_borrowed DESC
LIMIT 2;

-- Q6: Members who borrowed and have not returned yet
SELECT m.member_name, bk.title, bo.borrow_date
FROM members m
JOIN borrow bo ON m.member_id = bo.member_id
JOIN books bk ON bo.book_id = bk.book_id
WHERE bo.return_date IS NULL;

-- Q7: Create view for borrow transactions (member + book + dates)
-- (Run once; skip if view exists)
CREATE OR REPLACE VIEW v_borrow_transactions AS
SELECT bo.borrow_id, m.member_name, b.title AS book_title, bo.borrow_date, bo.return_date
FROM borrow bo
JOIN members m ON bo.member_id = m.member_id
JOIN books b ON bo.book_id = b.book_id;

-- Q8: Index on book title to speed up searches
CREATE INDEX IF NOT EXISTS idx_books_title ON books(title);

-- Q9: Insert a borrow record: Mani borrows "Java Fundamentals" today
INSERT INTO borrow (member_id, book_id, borrow_date, return_date)
VALUES (
  (SELECT member_id FROM members WHERE member_name = 'Mani' LIMIT 1),
  (SELECT book_id FROM books WHERE title = 'Java Fundamentals' LIMIT 1),
  CURDATE(),
  NULL
);

-- Q10: Decrease available copies for that book (safe update)
UPDATE books
SET available_copies = available_copies - 1
WHERE book_id = (
  SELECT book_id FROM (
    SELECT book_id FROM books WHERE title = 'Java Fundamentals' LIMIT 1
  ) AS t
);

