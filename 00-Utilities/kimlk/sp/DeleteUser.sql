DROP PROCEDURE IF EXISTS kimlk.DeleteUser;
DELIMITER $$
$$
CREATE PROCEDURE kimlk.DeleteUser(
	_uid INT UNSIGNED
)
BEGIN
    DECLARE _current_email VARCHAR(256);

    SELECT u.email INTO _current_email FROM users u WHERE u.uid = _uid;

    START TRANSACTION;
        UPDATE IGNORE users SET
            `deleted` = 1,
            `email` = CONCAT('###', FLOOR(RAND()*1000000000), '###', _current_email) 
        WHERE `uid` = _uid
        AND `deleted` = 0
        ;
        SELECT ROW_COUNT() INTO @rc;

    IF (@rc <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No deletion occured.';
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END
$$
DELIMITER ;
