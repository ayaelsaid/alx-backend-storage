-- creates a stored procedure that computes and store the average weighted score for a student.

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    CREATE TEMPORARY TABLE temp_average_scores (
        user_id INT,
        average_score FLOAT
    );
    INSERT INTO temp_average_scores (user_id, average_score)
    SELECT c.user_id, AVG(p.weight * c.score) AS average_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    GROUP BY c.user_id;
    UPDATE users u
    JOIN temp_average_scores tas ON u.id = tas.user_id
    SET u.average_score = tas.average_score;
    DROP TEMPORARY TABLE IF EXISTS temp_average_scores;
END $$

DELIMITER ;
