create or replace view dau as WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 1 DAY
      FROM cte
     WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT cte.dt, COUNT(distinct user_id) AS dau
  FROM cte LEFT JOIN sessions ON cte.dt = CAST(begin_dttm AS DATE)
 GROUP BY cte.dt
 ORDER BY cte.dt;
 
select dau.dt,
(
	select count(distinct user_id) 
    from sessions 
    where CAST(begin_dttm as DATE) between dau.dt - 7 and dau.dt
) as wau from dau
where dayofweek(dau.dt) = 7;