CREATE DATABASE petshop;
       USE petshop;
CREATE TABLE account (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         username VARCHAR(255) NOT NULL,
                         password VARCHAR(255),
                         email VARCHAR(255),
                         address VARCHAR(255),
                         role INT,
                         phone VARCHAR(15),
                         status INT DEFAULT 0;
);
CREATE TABLE revenue (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         date DATE,
                         amount DOUBLE
);