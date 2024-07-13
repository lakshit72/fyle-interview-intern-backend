-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH TeacherAssignmentCounts AS (
    SELECT
        teacher_id,
        COUNT(id) AS total_assignments
    FROM
        assignments
    GROUP BY
        teacher_id
    ORDER BY
        total_assignments DESC
    LIMIT 1
)

SELECT
    COUNT(a.id) AS grade_a_count
FROM
    assignments a
JOIN
    TeacherAssignmentCounts t
ON
    a.teacher_id = t.teacher_id
WHERE
    a.grade = 'A';
