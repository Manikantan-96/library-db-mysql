--views_indexes.sql

USE library_db;

-- View (already created in queries.sql as v_borrow_transactions)
CREATE OR REPLACE VIEW v_borrow_transactions AS
SELECT bo.borrow_id, m.member_name, b.title AS book_title, bo.borrow_date, bo.return_date
FROM borrow bo
JOIN members m ON bo.member_id = m.member_id
JOIN books b ON bo.book_id = b.book_id;

-- Index (already created in queries.sql)
CREATE INDEX IF NOT EXISTS idx_books_title ON books(title);


