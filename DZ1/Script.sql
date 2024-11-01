--Задание №1: Уникальные страны клиентов
--Определите, сколько уникальных стран представлено среди клиентов.

SELECT COUNT(DISTINCT Country) AS  QtyThisCountryIs
FROM Customers;

-- Уникальные страны клиентов: 21

--Задание №2: Клиенты из Бразилии
--Определите количество клиентов, которые проживают в Бразилии

SELECT COUNT(*) AS QtyBrasilClient 
FROM Customers
WHERE Country ='Brazil';

-- Клиенты из Бразилии: 9


--Задание №3: Средняя цена и количество товаров в категории 5
--Посчитайте среднюю цену и общее количество товаров в категории с
--идентификатором 5.

SELECT AVG(Price) AS AvrPrice,
COUNT(*) AS TotalQtyProducts
FROM Products 
WHERE CategoryID = 5;

-- Средняя цена: 20.25
-- количество товаров в категории: 7


--Задание №4: Средний возраст сотрудников на 2024-01-01
--Вычислите средний возраст сотрудников на дату 2024-01-01.

SELECT AVG(
    strftime('%Y', '2024-01-01') - strftime('%Y', BirthDate) -
    (strftime('%m', '2024-01-01') < strftime('%m', BirthDate) OR 
    (strftime('%m', '2024-01-01') = strftime('%m', BirthDate) AND 
    strftime('%d', '2024-01-01') < strftime('%d', BirthDate)
    ))) AS average_age
FROM Employees;

-- Ответ: 65.6


--Задание №5: Заказы в период 30 дней до 2024-02-15
--Найдите заказы, сделанные в период с 16 января по 15 февраля 2024 года, и
--отсортируйте их по дате заказа.

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2024-01-16' AND '2024-02-15'
ORDER BY OrderDate;

--Ответ Заказы в период 30 дней до 2024-02-15
--10416	87	8	2024-01-16	3
--10417	73	4	2024-01-16	3
--10418	63	4	2024-01-17	1
--10419	68	4	2024-01-20	2
--10420	88	3	2024-01-21	1
--10421	61	8	2024-01-21	1
--10422	27	2	2024-01-22	1
--10423	31	6	2024-01-23	3
--10424	51	7	2024-01-23	2
--10425	41	6	2024-01-24	2
--10426	29	4	2024-01-27	1
--10427	59	4	2024-01-27	2
--10428	66	7	2024-01-28	1
--10429	37	3	2024-01-29	2
--10430	20	4	2024-01-30	1
--10431	10	4	2024-01-30	2
--10432	75	3	2024-01-31	2
--10433	60	3	2024-02-03	3
--10434	24	3	2024-02-03	2
--10435	16	8	2024-02-04	2
--10436	7	3	2024-02-05	2
--10437	87	8	2024-02-05	1
--10438	79	3	2024-02-06	2
--10439	51	6	2024-02-07	3
--10440	71	4	2024-02-10	2
--10441	55	3	2024-02-10	2
--10442	20	3	2024-02-11	2
--10443	66	8	2024-02-12	1

--Задание №6: Количество заказов за ноябрь 2023 года (используя
--начальную и конечную дату)
--Определите количество заказов, сделанных в ноябре 2023 года, используя
--начальную и конечную дату месяца

SELECT COUNT(*) QtyOrderByNovember
FROM Orders 
WHERE OrderDate >= '2023-11-01' AND OrderDate <= '2023-11-30';

--Ответ Количество заказов за ноябрь 2023:     25


--Задание №7: Количество заказов за январь 2024 года (используя
--LIKE)
--Найдите количество заказов за январь 2024 года, используя оператор LIKE для фильтрации даты

SELECT COUNT(*) AS YanuaryOrders
FROM Orders 
WHERE OrderDate LIKE '2024-01-%'

--Ответ: 33

--Задание №8: Количество заказов за 2024 год
--Определите количество заказов за 2024 года, используя функцию STRFTIME для
--извлечения года

SELECT COUNT(*) AS AnnualOrdersCount
FROM orders
WHERE STRFTIME('%Y', OrderDate) = '2024';

--Ответ: 44
