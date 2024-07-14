-- creates a stored procedure that computes and store the average weighted score for a student.

DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE total_weighted_score FLOAT;
    SELECT SUM(c.score * p.weight) INTO total_weighted_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id;
    DECLARE total_users INT;
    SELECT COUNT(DISTINCT user_id) INTO total_users FROM corrections;
    DECLARE average_score FLOAT;
    IF total_users > 0 THEN
        SET average_score = total_weighted_score / total_users;
    ELSE
        SET average_score = 0; -- Default value if no users found
    END IF;
    UPDATE users
    SET average_score = average_score;
    
END $$

DELIMITER ;
