-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2022 at 06:21 PM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `U66sIF4mqr`
--

-- --------------------------------------------------------

--
-- Table structure for table `Administrator`
--

CREATE TABLE `Administrator` (
  `idAdministrator` int(11) NOT NULL,
  `adminTasks` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reportsAddressed` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Administrator`
--

INSERT INTO `Administrator` (`idAdministrator`, `adminTasks`, `reportsAddressed`, `month`) VALUES
(1, NULL, NULL, NULL),
(2, 'prep_for_finals', '12', 'May'),
(3, 'prep_for_finals', '12', 'May');

-- --------------------------------------------------------

--
-- Table structure for table `admissions`
--

CREATE TABLE `admissions` (
  `idadmissions` int(11) NOT NULL,
  `isAccepted` int(11) DEFAULT NULL,
  `isGraduated` int(11) DEFAULT NULL,
  `notAdmitted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admissions`
--

INSERT INTO `admissions` (`idadmissions`, `isAccepted`, `isGraduated`, `notAdmitted`) VALUES
(1, NULL, NULL, NULL),
(2, 1, 0, 0),
(3, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `idadvisor` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onTrack` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_idstudent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`idadvisor`, `name`, `subject`, `onTrack`, `student_idstudent`) VALUES
(1, 'Rick', 'CS', 'yes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bursar`
--

CREATE TABLE `bursar` (
  `idbursar` int(11) NOT NULL,
  `Paymenthistory` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPaid` int(11) DEFAULT NULL,
  `TotalPaid` int(11) DEFAULT NULL,
  `isStanding` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bursar`
--

INSERT INTO `bursar` (`idbursar`, `Paymenthistory`, `isPaid`, `TotalPaid`, `isStanding`) VALUES
(1, 'On Time', 700, 1000, 'Good'),
(2, 'On_Time', 800, 1000, 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `idcatalog` int(11) NOT NULL,
  `registrar_idregistrar` int(11) DEFAULT '1',
  `isUpperDiv` int(11) DEFAULT NULL,
  `isLowerDiv` int(11) DEFAULT NULL,
  `coursename` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`idcatalog`, `registrar_idregistrar`, `isUpperDiv`, `isLowerDiv`, `coursename`) VALUES
(1, 1, NULL, NULL, NULL),
(2, 1, 1, 0, 'CSC413'),
(3, 2, 1, 0, 'CSC317'),
(4, 1, 1, 0, 'CSC300'),
(5, 1, 0, 1, 'CSC220'),
(6, 1, 0, 1, 'ENG100'),
(7, 1, 0, 1, 'ENG110'),
(8, 1, 0, 1, 'ENG160'),
(9, 1, 0, 1, 'ENG200');

-- --------------------------------------------------------

--
-- Table structure for table `classHistory`
--

CREATE TABLE `classHistory` (
  `idclassHistory` int(11) NOT NULL,
  `isW` int(11) DEFAULT NULL,
  `grade` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `courseid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classHistory`
--

INSERT INTO `classHistory` (`idclassHistory`, `isW`, `grade`, `courseid`) VALUES
(2, 0, 'B', 7);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `idcourse` int(11) NOT NULL,
  `department_iddepartment` int(11) DEFAULT '1',
  `catalog_idcatalog` int(11) DEFAULT '1',
  `course_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `DegreePathway_idDegreePathway` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`idcourse`, `department_iddepartment`, `catalog_idcatalog`, `course_name`, `units`, `DegreePathway_idDegreePathway`) VALUES
(2, 1, 2, 'CSC413', 4, 1),
(3, 1, 3, 'CSC317', 3, 1),
(4, 1, 4, 'CSC300', 3, 1),
(5, 1, 5, 'CSC220', 4, 1),
(6, 2, 6, 'ENG100', 3, 2),
(7, 2, 7, 'ENG110', 2, 2),
(8, 2, 8, 'ENG160', 3, 2),
(9, 2, 9, 'ENG200', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Degree`
--

CREATE TABLE `Degree` (
  `idDegree` int(11) NOT NULL,
  `degreeName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `degreeUnits` int(11) DEFAULT NULL,
  `numberOfClasses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Degree`
--

INSERT INTO `Degree` (`idDegree`, `degreeName`, `degreeUnits`, `numberOfClasses`) VALUES
(1, 'Computer_Science', 32, 4),
(2, 'English', 12, 4);

-- --------------------------------------------------------

--
-- Table structure for table `DegreePathway`
--

CREATE TABLE `DegreePathway` (
  `idDegreePathway` int(11) NOT NULL,
  `Degree_idDegree` int(11) DEFAULT '1',
  `semestersToFinish` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numberOfCourses` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `degree_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `DegreePathway`
--

INSERT INTO `DegreePathway` (`idDegreePathway`, `Degree_idDegree`, `semestersToFinish`, `numberOfCourses`, `degree_name`) VALUES
(1, 1, '8', '8', 'Computer Science'),
(2, 2, '6', '4', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `iddepartment` int(11) NOT NULL,
  `department_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_idemployee` int(11) DEFAULT '1',
  `subject` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numberOfFaculty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`iddepartment`, `department_name`, `employee_idemployee`, `subject`, `numberOfFaculty`) VALUES
(1, NULL, 1, NULL, NULL),
(2, 'English', 1, 'ENG', 12),
(5, 'Computer_Science', 1, 'CS', 18);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `idemployee` int(11) NOT NULL,
  `idschool` int(11) DEFAULT '1',
  `depNum` int(11) DEFAULT NULL,
  `Administrator_idAdministrator` int(11) DEFAULT '1',
  `employeeType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`idemployee`, `idschool`, `depNum`, `Administrator_idAdministrator`, `employeeType`) VALUES
(1, 1, NULL, 1, NULL),
(2, 1, 5, 1, 'Safety');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_class`
--

CREATE TABLE `enrolled_class` (
  `idenrolled_class` int(11) NOT NULL,
  `idcatalog` int(11) DEFAULT '1',
  `unitsPending` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isEnroll` int(11) DEFAULT NULL,
  `preReqCheck` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paymentCheck` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enrolled_class`
--

INSERT INTO `enrolled_class` (`idenrolled_class`, `idcatalog`, `unitsPending`, `isEnroll`, `preReqCheck`, `paymentCheck`, `student_id`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL),
(2, 3, '3', 1, '1', '1', 2),
(4, 4, '3', 1, '1', '1', 2),
(5, 5, '4', 1, '1', '1', 2),
(6, 2, '4', 0, '0', '0', 2),
(9, 9, '4', 0, '0', '0', 2);

-- --------------------------------------------------------

--
-- Table structure for table `financialaid`
--

CREATE TABLE `financialaid` (
  `idfinancialaid` int(11) NOT NULL,
  `isEligibleScholarship` int(11) DEFAULT NULL,
  `hasFinancialAid` int(11) DEFAULT NULL,
  `grant_amount` int(11) DEFAULT NULL,
  `loan_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `financialaid`
--

INSERT INTO `financialaid` (`idfinancialaid`, `isEligibleScholarship`, `hasFinancialAid`, `grant_amount`, `loan_amount`) VALUES
(1, NULL, NULL, NULL, NULL),
(2, 1, 1, 1500, 2500);

-- --------------------------------------------------------

--
-- Table structure for table `Instructor`
--

CREATE TABLE `Instructor` (
  `idInstructor` int(11) NOT NULL,
  `department_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isTenured` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CoursesTaught` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Instructor`
--

INSERT INTO `Instructor` (`idInstructor`, `department_name`, `name`, `isTenured`, `CoursesTaught`) VALUES
(1, NULL, NULL, NULL, NULL),
(2, NULL, 'Duc_Ta', 'yes', 2),
(3, 'Computer_Science', 'John Roberts', 'No', 2),
(4, NULL, 'Jeffery Mathews', 'No', 2),
(5, NULL, 'James Gordon', 'Yes', 2);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `idlocation` int(11) NOT NULL,
  `building` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catalog_idcatalog` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`idlocation`, `building`, `room`, `floor`, `catalog_idcatalog`) VALUES
(1, NULL, NULL, NULL, 1),
(2, 'Hensil_Hall', '14', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `idpayment` int(11) NOT NULL,
  `paymentType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amountPaid` int(11) DEFAULT NULL,
  `paymentTotal` int(11) DEFAULT NULL,
  `enrolled_class_idenrolled_class` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`idpayment`, `paymentType`, `amountPaid`, `paymentTotal`, `enrolled_class_idenrolled_class`) VALUES
(1, NULL, NULL, NULL, 1),
(2, 'Bank', 1450, 1500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `registrar`
--

CREATE TABLE `registrar` (
  `idregistrar` int(11) NOT NULL,
  `registrar_notes` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isAdded` int(11) DEFAULT NULL,
  `classname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isRemoved` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registrarcol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `registrar`
--

INSERT INTO `registrar` (`idregistrar`, `registrar_notes`, `isAdded`, `classname`, `isRemoved`, `registrarcol`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, 'low_numbers', 1, 'Music_History', '0', 4);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `idschool` int(11) NOT NULL,
  `schoolname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schoolType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`idschool`, `schoolname`, `location`, `schoolType`) VALUES
(1, NULL, NULL, NULL),
(2, 'SFSU', 'San_Fransisco', 'CSU');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `idsection` int(11) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `startdate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enddate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `catalog_idcatalog` int(11) DEFAULT '1',
  `Instructor_idInstructor` int(11) DEFAULT '1',
  `seats_filled` int(11) DEFAULT NULL,
  `sectionNum` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`idsection`, `time`, `startdate`, `enddate`, `seats`, `catalog_idcatalog`, `Instructor_idInstructor`, `seats_filled`, `sectionNum`) VALUES
(2, 4, '08-26-22', '12-15-22', 40, 2, 2, 40, '0001'),
(3, 5, '08-26-22', '12-15-22', 35, 3, 3, 40, '0001'),
(4, 6, '08-26-22', '12-15-22\r\n', 24, 4, 2, 25, '0001'),
(5, 7, '08-26-22', '12-15-22', 18, 5, 3, 20, '0001'),
(6, 4, '08-26-22', '12-15-22', 18, 6, 4, 20, '0001'),
(7, 3, '08-26-22', '12-15-22', 25, 7, 4, 25, '0001'),
(8, 2, '08-26-22', '12-15-22', 24, 8, 5, 30, '0001'),
(9, 1, '08-26-22', '12-15-22', 15, 9, 5, 20, '0001');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `idstudent` int(11) NOT NULL,
  `user_iduser` int(11) DEFAULT '1',
  `admissions_info` int(11) DEFAULT '1',
  `idbursar` int(11) DEFAULT '1',
  `degreeName` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'degree',
  `classHistory_idclassHistory` int(11) DEFAULT '1',
  `Degree_idDegree` int(11) DEFAULT '1',
  `financialaid_idfinancialaid` int(11) DEFAULT '1',
  `unitsamount` int(11) DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolled_class_idenrolled_class` int(11) DEFAULT '1',
  `waitlist` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`idstudent`, `user_iduser`, `admissions_info`, `idbursar`, `degreeName`, `classHistory_idclassHistory`, `Degree_idDegree`, `financialaid_idfinancialaid`, `unitsamount`, `name`, `enrolled_class_idenrolled_class`, `waitlist`) VALUES
(2, 1, 1, 1, 'Computer Science', 2, 1, 1, 12, 'Rick Sanchez', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stud_has_wait`
--

CREATE TABLE `stud_has_wait` (
  `student_id` int(11) DEFAULT NULL,
  `waitlist_id` int(11) DEFAULT NULL,
  `stuwaitid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stud_has_wait`
--

INSERT INTO `stud_has_wait` (`student_id`, `waitlist_id`, `stuwaitid`) VALUES
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stuent_has_classhistory`
--

CREATE TABLE `stuent_has_classhistory` (
  `stuclass_id` int(11) NOT NULL,
  `classhistory_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stuent_has_classhistory`
--

INSERT INTO `stuent_has_classhistory` (`stuclass_id`, `classhistory_id`, `student_id`) VALUES
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `firstname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `firstname`, `lastname`, `gender`, `phonenumber`, `email`, `password`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Rick', 'Sanchez', 'male', '696-696-6969', 'getshwifty@gmail.com', 'balls420');

-- --------------------------------------------------------

--
-- Table structure for table `waitlist`
--

CREATE TABLE `waitlist` (
  `idwaitlist` int(11) NOT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `placement` int(11) DEFAULT NULL,
  `TotalPlacement` int(11) NOT NULL,
  `courseid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `waitlist`
--

INSERT INTO `waitlist` (`idwaitlist`, `status`, `placement`, `TotalPlacement`, `courseid`) VALUES
(2, 'Waitlisted', 3, 5, 2),
(3, 'FULL', 5, 5, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Administrator`
--
ALTER TABLE `Administrator`
  ADD PRIMARY KEY (`idAdministrator`);

--
-- Indexes for table `admissions`
--
ALTER TABLE `admissions`
  ADD PRIMARY KEY (`idadmissions`);

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`idadvisor`),
  ADD KEY `fk_advisor_student1_idx` (`student_idstudent`);

--
-- Indexes for table `bursar`
--
ALTER TABLE `bursar`
  ADD PRIMARY KEY (`idbursar`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`idcatalog`),
  ADD UNIQUE KEY `coursename` (`coursename`),
  ADD KEY `fk_catalog_registrar1_idx` (`registrar_idregistrar`);

--
-- Indexes for table `classHistory`
--
ALTER TABLE `classHistory`
  ADD PRIMARY KEY (`idclassHistory`),
  ADD KEY `classHistory_course_fk` (`courseid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`idcourse`),
  ADD KEY `fk_course_department1_idx` (`department_iddepartment`),
  ADD KEY `fk_course_catalog1_idx` (`catalog_idcatalog`),
  ADD KEY `fk_course_DegreePathway1_idx` (`DegreePathway_idDegreePathway`);

--
-- Indexes for table `Degree`
--
ALTER TABLE `Degree`
  ADD PRIMARY KEY (`idDegree`);

--
-- Indexes for table `DegreePathway`
--
ALTER TABLE `DegreePathway`
  ADD PRIMARY KEY (`idDegreePathway`),
  ADD KEY `fk_DegreePathway_Degree1_idx` (`Degree_idDegree`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`iddepartment`),
  ADD UNIQUE KEY `deperatment_name_UNIQUE` (`department_name`),
  ADD KEY `fk_department_employee1_idx` (`employee_idemployee`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`idemployee`),
  ADD KEY `fk_employee_school1_idx` (`idschool`),
  ADD KEY `fk_employee_Administrator1_idx` (`Administrator_idAdministrator`);

--
-- Indexes for table `enrolled_class`
--
ALTER TABLE `enrolled_class`
  ADD PRIMARY KEY (`idenrolled_class`),
  ADD KEY `fk_schedule_section1_idx` (`idcatalog`),
  ADD KEY `fk_student_enrolled_class` (`student_id`);

--
-- Indexes for table `financialaid`
--
ALTER TABLE `financialaid`
  ADD PRIMARY KEY (`idfinancialaid`);

--
-- Indexes for table `Instructor`
--
ALTER TABLE `Instructor`
  ADD PRIMARY KEY (`idInstructor`),
  ADD UNIQUE KEY `deperatment_name_UNIQUE` (`department_name`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`idlocation`),
  ADD KEY `fk_location_catalog1_idx` (`catalog_idcatalog`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`idpayment`),
  ADD KEY `fk_payment_enrolled_class1_idx` (`enrolled_class_idenrolled_class`);

--
-- Indexes for table `registrar`
--
ALTER TABLE `registrar`
  ADD PRIMARY KEY (`idregistrar`),
  ADD UNIQUE KEY `registrar_notes_UNIQUE` (`registrar_notes`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`idschool`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`idsection`),
  ADD KEY `fk_section_catalog1_idx` (`catalog_idcatalog`),
  ADD KEY `fk_section_Instructor1_idx` (`Instructor_idInstructor`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`idstudent`),
  ADD UNIQUE KEY `idstudent_UNIQUE` (`idstudent`),
  ADD KEY `fk_student_user1_idx` (`user_iduser`),
  ADD KEY `fk_student_admissions1_idx` (`admissions_info`),
  ADD KEY `fk_student_bursar1_idx` (`idbursar`),
  ADD KEY `fk_student_classHistory1_idx` (`classHistory_idclassHistory`),
  ADD KEY `fk_student_Degree1_idx` (`Degree_idDegree`),
  ADD KEY `fk_student_financialaid1_idx` (`financialaid_idfinancialaid`),
  ADD KEY `fk_student_enrolled_class1_idx` (`enrolled_class_idenrolled_class`),
  ADD KEY `fk_waitlist` (`waitlist`);

--
-- Indexes for table `stud_has_wait`
--
ALTER TABLE `stud_has_wait`
  ADD PRIMARY KEY (`stuwaitid`),
  ADD KEY `stud_fk` (`student_id`),
  ADD KEY `wait_fk` (`waitlist_id`);

--
-- Indexes for table `stuent_has_classhistory`
--
ALTER TABLE `stuent_has_classhistory`
  ADD PRIMARY KEY (`stuclass_id`),
  ADD KEY `classhistory_id` (`classhistory_id`),
  ADD KEY `stu_fk` (`student_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `waitlist`
--
ALTER TABLE `waitlist`
  ADD PRIMARY KEY (`idwaitlist`),
  ADD KEY `course_fk` (`courseid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Administrator`
--
ALTER TABLE `Administrator`
  MODIFY `idAdministrator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admissions`
--
ALTER TABLE `admissions`
  MODIFY `idadmissions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advisor`
--
ALTER TABLE `advisor`
  MODIFY `idadvisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bursar`
--
ALTER TABLE `bursar`
  MODIFY `idbursar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `idcatalog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `classHistory`
--
ALTER TABLE `classHistory`
  MODIFY `idclassHistory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `idcourse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Degree`
--
ALTER TABLE `Degree`
  MODIFY `idDegree` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `DegreePathway`
--
ALTER TABLE `DegreePathway`
  MODIFY `idDegreePathway` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `iddepartment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `idemployee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrolled_class`
--
ALTER TABLE `enrolled_class`
  MODIFY `idenrolled_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `financialaid`
--
ALTER TABLE `financialaid`
  MODIFY `idfinancialaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Instructor`
--
ALTER TABLE `Instructor`
  MODIFY `idInstructor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `idlocation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `idpayment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `registrar`
--
ALTER TABLE `registrar`
  MODIFY `idregistrar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `idschool` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `idsection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `idstudent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stud_has_wait`
--
ALTER TABLE `stud_has_wait`
  MODIFY `stuwaitid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `waitlist`
--
ALTER TABLE `waitlist`
  MODIFY `idwaitlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advisor`
--
ALTER TABLE `advisor`
  ADD CONSTRAINT `fk_advisor_student1` FOREIGN KEY (`student_idstudent`) REFERENCES `student` (`idstudent`);

--
-- Constraints for table `catalog`
--
ALTER TABLE `catalog`
  ADD CONSTRAINT `fk_catalog_registrar1` FOREIGN KEY (`registrar_idregistrar`) REFERENCES `registrar` (`idregistrar`);

--
-- Constraints for table `classHistory`
--
ALTER TABLE `classHistory`
  ADD CONSTRAINT `classHistory_course_fk` FOREIGN KEY (`courseid`) REFERENCES `course` (`idcourse`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_course_DegreePathway1` FOREIGN KEY (`DegreePathway_idDegreePathway`) REFERENCES `DegreePathway` (`iddegreepathway`),
  ADD CONSTRAINT `fk_course_catalog1` FOREIGN KEY (`catalog_idcatalog`) REFERENCES `catalog` (`idcatalog`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_course_department1` FOREIGN KEY (`department_iddepartment`) REFERENCES `department` (`iddepartment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `DegreePathway`
--
ALTER TABLE `DegreePathway`
  ADD CONSTRAINT `fk_DegreePathway_Degree1` FOREIGN KEY (`Degree_idDegree`) REFERENCES `Degree` (`iddegree`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `fk_department_employee1` FOREIGN KEY (`employee_idemployee`) REFERENCES `employee` (`idemployee`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_Administrator1` FOREIGN KEY (`Administrator_idAdministrator`) REFERENCES `Administrator` (`idadministrator`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employee_school1` FOREIGN KEY (`idschool`) REFERENCES `school` (`idschool`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrolled_class`
--
ALTER TABLE `enrolled_class`
  ADD CONSTRAINT `fk_schedule_section1` FOREIGN KEY (`idcatalog`) REFERENCES `catalog` (`idcatalog`),
  ADD CONSTRAINT `fk_student_enrolled_class` FOREIGN KEY (`student_id`) REFERENCES `student` (`idstudent`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Instructor`
--
ALTER TABLE `Instructor`
  ADD CONSTRAINT `fk_Instructor_department1` FOREIGN KEY (`department_name`) REFERENCES `department` (`department_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_location_catalog1` FOREIGN KEY (`catalog_idcatalog`) REFERENCES `catalog` (`idcatalog`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_enrolled_class1` FOREIGN KEY (`enrolled_class_idenrolled_class`) REFERENCES `enrolled_class` (`idenrolled_class`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `fk_section_Instructor1` FOREIGN KEY (`Instructor_idInstructor`) REFERENCES `Instructor` (`idinstructor`),
  ADD CONSTRAINT `fk_section_catalog1` FOREIGN KEY (`catalog_idcatalog`) REFERENCES `catalog` (`idcatalog`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_Degree1` FOREIGN KEY (`Degree_idDegree`) REFERENCES `Degree` (`iddegree`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_admissions1` FOREIGN KEY (`admissions_info`) REFERENCES `admissions` (`idadmissions`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_bursar1` FOREIGN KEY (`idbursar`) REFERENCES `bursar` (`idbursar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_classHistory1` FOREIGN KEY (`classHistory_idclassHistory`) REFERENCES `classHistory` (`idclasshistory`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_enrolled_class1` FOREIGN KEY (`enrolled_class_idenrolled_class`) REFERENCES `enrolled_class` (`idenrolled_class`),
  ADD CONSTRAINT `fk_student_financialaid1` FOREIGN KEY (`financialaid_idfinancialaid`) REFERENCES `financialaid` (`idfinancialaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`waitlist`) REFERENCES `stud_has_wait` (`waitlist_id`);

--
-- Constraints for table `stud_has_wait`
--
ALTER TABLE `stud_has_wait`
  ADD CONSTRAINT `stud_has_wait_ibfk_1` FOREIGN KEY (`waitlist_id`) REFERENCES `waitlist` (`idwaitlist`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stud_waitlist_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`idstudent`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stuent_has_classhistory`
--
ALTER TABLE `stuent_has_classhistory`
  ADD CONSTRAINT `stuent_has_classhistory_ibfk_1` FOREIGN KEY (`classhistory_id`) REFERENCES `classHistory` (`idclasshistory`),
  ADD CONSTRAINT `stuent_has_classhistory_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`idstudent`);

--
-- Constraints for table `waitlist`
--
ALTER TABLE `waitlist`
  ADD CONSTRAINT `course_waitlist` FOREIGN KEY (`courseid`) REFERENCES `course` (`idcourse`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
