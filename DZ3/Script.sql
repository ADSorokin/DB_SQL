/*Задание 1: Анализ прибыли по категориям продуктов
Задание: Определите общую прибыль для каждой категории продуктов,
используя таблицы OrderDetails, Orders и Products. Для расчета прибыли
умножьте цену продукта на количество, а затем суммируйте результаты по
категориям.
Подсказка: Используйте JOIN для объединения таблиц OrderDetails,
Orders, Products и Categories. Примените агрегию с функцией SUM.*/

SELECT 
	c.CategoryName,
	SUM(p.Price * od.Quantity)  SumProfit 
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID =od.ProductID 
JOIN Categories c  ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;
ORDER SumProfit BY DESC 

Результат:

Beverages	99464.5
Condiments	35071.6
Confections	54909.159999999996
Dairy Products	69921.0
Grains/Cereals	22327.75
Meat/Poultry	51676.520000000004
Produce	23401.4
Seafood	29652.3



/*Задание 2: Количество заказов по регионам
Задание:
Определите количество заказов, размещенных клиентами из различных стран, за
каждый месяц*/

SELECT
c.Country AS Country,
  strftime('%Y', o.OrderDate) AS Year,
  strftime('%m', o.OrderDate) AS Month,
COUNT(o.OrderID) AS OrderCount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Country, Month, Year
ORDER BY Year,Month;

Результат:

Austria	2023	07	2
Belgium	2023	07	1
Brazil	2023	07	5
Finland	2023	07	2
France	2023	07	2
Germany	2023	07	1
Mexico	2023	07	1
Sweden	2023	07	1
Switzerland	2023	07	2
USA	2023	07	3
Venezuela	2023	07	2
Brazil	2023	08	4
Finland	2023	08	1
France	2023	08	1
Germany	2023	08	6
Italy	2023	08	2
Mexico	2023	08	2
Spain	2023	08	2
Sweden	2023	08	2
UK	2023	08	1
USA	2023	08	3
Venezuela	2023	08	1
Belgium	2023	09	1
Brazil	2023	09	1
France	2023	09	3
Germany	2023	09	3
Ireland	2023	09	2
Italy	2023	09	1
Mexico	2023	09	2
Spain	2023	09	2
UK	2023	09	1
USA	2023	09	6
Venezuela	2023	09	1
Canada	2023	10	2
Denmark	2023	10	1
Finland	2023	10	2
France	2023	10	3
Germany	2023	10	5
Ireland	2023	10	1
Mexico	2023	10	2
Portugal	2023	10	2
Spain	2023	10	1
Sweden	2023	10	1
UK	2023	10	2
USA	2023	10	3
Venezuela	2023	10	1
Austria	2023	11	3
Brazil	2023	11	1
Denmark	2023	11	1
France	2023	11	4
Germany	2023	11	5
Mexico	2023	11	2
Portugal	2023	11	1
Spain	2023	11	1
UK	2023	11	3
USA	2023	11	3
Venezuela	2023	11	1
Austria	2023	12	3
Brazil	2023	12	3
Canada	2023	12	2
Denmark	2023	12	1
France	2023	12	1
Germany	2023	12	2
Ireland	2023	12	2
Norway	2023	12	1
Poland	2023	12	1
Portugal	2023	12	1
Sweden	2023	12	2
Switzerland	2023	12	1
UK	2023	12	3
USA	2023	12	6
Venezuela	2023	12	2
Argentina	2024	01	1
Austria	2024	01	4
Brazil	2024	01	5
Canada	2024	01	4
Denmark	2024	01	1
Finland	2024	01	2
France	2024	01	3
Germany	2024	01	2
Ireland	2024	01	1
Italy	2024	01	3
Spain	2024	01	1
Switzerland	2024	01	1
UK	2024	01	1
USA	2024	01	3
Venezuela	2024	01	1
Austria	2024	02	1
Canada	2024	02	1
Finland	2024	02	1
France	2024	02	1
Germany	2024	02	1
Italy	2024	02	1
Portugal	2024	02	1
Sweden	2024	02	1
UK	2024	02	1
USA	2024	02	2



/*Задание 3: Средняя продолжительность кредитного срока для
клиентов
Задание: Рассчитайте среднюю продолжительность кредитного срока для
клиентов по категориям образования.
Подсказка: Используйте таблицу Clusters и функцию AVG для вычисления
средней продолжительности кредитного срока.*/

SELECT 
	education e,
	AVG(credit_term) avg
FROM Clusters c
GROUP by e
ORDER BY avg DESC;

Результат:

Higher education	12.302564102564103
Incomplete higher education	11.244186046511627
Secondary special education	11.221291866028707
Secondary education	10.990384615384615
PhD degree	9.0
Incomplete secondary education	7.4
