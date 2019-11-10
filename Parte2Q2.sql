-- Q2
USE Chinook;
delimiter //
DROP TRIGGER IF EXISTS EmployeeInsert; 
CREATE TRIGGER EmployeeInsert BEFORE INSERT ON Employee
FOR EACH row 
BEGIN
    IF TIMESTAMPDIFF(YEAR, NEW.BirthDate, CURDATE()) < 16
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee must be 16 or older';
    END IF;
END;


//
delimiter ;
-- declare @invoiceid INT default 0;
SET @invoiceid = 1;

# insert
INSERT INTO `Employee` (`EmployeeId`, `LastName`, `FirstName`, `Title`, `BirthDate`, `HireDate`, `Address`, `City`, `State`, `Country`, `PostalCode`, `Phone`, `Fax`, `Email`)
 VALUES (2001, N'Adams', N'Andrew', N'General Manager', '2010/2/18', '2002/8/14', N'11120 Jasper Ave NW', N'Edmonton', N'AB', N'Canada', N'T5K 2N1', N'+1 (780) 428-9482', N'+1 (780) 428-3457', N'andrew@chinookcorp.com');
