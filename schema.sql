-- Create the database
CREATE DATABASE SR_Enterprise;
USE SR_Enterprise;

-- Create Customer Details table
CREATE TABLE Customer_Details (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),  -- Increased length for full names
    email VARCHAR(50) UNIQUE,   -- Email should be unique
    phone_no VARCHAR(15),       -- Changed to VARCHAR for phone numbers
    address VARCHAR(100)        -- Increased length for address
);
ALTER TABLE Customer_Details
CHANGE phone_no phone_no VARCHAR(50);

-- Create Loan table
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    loan_amount DECIMAL(10,2),  -- Using DECIMAL instead of FLOAT
    interest_rate DECIMAL(5,2), -- More precise interest rate
    start_date DATE,
    end_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer_Details(customer_id) ON DELETE CASCADE
);

-- Create Repayments table
CREATE TABLE Repayments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,  -- Auto-increment for unique payments
    loan_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    balance_due DECIMAL(10,2),
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id) ON DELETE CASCADE
);

-- Create Guarantors table
CREATE TABLE Guarantors (
    guarantors_id INT PRIMARY KEY AUTO_INCREMENT, 
    loan_id INT,
    full_name VARCHAR(50),   -- Increased name length
    phone VARCHAR(15),       -- Changed phone to VARCHAR
    relationship VARCHAR(50), 
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id) ON DELETE CASCADE
);
