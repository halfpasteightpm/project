CREATE TRIGGER check_duplicate_email_phone
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM customers WHERE email = NEW.email OR phone = NEW.phone) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate entry for email or phone';
    END IF;
END;

CREATE TRIGGER check_phone_length
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.phone) != 11 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be exactly 11 characters long';
    END IF;
END;
