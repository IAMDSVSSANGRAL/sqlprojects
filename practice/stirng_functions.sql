-- ASCII() FUNCTION 
-- ENGLSIH CHARACTER, STRING -> ASCII INTEGER CODE 
-- UTF 8 CHARACTER --> UNICODE INTEGER 
SELECT ASCII('A');

SELECT ASCII('a');

SELECT ASCII('SDFGH');

SELECT ASCII('Ω');

-- VICE VERSA FOR CHR() FUNCTION 

SELECT CHR(765);

SELECT CHR(97);


-- WAY OF CONCATINATION 
-- 1) OPERATOR ||
SELECT 'VISHAL' ||'@'||'SINGH' fullName;

-- but there is a problem
Select 'Vishal'|| NULL result;
-- operator do not ignore NULL values 

-- solution use concat() function
select concat('vishal',NULL);
-- concat fucntion actually ignores the Null value


select * from customer;

select concat(first_name,' ',last_name) as full_name
from customer
order by full_name;


CREATE TABLE contacts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15)
);

INSERT INTO contacts (name, email, phone) 
VALUES
    ('John Doe', 'john@gmail.com', '123-456-7890'),
    ('Jane Smith', 'jane@example.com', NULL),
    ('Bob Johnson', 'bob@example.com', '555-1234'),
    ('Alice Brown', 'alice@example.com', NULL),
    ('Charlie Davis', 'charlie@example.com', '987-654-3210')
RETURNING *;

select * from contacts;

select concat(name,' ',email,' ',phone)
from contacts;

--format function - it is used like formatted strings in python , where we use some placeholders
-- format(format_string, value1 , value2 ...)

select format('my customer full name  is %s %s','vishal','singh');

--syntax for fomat specifier - %[posiition][flags][width]  

-- position component
select format('my customer full name  is %2$s %1$s','vishal','singh');

--flags -- width  component
select format('my customer full name  is %2$10s %1$-10s|','vishal','singh');

select * from customer;
select format('my customer email id  is %3$s and his full name is %1$s %2$-10s|',first_name,last_name,email)
from customer;


-- use left(string, n or -n) n will bring that much character from string or -n left that much character from the end
select left(first_name,-3)
from customer;

-- length function to find the number of character in string 
-- if we length on null it will return null 

select first_name,length(left(first_name,-3)) as len , length (NULL) null_column
from customer;



-- Function that makes your output look beautifull - Lpad(string, length[,fill])
select lpad('postgres',20,'_');


select lpad('1235',10,'0');

select lpad(123,'8','&');
--issue of type cast arises because it accept string as an input.

select lpad(123::text,'8','*');

select 
concat(first_name,' ',last_name),
sum(amount),
lpad('*',cast(trunc(sum(amount)/10) as int),'*')
from payment
inner join customer
using (customer_id)
group by customer_id
order by sum(amount) desc;


--cast change the data type
--trunc removes all the decimal in the number

