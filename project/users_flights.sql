select u.login, p.payment_sum, p.payment_dt, f.*
from users u, payments p, flight f
where u.user_id = p.user_id and p.flight_id = f.flight_id
and f.begin_dttm > curdate()