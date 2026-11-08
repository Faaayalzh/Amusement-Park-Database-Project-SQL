-- 1. Games and the employee who manages each one
SELECT g.GameName, g.price, g.AgeRestriction, e.Emp_Name AS ManagedBy
FROM games g
JOIN employees e ON g.Emp_ID = e.EmployeeID;

-- 2. Number of players per game
SELECT g.GameName, COUNT(vg.VisitorID) AS Players
FROM games g
LEFT JOIN visitorsgame vg ON g.GameID = vg.GameID
GROUP BY g.GameID, g.GameName;

-- 3. Visitors per ticket type and total ticket revenue
SELECT t.TicketType, COUNT(v.VisitorID) AS Visitors, SUM(t.Price) AS TotalRevenue
FROM tickets t
JOIN visitors v ON v.TicketID = t.TicketID
GROUP BY t.TicketID, t.TicketType;

-- 4. Age check: visitors playing a game below its age restriction (should return no rows)
SELECT v.Name, v.Age, g.GameName, g.AgeRestriction
FROM visitorsgame vg
JOIN visitors v ON vg.VisitorID = v.VisitorID
JOIN games g ON vg.GameID = g.GameID
WHERE v.Age < g.AgeRestriction;

-- 5. Food orders with total, restaurant, and visitor
SELECT o.OrderID, o.FoodName, o.Quantity * o.Price AS Total,
       r.Name AS Restaurant, v.Name AS Visitor
FROM orders o
JOIN restaurants r ON o.Rest_ID = r.RestaurantID
JOIN visitors v ON o.Visit_ID = v.VisitorID;
