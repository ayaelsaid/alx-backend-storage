-- creates a stored procedure that computes and store the average weighted score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (
    IN p_user_id INT
)
BEGIN
    DECLARE avg_score FLOAT;
    SELECT SUM(c.score * p.weight) / SUM(p.weight)
    INTO avg_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = p_user_id;
    UPDATE users
    SET average_score = avg_score
    WHERE id = p_user_id;
END $$
DELIMITER ;
