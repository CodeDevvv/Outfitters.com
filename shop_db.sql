-- Create Database
CREATE DATABASE IF NOT EXISTS shob_db;
USE shob_db;

-- 4.1.1 Admins Table
CREATE TABLE IF NOT EXISTS Admins (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Password VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- 4.1.2 Cart Table
CREATE TABLE IF NOT EXISTS Cart (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    pid INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    image VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(Id),
    FOREIGN KEY (pid) REFERENCES Products(Id)
) ENGINE=InnoDB;

-- 4.1.3 Messages Table
CREATE TABLE IF NOT EXISTS Messages (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    number VARCHAR(12) NOT NULL,
    message VARCHAR(500) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(Id)
) ENGINE=InnoDB;

-- 4.1.4 Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    Name VARCHAR(20) NOT NULL,
    number VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    method VARCHAR(50) NOT NULL,
    address VARCHAR(500) NOT NULL,
    total_products VARCHAR(1000) NOT NULL,
    total_price INT NOT NULL,
    placed_on DATE NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(Id)
) ENGINE=InnoDB;

-- 4.1.5 Products Table
CREATE TABLE IF NOT EXISTS Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    details VARCHAR(500) NOT NULL,
    price INT NOT NULL,
    image_01 VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- 4.1.6 Users Table
CREATE TABLE IF NOT EXISTS Users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    Password VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- 4.1.7 Wishlist Table
CREATE TABLE IF NOT EXISTS Wishlist (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    pid INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    image VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(Id),
    FOREIGN KEY (pid) REFERENCES Products(Id)
) ENGINE=InnoDB;
