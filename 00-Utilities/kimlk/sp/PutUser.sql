DROP PROCEDURE IF EXISTS kimlk.PutUser;
DELIMITER $$
$$
CREATE PROCEDURE kimlk.PutUser(
	_uid INT UNSIGNED,
	_user JSON,
	_id JSON,
	_auth JSON
)
BEGIN
    DECLARE _errno INT;
    DECLARE _errmsg VARCHAR(256);

    START TRANSACTION;
        UPDATE IGNORE users SET
            `user`  = _user, 
            `id`    = _id, 
            `auth`  = _auth
        WHERE `uid` = _uid 
        ;
        SELECT ROW_COUNT() INTO @rc;

    IF (@rc <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No update occured.';
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END
$$
DELIMITER ;
