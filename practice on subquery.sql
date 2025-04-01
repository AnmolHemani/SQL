CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    publication_year INT NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_name VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Books (book_id, title, author, genre, price, publication_year) VALUES
(1, 'The Silent Patient', 'Alex Michaelides', 'Thriller', 15.99, 2019),
(2, 'Where the Crawdads Sing', 'Delia Owens', 'Mystery', 18.99, 2018),
(3, 'Atomic Habits', 'James Clear', 'Self-help', 21.50, 2018),
(4, 'The Midnight Library', 'Matt Haig', 'Fiction', 17.25, 2020),
(5, 'Educated', 'Tara Westover', 'Memoir', 14.75, 2018),
(6, 'Becoming', 'Michelle Obama', 'Biography', 22.99, 2018),
(7, 'The Alchemist', 'Paulo Coelho', 'Fiction', 12.99, 1988);

INSERT INTO Orders (order_id, book_id, customer_name, order_date, quantity, total_price) VALUES
(101, 1, 'John Doe', '2023-01-15', 2, 31.98),
(102, 2, 'Jane Smith', '2023-02-10', 1, 18.99),
(103, 3, 'Alice Johnson', '2023-03-05', 3, 64.50),
(104, 4, 'David Brown', '2023-04-12', 1, 17.25),
(105, 1, 'Sophia Wilson', '2023-05-25', 4, 63.96),
(106, 6, 'Michael Lee', '2023-06-08', 2, 45.98),
(107, 3, 'Emma Davis', '2023-07-19', 1, 21.50),
(108, 5, 'Olivia Taylor', '2023-08-01', 2, 29.50),
(109, 7, 'Daniel Martinez', '2023-09-05', 3, 38.97),
(110, 2, 'Lucas White', '2023-10-20', 2, 37.98);

select * from orders;
select * from books;

select * from books where price=(select max(price) from books);

-- find out the customer name who have placed the most expensive order
select * from orders where total_price=(select max(total_price) from orders);

-- find out the book name and the year for the first book published
select * from books where publication_year=(select min( publication_year) from books);

INSERT INTO Books (book_id, title, author, genre, price, publication_year) VALUES
(8, 'The Silent Killer', 'Alex Michaelides', 'Comedy', 15.99, 2020);

-- find out the books  and the price for those that have same price as of atleast one other book
select * from books where price=(select price from books group by price having count(price)>1);
select * from books where price in (select price from books group by price having count(price)>1); -- we use in for multiple records 

-- get those customer who have placed the same book as that of customer name john doe
select * from orders where book_id in (select book_id from orders where customer_name='john doe'); 

INSERT INTO Orders (order_id, book_id, customer_name, order_date, quantity, total_price) VALUES
(111, 2, 'John Doe', '2023-01-15', 5, 50.25);

INSERT INTO Orders (order_id, book_id, customer_name, order_date, quantity, total_price) VALUES
(112, 2, 'Jane Smith', '2023-02-10', 5, 51.25);

-- find the books that have be ordered on multiple different dates
select * from orders where book_id in (select book_id from orders group by book_id having count(distinct order_date)>1);

--  find the book with the second highest price
select * from books where price < (select max(price) from books) order by price desc limit 1;
select * from books where price = (select max(price) from books where price != (select max(price) from books)); -- using subquery 

-- find the books with the lowest quantity sold
select * from orders where book_id = (select book_id from orders group by book_id order by sum(quantity) limit 1);

-- find all the books that were ordered by more than 1 customer
select * from books where book_id in (select book_id from orders group by book_id having count(distinct customer_name)>1); 

-- learning assignment 
-- triggers => what are triggers and types of triggers in sql  

 