select user_id, SUM(payment_sum) as user_payment
from payments
group by user_id
order by user_payment DESC
LIMIT 3