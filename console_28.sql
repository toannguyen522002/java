create table Employee(
    id serial primary key ,
    full_name varchar(100),
    department varchar(50),
    salary numeric(10,2),
    hire_date Date
);
insert into  employee(id,full_name,department,salary,hire_date)
values (1,'Toàn','1','8000000','2023-3-1'),
       (2,'Hòa','2','7000000','2024-9-12'),
       (3,'Tâm','3','9000000','2025-5-27'),
       (4,'Quang','4','5000000','2023-9-12'),
       (5,'Uyên','5','9000000','2023-3-31'),
       (6,'Phước','6','10000000','2026-7-31');


update employee
set department ='Bảo vệ'
where id = 6;

update employee
set salary= salary*1.1
where department ='IT';
delete  from employee
where salary < 6000000;

select * from employee
where hire_date between '2023-01-01' and '2023-12-31';