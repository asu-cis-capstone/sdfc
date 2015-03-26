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

insert into injury (reportID, activityID, locationID, actionsID, injuryTypeID, injuryLocationID, treatmentID, asuID,
victimName, address, phone, age, genderMale, refusalSig, treatmentProvider, positionTitle, managerCalled,
notWhy, timeCalled, arrival, transported, emergencyCalled, emergencyReportNum, medicalReportNum,
description, witnessName, witnessPhone, victimSig) values (1, 2, 3, 4, 5, 1, 2, 1203960337, "Kevin Galati", "111 Anywhere",
"9288469880", 23, 1, "sig.jpeg", "Banner", "Staff", 1, "lol", CURDATE(), CURDATE(), "Yeah he went", 1, 6969420, 4206969,
"It was all pretty bad", "Cody Pugliese", "9282303781", "siglol.jpeg");

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





