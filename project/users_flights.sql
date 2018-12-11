select u.login, p.payment_sum, p.payment_dttm, f.*
from users u, payments p, flights f
where u.user_id = p.user_id and p.flight_id = f.flight_id
and f.begin_dttm > '2018-10-01'