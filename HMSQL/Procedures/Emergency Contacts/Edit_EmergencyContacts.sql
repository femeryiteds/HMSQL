IF EXISTS (SELECT * FROM sys.objects WHERE name = 'Edit_EmergencyContacts') BEGIN
    DROP PROCEDURE dbo.Edit_EmergencyContacts
END
GO

CREATE PROCEDURE [dbo].[Edit_EmergencyContacts]
    @EmployeeID                bigint,
    @Name1                     varchar(30),
    @Phone1                    nchar(15),
    @Address1                  varchar(30),
    @Relation1                 varchar(30),
    @Name2                     varchar(30),
    @Phone2                    nchar(15),
    @Address2                  varchar(30),
    @Relation2                 varchar(30),
    @Name3                     varchar(30),
    @Phone3                    nchar(15),
    @Address3                 varchar(30),
    @Relation3                 varchar(30)


AS
BEGIN

DECLARE @Assigned1  int
DECLARE @Assigned2  int
DECLARE @Assigned3  int

SET @Assigned1 = 1
SET @Assigned2 = 2
SET @Assigned3 = 3

DECLARE    @LastUpdated DateTime=GetDate()        

DECLARE @Rc     int
declare @Now DateTime=GetDate()


IF exists (select * from EmergencyContacts where EID = @EmployeeID and Assigned = @Assigned1)
BEGIN
    UPDATE EmergencyContacts SET
    Name = @name1,
    Phone = @Phone1,
    Address = @Address1,
    Relation = @Relation1,
    LastUpdated = @LastUpdated
    where EID = @EmployeeID and Assigned = @Assigned1
END
ELSE
BEGIN
        INSERT EmergencyContacts(
        EID, Name, Phone, Address, Relation, Assigned, LastUpdated
    ) VALUES (
       @EmployeeID, @Name1, @Phone1, @Address1, @Relation1, @Assigned1, @LastUpdated
    )
        SELECT @Rc = @@ERROR
    IF @Rc <> 0 BEGIN
        RAISERROR ('Error Inserting Contact: %d', 11, 1, @Rc)
        RETURN @Rc
    END
END

IF exists (select * from EmergencyContacts where EID = @EmployeeID and Assigned = @Assigned2)
BEGIN
    UPDATE EmergencyContacts SET
    Name = @name2,
    Phone = @Phone2,
    Address = @Address2,
    Relation = @Relation2,
    LastUpdated = @LastUpdated
    where EID = @EmployeeID and Assigned = @Assigned2
END
ELSE
BEGIN
        INSERT EmergencyContacts(
        EID, Name, Phone, Address, Relation, Assigned, LastUpdated
    ) VALUES (
       @EmployeeID, @Name2, @Phone2, @Address2, @Relation2, @Assigned2, @LastUpdated
    )
        SELECT @Rc = @@ERROR
    IF @Rc <> 0 BEGIN
        RAISERROR ('Error Inserting Contact: %d', 11, 1, @Rc)
        RETURN @Rc
    END
END

IF exists (select * from EmergencyContacts where EID = @EmployeeID and Assigned = @Assigned3)
BEGIN
    UPDATE EmergencyContacts SET
    Name = @name3,
    Phone = @Phone3,
    Address = @Address3,
    Relation = @Relation3,
    LastUpdated = @LastUpdated
    where EID = @EmployeeID and Assigned = @Assigned3
END
ELSE
BEGIN
        INSERT EmergencyContacts(
        EID, Name, Phone, Address, Relation, Assigned, LastUpdated
    ) VALUES (
       @EmployeeID, @Name3, @Phone3, @Address3, @Relation3, @Assigned3, @LastUpdated
    )
        SELECT @Rc = @@ERROR
    IF @Rc <> 0 BEGIN
        RAISERROR ('Error Inserting Contact: %d', 11, 1, @Rc)
        RETURN @Rc
    END
END



RETURN 0
END