/*Задание 1: Создание таблицы и изменение данных
Задание: Создайте таблицу EmployeeDetails для хранения информации о
сотрудниках. Таблица должна содержать следующие столбцы:
● EmployeeID (INTEGER, PRIMARY KEY)
● EmployeeName (TEXT)
● Position (TEXT)
● HireDate (DATE)
● Salary (NUMERIC)
После создания таблицы добавьте в неё три записи с произвольными данными о
сотрудниках.
*/


CREATE TABLE EmployeeDetails (
    EmployeeID INTEGER NOT NULL AUTO_INCREMENT,
    EmployeeName TEXT,
    Position TEXT,
    HireDate DATE,
    Salary NUMERIC,
    PRIMARY KEY (EmployeeID)
);

INSERT INTO EmployeeDetails (EmployeeName, Position, HireDate, Salary)
VALUES ('Olia', 'Программист', '2021-04-01', 100000),
       ('Petia', 'Менеджер', '2012-05-02', 150000),
       ('Misha', 'Аналитик', '2013-01-03', 120000);
      
/*
 * 
 select * from      
employeedetails;

1	Olia	Программист	2021-04-01	100000
2	Petia	Менеджер	2012-05-02	150000
3	Misha	Аналитик	2013-01-03	120000
*/
      
/*
 Задание 2: Создание представления
Задание: Создайте представление HighValueOrders для отображения всех заказов,
сумма которых превышает 10000. В представлении должны быть следующие столбцы:
● OrderID (идентификатор заказа),
● OrderDate (дата заказа),
●  (общая сумма заказа, вычисленная как сумма всех Quantity *
).
Используйте таблицы Orders, OrderDetails и Products.*/

CREATE VIEW HighValueOrders AS 
	 SELECT 
      	o.OrderID,
      	OrderDate,
      	SUM(Quantity*Price) as TotalAmount  	
      FROM  orders o          
      JOIN orderdetails od ON o.OrderID = od.OrderID
      JOIN products p on od.ProductID = p.ProductID
      GROUP BY o.OrderID,OrderDate
	  HAVING SUM(Quantity * Price) > 10000;
	 
	 
	
/*	 SELECT * 
	 FROM HighValueOrders;
	
	10353	2023-11-13	13402
	10372	2023-12-04	15300
	10417	2024-01-16	14061
	10424	2024-01-23	14327
*/
	 
/*Задание 3: Удаление данных и таблиц
Задание: Удалите все записи из таблицы EmployeeDetails, где Salary меньше
50000. Затем удалите таблицу EmployeeDetails из базы данных.*/
	 
/*
INSERT INTO sale.employeedetails
(EmployeeName, `Position`, HireDate, Salary)
VALUES('Vasia', 'водитель', '2024-03-03', 40000);

SELECT *
FROM employeedetails;

1	Olia	Программист	2021-04-01	100000
2	Petia	Менеджер	2012-05-02	150000
3	Misha	Аналитик	2013-01-03	120000
4	Vasia	водитель	2024-03-03	40000
*/	 
	DELETE FROM employeedetails
	WHERE Salary < 50000;
	
/*
SELECT *
FROM employeedetails;

1	Olia	Программист	2021-04-01	100000
2	Petia	Менеджер	2012-05-02	150000
3	Misha	Аналитик	2013-01-03	120000

*/
	 
/*Задание 4: Создание хранимой процедуры
Задание: Создайте хранимую процедуру GetProductSales с одним параметром
ProductID. Эта процедура должна возвращать список всех заказов, в которых
участвует продукт с заданным ProductID, включая следующие столбцы:
● OrderID (идентификатор заказа),
● OrderDate (дата заказа),
● CustomerID (идентификатор клиента).
*/

CREATE PROCEDURE GetProductSales(_ProductID INT)
begin
	SELECT 
	o.OrderID,
	CustomerID,
	OrderDate	
FROM orders o
	join orderdetails od on o.OrderID = od.OrderID 
	where ProductID = _ProductID;
end

/*
call GetProductSales(1);

OrderID	CustomerID	OrderDate
10285	63	2023-08-20
10294	65	2023-08-30
10317	48	2023-09-30
10348	86	2023-11-07
10354	58	2023-11-14
10370	14	2023-12-03
10406	62	2024-01-07
10413	41	2024-01-14

*/
