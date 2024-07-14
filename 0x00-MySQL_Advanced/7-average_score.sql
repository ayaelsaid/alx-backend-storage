-- creates a stored procedure AddBonus that adds a new correction for a student

DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN p_user_id INT
)
BEGIN
    DECLARE average_score FLOAT;
    SELECT AVG(c.score) INTO average_score
    FROM corrections c
    WHERE c.user_id = p_user_id;
    UPDATE users
    SET average_score = average_score
    WHERE id = p_user_id;
    
END $$

DELIMITER ;
