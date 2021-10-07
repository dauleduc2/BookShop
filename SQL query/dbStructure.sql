CREATE TABLE bookshop_category (
    categoryId TINYINT PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
)

CREATE TABLE bookshop_product (
    productId INT PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    image VARCHAR (500),
    quantity INT,
    price FLOAT,
    description VARCHAR (MAX),
    publishedDate DATE,
    categoryId TINYINT,
    FOREIGN KEY REFERENCES bookshop_category(categoryId)
)

CREATE TABLE bookshop_role (
    roleId TINYINT PRIMARY KEY,
    roleName VARCHAR (255) NOT NULL,
)

CREATE TABLE bookshop_user (
    userId VARCHAR (30) PRIMARY KEY,
    fullName VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    address VARCHAR(500),
    phone VARCHAR(20),
    password VARCHAR(30) NOT NULL,
    roleId TINYINT FOREIGN KEY REFERENCES bookshop_role(roleId),
)

CREATE TABLE bookshop_order (
    orderId VARCHAR (30) PRIMARY KEY,
    createDate DATE,
    status TINYINT,
    userId VARCHAR (30) FOREIGN KEY REFERENCES bookshop_user(userId),
)

CREATE TABLE bookshop_order_item (
    productId INT FOREIGN KEY REFERENCES bookshop_product(productId),
    orderId VARCHAR (30) FOREIGN KEY REFERENCES bookshop_order(orderId),
    quantity INT,
    price FLOAT,
)