-- creates a stored procedure that computes and store the average weighted score for a student.
DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (
    IN user_id INT
    )
BEGIN
    DECLARE avg_score FLOAT;
	SELECT SUM(corrections.score * projects.weight) / SUM(projects.weight) AS avg_score
	FROM corrections
	INNER JOIN projects
	ON projects.id = corrections.project_id
	WHERE corrections.user_id = user_id
    UPDATE users SET average_score = avg_score
	WHERE users.id = user_id;
END $$
DELIMITER ;
