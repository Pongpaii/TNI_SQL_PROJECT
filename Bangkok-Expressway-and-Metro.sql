-- BEM (MRT) 2213211861 ,2213211531,2213210210
--create table
CREATE TABLE Customer (
  cus_id NUMBER(10) PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  gender VARCHAR2(10),
  date_of_birth DATE,
  email VARCHAR2(100),
  phone_number VARCHAR2(20),
  registration_date DATE
);

CREATE TABLE TRANSACTION (
  transac_id NUMBER(10) PRIMARY KEY,
  cus_id NUMBER(10),
  transac_date DATE,
  price NUMBER(5),
  tax NUMBER(2),
  payment_method VARCHAR2(50),
  FOREIGN KEY (cus_id) REFERENCES Customer(cus_id)
);

CREATE TABLE TRAIN_TICKET (
  ticket_id NUMBER(10) PRIMARY KEY,
  transac_id NUMBER(10),
  depart_sta VARCHAR2(50),
  arrival_sta VARCHAR2(50),
  status VARCHAR2(20),
  FOREIGN KEY (transac_id) REFERENCES TRANSACTION(transac_id)
);

CREATE TABLE JOURNEY (
  JOURNEY_ID NUMBER(10),
  TICKET_ID NUMBER(10),
  TRANSAC_ID NUMBER(10),
  DESTINATION VARCHAR2(255),
  TRAVEL_DURATION NUMBER(5),
  PRIMARY KEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID),
  FOREIGN KEY (TICKET_ID) REFERENCES TRAIN_TICKET(TICKET_ID),
  FOREIGN KEY (TRANSAC_ID) REFERENCES TRANSACTION(TRANSAC_ID)
);


CREATE TABLE EMPLOYEE (
  EMP_ID NUMBER(10) PRIMARY KEY,
  FIRST_NAME VARCHAR2(50),
  LAST_NAME VARCHAR2(50),
  DOB DATE,
  ADDRESS VARCHAR2(255),
  PHONE VARCHAR2(15),
  SALARY NUMBER(12,2),
  HIRE_DATE DATE
);

CREATE TABLE STATION (
  station_id NUMBER(10),
  journey_id NUMBER(10),
  ticket_id NUMBER(10),
  transac_id NUMBER(10),
  emp_id NUMBER(10),
  station_name VARCHAR2(255),
  station_phone VARCHAR2(20),
  PRIMARY KEY (station_id, journey_id, ticket_id, emp_id),
  FOREIGN KEY (journey_id, ticket_id, transac_id) 
  REFERENCES JOURNEY(JOURNEY_ID, TICKET_ID, TRANSAC_ID),
  FOREIGN KEY (emp_id) REFERENCES EMPLOYEE(EMP_ID)
);

CREATE TABLE TRAIN (
  train_id NUMBER(10) PRIMARY KEY,
  train_name VARCHAR2(50),
  train_type VARCHAR2(50),
  train_model VARCHAR2(50),
  seating_capacity NUMBER(5),
  max_speed NUMBER(3),
  phone VARCHAR2(15)
);

CREATE TABLE trainschedule (
  sch_id NUMBER(10) PRIMARY KEY,
  depart_time NUMBER(5),
  arrival_time NUMBER(5),
  train_id NUMBER(10) REFERENCES train(train_id),
  schedule_date DATE
);

CREATE TABLE DEPARTMENT (
  dept_id NUMBER(10) PRIMARY KEY,
  emp_id NUMBER(10) REFERENCES EMPLOYEE(emp_id),
  dept_location VARCHAR2(255),
  dept_phone VARCHAR2(20)
);

CREATE TABLE JOB (
  job_id NUMBER(10) PRIMARY KEY,
  emp_id NUMBER(10),
  job_title VARCHAR2(50),
  salary NUMBER(12,2),
  hire_date DATE,
  CONSTRAINT job_emp_fk FOREIGN KEY (emp_id) REFERENCES EMPLOYEE(emp_id)
);

CREATE TABLE VENDOR (
  ven_id NUMBER(10) PRIMARY KEY,
  ventype VARCHAR2(50),
  venaddress VARCHAR2(255),
  venphone VARCHAR2(20),
  venemail VARCHAR2(100),
  product VARCHAR2(255)
);

CREATE TABLE SUPPLIER (
  supplier_id NUMBER(10) PRIMARY KEY,
  supplier_name VARCHAR2(255),
  contact VARCHAR2(50),
  address VARCHAR2(255),
  payment VARCHAR2(50)
);

CREATE TABLE SUPPLY (
  supply_id NUMBER(10) PRIMARY KEY,
  supplier_id NUMBER(10) REFERENCES SUPPLIER(supplier_id),
  qty NUMBER(5),
  unit_price NUMBER(12,2),
  delivery_date DATE
);


--sequence
CREATE SEQUENCE cus_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE transac_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE ticket_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;




CREATE SEQUENCE journey_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE emp_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE station_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE train_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE sch_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE dept_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE job_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE ven_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE supplier_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE supply_id_seq
  INCREMENT BY 1
  START WITH 100
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;

--insert

--customer
select * from customer;
INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'John', 'Doe', 'Male', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'john.doe@email.com', '1234567890', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'Jane', 'Smith', 'Female', TO_DATE('1985-05-22', 'YYYY-MM-DD'), 'jane.smith@email.com', '9876543210', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'Bob', 'Johnson', 'Male', TO_DATE('1982-11-10', 'YYYY-MM-DD'), 'bob.johnson@email.com', '5551234567', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'Alice', 'Williams', 'Female', TO_DATE('1995-03-28', 'YYYY-MM-DD'), 'alice.williams@email.com', '3339876543', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'David', 'Brown', 'Male', TO_DATE('1988-07-17', 'YYYY-MM-DD'), 'david.brown@email.com', '7890123456', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'Eva', 'Davis', 'Female', TO_DATE('1993-09-05', 'YYYY-MM-DD'), 'eva.davis@email.com', '6543210987', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'Michael', 'White', 'Male', TO_DATE('1980-12-12', 'YYYY-MM-DD'), 'michael.white@email.com', '8765432109', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'Sophie', 'Miller', 'Female', TO_DATE('1998-04-20', 'YYYY-MM-DD'), 'sophie.miller@email.com', '1237894560', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'William', 'Taylor', 'Male', TO_DATE('1987-06-08', 'YYYY-MM-DD'), 'william.taylor@email.com', '4567890123', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'Olivia', 'Clark', 'Female', TO_DATE('1991-02-18', 'YYYY-MM-DD'), 'olivia.clark@email.com', '9870123456', SYSDATE);

INSERT INTO Customer (cus_id, first_name, last_name, gender, date_of_birth, email, phone_number, registration_date)
VALUES (cus_id_seq.NEXTVAL, 'Kanye', 'West', 'Male', TO_DATE('1900-08-28', 'YYYY-MM-DD'), 'ye@email.com', '213445643', SYSDATE);

--transaction

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 101, SYSDATE, 500, 7, 'Credit Card');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 102, SYSDATE, 700, 10, 'Cash');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 103, SYSDATE, 900, 15, 'PayPal');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 104, SYSDATE, 1200, 20, 'Debit Card');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 105, SYSDATE, 1500, 25, 'Credit Card');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 106, SYSDATE, 1800, 30, 'Cash');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 107, SYSDATE, 2000, 35, 'PayPal');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 108, SYSDATE, 2200, 40, 'Debit Card');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 109, SYSDATE, 2500, 45, 'Credit Card');

INSERT INTO TRANSACTION (transac_id, cus_id, transac_date, price, tax, payment_method)
VALUES (transac_id_seq.NEXTVAL, 110, SYSDATE, 2800, 50, 'Cash');

select * from transaction;



-- TRAIN_TICKET
select * from TRAIN_TICKET;
INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 100, 'Station A', 'Station B', 'Confirmed');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 101, 'Station C', 'Station D', 'Confirmed');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 102, 'Station E', 'Station F', 'Pending');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 103, 'Station G', 'Station H', 'Confirmed');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 104, 'Station I', 'Station J', 'Pending');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 105, 'Station K', 'Station L', 'Confirmed');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 106, 'Station M', 'Station N', 'Confirmed');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 107, 'Station O', 'Station P', 'Pending');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 108, 'Station Q', 'Station R', 'Confirmed');

INSERT INTO TRAIN_TICKET (ticket_id, transac_id, depart_sta, arrival_sta, status)
VALUES (ticket_id_seq.NEXTVAL, 109, 'Station S', 'Station T', 'Confirmed');


-- JOURNEY
INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 100, 100, 'Destination A', 120);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 101, 101, 'Destination B', 150);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 102, 102, 'Destination C', 180);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 103, 103, 'Destination D', 200);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 104, 104, 'Destination E', 160);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 105, 105, 'Destination F', 130);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 106, 106, 'Destination G', 170);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 107, 107, 'Destination H', 190);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 108, 108, 'Destination I', 140);

INSERT INTO JOURNEY (JOURNEY_ID, TICKET_ID, TRANSAC_ID, DESTINATION, TRAVEL_DURATION)
VALUES (journey_id_seq.NEXTVAL, 109, 109, 'Destination J', 110);

select * from journey;


-- Employee
INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Bruno', 'Harmon', TO_DATE('1985-09-02', 'YYYY-MM-DD'), 'Address BH', '1234567890', 90000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Adele', 'Rhythm', TO_DATE('1988-03-12', 'YYYY-MM-DD'), 'Address AR', '2345678901', 85000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Beyoncé', 'Melody', TO_DATE('1981-01-20', 'YYYY-MM-DD'), 'Address BM', '3456789012', 95000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Ed', 'Lyric', TO_DATE('1990-07-10', 'YYYY-MM-DD'), 'Address EL', '4567890123', 80000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Taylor', 'Echo', TO_DATE('1989-12-13', 'YYYY-MM-DD'), 'Address TE', '5678901234', 87000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Kanye', 'Blaze', TO_DATE('1982-06-08', 'YYYY-MM-DD'), 'Address KB', '6789012345', 92000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Ariana', 'Virtuoso', TO_DATE('1993-02-24', 'YYYY-MM-DD'), 'Address AV', '7890123456', 88000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Billie', 'Groove', TO_DATE('1986-11-30', 'YYYY-MM-DD'), 'Address BG', '8901234567', 91000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Rihanna', 'Rebel', TO_DATE('1987-09-12', 'YYYY-MM-DD'), 'Address RR', '9012345678', 93000, SYSDATE);

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, DOB, ADDRESS, PHONE, SALARY, HIRE_DATE)
VALUES (emp_id_seq.NEXTVAL, 'Drake', 'Diva', TO_DATE('1986-10-24', 'YYYY-MM-DD'), 'Address DD', '0123456789', 89000, SYSDATE);

select *from employee;


-- STATION
INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (100, 100, 100, 100, 100, 'Station A', '123-456-7890');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (101, 101, 101, 101, 101, 'Station B', '234-567-8901');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (102, 102, 102, 102, 102, 'Station C', '345-678-9012');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (103, 103, 103, 103, 103, 'Station D', '456-789-0123');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (104, 104, 104, 104, 104, 'Station E', '567-890-1234');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (105, 105, 105, 105, 105, 'Station F', '678-901-2345');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (106, 106, 106, 106, 106, 'Station G', '789-012-3456');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (107, 107, 107, 107, 107, 'Station H', '890-123-4567');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (108, 108, 108, 108, 108, 'Station I', '901-234-5678');

INSERT INTO STATION (station_id, journey_id, ticket_id, transac_id, emp_id, station_name, station_phone)
VALUES (109, 109, 109, 109, 109, 'Station J', '012-345-6789');

SELECT * FROM station;


-- TRAIN
INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Shadowhawk X', 'SMALL', 'Model X', 150, 100, '1234567890');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Thunderstrike', 'MEDIUM', 'Model T', 200, 120, '2345678901');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Stealth Falcon', 'FIRSTCLASS', 'Model SF', 80, 150, '3456789012');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Eclipse Fury', 'SMALL', 'Model EF', 120, 110, '4567890123');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Velocity Vortex', 'MEDIUM', 'Model VV', 180, 130, '5678901234');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Nova Phoenix', 'FIRSTCLASS', 'Model NP', 100, 160, '6789012345');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Quantum Jetstream', 'SMALL', 'Model QJ', 130, 105, '7890123456');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Galactic Blazer', 'MEDIUM', 'Model GB', 160, 140, '8901234567');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Infinite Horizon', 'FIRSTCLASS', 'Model IH', 90, 170, '9012345678');

INSERT INTO TRAIN (train_id, train_name, train_type, train_model, seating_capacity, max_speed, phone)
VALUES (train_id_seq.NEXTVAL, 'Viper Thunderbolt', 'SMALL', 'Model VT', 140, 115, '0123456789');


SELECT * FROM train;


--schedule


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('08:00', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('10:00', 'HH24:MI'), 'HH24MI')), 100, TO_DATE('2024-02-17', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('10:30', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('12:30', 'HH24:MI'), 'HH24MI')), 101, TO_DATE('2024-02-18', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('13:15', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('15:30', 'HH24:MI'), 'HH24MI')), 102, TO_DATE('2024-02-19', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('16:00', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('18:00', 'HH24:MI'), 'HH24MI')), 103, TO_DATE('2024-02-20', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('19:30', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('21:30', 'HH24:MI'), 'HH24MI')), 104, TO_DATE('2024-02-21', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('08:45', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('10:45', 'HH24:MI'), 'HH24MI')), 105, TO_DATE('2024-02-22', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('11:30', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('13:30', 'HH24:MI'), 'HH24MI')), 106, TO_DATE('2024-02-23', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('14:15', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('16:15', 'HH24:MI'), 'HH24MI')), 107, TO_DATE('2024-02-24', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('17:00', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('19:00', 'HH24:MI'), 'HH24MI')), 108, TO_DATE('2024-02-25', 'YYYY-MM-DD'));


INSERT INTO trainschedule (sch_id, depart_time, arrival_time, train_id, schedule_date)
VALUES (sch_id_seq.NEXTVAL, TO_NUMBER(TO_CHAR(TO_DATE('19:45', 'HH24:MI'), 'HH24MI')), TO_NUMBER(TO_CHAR(TO_DATE('21:45', 'HH24:MI'), 'HH24MI')), 109, TO_DATE('2024-02-26', 'YYYY-MM-DD'));


select * from trainschedule;


-- DEPARTMENT
INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 100, 'Station A Department', '123-456-7890');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 101, 'Station B Department', '234-567-8901');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 102, 'Station C Department', '345-678-9012');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 103, 'Station D Department', '456-789-0123');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 104, 'Station E Department', '567-890-1234');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 105, 'Station F Department', '678-901-2345');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 106, 'Station G Department', '789-012-3456');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 107, 'Station H Department', '890-123-4567');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 108, 'Station I Department', '901-234-5678');

INSERT INTO DEPARTMENT (dept_id, emp_id, dept_location, dept_phone)
VALUES (dept_id_seq.NEXTVAL, 109, 'Station J Department', '012-345-6789');

select *from department;

--  JOB 
INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 100, 'Manager', 80000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 101, 'Developer', 60000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 102, 'Designer', 55000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 103, 'Analyst', 70000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 104, 'Engineer', 65000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 105, 'Coordinator', 50000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 106, 'Specialist', 75000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 107, 'Administrator', 70000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 108, 'Supervisor', 85000, SYSDATE);

INSERT INTO JOB (job_id, emp_id, job_title, salary, hire_date)
VALUES (job_id_seq.NEXTVAL, 109, 'Technician', 60000, SYSDATE);

select * from job;

--VENDOR 
INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type1', 'Address1', '1234567890', 'vendor1@email.com', 'Product1');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type2', 'Address2', '2345678901', 'vendor2@email.com', 'Product2');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type3', 'Address3', '3456789012', 'vendor3@email.com', 'Product3');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type4', 'Address4', '4567890123', 'vendor4@email.com', 'Product4');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type5', 'Address5', '5678901234', 'vendor5@email.com', 'Product5');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type6', 'Address6', '6789012345', 'vendor6@email.com', 'Product6');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type7', 'Address7', '7890123456', 'vendor7@email.com', 'Product7');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type8', 'Address8', '8901234567', 'vendor8@email.com', 'Product8');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type9', 'Address9', '9012345678', 'vendor9@email.com', 'Product9');

INSERT INTO VENDOR (ven_id, ventype, venaddress, venphone, venemail, product)
VALUES (ven_id_seq.NEXTVAL, 'Type10', 'Address10', '0123456789', 'vendor10@email.com', 'Product10');

select * from vendor;

--SUPPLIER 
INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier A', 'John Doe', '123 Main St, City A', 'Net 30');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier B', 'Jane Smith', '456 Oak St, City B', 'Net 15');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier C', 'Bob Johnson', '789 Pine St, City C', 'Credit Card');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier D', 'Alice Williams', '101 Elm St, City D', 'Cash on Delivery');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier E', 'David Brown', '202 Cedar St, City E', 'Net 45');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier F', 'Eva Davis', '303 Maple St, City F', 'Credit Card');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier G', 'Michael White', '404 Birch St, City G', 'Net 60');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier H', 'Sophie Miller', '505 Walnut St, City H', 'Cash');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier I', 'William Taylor', '606 Spruce St, City I', 'Credit Card');

INSERT INTO SUPPLIER (supplier_id, supplier_name, contact, address, payment)
VALUES (supplier_id_seq.NEXTVAL, 'Supplier J', 'Olivia Clark', '707 Pine St, City J', 'Net 30');

select * from supplier;

--  SUPPLY 
INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 100, 50, 10.5, TO_DATE('2024-02-17', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 101, 30, 8.75, TO_DATE('2024-02-18', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 102, 40, 12.0, TO_DATE('2024-02-19', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 103, 25, 15.25, TO_DATE('2024-02-20', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 104, 35, 11.8, TO_DATE('2024-02-21', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 105, 20, 9.6, TO_DATE('2024-02-22', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 106, 45, 14.3, TO_DATE('2024-02-23', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 107, 28, 13.2, TO_DATE('2024-02-24', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 108, 33, 10.9, TO_DATE('2024-02-25', 'YYYY-MM-DD'));

INSERT INTO SUPPLY (supply_id, supplier_id, qty, unit_price, delivery_date)
VALUES (supply_id_seq.NEXTVAL, 109, 22, 16.5, TO_DATE('2024-02-26', 'YYYY-MM-DD'));

select *from supply;


SELECT * FROM Customer;
SELECT * FROM TRANSACTION;
SELECT * FROM TRAIN_TICKET;
SELECT * FROM JOURNEY;
SELECT * FROM EMPLOYEE;
SELECT * FROM STATION;
SELECT * FROM TRAIN;
SELECT * FROM trainschedule;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM VENDOR;
SELECT * FROM SUPPLIER;
SELECT * FROM SUPPLY;

commit;
