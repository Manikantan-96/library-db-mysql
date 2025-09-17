--advanced.sql

USE library_db;

-- Stored procedure (safe transactional borrow)
DELIMITER $$
CREATE PROCEDURE sp_borrow_book(IN p_member INT, IN p_book INT)
BEGIN
  DECLARE copies INT;
  START TRANSACTION;

  SELECT available_copies INTO copies
  FROM books
  WHERE book_id = p_book
  FOR UPDATE;

  IF copies > 0 THEN
    INSERT INTO borrow(member_id, book_id, borrow_date, return_date)
    VALUES (p_member, p_book, CURDATE(), NULL);

    UPDATE books
    SET available_copies = available_copies - 1
    WHERE book_id = p_book;

    COMMIT;
    SELECT 'BORROWED' AS status;
  ELSE
    ROLLBACK;
    SELECT 'NO_COPIES_AVAILABLE' AS status;
  END IF;
END$$
DELIMITER ;

-- Example call (uncomment to test)
-- CALL sp_borrow_book(1, 1);
