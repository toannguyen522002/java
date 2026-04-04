create table Product(
    id serial primary key ,
    name varchar(100),
    category varchar(50),
    price numeric(10,2),
    stock int
);
insert into Product(id,name,category,price,stock)
values (  '1','Iphone 14 promax','Điện thoại','25000000','3' ),
       (2,'Apple watch Seri 10','Đồng Hồ','12000000','5'),
       ('3','Tivi LG','Tivi','10000000','7'),
       ('4','Airpod 3','Tai nghe','7000000','6'),
       ('5','Màn hình Asus','Màn hình','14000000','2');

select * from Product;
select name,price from Product
order by  price desc
limit 3;


select Product.category,Product.price from product
where Product.category='Điện thoại' and price > 10000000;

select Product.stock,Product.name from product
order by stock asc