create table customers(
    customer_id serial primary key ,
    customer_name varchar(50),
    city varchar(50)

);
create table orders(
    order_id serial primary key ,
    customer_id int,
    foreign key (customer_id) references customers(customer_id),
    order_date date,
    total_price int
);
create table orders_item(
    item_id serial ,
    order_id int,
    foreign key (order_id) references orders(order_id),
    product_id serial,
    PRIMARY KEY (order_id, product_id),
    quantity int,
    price int
);
insert into customers(customer_name, city)
values ('Nguyễn Văn A','Hà Nội'),
       ('Trần Thị B','Đà Nẵng'),
       ('Lê Văn C','Hồ Chí Minh'),
       ('Phạm Thị D','Hà Nội');
alter table orders
alter column order_id type int;
insert into orders(order_id,customer_id,order_date,total_price)
values (101,'1','2025-01-05',3000),
       (102,'2','2025-02-10',1500),
       (103,'1','2025-02-10',2500),
       (104,'3','2025-02-15',4000),
       (105,'4','2025-03-01',800);
alter table orders
alter column customer_id type int;
alter table orders_item
alter column product_id type int;
insert into orders_item(item_id,order_id,product_id,quantity,price)
values (1,101,1,2,1500),
       (2,102,2,1,1500),
       (3,103,3,5,500),
       (4,104,2,4,1000);
SELECT
    c.customer_name,
    SUM(o.total_price) AS total_revenue,
    COUNT(o.order_id) AS order_count
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING SUM(o.total_price) > 2000;
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_price) AS total_revenue
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_price) > (
    SELECT AVG(total_revenue)
    FROM (
             SELECT
                 customer_id,
                 SUM(total_price) AS total_revenue
             FROM orders
             GROUP BY customer_id
         ) AS sub
);
