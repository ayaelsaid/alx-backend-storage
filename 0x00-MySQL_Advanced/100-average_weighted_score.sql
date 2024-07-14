-- creates a stored procedure that computes and store the average weighted score for a student.


DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN p_user_id INT
)
BEGIN
    DECLARE average_score FLOAT;
    SELECT SUM(corrections.score * projects.weight) / SUM(projects.weight)
    INTO average_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = p_user_id;
    UPDATE users
    SET average_score = average_score
    WHERE id = p_user_id;
    
END $$

DELIMITER ;
