IF EXISTS (SELECT * FROM sys.objects WHERE name = 'Update_Employee') BEGIN
    DROP PROCEDURE dbo.Update_Employee
END
GO

CREATE PROCEDURE dbo.Update_Employee 
    @EmployeeID                 bigint,
    @FirstName                  varchar(50),
    @LastName                   varchar(50),
    @MiddleInt                  varchar(50),
    @Username                   varchar(50),
    @Home                       nchar(10),
    @Mobile                     nchar(10),
    @Address1                   varchar(50),
    @Address2                   varchar(50),
    @City                       varchar(50),
    @State                      varchar(2),
    @Zipcode                    nchar(6),
    @Email                      varchar(50),
	@Social                     nchar(10),
    @StateID                    varchar(20),
	@IssueState                 varchar(2),
	@Password                   varchar(50),
	@FailedAttempts             int,
	@ResetPassword              bit,
	@PasswordUpdated            Date,
	@GROUPID                    int,
	@DOB                        Date,
	@Active                     bit,
	@HireDate                   Date,
	@EndDate                    Date,
	@LastUpdated                Date,
	@Garnish                    bit,
	@GarnishTitle               varchar(20),
	@Alimony                    bit,
	@ChildSupport               bit,
	@Deduction1                 bit,
	@Deduction2                 bit,
	@Deduction3                 bit,
	@Deduction4                 bit,
	@Deduction5                 bit,
	@Deduction6                 bit,
	@Deduction7                 bit,
	@Deduction8                 bit,
	@Deduction9                 bit,
	@Deduction10                bit,
	@DeductionName1             Varchar(20),
	@DeductionName2             Varchar(20),
	@DeductionName3             Varchar(20),
	@DeductionName4             Varchar(20),
	@DeductionName5             Varchar(20),
	@DeductionName6             Varchar(20),
	@DeductionName7             Varchar(20),
	@DeductionName8             Varchar(20),
	@DeductionName9             Varchar(20),
	@DeductionName10            Varchar(20),
	@RehireSafe                 bit

AS
BEGIN
DECLARE @NewNumber VARCHAR(1000)
SET @NewNumber=CAST(@EmployeeID AS VARCHAR(100))
SET NOCOUNT ON;

    DECLARE @Rc int
    IF NOT EXISTS (SELECT * FROM EMPLOYEES WHERE Employeeid = @EmployeeID) BEGIN
        RAISERROR ('Employee Not Found: %d', 11, 1, @NewNumber)
        RETURN -1
    END
    UPDATE EMPLOYEES Set
      FIrstName = @FirstName,
      LastName = @LastName,
      MIddleInt = @MiddleInt,
      Username = @Username,
      Home = @Home,
      Mobile = @Mobile,
      Address1 = @Address1,
      Address2 = @Address2,
      City = @City,
      State = @State,
      Zipcode = @Zipcode,
      Email = @Email,
      Social = @Social,
      STATEID = @STATEID,
      ISSUESTATE = @ISSUESTATE,
      Password = @Password,
      FailedAttempts = @FailedAttempts,
      ResetPassword = @ResetPassword,
      PasswordUpdated = @PasswordUpdated,
      GROUPID = @GROUPID,
      DOB = @DOB,
      Active = @Active,
      HireDate = @HireDate,
      EndDate = @EndDate,
      LastUpdated = @LastUpdated,
      Garnish = @Garnish,
      GarnishTitle = @GarnishTitle,
      Alimony = @Alimony,
      ChildSupport = @ChildSupport,
      Deduction1 = @Deduction1,
      Deduction2 = @Deduction2,
      Deduction3 = @Deduction3,
      Deduction4 = @Deduction4,
      Deduction5 = @Deduction5,
      Deduction6 = @Deduction6,
      Deduction7 = @Deduction7,
      Deduction8 = @Deduction8,
      Deduction9 = @Deduction9,
      Deduction10 = @Deduction10,
      DeductionName1 = @DeductionName1,
      DeductionName2 = @DeductionName2,
      DeductionName3 = @DeductionName3,
      DeductionName4 = @DeductionName4,
      DeductionName5 = @DeductionName5,
      DeductionName6 = @DeductionName6,
      DeductionName7 = @DeductionName7,
      DeductionName8 = @DeductionName8,
      DeductionName9 = @DeductionName9,
      DeductionName10 = @DeductionName10,
      RehireSafe = @RehireSafe


    WHERE Employeeid = @EmployeeID
    SELECT @Rc = @@ERROR
    IF @Rc <> 0 BEGIN
        RAISERROR ('Error Updating Employee Record: %d', 11, 1, @Rc)
        RETURN @Rc
    END
    RETURN 0
END
