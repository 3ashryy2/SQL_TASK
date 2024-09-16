CREATE TABLE Users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role ENUM('customer', 'admin') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categories (
    categoryID INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(255) NOT NULL,
    parentCategoryID INT,
    FOREIGN KEY (parentCategoryID) REFERENCES Categories(categoryID) ON DELETE SET NULL
);

CREATE TABLE Products (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image VARCHAR(255),
    categoryID INT,
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID) ON DELETE CASCADE
);

CREATE TABLE Orders (
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    total DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'shipped', 'delivered') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

CREATE TABLE Order_Items (
    orderItemID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    productID INT,
    quantity INT NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES Products(productID) ON DELETE CASCADE
);

CREATE TABLE Cart (
    cartID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

CREATE TABLE Cart_Items (
    cartItemID INT PRIMARY KEY AUTO_INCREMENT,
    cartID INT,
    productID INT,
    quantity INT NOT NULL,
    FOREIGN KEY (cartID) REFERENCES Cart(cartID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES Products(productID) ON DELETE CASCADE
);

CREATE TABLE Reviews (
    reviewID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    productID INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES Products(productID) ON DELETE CASCADE
);
