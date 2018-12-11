select f.flight_id, sum(IF(pay.payment_sum DIV t.cost > 0, pay.payment_sum DIV t.cost, 1)) as 'ticket_count'
from flights f LEFT JOIN payments pay on f.flight_id = pay.flight_id
LEFT JOIN tickets t on f.ticket_id = t.ticket_id
group by f.flight_id;