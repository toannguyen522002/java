create table students(
    id serial primary key ,
    full_name varchar(50) ,
    gender varchar(50),
    birth_year bigint,
    major varchar(20),
    gpa decimal(3,2)
)
alter table students
alter column birth_year type int;
alter table students
alter column gpa set default NULL;
insert into students(id,full_name,gender,birth_year,major,gpa)
values ('1','Nguyễn Văn A','Nam','2002','CNTT','3.6'),
       ('2','Trần Thị Bích Ngọc','Nữ','2001','Kinh tế','3.2'),
       ('3','Lê Quốc Cường','Nam','2003','CNTT','2.7'),
       ('4','Phạm Minh Anh','Nữ','2000','Luật','3.9'),
       ('5','Nguyễn Văn A','Nam','2002','CNTT','3.6'),
       ('6','Lưu Đức Tài','Nam','2004','Cơ khí',  NULL),
       ('7','Võ Thị Thu Hằng','Nữ','2001','CNTT','3.0');
select * from students;
--Thêm sinh viên “Phan Hoàng Nam”, giới tính Nam, sinh năm 2003, ngành CNTT, GPA 3.8
insert into students(id,full_name,gender,birth_year,major,gpa)
values('8','Phan Hoàng Nam','Nam','2003','CNTT','3.8');
--Sinh viên “Lê Quốc Cường” vừa cải thiện học lực, cập nhật gpa = 3.4
update students
set gpa = 3.4
where id = 3;
--Xóa tất cả sinh viên có gpa IS NULL
delete from students
where gpa is NULL;
--Hiển thị sinh viên ngành CNTT có gpa >= 3.0, chỉ lấy 3 kết quả đầu tiên
select * from students
where gpa >= 3
limit 3;
--Liệt kê danh sách ngành học duy nhất
select distinct major from students;
--Hiển thị sinh viên ngành CNTT, sắp xếp giảm dần theo GPA, sau đó tăng dần theo tên
select * from students
where major = 'CNTT'
order by gpa desc , full_name asc ;
--Tìm sinh viên có tên bắt đầu bằng “Nguyễn”
select * from students
where full_name like ('%Nguyễn%');
--Hiển thị sinh viên có năm sinh từ 2001 đến 2003
select * from students
where birth_year >= 2001 and birth_year <= 2003;
