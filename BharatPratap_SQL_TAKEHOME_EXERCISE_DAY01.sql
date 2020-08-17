use hr;
-- take home1

select * from locations;
-- question 1
select location_id, city from locations where state_province is null;

select * from jobs;
-- question 2
select job_id, job_title, min_salary, max_salary from jobs where max_salary > 10000;

select * from departments;
-- question 3
select department_id,department_name,
  Manager_id from departments where manager_id > 200 and  
  location_id = 2400;

select * from jobs;
-- question 4
select job_title from jobs where min_salary > 8000 and max_salary < 20000;

select * from departments;
-- question 5
select * from departments where location_id = 1700 and manager_id is not null;

use orders;
select * from product;
-- question 6
select PRODUCT_ID, PRODUCT_DESC, PRODUCT_CLASS_CODE, PRODUCT_PRICE
from product where PRODUCT_CLASS_CODE in(2050, 2053, 2055);

select * from order_header;
-- question 7
select CUSTOMER_ID, ORDER_ID, ORDER_DATE, ORDER_SHIPMENT_DATE from order_header 
where ORDER_SHIPMENT_DATE is not null order by CUSTOMER_ID asc, ORDER_DATE desc;

select * from product;
-- question 8
select * from product where PRODUCT_CLASS_CODE = 2050 and PRODUCT_QUANTITY_AVAIL >= 15 and PRODUCT_PRICE between 10000 and 35000;

select * from order_header;
-- question 9
select * from order_header where ORDER_STATUS not in ('Shipped');

-- question 10
select * from order_header
where ORDER_STATUS in ('Shipped') and PAYMENT_MODE = 'Credit Card' or PAYMENT_MODE = 'Net Banking' and PAYMENT_DATE > date_format('2013-01-01','%y-%m-%d');