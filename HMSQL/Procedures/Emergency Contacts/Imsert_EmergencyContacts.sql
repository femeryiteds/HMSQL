IF EXISTS (SELECT * FROM sys.objects WHERE name = 'Add_EmergencyContacts') BEGIN
    DROP PROCEDURE dbo.Add_EmergencyContacts
END
GO

CREATE PROCEDURE [dbo].[Add_EmergencyContacts]
    @EmployeeID               bigint,
    @Name                     varchar(30),
    @Phone                    nchar(15),
    @Address                  varchar(30),
    @Relation                 varchar(30),
	@LastUpdated              date 

AS
BEGIN

DECLARE @Rc     int
declare @Now DateTime=GetDate()

Declare @RowCountX int
set @RowCountX = (SELECT COUNT(EID) FROM EmergencyContacts where EID = @EmployeeID)

IF @RowCountX < 3 

	    INSERT EmergencyContacts(
        EID, Name, Phone, Address, Relation, LastUpdated
    ) VALUES (
       @EmployeeID, @Name, @Phone, @Address, @Relation, @LastUpdated
    )
    SELECT @Rc = @@ERROR
    IF @Rc <> 0 BEGIN
        RAISERROR ('Error Inserting Item Employee: %d', 11, 1, @Rc)
        RETURN @Rc
    END

RETURN 0
END