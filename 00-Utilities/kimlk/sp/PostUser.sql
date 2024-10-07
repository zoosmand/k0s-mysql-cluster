DROP PROCEDURE IF EXISTS kimlk.PostUser;
DELIMITER $$
$$
CREATE PROCEDURE kimlk.PostUser(
	_email VARCHAR(256),
	_user JSON,
	_id JSON,
	_auth JSON
)
BEGIN
    DECLARE _errno INT;
    DECLARE _errmsg VARCHAR(256);

    START TRANSACTION;
        INSERT IGNORE INTO users (
            `email`,
            `user`, 
            `id`, 
            `auth`
        ) VALUES (
            _email,
            _user,
            _id,
            _auth
        )
        ;
        GET CURRENT DIAGNOSTICS CONDITION 1 _errno = MYSQL_ERRNO, _errmsg = MESSAGE_TEXT;

    IF (_errno > 0) THEN
        SET @error_message_text = CONCAT('An error occurred: ', _errno, ', Message: ', _errmsg);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @error_message_text;
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END
$$
DELIMITER ;
