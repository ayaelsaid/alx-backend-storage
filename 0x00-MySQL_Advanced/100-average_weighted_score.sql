-- creates a stored procedure that computes and store the average weighted score for a student.
DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

-- Create the stored procedure
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN p_user_id INT
)
BEGIN
    -- Declare variable to hold the computed average score
    DECLARE avg_score INT;

    -- Compute the average weighted score
    SELECT SUM(c.score * p.weight) / SUM(p.weight)
    INTO avg_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = p_user_id;

    -- Update the user's average_score in the users table
    UPDATE users
    SET average_score = IFNULL(avg_score, 0) -- Handle NULL case gracefully
    WHERE id = p_user_id;
END $$

-- Reset the delimiter back to ;
DELIMITER ;
