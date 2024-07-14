-- computes and store the average weighted score for all students
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    CREATE TEMPORARY TABLE temp_average_scores (
        user_id INT,
        weight_avg FLOAT
    );
    INSERT INTO temp_average_scores (user_id, weight_avg)
    SELECT c.user_id, SUM(c.score * p.weight) / SUM(p.weight) AS weight_avg
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    GROUP BY c.user_id;
    UPDATE users u
    JOIN temp_average_scores tas ON u.id = tas.user_id
    SET u.average_score = tas.weight_avg;
    DROP TEMPORARY TABLE IF EXISTS temp_average_scores;
END $$

DELIMITER ;
