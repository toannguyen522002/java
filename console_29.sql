create table Oder_Info(
    id serial primary key ,
    customer_id int,
    order_date date,
    total numeric(10,2),
    status varchar(20)
);
INSERT INTO Oder_Info (customer_id, order_date, total, status) VALUES
                                                                   (1, '2024-10-01', 300000, 'Pending'),
                                                                   (2, '2024-10-05', 750000, 'Completed'),
                                                                   (3, '2024-09-20', 1200000, 'Shipped'),
                                                                   (4, '2024-10-15', 450000, 'Completed'),
                                                                   (5, '2024-10-25', 900000, 'Pending');
select * from Oder_Info
where total>500000;

select * from Oder_Info
where order_date >= '2024-10-1' and order_date <= '2024-10-31';

select * from Oder_Info
where status ='Pending';

select * from Oder_Info
order by order_date desc
limit 2;