/*
Create entire FlightReservation Database
*/
DROP DATABASE IF EXISTS companyensf608;
CREATE DATABASE companyensf608; 
USE companyensf608;

Create Database test;
use test;
CREATE TABLE COMPANY (
	companyID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE AIRCRAFT (
	aircraftID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    companyID INT NOT NULL,
    FOREIGN KEY (companyID) REFERENCES COMPANY(companyID)
);

CREATE TABLE AIRPORT (
	airportID VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE FLIGHT (
	flightID INT AUTO_INCREMENT PRIMARY KEY,
    departure VARCHAR(50) NOT NULL,
    FOREIGN KEY (departure) REFERENCES AIRPORT(airportID),
    destination VARCHAR(50) NOT NULL, 
    FOREIGN KEY (destination) REFERENCES AIRPORT(airportID),
    date DATE NOT NULL,
    aircraftID INT NOT NULL,
	FOREIGN KEY (aircraftID) REFERENCES AIRCRAFT(aircraftID)
);

CREATE TABLE USER (
	userID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    birthDate DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL
);

CREATE TABLE REGISTERED_USER (
	userID INT PRIMARY KEY,
    FOREIGN KEY (userID) REFERENCES USER(userID),
	companyCard TINYINT NOT NULL,
    membership TINYINT NOT NULL,
    promotionAlert TINYINT NOT NULL
);

CREATE TABLE AIRLINE_AGENT (
	userID INT PRIMARY KEY,
    FOREIGN KEY (userID) REFERENCES USER(userID)
);

CREATE TABLE FLIGHT_ATTENDANT (
	userID INT PRIMARY KEY,
    FOREIGN KEY (userID) REFERENCES USER(userID)
);

CREATE TABLE SYSTEM_ADMIN (
	userID INT PRIMARY KEY,
    FOREIGN KEY (userID) REFERENCES USER(userID)
);

CREATE TABLE FLIGHT_ATTENDANT_ASSIGNMENT (
	flightAttendantID INT,
    FOREIGN KEY (flightAttendantID) REFERENCES FLIGHT_ATTENDANT(userID),
    flightID INT,
    FOREIGN KEY (flightID) REFERENCES FLIGHT(flightID),
    PRIMARY KEY (flightAttendantID, flightID)
);

CREATE TABLE BOOKING (
	bookingID INT AUTO_INCREMENT PRIMARY KEY,
    flightID INT NOT NULL,
    FOREIGN KEY (flightID) REFERENCES FLIGHT(flightID),
    firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    seat INT
);


