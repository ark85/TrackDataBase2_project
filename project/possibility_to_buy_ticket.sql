CREATE OR REPLACE VIEW sold_tickets AS
select f.flight_id, sum(IF(pay.payment_sum DIV t.cost > 0, pay.payment_sum DIV t.cost, 1)) as 'ticket_count'
from flights f LEFT JOIN payments pay on f.flight_id = pay.flight_id
LEFT JOIN tickets t on f.ticket_id = t.ticket_id
group by f.flight_id;

select f.flight_id, IF(p.sits > st.ticket_count, TRUE, FALSE)  as 'possibility_to_by_ticket'
from flights f
LEFT JOIN planes p on f.plane_id = p.plane_id
LEFT JOIN sold_tickets st on f.flight_id = st.flight_id