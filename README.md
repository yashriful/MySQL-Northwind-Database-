🏢 Northwind Database Project

A Classic Business Database for SQL Learning

📌 Introduction
The Northwind Database is a popular sample database representing a wholesale trading business. It contains data on customers, orders, products, employees, and suppliers. This project explores various SQL queries for business analysis.

📁 Database Schema
Below is a diagram of the Northwind Database Schema:


(This schema illustrates table relationships in Northwind DB.)

🔍 Key SQL Queries & Screenshots
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

(Displays the top 5 customers with the most orders.)

2️⃣ Find Best-Selling Products
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

(Highlights the top-selling products in the company.)

3️⃣ Employee Sales Performance
sql
Copy
Edit
SELECT e.EmployeeID, e.LastName, COUNT(o.OrderID) AS TotalOrders
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.LastName
ORDER BY TotalOrders DESC;
Output:

(Shows which employees handled the most orders.)

🛠️ How to Set Up the Northwind Database
1️⃣ Download & Install MySQL
2️⃣ Load the Northwind Database

bash
Copy
Edit
mysql -u root -p < northwind.sql
3️⃣ Verify the Database

sql
Copy
Edit
SHOW DATABASES;
USE northwind;
SHOW TABLES;
📊 Future Improvements
✅ Implement views and stored procedures
✅ Create interactive dashboards
✅ Perform advanced business analysis with Python & SQL

📌 Conclusion
This project demonstrates SQL queries and data analysis using MySQL’s Northwind Database. It serves as an excellent resource for learning database management, queries, and business intelligence.

🔹 Built with MySQL 🔹
