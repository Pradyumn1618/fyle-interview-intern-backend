-- Write query to find the number of grade A's given by the teacher who has graded the most assignments

SELECT COUNT(grade) AS grade_A_count
FROM assignments
WHERE grade = 'A'
AND teacher_id = (
    SELECT teacher_id
    FROM (
        SELECT teacher_id, COUNT(*) AS graded_count
        FROM assignments
        WHERE state = 'GRADED'
        GROUP BY teacher_id
        ORDER BY COUNT(*) DESC
        LIMIT 1
    ) AS max_grading_teacher
);

