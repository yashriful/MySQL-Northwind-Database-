use northwind;
-- Joins
select Customers.CustomerName, Orders.OrderID
from Orders -- left 
inner join Customers -- right table 
on Orders.CustomerID = Customers.CustomerID;

select Customers.CustomerName, Orders.OrderID
from Customers -- left 
inner join Orders -- right table 
on Orders.CustomerID = Customers.CustomerID;

-- Find out shippers for different orders
select *
from Orders
inner join Shippers
on Orders.ShipperID = Shippers.ShipperID;

-- Find out shippers for different orders
select Orders.OrderID, Shippers.ShipperID, Shippers.ShipperName
from Orders
inner join Shippers
on Orders.ShipperID = Shippers.ShipperID;


SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

-- The following SQL statement selects all products with thier suppliers:
select *
from Products
inner join Suppliers
on Products.SupplierId = Suppliers.SupplierID;

select Products.ProductName, Suppliers.SupplierName
from Suppliers
inner join Products
on Products.SupplierId = Suppliers.SupplierID;

-- The following SQL statement selects all products for supplier G'day, Mate:
select Products.ProductName, Suppliers.SupplierName
from Suppliers
inner join Products
on Products.SupplierId = Suppliers.SupplierID
where Suppliers.SupplierName = "G'day, Mate";

-- Write a query to list the employees who handled each order, along with the order date.
SELECT Orders.OrderID, Orders.OrderDate, Employees.FirstName, Employees.LastName 
FROM Orders 
JOIN Employees 
ON Orders.EmployeeID = Employees.EmployeeID;

-- Write a query to find all orders shipped by a specific shipper (e.g., ShipperName = 'Speedy Express').
SELECT orders.OrderID,shippers.ShipperName 
FROM orders 
INNER JOIN shippers 
ON orders.ShipperID = shippers.ShipperID 
WHERE shippers.Shippername ="Speedy Express";

-- Write a query to display all products along with their category names.
select products.productname, categories.categoryname 
from products 
inner join categories 
on products.categoryid = categories.categoryid;

-- Write a query to list all products and their quantities for each order.
select products.productid, products.productname, order_details.quantity
from products -- left table
inner join order_details -- right table 
on products.productid = order_details.productid; 

-- epmloyees and their orders 
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;


SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
where Orders.OrderID is null
ORDER BY Orders.OrderID;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

-- customers with no order. 
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where Orders.OrderID is null
ORDER BY Customers.CustomerName;

-- use right customers with no order. 
SELECT Customers.CustomerName, Orders.OrderID
FROM Orders
Right JOIN Customers ON Customers.CustomerID = Orders.CustomerID
where Orders.OrderID is null
ORDER BY Customers.CustomerName;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;

-- GROUP BY
select count(*), country
from customers
group by country;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

-- Find average price for each product
select avg(price), productname
from products
group by productname;

-- return categories for each product
select avg(price), products.productname, categories.categoryname
from products
join categories
on products.categoryid = categories.categoryid
group by products.productname, categories.categoryname
order by avg(price) desc;

-- The following SQL statement lists the number of orders sent by each shipper:
select count(*), sh.shippername
from orders as o
join shippers as sh
on o.shipperid = sh.shipperid
group by sh.shippername; 

-- The following SQL statement lists the total sales by product:
select sum(od.quantity*p.price) as totalsales, p.productname as products
from products as p
join order_details as od 
on p.productid = od.productid
group by p.productname
order by totalsales desc;

-- Write SQL query to list the number of customers in each country.
select count(customerid) as totalcustomers, country
from customers
group by country
order by totalcustomers desc;

-- Write a query to list each product category and the total quantity of products sold in that category.
select c.categoryname as total_sold, sum(od.quantity)
from products as p
join categories as c
on p.categoryid = c.categoryid
join order_details as od
on p.productid = od.productid
group by c.categoryname;

SELECT Country, COUNT(Customerid) AS Customercount
FROM
    Customers
GROUP BY
    Country
ORDER BY
    Customercount DESC;