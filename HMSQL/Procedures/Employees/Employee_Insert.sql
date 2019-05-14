IF EXISTS (SELECT * FROM sys.objects WHERE name = 'Add_Employee') BEGIN
    DROP PROCEDURE dbo.Add_Employee
END
GO

CREATE PROCEDURE [dbo].[Add_Employee]
    @EmployeeID                 nchar(10),
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

DECLARE @Rc     int
declare @Now DateTime=GetDate()

IF EXISTS (SELECT * FROM EMPLOYEES WITH (nolock)
               WHERE  Employeeid = @EmployeeID) BEGIN
        RAISERROR ('Employee: %s / %s Already Exists', 11, 1, @EmployeeID)
        RETURN -2
    END

	    INSERT EMPLOYEES(
        Employeeid, FirstName, LastName, MiddleInt, Username, Home, Mobile, Address1, Address2, City, State, Zipcode, Email, Social, STATEID, ISSUESTATE, 
		Password, FailedAttempts, ResetPassword, PasswordUpdated, GROUPID, DOB, Active, HireDate, EndDate, LastUpdated, Garnish, GarnishTitle, Alimony,
		ChildSupport, Deduction1, Deduction2, Deduction3, Deduction4, Deduction5, Deduction6, Deduction7, Deduction8, Deduction9, Deduction10, DeductionName1,
		DeductionName2, DeductionName3, DeductionName4, DeductionName5, DeductionName6, DeductionName7, DeductionName8, DeductionName9, DeductionName10, RehireSafe
    ) VALUES (
       @Employeeid, @FirstName, @LastName, @MiddleInt, @Username, @Home, @Mobile, @Address1, @Address2, @City, @State, @Zipcode, @Email, @Social, @STATEID, @ISSUESTATE, 
		@Password, @FailedAttempts, @ResetPassword, @PasswordUpdated, @GROUPID, @DOB, @Active, @HireDate, @EndDate, @LastUpdated, @Garnish, @GarnishTitle, @Alimony,
		@ChildSupport, @Deduction1, @Deduction2, @Deduction3, @Deduction4, @Deduction5, @Deduction6, @Deduction7, @Deduction8, @Deduction9, @Deduction10, @DeductionName1,
		@DeductionName2, @DeductionName3, @DeductionName4, @DeductionName5, @DeductionName6, @DeductionName7, @DeductionName8, @DeductionName9, @DeductionName10, @Rehiresafe
    )
    SELECT @Rc = @@ERROR
    IF @Rc <> 0 BEGIN
        RAISERROR ('Error Inserting Item Employee: %d', 11, 1, @Rc)
        RETURN @Rc
    END


RETURN 0
END