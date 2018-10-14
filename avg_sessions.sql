with session_count_per_user as
(
select user_id, COUNT(CAST(begin_dttm as DATE)) as sessions from sessions
group by user_id
)
select AVG(IFNULL(sc.sessions, 0)) from users u LEFT JOIN session_count_per_user sc on u.user_id = sc.user_id