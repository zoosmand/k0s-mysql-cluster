DROP PROCEDURE IF EXISTS kimlk.GetUsers;
DELIMITER $$
$$
CREATE PROCEDURE kimlk.GetUsers(
	_limit INT UNSIGNED,
	_page INT UNSIGNED
)
BEGIN
    IF (_limit = 0) THEN
        SET _limit = 100;
    END IF;
    
    SELECT 
        JSON_OBJECT(
            'uid', u.uid,
            'email', u.email,
            'user', u.user,
            'id', u.id,
            'auth', u.auth
        ) AS UserData
    FROM users u
    WHERE u.deleted = 0
    LIMIT _page, _limit
    ;
    
END
$$
DELIMITER ;
