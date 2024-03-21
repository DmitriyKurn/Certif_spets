DELIMITER $$

CREATE FUNCTION formatSeconds(seconds INT) RETURNS VARCHAR(255)

BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE message VARCHAR(255);
    SET days = seconds DIV (60 * 60 * 24);
    SET seconds = seconds MOD (60 * 60 * 24);
	SET hours = seconds DIV (60 * 60);
    SET seconds = seconds MOD (60 * 60);
    SET minutes = seconds DIV 60;
    SET seconds = seconds MOD 60;
    SET message = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    RETURN message;
END$$

DELIMITER ;
DELIMITER $$

CREATE FUNCTION getEvenNumbers() RETURNS VARCHAR(255)

BEGIN
    DECLARE i INT;
    DECLARE evenNumbers VARCHAR(255);
    SET i = 1;
    SET evenNumbers = '';
    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SET evenNumbers = CONCAT(evenNumbers, i, ',');
        END IF;
		SET i = i + 1;
    END WHILE;
    RETURN SUBSTRING(evenNumbers, 1, LENGTH(evenNumbers) - 1);
END$$

DELIMITER ;
SELECT formatSeconds(123456);

SELECT getEvenNumbers();