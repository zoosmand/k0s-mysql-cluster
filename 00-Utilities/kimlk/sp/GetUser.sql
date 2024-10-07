DROP PROCEDURE IF EXISTS kimlk.GetUser;
DELIMITER $$
$$
CREATE PROCEDURE kimlk.GetUser(
	_uid INT UNSIGNED
)
BEGIN
    SELECT 
        JSON_OBJECT(
            'uid', u.uid,
            'email', u.email,
            'user', u.user,
            'id', u.id,
            'auth', u.auth
        ) AS UserData
    FROM users u
    WHERE u.uid = _uid
    AND u.deleted = 0
    ;

END
$$
DELIMITER ;
