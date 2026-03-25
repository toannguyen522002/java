create table product(
    id serial primary key ,
    name varchar(50),
    category varchar(50),
    price numeric(10,2),
    stock int,
    manufacturer varchar(50)
);
alter table product
alter column stock set default NULL;
insert into product(id,name,category,price,stock,manufacturer)
values('1','Laptop Dell XPS 13','Laptop','25000000','12','Dell'),
      ('2','Chuột Logitech M90','Phụ kiện','150000','50','Logitech'),
      ('3','Bàn phím cơ Razer','Phụ kiện','2200000',NULL,'Razer'),
      ('4','Macbook Air M2','Laptop','32000000','7','Apple'),
      ('5','iPhone 14 Pro Max','Điện thoại','35000000','15','Apple'),
      ('6','Laptop Dell XPS 13','Laptop','25000000','12','Dell'),
      ('7','Tai nghe AirPods 3','Phụ kiện','4500000',NULL,'Apple');
select * from product;
update product
set stock = 0
where id = 3;
update product
set category = 'Laptop', price ='25000000'
where id = 1;

--Thêm sản phẩm “Chuột không dây Logitech M170”, loại Phụ kiện, giá 300000, tồn kho 20, hãng Logitech
insert into product(id,name,category,price,stock,manufacturer)
values('8','Chuột không dây Logitech M170','Phụ kiện','300000','20','Logitech')
--Tăng giá tất cả sản phẩm của Apple thêm 10%
update product
set price = price * 1.1
where manufacturer = 'Apple';
--Xóa sản phẩm có stock = 0
delete from product
where stock = 0;
--Hiển thị sản phẩm có price BETWEEN 1000000 AND 30000000
select * from product
where price BETWEEN 1000000 AND 30000000;
--Hiển thị sản phẩm có stock IS NULL
select * from product
where stock isnull ;
--Liệt kê danh sách hãng sản xuất duy nhất
select distinct product.manufacturer from product;
--Hiển thị toàn bộ sản phẩm, sắp xếp giảm dần theo giá, sau đó tăng dần theo tên
select * from product
order by  price desc, name asc ;
--Tìm sản phẩm có tên chứa từ “laptop” (không phân biệt hoa thường)
select * from product
where  category ilike('%laptop%')
--Lấy về 2 sản phẩm đầu tiên sau khi sắp xếp theo giá giảm dần .
select * from product
order by price desc
limit 2;





