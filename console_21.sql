create table products(
    product_id serial primary key ,
    product_name varchar(50),
    category varchar(50)
);
create table orders(
    order_id serial primary key,
    product_id int,
    foreign key (product_id) references products(product_id),
    quantity int,
    total_price decimal(3,2)

);
alter table orders
alter column total_price type int;
insert into products(product_id,product_name,category)
values ('1','Laptop Dell','Electronics'),
       ('2','Iphone 15','Electronics'),
       ('3','Bàn học gỗ','Furniture'),
       ('4','Ghế xoay','Furniture');
insert into orders(order_id,product_id,quantity,total_price)
values ('101','1','2','2200'),
       ('102','2','3','3300'),
       ('103','3','5','2500'),
       ('104','4','4','1600'),
       ('105','1','1','1100');
/*Viết truy vấn hiển thị tổng doanh thu (SUM(total_price)) và số lượng sản phẩm bán được (SUM(quantity)) cho từng nhóm danh mục (category)
Đặt bí danh cột như sau:
total_sales cho tổng doanh thu
total_quantity cho tổng số lượng*/
select
    p.category,
    SUM(o.total_price) as tongdoanhthu,
    sum(o.quantity) as tongsoluong
from orders o
join products p on p.product_id = o.product_id
group by p.category;
--Chỉ hiển thị những nhóm có tổng doanh thu lớn hơn 2000
select
    p.category,
    SUM(o.total_price) as tongdoanhthu,
    sum(o.quantity) as tongsoluong
from orders o
         join products p on p.product_id = o.product_id
group by p.category
having sum(o.total_price) > 2000
order by tongdoanhthu desc ;
--Viết truy vấn con (Subquery) để tìm sản phẩm có doanh thu cao nhất trong bảng orders
--Hiển thị: product_name, total_revenue
SELECT
    p.product_name,
    SUM(o.total_price) AS total_revenue
FROM orders o
         JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(o.total_price) = (
    SELECT MAX(total_revenue)
    FROM (
             SELECT
                 product_id,
                 SUM(total_price) AS total_revenue
             FROM orders
             GROUP BY product_id
         ) AS sub
);
--Viết truy vấn hiển thị tổng doanh thu theo từng nhóm category (dùng JOIN + GROUP BY)
SELECT
    p.category,
    SUM(o.total_price) AS total_revenue
FROM orders o
         JOIN products p ON o.product_id = p.product_id
GROUP BY p.category;



