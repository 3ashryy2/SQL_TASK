### **1. Users**

#### **NoSQL Structure (MongoDB)**

```json
{
  "_id": "ObjectId",
  "username": "string",
  "password": "string",
  "email": "string",
  "role": "customer" | "admin",
  "created_at": "ISODate"
}
```

#### **Relational Mapping:**

| Column Name  | Data Type         | Constraints                |
|--------------|-------------------|----------------------------|
| `userID`     | INT (Primary Key)  | AUTO_INCREMENT             |
| `username`   | VARCHAR(255)       | UNIQUE, NOT NULL           |
| `password`   | VARCHAR(255)       | NOT NULL                   |
| `email`      | VARCHAR(255)       | UNIQUE, NOT NULL           |
| `role`       | ENUM('customer', 'admin') | DEFAULT 'customer'  |
| `created_at` | TIMESTAMP          | DEFAULT CURRENT_TIMESTAMP  |

---

### **2. Categories**

#### **NoSQL Structure (MongoDB)**

```json
{
  "_id": "ObjectId",
  "categoryName": "string",
  "parentCategoryID": "ObjectId" | null
}
```

#### **Relational Mapping:**

| Column Name       | Data Type         | Constraints                |
|-------------------|-------------------|----------------------------|
| `categoryID`      | INT (Primary Key)  | AUTO_INCREMENT             |
| `categoryName`    | VARCHAR(255)       | NOT NULL                   |
| `parentCategoryID`| INT               | NULLABLE (Foreign Key)      |

---

### **3. Products**

#### **NoSQL Structure (MongoDB)**

```json
{
  "_id": "ObjectId",
  "productName": "string",
  "description": "string",
  "price": "decimal",
  "image": "string",
  "category": {
    "_id": "ObjectId",
    "categoryName": "string"
  },
  "reviews": [
    {
      "user_id": "ObjectId",
      "rating": "int",
      "comment": "string",
      "created_at": "ISODate"
    }
  ]
}
```

#### **Relational Mapping:**

| Column Name       | Data Type          | Constraints                |
|-------------------|--------------------|----------------------------|
| `productID`       | INT (Primary Key)   | AUTO_INCREMENT             |
| `productName`     | VARCHAR(255)        | NOT NULL                   |
| `description`     | TEXT                |                            |
| `price`           | DECIMAL(10, 2)      | NOT NULL                   |
| `image`           | VARCHAR(255)        |                            |
| `categoryID`      | INT                 | Foreign Key                |

For **Reviews**:

| Column Name       | Data Type          | Constraints                |
|-------------------|--------------------|----------------------------|
| `reviewID`        | INT (Primary Key)   | AUTO_INCREMENT             |
| `userID`          | INT                 | Foreign Key                |
| `productID`       | INT                 | Foreign Key                |
| `rating`          | INT                 | CHECK (rating BETWEEN 1-5) |
| `comment`         | TEXT                |                            |
| `created_at`      | TIMESTAMP           | DEFAULT CURRENT_TIMESTAMP  |

---

### **4. Orders**

#### **NoSQL Structure (MongoDB)**

```json
{
  "_id": "ObjectId",
  "user_id": "ObjectId",
  "products": [
    {
      "product_id": "ObjectId",
      "quantity": "int"
    }
  ],
  "total": "decimal",
  "status": "pending" | "shipped" | "delivered",
  "created_at": "ISODate"
}
```

#### **Relational Mapping:**

| Column Name       | Data Type          | Constraints                |
|-------------------|--------------------|----------------------------|
| `orderID`         | INT (Primary Key)   | AUTO_INCREMENT             |
| `userID`          | INT                 | Foreign Key                |
| `total`           | DECIMAL(10, 2)      | NOT NULL                   |
| `status`          | ENUM('pending', 'shipped', 'delivered') | DEFAULT 'pending'  |
| `created_at`      | TIMESTAMP           | DEFAULT CURRENT_TIMESTAMP  |

For **Order_Items**:

| Column Name       | Data Type          | Constraints                |
|-------------------|--------------------|----------------------------|
| `orderItemID`     | INT (Primary Key)   | AUTO_INCREMENT             |
| `orderID`         | INT                 | Foreign Key                |
| `productID`       | INT                 | Foreign Key                |
| `quantity`        | INT                 | NOT NULL                   |

---

### **5. Cart**

#### **NoSQL Structure (MongoDB)**

```json
{
  "_id": "ObjectId",
  "user_id": "ObjectId",
  "products": [
    {
      "product_id": "ObjectId",
      "quantity": "int"
    }
  ],
  "created_at": "ISODate"
}
```

#### **Relational Mapping:**

| Column Name       | Data Type          | Constraints                |
|-------------------|--------------------|----------------------------|
| `cartID`          | INT (Primary Key)   | AUTO_INCREMENT             |
| `userID`          | INT                 | Foreign Key                |
| `created_at`      | TIMESTAMP           | DEFAULT CURRENT_TIMESTAMP  |

For **Cart_Items**:

| Column Name       | Data Type          | Constraints                |
|-------------------|--------------------|----------------------------|
| `cartItemID`      | INT (Primary Key)   | AUTO_INCREMENT             |
| `cartID`          | INT                 | Foreign Key                |
| `productID`       | INT                 | Foreign Key                |
| `quantity`        | INT                 | NOT NULL                   |

---
