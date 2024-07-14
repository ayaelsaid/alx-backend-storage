-- creates a stored procedure that computes and store the average weighted score for a student.

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users u
    JOIN (
        SELECT u.id, SUM(c.score * p.weight) / SUM(p.weight) AS weight_avg
        FROM users u
        JOIN corrections c ON u.id = c.user_id
        JOIN projects p ON c.project_id = p.id
        GROUP BY u.id
    ) AS weighted_avg ON u.id = weighted_avg.id
    SET u.average_score = weighted_avg.weight_avg;
END $$

DELIMITER ;
