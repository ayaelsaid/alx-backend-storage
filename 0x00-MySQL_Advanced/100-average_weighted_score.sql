-- creates a stored procedure that computes and store the average weighted score for a student.
-- Drop the procedure if it already exists to avoid conflicts
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

-- Change the delimiter to handle the procedure definition
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN p_user_id INT
)
BEGIN
    DECLARE avg_score INT;
    SELECT SUM(c.score * p.weight) / SUM(p.weight)
    INTO avg_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = p_user_id;
    UPDATE users
    SET average_score = COALESCE(avg_score, 0)
    WHERE id = p_user_id;
END $$
DELIMITER ;
