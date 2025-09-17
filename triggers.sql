--triggers.sql

USE library_db;

-- Trigger: before insert on borrow -> decrease available copies for the borrowed book
DELIMITER $$
CREATE TRIGGER trg_borrow_before_insert
BEFORE INSERT ON borrow
FOR EACH ROW
BEGIN
  UPDATE books
  SET available_copies = available_copies - 1
  WHERE book_id = NEW.book_id;
END$$
DELIMITER ;

-- Trigger: after update on borrow -> if return_date changed from NULL to NOT NULL, increment copies
DELIMITER $$
CREATE TRIGGER trg_borrow_after_update
AFTER UPDATE ON borrow
FOR EACH ROW
BEGIN
  IF OLD.return_date IS NULL AND NEW.return_date IS NOT NULL THEN
    UPDATE books
    SET available_copies = available_copies + 1
    WHERE book_id = NEW.book_id;
  END IF;
END$$
DELIMITER ;
