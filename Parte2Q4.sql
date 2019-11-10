-- Q2
USE Chinook;
delimiter //
DROP TRIGGER IF EXISTS invoiceLineInsert; 
CREATE TRIGGER invoiceLineInsert AFTER INSERT ON InvoiceLine
FOR EACH row 
BEGIN
    UPDATE Invoice SET Total = Total + (NEW.UnitPrice * NEW.Quantity) WHERE NEW.InvoiceId = InvoiceId;
END;

DROP TRIGGER IF EXISTS invoiceLineDelete; 
CREATE TRIGGER invoiceLineDelete AFTER DELETE ON InvoiceLine
FOR EACH row 
BEGIN
    UPDATE Invoice SET Total = Total - (OLD.UnitPrice * OLD.Quantity) WHERE OLD.InvoiceId = InvoiceId;
END;

DROP TRIGGER IF EXISTS invoiceLineUpdate; 
CREATE TRIGGER invoiceLineUpdate AFTER UPDATE ON InvoiceLine
FOR EACH row 
BEGIN
    UPDATE Invoice SET Total = Total - (OLD.UnitPrice * OLD.Quantity) + (NEW.UnitPrice * NEW.Quantity) WHERE NEW.InvoiceId = InvoiceId;
END;

//
delimiter ;
-- declare @invoiceid INT default 0;
SET @invoiceid = 1;

# insert
Select "'Test insert of invoiceLine, invoice before test'" as '';
delete from InvoiceLine where InvoiceId = @invoiceid;
select InvoiceId, total from Invoice where InvoiceId =  @invoiceid;
INSERT INTO `InvoiceLine` (`InvoiceLineId`, `InvoiceId`, `TrackId`, `UnitPrice`, `Quantity`) VALUES (1, @invoiceid, 2, 2, 1);
INSERT INTO `InvoiceLine` (`InvoiceLineId`, `InvoiceId`, `TrackId`, `UnitPrice`, `Quantity`) VALUES (2, @invoiceid, 4, 2, 1);
Select "'invoiceLine after insert'" as '';
select * from InvoiceLine where InvoiceId = @invoiceid;
Select "'Invoice after insert'" as '';
select InvoiceId, total from Invoice where InvoiceId = @invoiceid;


# update
Select '' as '';
Select '' as '';
Select "'Test update of invoiceLine, invoice before test'" as '';
select InvoiceId, total from Invoice where InvoiceId = @invoiceid;
Select 'InvoiceLine objects' as '';
select * from InvoiceLine where InvoiceId = @invoiceid;
update InvoiceLine SET UnitPrice = 4 where InvoiceId = @invoiceid;
Select "'invoiceLine after update'" as '';
select * from InvoiceLine where InvoiceId = @invoiceid;
Select "'Invoice after update'" as '';
select InvoiceId, total from Invoice where InvoiceId = @invoiceid;


# delete
Select '' as '';
Select '' as '';
Select "'Test delete of invoiceLine, invoice before test'" as '';
select InvoiceId, total from Invoice where InvoiceId = @invoiceid;
Select "'InvoiceLine before delete'" as '';
select * from InvoiceLine where InvoiceId = @invoiceid;
delete from InvoiceLine where InvoiceId = @invoiceid;
Select "'invoiceLine after delete'" as '';
select count(*) from InvoiceLine where InvoiceId = @invoiceid;
Select "'Invoice after delete'" as '';
select InvoiceId, total from Invoice where InvoiceId = @invoiceid;
