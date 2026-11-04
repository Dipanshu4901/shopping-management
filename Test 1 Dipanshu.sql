Drop database if exists Shopping_management;
create database Shopping_management;
use Shopping_management;

select *from customer;

Create table customer(
Customer_Id Int primary key auto_increment,
Customer_name varchar(100) not null,
Email varchar(100) unique, 
Phone_number char(10) unique,
Age tinyint unsigned check (age>0),
Gender enum('Male', 'Female', 'Other'),
Country varchar(50) default 'India',
City varchar(50) not null, 
Pincode char(6) default '201301', 
Registration_date date default (current_date),
Registration_time time default (current_time),
Created_at timestamp default (current_timestamp),
Address varchar(250),
Customer_status enum('Active', 'Inactive', 'Blocked') default 'Active',
Customer_notes tinytext
);

INSERT INTO customer(Customer_Name, Email, Phone_Number, Age, Gender, City, Address)
VALUES
('Dipanshu Yadav','deep@gmail.com','9311011675',25,'Male','Noida','Sector 62'),
('Aanchal Khurana','aanchal.kkhurana@gmail.com','9643786415',21,'Female','Delhi','Uttam Nagar'),
('Sarthak Soni','Sarthak@gmail.com','9547136540',24,'Male','Parthala','Greater Noida'),
('Durgesh Yadav','durgesh@gmail.com','7011654210',23,'Male','Khora','Ghaziabad');

CREATE TABLE orders (
    Order_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,
    Order_Status ENUM('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
    Payment_Method ENUM('Cash','Card','UPI','Net Banking'),
    Payment_Status ENUM('Pending','Paid','Failed') DEFAULT 'Pending',
    Shipping_Address VARCHAR(250) NOT NULL,
    Delivery_Pincode CHAR(6),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATE DEFAULT NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tracking_Number VARCHAR(30) UNIQUE,
    Delivery_Status ENUM('Not Dispatched','In Transit','Delivered','Returned')
        DEFAULT 'Not Dispatched',
    Order_Notes TINYTEXT,

    CONSTRAINT fk_customer
    FOREIGN KEY (Customer_Id)
    REFERENCES customers(Customer_Id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);