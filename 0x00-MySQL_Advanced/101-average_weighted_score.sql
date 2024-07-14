-- computes and store the average weighted score for all students
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers(
)
BEGIN
    DECLARE average_score FLOAT;

    SELECT AVG(SUM(p.weight) * SUM(c.score)) INTO average_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = p_user_id;

    -- Update the users table with the computed average score
    UPDATE users
    SET average_score = average_score
    WHERE id = p_user_id;
    
END $$

DELIMITER ;
