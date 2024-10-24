

/*Базы данных и SQL (семинары) Урок 2

Задание №1: Анализ влияния категорий продуктов на общий доход
Описание: Вам необходимо проверить, как различные категории продуктов влияют на
общий доход (общую сумму заказов) в таблице OrderDetails. Подсчитайте общее
количество заказов (сумму количества) и общий доход (сумму количества * цену) для
каждой категории продуктов. Выведите результаты, включая:

● CategoryID
● Общее количество заказов (total_quantity)
● Общий доход (total_revenue)
Отсортируйте результаты по убыванию общего дохода (total_revenue). Используйте
таблицы Products, OrderDetails и Categories.*/

SELECT p.CategoryID, 
SUM(od.Quantity) AS total_quantity,
SUM(od.Quantity * p.Price ) AS total_revenue
FROM OrderDetails od, Products p
WHERE od.ProductID = p.ProductID
GROUP BY
p.CategoryID
ORDER BY
total_revenue DESC;


/*
 * 
 * Результат
 * 
 * CategoryID	total_quantity	total_revenue
1	  2 289	  99 464,5
4	  2 601	  69 921
3	  2 110	  54 909,16
6	  1 288	  51 676,52
2	  1 383	  35 071,6
8	  1 445	  29 652,3
7	  715	    23 401,4
5	  912	    22 327,75*/


/*Задание №2: Анализ частоты заказа продуктов по категориям
Описание: Напишите запрос SQL для подсчета количества заказов продуктов по
каждой категории. Подсчитайте количество уникальных заказов (OrderID) для каждой
категории продуктов. Выведите результаты, включая:
● CategoryID
● Количество уникальных заказов (order_count)
Отсортируйте результаты по убыванию количества уникальных заказов
(order_count). Используйте таблицы Products, OrderDetails и Categories.
Подсказка: Используйте объединение таблиц (JOIN), агрегатные функции
COUNT(DISTINCT ...) и GROUP BY */


SELECT
p.CategoryID,
COUNT(DISTINCT od.OrderID) AS order_count
FROM OrderDetails od, Products p
WHERE od.ProductID = p.ProductID
GROUP BY
p.CategoryID
ORDER BY
order_count DESC;

/*
 * 
 * Результат
 * 
CategoryID	order_count
1	          80
3	          78
4	          76
8	          60
6	          48
2	          41
5	          38
7	          32

*/

/*Задание №3: Вывод наиболее популярных продуктов по количеству
заказов
Описание: Выведите список продуктов (название ProductName), отсортированных по
количеству заказов в порядке убывания. Подсчитайте общее количество заказов
(Quantity) для каждого продукта. Выведите результаты, включая:
● ProductName
● Общее количество заказов (total_quantity)
Отсортируйте результаты по убыванию общего количества заказов (total_quantity).
Используйте таблицы Products и OrderDetails*/

SELECT
p.ProductName,
SUM(od.Quantity) AS total_quantity
FROM OrderDetails od, Products p
WHERE od.ProductID = p.ProductID
GROUP BY
p.ProductName 
ORDER BY
total_quantity DESC;



/*
 * Результат
 * 
ProductName	              total_quantity
Gorgonzola Telino	        458
Camembert Pierrot	        430
Steeleye Stout	          369
Raclette Courdavault	    346
Chang	                    341
Pavlova	                  338
FlÃƒÂ¸temysost	          336
Alice Mutton	            331
Tarte au sucre	          325
Geitost	                  316
TourtiÃƒÂ¨re	            280
Mozzarella di Giovanni	  270
Gnocchi di nonna Alice	  269
Chartreuse verte	        266
Boston Crab Meat	        256
Perth Pasties	            251
CÃƒÂ´te de Blaye	        239
PÃƒÂ¢tÃƒÂ© chinois	      238
GumbÃƒÂ¤r GummibÃƒÂ¤rchen	232
Vegie-spread	            209
Scottish Longbreads	      199
LakkalikÃƒÂ¶ÃƒÂ¶ri	      198
Inlagd Sill	198
RÃƒÂ¶ssle Sauerkraut	    189
Longlife Tofu	            186
Gudbrandsdalsost	        184
Queso Cabrales	          182
Teatime Chocolate Biscuits181
Maxilaku	                180
Gula Malacca	            178
Louisiana Fiery Hot Pepper Sauce	175
Nord-Ost Matjeshering	     170
ThÃƒÂ¼ringer Rostbratwurst	168
Ravioli Angelo	            168
Wimmers gute SemmelknÃƒÂ¶del	167
TunnbrÃƒÂ¶d	                165
Outback Lager	              164
Manjimup Dried Apples	      163
Chais	                      159
GuaranÃƒÂ¡ FantÃƒÂ¡stica	  158
Escargots de Bourgogne	    155
Tofu	                      152
Sir Rodney's Scones	        147
Spegesild	145
RhÃƒÂ¶nbrÃƒÂ¤u Klosterbier	144
Northwoods Cranberry Sauce	140
Jack's New England Clam Chowder	139
Ipoh Coffee	                136
Chef Anton's Gumbo Mix	    129
Sasquatch Ale	110
Original Frankfurter grÃƒÂ¼ne SoÃƒÅ¸e	108
Chef Anton's Cajun Seasoning	107
Sirop d'ÃƒÂ©rable	          106
Sir Rodney's Marmalade	    106
Carnarvon Tigers	          106
Zaanse koeken	              101
Konbu	                      92
Schoggi Schokolade	        90
Louisiana Hot Spiced Okra	  90
Ikura	                      85
Aniseed Syrup	              80
Singaporean Hokkien Fried Mee	77
NuNuCa NuÃƒÅ¸-Nougat-Creme	71
Valkoinen suklaa	70
Chocolade	70
Mascarpone Fabioli	52
Filo Mix	48
RÃƒÂ¶d Kaviar	45
Gravad lax	39
Grandma's Boysenberry Spread	36
Queso Manchego La Pastora	27
Uncle Bob's Organic Dried Pears	25
Genen Shouyu	25
Mishi Kobe Niku	20
Gustaf's KnÃƒÂ¤ckebrÃƒÂ¶d	18
RÃƒÂ¸gede sild	15
Laughing Lumberjack Lager	5
*/
