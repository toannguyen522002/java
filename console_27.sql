create table customer(
    id serial primary key ,
    name varchar(50),
    email varchar(50),
    phone varchar(20),
    points int
);
INSERT INTO customer (name, email, phone, points) VALUES
                                                   ('Nguyễn Văn An', 'an.nguyen@gmail.com', '0901234567', 120),
                                                   ('Trần Thị Bình', 'binh.tran@gmail.com', '0912345678', 250),
                                                   ('Lê Văn Cường', 'cuong.le@gmail.com', '0923456789', 80),
                                                   ('Phạm Thị Dung', 'dung.pham@gmail.com', '0934567890', 300),
                                                   ('Hoàng Minh Anh', null, '0945678901', 150),
                                                   ('Đỗ Văn An', 'an.do@gmail.com', '0956789012', 200),
                                                   ('Nguyễn Thị Lan', 'lan.nguyen@gmail.com', '0967890123', 90);

select distinct name from customer;
select * from customer
where email isnull ;
select * from customer
order by points desc
limit 3
offset 1;

select * from customer
order by name desc ;
