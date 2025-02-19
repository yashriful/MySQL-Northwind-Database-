📊 Northwind Database Project
📌 Introduction
The Northwind Database is a classic sample database that simulates a company's sales operations, including customers, orders, products, employees, and suppliers. This project explores various SQL queries and database operations.

📁 Database Schema
Below is a diagram of the Northwind Database Schema, showing table relationships.


(Screenshot of the database schema with table relationships.)

🔍 Queries & Screenshots
1️⃣ Retrieve Top 5 Customers by Order Count
sql
Copy
Edit
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
ORDER BY OrderCount DESC
LIMIT 5;
Output:

(Displays the top 5 customers who have placed the most orders.)

2️⃣ Get Employee Sales Performance
sql
Copy
Edit
SELECT e.EmployeeID, e.LastName, COUNT(o.OrderID) AS TotalOrders
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.LastName
ORDER BY TotalOrders DESC;
Output:

(Shows the number of orders handled by each employee.)

3️⃣ Find Most Popular Products
sql
Copy
Edit
SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC
LIMIT 5;
Output:

(Highlights the top-selling products in the database.)

🛠️ How to Run the Project
Install MySQL or PostgreSQL.
Download the Northwind Database and import it into your SQL environment.
Run the provided SQL scripts.
📌 Conclusion
This project demonstrates SQL queries to analyze business performance using the Northwind Database. Future improvements may include stored procedures, views, and optimizations.
