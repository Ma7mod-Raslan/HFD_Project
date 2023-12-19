USE hfd;

-- Simple query on one table to get basic all Person information
SELECT ID, concat(Fname , ' ' , Minit , ' ' ,Lname ) AS Name , Gender, Bdate
FROM Person;

-- Query on multiple tables to get guests and their reservation details
SELECT
    g.ID AS Guest_ID,
    p.Fname,
    p.Lname,
    g.Room_rID AS Room_ID,
    g.price,
    g.disability_type,
    g.check_inDt,
    g.check_outDt
FROM
    Guest g , Person p
WHERE
	g.ID = p.ID;
    
-- Calculate Average Salary by Department
SELECT
    d.name AS Department,
    AVG(e.salary) AS Avg_Salary
FROM
    Department d
LEFT JOIN
    Employee e ON d.dID = e.Department_dID
GROUP BY
    d.name;
    
-- Nested query to Retrieve Employee Information with salary above average
SELECT
    e.ID AS Employee_ID,
    P.Fname,
    P.Lname,
    e.job_type,
    e.salary,
    d.name AS Department
FROM
    (Employee e INNER JOIN  Person p ON e.ID = P.ID )
LEFT JOIN
    Department d ON e.Department_dID = d.dID
WHERE
    e.salary > (
        SELECT AVG(salary)
        FROM Employee
    );
    
-- Count and group by to retrieve employee count by job type
SELECT
    job_type,
    COUNT(*) AS Employee_Count
FROM
    Employee
GROUP BY
    job_type;

-- Join and select guests with their dependents
SELECT
    g.ID AS Guest_ID,
    p.Fname,
    p.Lname,
    d.Name AS Dependent_Name,
    d.relationship,
    d.Bdate AS Birth_Date
FROM
    (Guest g INNER JOIN  Person p ON g.ID = P.ID )
LEFT JOIN
    Dependent d ON g.ID = d.Guest_ID;	
    
-- Join to get transportation details for entertainment trips
SELECT
    t.plate_no,
    t.model,
    t.type,
    et.type AS Entertainment_Trip_Type,
    et.place AS Entertainment_Trip_Place
FROM
    Transpoertation t
INNER JOIN
    Entertainment_Trip et ON t.Entertainment_Trip_eID = et.eID;
    
-- Join to retrieve employee who have received traning with their training information
SELECT
    e.ID AS Employee_ID,
    p.Fname,
    p.Lname,
    t.name AS Training_Name,
    t.Date AS Training_Date
FROM
    (Employee e INNER JOIN  Person p ON e.ID = P.ID )
RIGHT JOIN
    Gets gt ON e.ID = gt.trainee_ID
RIGHT JOIN
    Training t ON gt.Training_name = t.name;

-- Join to retrieve guests who have received Trip and their entertainment trips
SELECT
    g.ID AS Guest_ID,
    p.Fname,
    p.Lname,
    et.type AS Entertainment_Trip_Type,
    et.place AS Entertainment_Trip_Place
FROM
    (Guest g INNER JOIN  Person p ON g.ID = P.ID )
INNER JOIN
    Goes_on go ON g.ID = go.Guest_ID
INNER JOIN
    Entertainment_Trip et ON go.Entertainment_Trip_eID = et.eID;

-- Join to retrieve employee lawsuits information
SELECT
    e.ID AS Employee_ID,
    P.Fname,
    P.Lname,
    la.type AS Lawsuit_Type,
    la.date AS Lawsuit_Date
FROM
    (Employee e INNER JOIN  Person p ON e.ID = P.ID )
INNER JOIN
    lawsuit l ON e.ID = l.Employee_ID
INNER JOIN
	legal_affairs la ON la.lID = l.Legal_Affairs_lID;
    
-- Join to retrieve guests with their care giver information
SELECT
    g.ID AS Guest_ID,
    p.Fname,
    p.Lname,
    c.skills AS Care_Giver_Skills
FROM
    (Guest g INNER JOIN  Person p ON g.ID = P.ID )
LEFT JOIN
    Care_Giver c ON g.ID = c.Guest_ID;

-- Join to retrieve department insurance information
SELECT
    d.name AS Department,
    i.iID AS Insurance_ID,
    i.duration,
    i.date AS Insurance_Date
FROM
    Department d
INNER JOIN
    Insurance i ON d.dID = i.Department_dID;
    
-- Simple qury to retrieve purchase information 
SELECT
    p.pID,
    p.name,
    p.type,
    p.price,
    p.quantity,
    p.date,
    p.supplier
FROM
    Purchase p;

-- Join to retrieve guests with their medical conditions
SELECT
    g.ID AS Guest_ID,
    p.Fname,
    p.Lname,
    m.condition AS Medical_Condition
FROM
    (Guest g INNER JOIN  Person p ON g.ID = P.ID )
LEFT JOIN
    Medical m ON g.ID = m.Guest_ID;
    
    -- Display safety incidents in a specific department
SELECT
    s.sID,
    s.incident,
    s.location,
    s.date,
    d.name AS Department_Name
FROM
    Safety s
INNER JOIN
    Department d ON s.Department_dID = d.dID;
    
-- Display expired items in storage
SELECT
    s.sID AS Storage_ID,
    s.expair_date,
    s.type AS Item_Type,
    p.name AS Purchase_Name,
    p.date AS Purchase_Date,
    d.name AS Department_Name
FROM
    Storage s
INNER JOIN
    Purchase p ON s.Purchase_ID = p.pID AND s.Purchase_Department_dID = p.Department_dID
INNER JOIN
    Department d ON s.Department_dID = d.dID
WHERE
    s.expair_date < CURDATE();


-- Join to retrieve guest ratings and thier feedback
SELECT
    g.ID AS Guest_ID,
    p.Fname,
    p.Lname,
    r.feedback,
    r.evaluation AS Avg_Rating
FROM
    (Guest g INNER JOIN  Person p ON g.ID = P.ID )
INNER JOIN
    Rating r ON g.ID = r.Guest_ID;

-- Join to retrieve rooms and their cleanliness status
SELECT
    r.rID AS Room_ID,
    r.accesibilty_feature,
    c.date AS Last_Cleaned_Date
FROM
    Room r
LEFT JOIN
    Cleanliness c ON r.rID = c.Room_rID1
ORDER BY
    r.rID ;

-- Joining Transportation, Maintenance, and Department tables to retrieve information
SELECT
    t.plate_no,
    t.model,
    t.type AS Transportation_Type,
    m.type AS Maintenance_Type,
    d.name AS Department
FROM
    Transpoertation t
LEFT JOIN
    transportation_maintenance tm ON t.plate_no = tm.Transpoertation_plate_no AND t.Department_dID = tm.Transpoertation_Department_dID
LEFT JOIN
    Maintenance m ON tm.Maintenance_mID = m.mID AND tm.Maintenance_Department_dID = m.Department_dID
LEFT JOIN
    Department d ON t.Department_dID = d.dID;

-- Joining Guest, Room, and Cleanliness tables to retrieve information
SELECT
    g.ID AS Guest_ID,
    p.Fname,
    p.Lname,
    r.rID AS Room_ID,
    r.accesibilty_feature,
    c.date AS Last_Cleaned_Date
FROM
    (Guest g INNER JOIN  Person p ON g.ID = P.ID )
LEFT JOIN
    Room r ON g.Room_rID = r.rID
LEFT JOIN
    Cleanliness c ON r.rID = c.Room_rID1
ORDER BY
    c.date DESC;

-- Joining Employee, Department, and Insurance tables to retrieve information
SELECT
    e.ID AS Employee_ID,
    p.Fname,
    p.Lname,
    d.name AS Department,
    i.duration,
    i.date AS Insurance_Date
FROM
    (Employee e INNER JOIN  Person p ON e.ID = P.ID )
LEFT JOIN
    Department d ON e.Department_dID = d.dID
LEFT JOIN
    employee_insurance ei ON e.ID = ei.Employee_ID
INNER JOIN
    Insurance i ON ei.Insurance_iID = i.iID AND ei.Insurance_Department_dID = i.Department_dID;
    
-- Simple Query to Display appointments with more than 5 employees
SELECT
    *
FROM
    Appoitment
WHERE
    no_of_employee > 5;
    
-- Display medication information for a specific guest
SELECT
    p.ID,
    p.Fname AS Guest_FirstName,
    p.Lname AS Guest_LastName,
    med.medication
FROM
    (Guest g INNER JOIN  Person p ON g.ID = P.ID )
INNER JOIN
    medical m ON m.Guest_ID = g.ID
INNER JOIN
	medication med ON med.Medical_ID = m.mID
WHERE p.Fname LIKE 'a%';


-- Thank You --
-- By  :  Mahmoud Yousif Raslan 
-- Team : AMMMA