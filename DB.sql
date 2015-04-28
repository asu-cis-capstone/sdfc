CREATE TABLE `employee` (
  `asuID` int(11) NOT NULL,
  `asurite` varchar(10) DEFAULT NULL,
  `password` varchar(15) NOT NULL,
  `lastName` varchar(15) DEFAULT NULL,
  `firstName` varchar(15) DEFAULT NULL,
  `position` varchar(15) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`asuID`),
  KEY `manager` (`manager`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `employee` (`asuID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



create table report (
reportID int NOT NULL primary key auto_increment,
asuID int NOT NULL,
reportStatus varchar (255),
comments varchar (255),
dateFiled timestamp default current_timestamp,
FOREIGN KEY (asuID) references employee (asuID)
);


create table activity(
activityID int NOT NULL AUTO_INCREMENT primary key,
activityName varchar(255)

);

create table location(
locationID int NOT NULL AUTO_INCREMENT primary key,
locationName varchar(255)
);

create table actions(
actionsID int NOT NULL AUTO_INCREMENT primary key,
actionName varchar(255)
);

create table injuryType(
injuryTypeID int NOT NULL AUTO_INCREMENT primary key,
injuryTypeName varchar(255)
);

create table injuryLocation(
injuryLocationID int NOT NULL AUTO_INCREMENT primary key,
injuryLocationName varchar(255)
);

create table treatment(
treatmentID int NOT NULL AUTO_INCREMENT primary key,
treatmentName varchar(255)
);


create table injury(
reportID int NOT NULL primary key auto_increment,
activityID int NOT NULL,
locationID int NOT NULL,
actionsID int NOT NULL,
injuryTypeID int NOT NULL,
injuryLocationID int NOT NULL,
treatmentID int NOT NULL,
asuID int,
victimName varchar(55),
address varchar(255),
phone varchar(11),
age int,
genderMale bit,
refusalSig varchar(255),
treatmentProvider varchar(55),
positionTitle varchar(55),
managerCalled bit,
notWhy varchar(255),
timeCalled datetime,
arrival datetime,
transported varchar(255),
emergencyCalled bit,
emergencyReportNum varchar(255),
medicalReportNum varchar(255),
description varchar(255),
witnessName varchar(255),
witnessPhone varchar(11),
victimSig varchar(255),
FOREIGN KEY (reportID) references report (reportID),
FOREIGN KEY (activityID) references activity (activityID),
FOREIGN KEY (locationID) references location (locationID),
FOREIGN KEY (actionsID) references actions (actionsID),
FOREIGN KEY (injuryTypeID) references injuryType (injuryTypeID),
FOREIGN KEY (injuryLocationID) references injuryLocation (injuryLocationID),
FOREIGN KEY (treatmentID) references treatment (treatmentID)
);

DELIMITER $$
CREATE PROCEDURE fileReport(Actions int, Activity int, Address varchar (255), Age int, ArrivalTime datetime, Comments varchar(255),
Description varchar (255), InjuryLocation int, InjuryType int, Location int, Male bit, 
ManagerCalled bit, MedicalReportNo varchar (255), Phone varchar (11), ASUID int, PoliceContacted bit, PositionTitles varchar (55),
ReportNo varchar (255), VictimSignature varchar(255), TimeCalled datetime, TransportedTo varchar (255), Treatment int, Treator varchar (55), VictimName varchar(55),
WhyNot varchar (255), WitnessName varchar (255), WitnessPhone varchar(11), RefusalSignature varchar (255))
BEGIN
INSERT into report (asuID, reportStatus, comments) values (ASUID, 'open', Comments);

INSERT into injury (reportID, activityID, locationID, actionsID, injuryTypeID, injuryLocationID, treatmentID, asuID,
victimName, address, phone, age, genderMale, refusalSig, treatmentProvider, positionTitle, managerCalled,
notWhy, timeCalled, arrival, transported, emergencyCalled, emergencyReportNum, medicalReportNum,
description, witnessName, witnessPhone, victimSig) values (LAST_INSERT_ID(), Activity, Location, Actions, InjuryType, InjuryLocation, Treatment,
ASUID, VictimName, Address, Phone, Age, Male, RefusalSignature, Treator, PositionTitles, ManagerCalled, WhyNot, 
TimeCalled, ArrivalTime, TransportedTo, PoliceContacted, ReportNo, MedicalReportNo, Description, WitnessName, 
WitnessPhone, VictimSignature);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addEmployee(ASUID int, FirstName varchar(15), LastName varchar(15), ASURite varchar(10), Password varchar(15), 
Position varchar(15), Active bit, Manager bit)
BEGIN

INSERT into employee (asuID, asurite, password, lastName, firstName, position, active, manager) values (ASUID, ASURITE,
Password, LastName, FirstName, Position, Active, Manager);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`capstone`@`%` PROCEDURE `spGetRecentAccidentReport`()
BEGIN

SELECT
	firstName,
    lastName,
    dateFiled,
	victimName,
    address,
    phone,
    age,
    genderMale,
    inj.asuID,
    inj.reportID,
    #victimStatus
    
    activityName,
    locationName,
    actionName,
    injuryTypeName,
    injuryLocationName,
    treatmentName,
    
    treatmentProvider,
    managerCalled,
    emergencyCalled,
    emergencyReportNum,
    medicalReportNum,
    
    positionTitle,
    notWhy,
    timeCalled, 
    arrival, 
    transported,
    
    description,
    witnessName, 
    witnessPhone, 
    victimSig,
    
    mgrReviewedBy,
    mgrDate,
    mgrPosition,
    mgrReferred,
    mgrFollowup
    
    
FROM
	injury inj
    INNER JOIN
    actions on inj.actionsID = actions.actionsID
    INNER JOIN 
    activity on inj.activityID = activity.activityID
    INNER JOIN 
    injuryLocation on inj.injuryLocationID = injuryLocation.injuryLocationID
    INNER JOIN 
    injuryType on inj.injuryTypeID = injuryType.injuryTypeID
    INNER JOIN 
    location on inj.locationID = location.locationID
    INNER JOIN 
    treatment on inj.treatmentID = treatment.treatmentID
    INNER JOIN 
    report on inj.reportID = report.reportID
    INNER JOIN 
    employee on report.asuID = employee.asuID

ORDER BY 
	dateFiled desc
    
LIMIT 5;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`capstone`@`%` PROCEDURE `spGetUserLogin`(asuriteLog varchar(30))
BEGIN
	
SELECT emp.password,
		emp.asuID

FROM employee emp

WHERE asuriteLog = asurite;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`capstone`@`%` PROCEDURE `spReportAllParms`(
	startdate datetime,
    enddate datetime,
    
    activity1 int,
    activity2 int,
    activity3 int,
    activity4 int,
    activity5 int,
    activity6 int,
    activity7 int,
    activity8 int,
    
    location1 int,
    location2 int,
    location3 int,
    location4 int,
    location5 int,
    location6 int,
    location7 int,
    location8 int,
    location9 int,
    location10 int,
    location11 int,
    location12 int,
    location13 int,
    location14 int,
    location15 int,
    location16 int,
    location17 int,
    location18 int,
    location19 int,
    location20 int,
    
    sort varchar(10)
    
)
BEGIN
	SELECT
	firstName,
    lastName,
    dateFiled,
	victimName,
    address,
    phone,
    age,
    genderMale,
    inj.asuID,
    #victimStatus
    
    activityName,
    locationName,
    actionName,
    injuryTypeName,
    injuryLocationName,
    treatmentName,
    
    treatmentProvider,
    managerCalled,
    emergencyCalled,
    emergencyReportNum,
    medicalReportNum,
    
    positionTitle,
    notWhy,
    timeCalled, 
    arrival, 
    transported,
    
    description,
    witnessName, 
    witnessPhone, 
    victimSig,
    
    mgrReviewedBy,
    mgrDate,
    mgrPosition,
    mgrReferred,
    mgrFollowup
    
    
FROM
	injury inj
    INNER JOIN
    actions on inj.actionsID = actions.actionsID
    INNER JOIN 
    activity on inj.activityID = activity.activityID
    INNER JOIN 
    injuryLocation on inj.injuryLocationID = injuryLocation.injuryLocationID
    INNER JOIN 
    injuryType on inj.injuryTypeID = injuryType.injuryTypeID
    INNER JOIN 
    location on inj.locationID = location.locationID
    INNER JOIN 
    treatment on inj.treatmentID = treatment.treatmentID
    INNER JOIN 
    report on inj.reportID = report.reportID
    INNER JOIN 
    employee on report.asuID = employee.asuID

WHERE 
	dateFiled BETWEEN startdate AND enddate
    
    and

	inj.activityID IN (activity1,
						activity2,
						activity3,
						activity4,
						activity5,
						activity6,
						activity7,
						activity8)
	 and
	inj.injuryLocationID IN (location1,
								location2,
								location3,
								location4,
								location5,
								location6,
								location7,
								location8,
								location9,
								location10,
								location11,
								location12,
								location13,
								location14,
								location15,
								location16,
								location17,
								location18,
								location19,
								location20)
                                
	

ORDER BY 
	CASE sort
		WHEN "datedesc" then dateFiled
		WHEN "namedesc" then victimName
        else 1 END
	DESC,
        
	CASE sort
		WHEN "dateasc" then dateFiled
		WHEN "nameasc" then victimName
        else 1 END
	ASC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`capstone`@`%` PROCEDURE `spSearchByLastName`(lastName varchar(30))
BEGIN
	
    declare search varchar(30);
    set search = concat('%', lastName, '%');
    
    SELECT
	firstName,
    employee.lastName,
    dateFiled,
    
	victimName,
    address,
    phone,
    age,
    genderMale,
    inj.asuID,
    inj.reportID,
    #victimStatus
    
    activityName,
    locationName,
    actionName,
    injuryTypeName,
    injuryLocationName,
    treatmentName,
    
    treatmentProvider,
    managerCalled,
    emergencyCalled,
    emergencyReportNum,
    medicalReportNum,
    
    positionTitle,
    notWhy,
    timeCalled, 
    arrival, 
    transported,
    
    description,
    witnessName, 
    witnessPhone, 
    victimSig,
    
    mgrReviewedBy,
    mgrDate,
    mgrPosition,
    mgrReferred,
    mgrFollowup
    
    
FROM
	injury inj
    INNER JOIN
    actions on inj.actionsID = actions.actionsID
    INNER JOIN 
    activity on inj.activityID = activity.activityID
    INNER JOIN 
    injuryLocation on inj.injuryLocationID = injuryLocation.injuryLocationID
    INNER JOIN 
    injuryType on inj.injuryTypeID = injuryType.injuryTypeID
    INNER JOIN 
    location on inj.locationID = location.locationID
    INNER JOIN 
    treatment on inj.treatmentID = treatment.treatmentID
    INNER JOIN 
    report on inj.reportID = report.reportID
    INNER JOIN 
    employee on report.asuID = employee.asuID

WHERE
	victimName like search
    or
    firstName like search
    or 
    lastName like search
    or 
    inj.asuID like search
    or 
    witnessName like search

ORDER BY 
	dateFiled desc;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`capstone`@`%` PROCEDURE `spSelectAllEmployee`(asuid int(11))
BEGIN
	SELECT 
		* 
        
	FROM 
		cis440db.employee
    
    WHERE 
		manager = asuid;
        
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`capstone`@`%` PROCEDURE `spUpdateEmployee`(nasuID int, nasurite varchar(10), npassword varchar(15), nfirstName varchar(15), nlastName varchar(15), nposition varchar(15), nactive bit, nmanager int)
BEGIN
	UPDATE employee
    SET asurite = nasurite,
		employee.password = npassword,
        lastName = nlastName,
        firstName = nfirstName,
        position = nposition,
        active = nactive,
        manager = nmanager
        
	WHERE 
		asuID = nasuID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`capstone`@`%` PROCEDURE `spUpdateRiskMgr`(treportID int, tmgrReview varchar(45), tmgrDate DateTime, tmgrPosition varchar(45), tmgrReferred varchar(45), tmgrFollowup varchar(5000))
BEGIN

	UPDATE injury
    SET mgrReviewedBy = tmgrReview,
		mgrDate = tmgrDate,
        mgrPosition = tmgrPosition,
        mgrReferred = tmgrReferred,
        mgrFollowup = tmgrFollowup
        
	WHERE 
		reportID = treportID;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`capstone`@`%` PROCEDURE `viewReports`()
BEGIN
	SELECT victimName,
			asuID,
            locationName,
            treatmentProvider,
            address,
            phone,
            age,
            description
    
    FROM injury
			inner join 
            location on injury.locationID = location.locationID;
END$$
DELIMITER ;






