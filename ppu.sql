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

create or replace view payments_per_day as WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM payments
        UNION ALL
	SELECT dt + INTERVAL 1 DAY
      FROM cte
     WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) FROM payments)
)
SELECT cte.dt, COUNT(distinct user_id) AS pay_count
  FROM cte LEFT JOIN payments ON cte.dt = CAST(payment_dttm AS DATE)
 GROUP BY cte.dt
 ORDER BY cte.dt;
 
select dau.dt, IFNULL(ppd.pay_count, 0) / dau.dau
from dau left join payments_per_day ppd on dau.dt = ppd.dt;