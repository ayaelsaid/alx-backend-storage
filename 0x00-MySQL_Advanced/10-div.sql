-- function SafeDiv that divides (and returns) the first by the second number

DELIMITER $$

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result INT;

    IF b = 0 THEN
        RETURN 0;
    END IF;

    SET result = a / b

    RETURN result;
END $$

DELIMITER ;
