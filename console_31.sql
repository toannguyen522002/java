create table book(
    book_id  serial primary key ,
    title varchar(255),
    author varchar(100),
    genre varchar(50),
    price decimal(10,2),
    description TEXT,
    create_at timestamp default current_timestamp
);
INSERT INTO book (title, author, genre, price, description)
VALUES
    ('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 19.99, 'Phần 1 của Harry Potter'),
    ('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Fantasy', 21.99, 'Phần 2 của Harry Potter'),
    ('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 25.50, 'Cuộc phiêu lưu của Bilbo Baggins'),
    ('To Kill a Mockingbird', 'Harper Lee', 'Classic', 18.00, 'Câu chuyện về công lý và phân biệt chủng tộc'),
    ('Clean Code', 'Robert C. Martin', 'Programming', 30.00, 'Hướng dẫn viết code sạch');
create index idx_book_author
on book(author);
select * from book where author ilike '%Rowling%';
create index idx_genre_author
on book(genre);
select * from book
where genre = 'Fantasy';
