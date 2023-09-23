#This is the sql database

CREATE DATABASE IF NOT EXISTS ITIM;

USE ITIM;

CREATE TABLE IF NOT EXISTS Property(
    Id_Property BIGINT UNSIGNED AUTO_INCREMENT,
    Property_Code VARCHAR(50) UNIQUE NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY(Id_Property)
);

CREATE TABLE IF NOT EXISTS Departament(
    Id_Departament BIGINT UNSIGNED AUTO_INCREMENT,
    Departament VARCHAR(50) NOT NULL,
    Property BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Departament),
    CONSTRAINT Property_FK_Departament
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Google_Account(
    Id_Google_Account BIGINT UNSIGNED AUTO_INCREMENT,
    Google_Account VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Country VARCHAR(20) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Email_Recovery VARCHAR(50),
    Property BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Google_Account),
    CONSTRAINT Property_FK_Google_Account
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Phone_Line(
    Id_Phone_Line BIGINT UNSIGNED AUTO_INCREMENT,
    Phone_Company VARCHAR(50) NOT NULL,
    Phone_Number VARCHAR(12) NOT NULL UNIQUE,
    SIM_Code VARCHAR(30) UNIQUE,
    Country_Code VARCHAR(5) NOT NULL,
    Status VARCHAR(10) NOT NULL,
    Availability VARCHAR(10) NOT NULL,
    PRIMARY KEY(Id_Phone_Line)
);

CREATE TABLE IF NOT EXISTS Join_Google_Account_Phone_Line(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Google_Account BIGINT UNSIGNED NOT NULL,
    Id_Phone_Line BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Google_Account_FK_Join_Google_Account_Phone_Line
    FOREIGN KEY(Id_Google_Account) REFERENCES Google_Account(Id_Google_Account) ON UPDATE CASCADE,
    CONSTRAINT Phone_Line_FK_Join_Google_Account_Phone_Line
    FOREIGN KEY(Id_Phone_Line) REFERENCES Phone_Line(Id_Phone_Line) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Apple_ID(
    Id_Apple_ID BIGINT UNSIGNED AUTO_INCREMENT,
    Apple_ID VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Country VARCHAR(20) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Registration_Date DATE NOT NULL,
    Secret_Question_1 VARCHAR(100),
    Secret_Question_1_Password VARCHAR(50),
    Secret_Question_2 VARCHAR(100),
    Secret_Question_2_Password VARCHAR(50),
    Secret_Question_3 VARCHAR(100),
    Secret_Question_3_Password VARCHAR(50),
    Property BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Apple_ID),
    CONSTRAINT Property_FK_Apple_ID
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Apple_ID_Phone_Line(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Apple_ID BIGINT UNSIGNED NOT NULL,
    Id_Phone_Line BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Apple_ID_FK_Join_Apple_ID_Phone_Line
    FOREIGN KEY(Id_Apple_ID) REFERENCES Apple_ID(Id_Apple_ID) ON UPDATE CASCADE,
    CONSTRAINT Phone_Line_FK_Join_Apple_ID_Phone_Line
    FOREIGN KEY(Id_Phone_Line) REFERENCES Phone_Line(Id_Phone_Line) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS TradeMark(
    Id_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY(Id_TradeMark)
);

CREATE TABLE IF NOT EXISTS Operating_System_TradeMark(
    Id_Operating_System_Trademark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Operating_System_Trademark),
    CONSTRAINT TradeMark_FK_Operating_System_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Server_TradeMark(
    Id_Server_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Server_TradeMark),
    CONSTRAINT TradeMark_FK_Server_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS UPS_TradeMark(
    Id_UPS_Trademark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_UPS_Trademark),
    CONSTRAINT TradeMark_FK_UPS_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Monitor_TradeMark(
    Id_Monitor_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Monitor_Trademark),
    CONSTRAINT TradeMark_FK_Monitor_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS CPU_TradeMark(
    Id_CPU_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_CPU_Trademark),
    CONSTRAINT TradeMark_FK_CPU_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Cell_Phone_TradeMark(
    Id_Cell_Phone_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Cell_Phone_Trademark),
    CONSTRAINT TradeMark_FK_Cell_Phone_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Tablet_TradeMark(
    Id_Tablet_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Tablet_Trademark),
    CONSTRAINT TradeMark_FK_Tablet_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Phone_TradeMark(
    Id_Phone_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Phone_Trademark),
    CONSTRAINT TradeMark_FK_Phone_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PC_TradeMark(
    Id_PC_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_PC_Trademark),
    CONSTRAINT TradeMark_FK_PC_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Printer_TradeMark(
    Id_Printer_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Printer_Trademark),
    CONSTRAINT TradeMark_FK_Printer_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Switch_TradeMark(
    Id_Switch_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Switch_Trademark),
    CONSTRAINT TradeMark_FK_Switch_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Router_TradeMark(
    Id_Router_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Router_Trademark),
    CONSTRAINT TradeMark_FK_Router_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Model(
    Id_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(Id_Model)
);

CREATE TABLE IF NOT EXISTS Server_Model(
    Id_Server_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Server_Model),
    CONSTRAINT Model_FK_Server_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT Server_TradeMark_FK_Server_Model
    FOREIGN KEY(TradeMark) REFERENCES Server_TradeMark(Id_Server_TradeMark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS UPS_Model(
    Id_UPS_Model BIGINT UNSIGNED AUTO_INCREMENT,
    VA VARCHAR(5),
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_UPS_Model),
    CONSTRAINT Model_FK_UPS_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_UPS_Model
    FOREIGN KEY(TradeMark) REFERENCES UPS_TradeMark(Id_UPS_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Monitor_Model(
    Id_Monitor_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Refresh_Rate VARCHAR(10),
    Size VARCHAR(20) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Monitor_Model),
    CONSTRAINT Model_FK_Monitor_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_Monitor_Model
    FOREIGN KEY(TradeMark) REFERENCES Monitor_TradeMark(Id_Monitor_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS CPU_Model(
    Id_CPU_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Speed VARCHAR(5) NOT NULL,
    Generation INT NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_CPU_Model),
    CONSTRAINT Model_FK_CPU_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_CPU_Model
    FOREIGN KEY(TradeMark) REFERENCES CPU_TradeMark(Id_CPU_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Router_Model(
    Id_Router_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Speed VARCHAR(5) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Router_Model),
    CONSTRAINT Model_FK_Router_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_Router_Model
    FOREIGN KEY(TradeMark) REFERENCES Router_TradeMark(Id_Router_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Switch_Model(
    Id_Switch_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Speed VARCHAR(5) NOT NULL,
    Manageable INT NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Switch_Model),
    CONSTRAINT Model_FK_Switch_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_Switch_Model
    FOREIGN KEY(TradeMark) REFERENCES Switch_TradeMark(Id_Switch_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Printer_Model(
    Id_Printer_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Type VARCHAR(10) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Printer_Model),
    CONSTRAINT Model_FK_Printer_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_Printer_Model
    FOREIGN KEY(TradeMark) REFERENCES Printer_TradeMark(Id_Printer_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PC_Model(
    Id_PC_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Type VARCHAR(10) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_PC_Model),
    CONSTRAINT Model_FK_PC_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_PC_Model
    FOREIGN KEY(TradeMark) REFERENCES PC_TradeMark(Id_PC_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Phone_Model(
    Id_Phone_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Type VARCHAR(20) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Phone_Model),
    CONSTRAINT Model_FK_Phone_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_Phone_Model
    FOREIGN KEY(TradeMark) REFERENCES Phone_TradeMark(Id_Phone_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Tablet_Model(
    Id_Tablet_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Tablet_Model),
    CONSTRAINT Model_FK_Tablet_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_Tablet_Model
    FOREIGN KEY(TradeMark) REFERENCES Tablet_TradeMark(Id_Tablet_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Cell_Phone_Model(
    Id_Cell_Phone_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Cell_Phone_Model),
    CONSTRAINT Model_FK_Cell_Phone_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE,
    CONSTRAINT TradeMark_FK_Cell_Phone_Model
    FOREIGN KEY(TradeMark) REFERENCES Cell_Phone_TradeMark(Id_Cell_Phone_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS HostName(
    Id_HostName BIGINT UNSIGNED AUTO_INCREMENT,
    HostName VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(10) NOT NULL,
    Property BIGINT UNSIGNED, 
    PRIMARY KEY(Id_HostName),
    CONSTRAINT Property_FK_HostName
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Operating_System(
    Id_Operating_System BIGINT UNSIGNED AUTO_INCREMENT,
    Operating_System VARCHAR(20) NOT NULL UNIQUE,
    Architecture VARCHAR(10) NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Operating_System),
    CONSTRAINT Operating_System_TradeMark_FK_Operating_System
    FOREIGN KEY(TradeMark) REFERENCES Operating_System_TradeMark(Id_Operating_System_Trademark) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS IP_Address(
    Id_IP_Address BIGINT UNSIGNED AUTO_INCREMENT,
    IP_Address VARCHAR(20) NOT NULL UNIQUE,
    Status INT(1) NOT NULL,
    PRIMARY KEY(Id_IP_Address)
);

CREATE TABLE IF NOT EXISTS Network(
    Id_Network BIGINT UNSIGNED AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    Subnet_Mask VARCHAR(15) NOT NULL,
    CIDR VARCHAR(2) NOT NULL,
    Host_Number INT NOT NULL,
    Length INT NOT NULL,
    IP_Address BIGINT UNSIGNED,
    Property BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Network),
    CONSTRAINT Property_FK_Network
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT IP_Address_FK_Network
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE IP_Address ADD COLUMN Network BIGINT UNSIGNED NOT NULL,
ADD CONSTRAINT Network_FK_IP_Address
FOREIGN KEY(Network) REFERENCES Network(Id_Network) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS Join_Network_IP_Address_as_DHCP_Server(
    Id_DHCP_Server BIGINT UNSIGNED AUTO_INCREMENT,
    Id_IP_Address BIGINT UNSIGNED,
    Id_Network BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_DHCP_Server),
    CONSTRAINT Join_Network_IP_Address_as_DHCP_Server_FK_IP_Address
    FOREIGN KEY(Id_IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Join_Network_IP_Address_as_DHCP_Server_FK_Network
    FOREIGN KEY(Id_Network) REFERENCES Network(Id_Network) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Network_IP_Address_as_Broadcast(
    Id_Broadcast BIGINT UNSIGNED AUTO_INCREMENT,
    Id_IP_Address BIGINT UNSIGNED NOT NULL,
    Id_Network BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Broadcast),
    CONSTRAINT Join_Network_IP_Address_as_Broadcast_FK_IP_Address
    FOREIGN KEY(Id_IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Join_Network_IP_Address_as_Broadcast_FK_Network
    FOREIGN KEY(Id_Network) REFERENCES Network(Id_Network) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Network_IP_Address_as_Gateway(
    Id_Gateway BIGINT UNSIGNED AUTO_INCREMENT,
    Id_IP_Address BIGINT UNSIGNED NOT NULL,
    Id_Network BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Gateway),
    CONSTRAINT Join_Network_IP_Address_as_Gateway_FK_IP_Address
    FOREIGN KEY(Id_IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Join_Network_IP_Address_as_Gateway_FK_Network
    FOREIGN KEY(Id_Network) REFERENCES Network(Id_Network) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS UPS(
    Id_UPS BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Property BIGINT UNSIGNED NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_UPS),
    CONSTRAINT Property_FK_UPS
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT UPS_Model_FK_UPS
    FOREIGN KEY(Model) REFERENCES UPS_Model(Id_UPS_Model) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS User(
    Id_User BIGINT UNSIGNED AUTO_INCREMENT,
    Employee_Number VARCHAR(20) NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    First_Surname VARCHAR(50) NOT NULL,
    Second_Surname VARCHAR(50) NOT NULL,
    Job VARCHAR(50),
    Email VARCHAR(50),
    Generic_Email VARCHAR(50),
    Windows_User VARCHAR(15),
    Windows_Password VARCHAR(50),
    Have_SAP_Password INT,
    SAP_Password VARCHAR(50),
    Domain_User VARCHAR(20),
    Domain_Password VARCHAR(50),
    Status VARCHAR(10) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Note_3 VARCHAR(100),
    UPS BIGINT UNSIGNED,
    Departament BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_User),
    CONSTRAINT UPS_FK_User
    FOREIGN KEY(UPS) REFERENCES UPS(Id_UPS) ON UPDATE CASCADE,
    CONSTRAINT Departament_FK_User
    FOREIGN KEY(Departament) REFERENCES Departament(Id_Departament) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Cell_Phone(
    Id_Cell_Phone BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) UNIQUE,
    Imei_1 VARCHAR(50) NOT NULL UNIQUE,
    Imei_2 VARCHAR(50) UNIQUE,
    Storage_Capacity VARCHAR(10),
    Platformed INT,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Status VARCHAR(10) NOT NULL,
    Registration_Date DATE NOT NULL,
    Property BIGINT UNSIGNED NOT NULL,
    User BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    Apple_ID BIGINT UNSIGNED,
    PRIMARY KEY(Id_Cell_Phone),
    CONSTRAINT Property_FK_Cell_Phone
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT User_FK_Cell_Phone
    FOREIGN KEY(User) REFERENCES User(Id_User) ON UPDATE CASCADE,
    CONSTRAINT Model_FK_Cell_Phone
    FOREIGN KEY(Model) REFERENCES Cell_Phone_Model(Id_Cell_Phone_Model) ON UPDATE CASCADE,
    CONSTRAINT Apple_ID_FK_Cell_Phone
    FOREIGN KEY(Apple_ID) REFERENCES Apple_ID(Id_Apple_ID) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Tablet(
    Id_Tablet BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Storage_Capacity VARCHAR(10),
    Platformed INT,
    Status VARCHAR(10) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Property BIGINT UNSIGNED NOT NULL,
    User BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    Apple_ID BIGINT UNSIGNED,
    PRIMARY KEY(Id_Tablet),
    CONSTRAINT Property_FK_Tablet
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT User_FK_Tablet
    FOREIGN KEY(User) REFERENCES User(Id_User) ON UPDATE CASCADE,
    CONSTRAINT Model_FK_Tablet
    FOREIGN KEY(Model) REFERENCES Tablet_Model(Id_Tablet_Model) ON UPDATE CASCADE,
    CONSTRAINT Apple_ID_FK_Tablet
    FOREIGN KEY(Apple_ID) REFERENCES Apple_ID(Id_Apple_ID) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Extension(
    Id_Extension BIGINT UNSIGNED AUTO_INCREMENT,
    Extension VARCHAR(10) NOT NULL UNIQUE,
    Status VARCHAR(10) NOT NULL,
    Circuit VARCHAR(10) UNIQUE,
    Phone_Line BIGINT UNSIGNED UNIQUE,
    PRIMARY KEY(Id_Extension),
    CONSTRAINT Phone_Line_FK_Extension
    FOREIGN KEY(Phone_Line) REFERENCES Phone_Line(Id_Phone_Line) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Phone(
    Id_Phone BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(10) NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Registration_Date DATE NOT NULL,
    IP_Address BIGINT UNSIGNED,
    Extension BIGINT UNSIGNED,
    Property BIGINT UNSIGNED NOT NULL,
    User BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Phone),
    CONSTRAINT IP_Address_FK_Phone
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE,
    FOREIGN KEY(Extension) REFERENCES Extension(Id_Extension) ON UPDATE CASCADE,
    CONSTRAINT Property_FK_Phone
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT User_FK_Phone
    FOREIGN KEY(User) REFERENCES User(Id_User) ON UPDATE CASCADE,
    CONSTRAINT Model_FK_Phone
    FOREIGN KEY(Model) REFERENCES Phone_Model(Id_Phone_Model) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PC(
    Id_PC BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) UNIQUE,
    Type VARCHAR(20) NOT NULL,
    Status VARCHAR(10) NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    RAM_Capacity INT,
    Type_Storage VARCHAR(5),
    Storage_Capacity INT,
    Platformed INT NOT NULL,
    Registration_Date DATE NOT NULL,
    Warranty_Status VARCHAR(10),
    Warranty_Start DATE,
    Warranty_Expiration DATE,
    Property BIGINT UNSIGNED NOT NULL,
    HostName BIGINT UNSIGNED,
    CPU BIGINT UNSIGNED NOT NULL,
    IP_Address BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_PC),
    CONSTRAINT Property_FK_PC
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT HostName_FK_PC
    FOREIGN KEY(HostName) REFERENCES HostName(Id_HostName) ON UPDATE CASCADE,
    CONSTRAINT CPU_Model_FK_PC
    FOREIGN KEY(CPU) REFERENCES CPU_Model(Id_CPU_Model) ON UPDATE CASCADE,
    CONSTRAINT IP_Address_FK_PC
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE,
    CONSTRAINT PC_Model_FK_PC
    FOREIGN KEY(Model) REFERENCES PC_Model(Id_PC_Model) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Operating_System_PC(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Operating_System BIGINT UNSIGNED NOT NULL,
    Id_PC BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Operating_System_FK_Join_Operating_System_PC
    FOREIGN KEY(Id_Operating_System) REFERENCES Operating_System(Id_Operating_System) ON UPDATE CASCADE,
    CONSTRAINT PC_FK_Join_Operating_System_PC
    FOREIGN KEY(Id_PC) REFERENCES PC(Id_PC) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Printer(
    Id_Printer BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Connection_Type VARCHAR(10),
    Modality VARCHAR(20) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    IP_Address BIGINT UNSIGNED UNIQUE,
    Property BIGINT UNSIGNED,
    Departament BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Printer),
    CONSTRAINT IP_Address_FK_Printer
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE,
    CONSTRAINT Property_FK_Printer
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT Departament_FK_Printer
    FOREIGN KEY(Departament) REFERENCES Departament(Id_Departament) ON UPDATE CASCADE,
    CONSTRAINT Printer_Model_FK_Printer
    FOREIGN KEY(Model) REFERENCES Printer_Model(Id_Printer_Model) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Switch(
    Id_Switch BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    IP_Address BIGINT UNSIGNED,
    Property BIGINT UNSIGNED NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Switch),
    CONSTRAINT IP_Address_FK_Switch
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE,
    CONSTRAINT Property_FK_Switch
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT Switch_Model_FK_Switch
    FOREIGN KEY(Model) REFERENCES Switch_Model(Id_Switch_Model) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Router(
    Id_Router BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Property BIGINT UNSIGNED NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Router),
    CONSTRAINT Property_FK_Router
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT Router_Model_FK_Router
    FOREIGN KEY(Model) REFERENCES Router_Model(Id_Router_Model) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Monitor(
    Id_Monitor BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    PC BIGINT UNSIGNED,
    Property BIGINT UNSIGNED NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Monitor),
    CONSTRAINT PC_FK_Monitor
    FOREIGN KEY(PC) REFERENCES PC(Id_PC) ON UPDATE CASCADE,
    CONSTRAINT Property_FK_Monitor
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT Monitor_Model_FK_Monitor
    FOREIGN KEY(Model) REFERENCES Monitor_Model(Id_Monitor_Model) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Server(
    Id_Server BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) UNIQUE,
    Status VARCHAR(10) NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    RAM_Capacity INT,
    Type_Storage VARCHAR(5),
    Storage_Capacity INT,
    Platformed INT NOT NULL,
    Registration_Date DATE NOT NULL,
    Warranty_Status VARCHAR(10),
    Warranty_Start DATE,
    Warranty_Expiration DATE,
    Property BIGINT UNSIGNED NOT NULL,
    HostName BIGINT UNSIGNED,
    CPU BIGINT UNSIGNED NOT NULL,
    IP_Address BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Server),
    CONSTRAINT Property_FK_Server
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE,
    CONSTRAINT HostName_FK_Server
    FOREIGN KEY(HostName) REFERENCES HostName(Id_HostName) ON UPDATE CASCADE,
    CONSTRAINT CPU_Model_FK_Server
    FOREIGN KEY(CPU) REFERENCES CPU_Model(Id_CPU_Model) ON UPDATE CASCADE,
    CONSTRAINT IP_Address_FK_Server
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE,
    CONSTRAINT Server_Model_FK_Server
    FOREIGN KEY(Model) REFERENCES Server_Model(Id_Server_Model) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS System_User(
    Id_System_User BIGINT UNSIGNED AUTO_INCREMENT,
    Password TEXT NOT NULL,
    User_Type VARCHAR(20) NOT NULL,
    User BIGINT UNSIGNED NOT NULL UNIQUE,
    Language VARCHAR(20) DEFAULT "auto",
    PRIMARY KEY(Id_System_User),
    CONSTRAINT User_FK_System_User
    FOREIGN KEY(User) REFERENCES User(Id_User) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS System_Section(
    Id_System_Section BIGINT UNSIGNED AUTO_INCREMENT,
    Section VARCHAR(20) NOT NULL,
    PRIMARY KEY(Id_System_Section)
);

CREATE TABLE IF NOT EXISTS Event(
    Id_Event BIGINT UNSIGNED AUTO_INCREMENT,
    Event VARCHAR(50) NOT NULL,
    Event_Date DATE NOT NULL,
    Details VARCHAR(200) NOT NULL,
    User BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Event),
    CONSTRAINT System_User_FK_Event
    FOREIGN KEY(User) REFERENCES System_User(Id_System_User) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_System_User_System_Section(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_System_User BIGINT UNSIGNED NOT NULL,
    Id_System_Section BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Join_System_User_System_Section_FK_System_User
    FOREIGN KEY(Id_System_User) REFERENCES System_User(Id_System_User) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Join_System_User_System_Section_FK_System_Section
    FOREIGN KEY(Id_System_Section) REFERENCES System_Section(Id_System_Section) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_System_User_Property(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_System_User BIGINT UNSIGNED NOT NULL,
    Id_Property BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Join_System_User_Property_Fk_System_User
    FOREIGN KEY(Id_System_User) REFERENCES System_User(Id_System_User) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Join_System_User_Property_FK_Property
    FOREIGN KEY(Id_Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_User_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_User BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT User_FK_Join_User_Event
    FOREIGN KEY(Id_User) REFERENCES User(Id_User) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_User_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Cell_Phone_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Cell_Phone BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Cell_Phone_FK_Join_Cell_Phone_Event
    FOREIGN KEY(Id_Cell_Phone) REFERENCES Cell_Phone(Id_Cell_Phone) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Cell_Phone_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Tablet_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Tablet BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Tablet_FK_Join_Tablet_Event
    FOREIGN KEY(Id_Tablet) REFERENCES Tablet(Id_Tablet) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Tablet_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Phone_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Phone BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Phone_FK_Join_Phone_Event
    FOREIGN KEY(Id_Phone) REFERENCES Phone(Id_Phone) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Phone_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_PC_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_PC BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT PC_FK_Join_PC_Event
    FOREIGN KEY(Id_PC) REFERENCES PC(Id_PC) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_PC_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Printer_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Printer BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Printer_FK_Join_Printer_Event
    FOREIGN KEY(Id_Printer) REFERENCES Printer(Id_Printer) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Printer_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Switch_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Switch BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Swtich_FK_Join_Switch_Event
    FOREIGN KEY(Id_Switch) REFERENCES Switch(Id_Switch) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Switch_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Router_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Router BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Router_Fk_Join_Router_Event
    FOREIGN KEY(Id_Router) REFERENCES Router(Id_Router) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Router_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Monitor_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Monitor BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Monitor_FK_Join_Monitor_Event
    FOREIGN KEY(Id_Monitor) REFERENCES Monitor(Id_Monitor) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Monitor_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_UPS_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_UPS BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT UPS_FK_Join_UPS_Event
    FOREIGN KEY(Id_UPS) REFERENCES UPS(Id_UPS) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_UPS_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Server_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Server BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Server_FK_Join_Server_Event
    FOREIGN KEY(Id_Server) REFERENCES Server(Id_Server) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Server_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_System_User_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_System_User BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT System_User_FK_Join_System_User_Event
    FOREIGN KEY(Id_System_User) REFERENCES System_User(Id_System_User) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_System_User_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Property_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Property BIGINT UNSIGNED,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Property_FK_Join_Property_Event
    FOREIGN KEY(Id_Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Property_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Departament_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Departament BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Departament_FK_Join_Departament_Event
    FOREIGN KEY(Id_Departament) REFERENCES Departament(Id_Departament) ON UPDATE CASCADE,
    CONSTRAINT Event_FK_Join_Departament_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_IP_Address_Router(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_IP_Address BIGINT UNSIGNED NOT NULL,
    Id_Router BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT IP_Address_FK_Join_IP_Address_Router
    FOREIGN KEY(Id_IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Router_FK_Join_IP_Address_Router
    FOREIGN KEY(Id_Router) REFERENCES Router(Id_Router) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_User_PC(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_User BIGINT UNSIGNED NOT NULL,
    Id_PC BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT User_FK_Join_User_PC
    FOREIGN KEY(Id_User) REFERENCES User(Id_User) ON UPDATE CASCADE,
    CONSTRAINT PC_FK_Join_User_PCA
    FOREIGN KEY(Id_PC) REFERENCES PC(Id_PC) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Tablet_Google_Account(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Google_Account BIGINT UNSIGNED NOT NULL,
    Id_Tablet BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Google_Account_FK_Join_Tablet_Google_Account
    FOREIGN KEY(Id_Google_Account) REFERENCES Google_Account(Id_Google_Account) ON UPDATE CASCADE,
    CONSTRAINT Tablet_FK_Join_Tablet_Google_Account
    FOREIGN KEY(Id_Tablet) REFERENCES Tablet(Id_Tablet) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Cell_Phone_Google_Account(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Google_Account BIGINT UNSIGNED NOT NULL,
    Id_Cell_Phone BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Google_Account_FK_Join_Cell_Phone_Google_Account
    FOREIGN KEY(Id_Google_Account) REFERENCES Google_Account(Id_Google_Account) ON UPDATE CASCADE,
    CONSTRAINT Cell_Phone_FK_Join_Cell_Phone_Google_Account
    FOREIGN KEY(Id_Cell_Phone) REFERENCES Cell_Phone(Id_Cell_Phone) ON UPDATE CASCADE
);


CREATE USER 'administrator'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Roll$371415';
GRANT ALL PRIVILEGES ON MIT . * TO 'administrator'@'localhost';

INSERT INTO Property VALUES(NULL, '5836', 'Paradisus Cancún');
INSERT INTO Property VALUES(NULL, '6167', 'Circle by Melia Cancún');

INSERT INTO Departament VALUES(NULL, 'Sistemas', 1);

INSERT INTO User VALUES(
    NULL,
    '3066976',
    'Javier Alfonso',
    'Maria',
    'Salas',
    'Asistente de Sistemas',
    'javier.maria.salas@melia.com',
    NULL,
    'JLMR125',
    'Mell$1148',
    0,
    NULL,
    'SMA0384',
    'Mell$1148129',
    'Activo',
    '2023-01-29',
    'Primer usuario creado para la bd',
    'Sin nota 2',
    'Sin nota 3',
    NULL,
    1
);

INSERT INTO User VALUES(
    NULL,
    '3066978',
    'Luis Javier',
    'Cruz',
    'Acevedo',
    'Gerente de Sistemas',
    'luis.cruz.acevedo@melia.com',
    NULL,
    'JLMR126',
    'Mell$1149',
    0,
    NULL,
    'SMA0385',
    'Mell$11445632',
    'Activo',
    '2023-02-28',
    'Segundo usuario creado para la bd',
    'Sin nota 2',
    'Sin nota 3',
    NULL,
    1
);
INSERT INTO System_User (Password, User_Type, User) VALUES(
    'd26566fac1aa1773fb4e4a1f5591dbe8',
    'Administrator',
    1
);

#Temp Insertions to next comment
INSERT INTO System_Section VALUES(null, "Home");
INSERT INTO System_Section VALUES(null, "Properties");
INSERT INTO System_Section VALUES(null, "Networks");
INSERT INTO System_Section VALUES(null, "Events");
INSERT INTO System_Section VALUES(null, "Users");

INSERT INTO Join_System_User_System_Section VALUES(null, 1, 1);
INSERT INTO Join_System_User_System_Section VALUES(null, 1, 2);
INSERT INTO Join_System_User_System_Section VALUES(null, 1, 3);
INSERT INTO Join_System_User_System_Section VALUES(null, 1, 4);
INSERT INTO Join_System_User_System_Section VALUES(null, 1, 5);

#Evento_1
INSERT INTO Event VALUES(
    NULL,
    'Creación de Propiedad',
    '2023-07-01',
    'Creación de Propiedad 5836 Paradisus Cancún automaticamente por sistema',
    1
);

#Evento_2
INSERT INTO Event VALUES(
    NULL,
    'Creación de Propiedad',
    '2023-07-01',
    'Creación de Propiedad 6167 Circle by Melia Cancún automaticamente por sistema',
    1
);

INSERT INTO Join_Property_Event VALUES(
    NULL,
    1,
    1
);

INSERT INTO Join_Property_Event VALUES(
    NULL,
    2,
    2
);

#Evento_3
INSERT INTO Event VALUES(
    NULL,
    'Creación de Departamento',
    '2023-07-01',
    'Creación de Departamento Sistemas automaticamente por sistema',
    1
);

INSERT INTO Join_Departament_Event VALUES(
    NULL,
    1,
    3
);

#Evento_4
INSERT INTO Event VALUES(
    NULL,
    'Creación de Usuario',
    '2023-07-01',
    'Creación de usuario Javier Alfonso Maria Salas',
    1
);

INSERT INTO Join_User_Event VALUES(
    NULL,
    1,
    4
);

#Evento_5
INSERT INTO Event VALUES(
    NULL,
    'Creación de Usuario de sistema',
    '2023-07-01',
    'Creación de usuario de Sistema JLMR125 automaticamente por sistema',
    1
);

INSERT INTO Join_System_User_Event VALUES(
    NULL,
    1,
    5
);


#VIEWS

CREATE VIEW System_Users AS
SELECT System_User.Id_System_User,
       User.Name,
       User.First_Surname,
       User.Second_Surname,
       User.Windows_User,
       System_User.Password,
       System_User.User_Type,
       System_User.Language,
       User.Id_User
       FROM User inner join System_User ON User.Id_User = System_User.User;

CREATE VIEW System_User_Events AS SELECT 
	System_User.Id_System_User,
    System_User.User_Type,
    Event.Id_Event,
    Event.Event,
    Event.Event_Date,
    Event.Details,
    User.Employee_Number,
    User.Name,
    User.First_Surname,
    User.Second_Surname,
    User.Windows_User
	FROM System_User INNER JOIN Join_System_User_Event ON System_User.Id_System_User = Join_System_User_Event.Id_System_User INNER JOIN Event ON Event.Id_Event = Join_System_User_Event.Id_Event INNER JOIN User ON User.Id_User = System_User.User;

CREATE VIEW Property_Events AS SELECT 
	Property.Id_Property,
    Property.Property_Code,
    Property.Name as "Property_Name",
    Event.Id_Event,
    Event.Event,
    Event.Event_Date,
    Event.Details,
    User.Employee_Number,
    User.Name,
    User.First_Surname,
    User.Second_Surname,
    User.Windows_User
	FROM Property INNER JOIN Join_Property_Event ON Property.Id_Property = Join_Property_Event.Id_Property INNER JOIN Event ON Event.Id_Event = Join_Property_Event.Id_Event INNER JOIN User ON User.Id_User = Event.User;

CREATE VIEW Partial_Networks AS SELECT
    Property.Property_Code AS Property_Code,
    Property.Name AS Property_Name,
    Network.Id_Network,
    Network.Name AS Network_Name,
    Network.Subnet_Mask,
    Network.CIDR,
    Network.Host_Number,
    Network.Length,
    IP_Address.IP_Address AS Network_Address
    FROM Network JOIN IP_Address ON Network.IP_Address = IP_Address.Id_IP_Address AND Network.Id_Network = IP_Address.Network JOIN Property ON Property.Id_Property = Network.Property;

CREATE VIEW Broadcast AS SELECT
	Network.Id_Network,
    IP_Address.IP_Address AS Broadcast
	FROM Network JOIN Join_Network_IP_Address_as_Broadcast ON Network.Id_Network = Join_Network_IP_Address_as_Broadcast.Id_Network JOIN IP_Address ON Join_Network_IP_Address_as_Broadcast.Id_IP_Address = IP_Address.Id_IP_Address;

CREATE VIEW Gateway AS SELECT
	Network.Id_Network,
    IP_Address.IP_Address AS Gateway
	FROM Network JOIN Join_Network_IP_Address_as_Gateway ON Network.Id_Network = Join_Network_IP_Address_as_Gateway.Id_Network JOIN IP_Address ON Join_Network_IP_Address_as_Gateway.Id_IP_Address = IP_Address.Id_IP_Address;

CREATE VIEW DHCP_Server AS SELECT
	Network.Id_Network,
    IP_Address.IP_Address AS DHCP_Server
	FROM Network JOIN Join_Network_IP_Address_as_DHCP_Server ON Network.Id_Network = Join_Network_IP_Address_as_DHCP_Server.Id_Network JOIN IP_Address ON Join_Network_IP_Address_as_DHCP_Server.Id_IP_Address = IP_Address.Id_IP_Address;

CREATE VIEW Networks AS SELECT
	Partial_Networks.Id_Network,
    Partial_Networks.Property_Code,
    Partial_Networks.Property_Name,
    Partial_Networks.Network_Name,
    Partial_Networks.Subnet_Mask,
    Partial_Networks.CIDR,
    Partial_Networks.Network_Address,
    Broadcast.Broadcast,
    Partial_Networks.Host_Number,
    Partial_Networks.Length
		FROM Partial_Networks JOIN Broadcast
			ON Partial_Networks.Id_Network = Broadcast.Id_Network;

 CREATE VIEW Gateways_Address AS SELECT
    IP_Address.Id_IP_Address,
    IP_Address.IP_Address,
    IP_Address.Network
        FROM Router JOIN Join_IP_Address_Router
            ON Router.Id_Router = Join_IP_Address_Router.Id_Router
        JOIN IP_Address
            ON IP_Address.Id_IP_Address = Join_IP_Address_Router.Id_IP_Address;


#DataTemp
#INSERT INTO Network VALUES(null, 'Red 19', '255.255.255.0', '24', 254, 256, null, 1);
#INSERT INTO Network VALUES(null, 'Red de Club', '255.255.255.0', '24', 254, 256, null, 2);
#INSERT INTO IP_Address VALUES(null, '10.0.19.0', 0, 1);
#INSERT INTO IP_Address VALUES(null, '10.0.19.255', 0, 1);
#INSERT INTO IP_Address VALUES(null, '10.0.19.108', 0, 1);
#INSERT INTO IP_Address VALUES(null, '10.0.19.1', 0, 1);
#INSERT INTO IP_Address VALUES(null, '10.1.50.0', 0, 2);
#INSERT INTO IP_Address VALUES(null, '10.1.50.255', 0, 2);
#INSERT INTO IP_Address VALUES(null, '10.1.50.1', 0, 2);
#UPDATE Network SET IP_Address = 1 WHERE Id_Network = 1;
#UPDATE Network SET IP_Address = 5 WHERE Id_Network = 2;


##INSERT INTO Join_Network_IP_Address_as_DHCP_Server VALUES(null, null, 1);
#INSERT INTO Join_Network_IP_Address_as_Broadcast VALUES(null, 2, 1);
#INSERT INTO Join_Network_IP_Address_as_Gateway VALUES(null, 3, 1);

#INSERT INTO Join_Network_IP_Address_as_DHCP_Server VALUES(null, 7, 2);
#INSERT INTO Join_Network_IP_Address_as_Broadcast VALUES(null, 6, 2);
#INSERT INTO Join_Network_IP_Address_as_Gateway VALUES(null, 7, 2);

#SELECT User.Name, User.First_Surname, User.Second_Surname, User.Windows_User, System_User.Password, System_User.User_Type, System_User.Lenguage FROM User inner join System_User ON User.Id_User = 1 AND System_User.User = 1;
#SELECT * from System_Users;