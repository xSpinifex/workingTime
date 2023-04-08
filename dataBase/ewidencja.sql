-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2023 at 01:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ewidencjadane13`
--

-- --------------------------------------------------------

--
-- Table structure for table `absencerekords`
--

CREATE TABLE `absencerekords` (
  `id_absenceRekord` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `issueDate` date NOT NULL,
  `absenceType_id` int(11) NOT NULL,
  `extraVacationDay_id` int(11) DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `absencetosettlement_aftersettlement`
--

CREATE TABLE `absencetosettlement_aftersettlement` (
  `id_AbsenceToSettlement_AfterSettlement` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `workingtimesettlement_id` int(11) NOT NULL,
  `absenceRecord_id` int(11) NOT NULL,
  `absenceType_id` int(11) NOT NULL,
  `workDays` int(11) NOT NULL,
  `Days` int(11) NOT NULL,
  `workTime` time NOT NULL,
  `nightHours` time NOT NULL,
  `overTIME` time NOT NULL,
  `typeOfOverTime` int(11) NOT NULL,
  `IsTypeDeleted` tinyint(1) NOT NULL,
  `isUsed` tinyint(1) NOT NULL,
  `usedBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `absencetypes`
--

CREATE TABLE `absencetypes` (
  `id_absenceType` int(11) NOT NULL,
  `shortcut` varchar(10) NOT NULL,
  `description` varchar(50) NOT NULL,
  `descriptionPlus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absencetypes`
--

INSERT INTO `absencetypes` (`id_absenceType`, `shortcut`, `description`, `descriptionPlus`) VALUES
(1, 'UW', 'Urlop wypoczynkowy', 'Urlop wypoczynkowy pobierany jest z dostępnych dni urlopu dla każdego pracownika.'),
(2, 'Uwż', 'Urlop na żądanie.', 'Dostępne 4 dni w roku. Urlop na żądanie pobierany jest z dostępnych dni urlopu dla każdego pracownika.'),
(3, 'UM', 'Urlop macierzyński', ''),
(4, 'Ub', 'Urlop bezpłatny', ''),
(5, 'Usz', 'Urlop szkoleniowy', ''),
(6, 'Uo', 'Urlop ojcowski', ''),
(7, 'L4', 'Chorobowe - L4', ''),
(8, 'NN', 'Nieobecność nieusprawiedliwiona niepłatna', ''),
(9, 'Nup', 'Nieobecność usprawiedliwiona płatna', ''),
(10, 'Nun', 'Nieobecność usprawiedliwiona niepłatna', ''),
(11, 'Del', 'Delegacja', ''),
(12, 'Od', 'Odbiór dnia', ''),
(13, 'Ur', 'Urlop rodzicielski', ''),
(14, 'Uwych.', 'Urlop wychowawczy', ''),
(15, 'Uok', 'Urlop okolicznościowy', ''),
(16, 'Uop', 'Urlop opieka', 'Dostępne 2 dni na jeden rok. Niezależne od Urlopu wypoczynkowego'),
(17, 'Inne', 'Inne', '');

-- --------------------------------------------------------

--
-- Table structure for table `daysofvacation`
--

CREATE TABLE `daysofvacation` (
  `id_daysOfVacation` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `availableDays` int(11) NOT NULL,
  `usedDays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daysofvacations_logs`
--

CREATE TABLE `daysofvacations_logs` (
  `id_daysOfVacations_logs` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `usedDays` int(11) NOT NULL,
  `absenceRecord_id` int(11) DEFAULT NULL,
  `dateFrom` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daysofvacations_transfer`
--

CREATE TABLE `daysofvacations_transfer` (
  `id_daysOfVacations_transfer` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `daysofvacationFrom_id` int(11) NOT NULL,
  `daysofvacationFor_id` int(11) NOT NULL,
  `yearFROM` int(11) NOT NULL,
  `yearFOR` int(11) NOT NULL,
  `countOfDays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `extravacationdays`
--

CREATE TABLE `extravacationdays` (
  `id_extraVacationDays` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `workday_id` int(11) DEFAULT NULL,
  `holiday_id` int(11) DEFAULT NULL,
  `dateFrom` date NOT NULL,
  `isUsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id_group` int(11) NOT NULL,
  `nameOfGroup` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id_holiday` int(11) NOT NULL,
  `Date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id_holiday`, `Date`, `description`) VALUES
(1, '2023-01-01', 'Nowy rok'),
(2, '2023-01-06', 'Święto Trzech Króli'),
(3, '2023-04-09', 'Wielkanoc'),
(4, '2023-04-10', 'Poniedziałek Wielkanocny'),
(5, '2023-05-01', 'Święto Pracy'),
(6, '2023-05-03', 'Święto Konstytucji 3 Maja'),
(7, '2023-05-28', 'Zielone Świątki'),
(8, '2023-06-08', 'Boże Ciało'),
(9, '2023-08-15', ' Święto Wojska Polskiego'),
(10, '2023-11-01', 'Wszystkich Świętych'),
(11, '2023-11-11', 'Święto Niepodległości'),
(12, '2023-12-25', 'Boże Narodzenie (dzień pierwszy)'),
(13, '2023-12-26', 'Boże Narodzenie (dzień drugi)');

-- --------------------------------------------------------

--
-- Table structure for table `nighthours`
--

CREATE TABLE `nighthours` (
  `id_nightHours` int(11) NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nighthours`
--

INSERT INTO `nighthours` (`id_nightHours`, `timeStart`, `timeEnd`) VALUES
(1, '22:00:00', '06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id_section` int(11) NOT NULL,
  `nameOfSection` varchar(100) NOT NULL,
  `menagerOfSection` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id_shift` int(11) NOT NULL,
  `nameOfShift` varchar(20) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shiftsofgroups`
--

CREATE TABLE `shiftsofgroups` (
  `id_shiftsOfGroups` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userlogs`
--

CREATE TABLE `userlogs` (
  `id_logs` int(11) NOT NULL,
  `userFullName` varchar(150) NOT NULL,
  `logDate` varchar(25) NOT NULL,
  `sqlQuery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `workdays`
--

CREATE TABLE `workdays` (
  `id_workDay` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `shift` varchar(100) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `workTime` time NOT NULL,
  `nightHours` time NOT NULL,
  `overTime` time NOT NULL,
  `typeOfOverTime` int(10) NOT NULL,
  `typeOfRecord` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `id_worker` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `position` varchar(150) NOT NULL,
  `commune` varchar(30) DEFAULT NULL,
  `mark` varchar(30) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `hireDate` date NOT NULL,
  `fireDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `workingtimesettlement`
--

CREATE TABLE `workingtimesettlement` (
  `id_workingTimeSettlement` int(11) NOT NULL,
  `dataStart` date NOT NULL,
  `dataEnd` date NOT NULL,
  `JsonData` longtext NOT NULL,
  `generatedAt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absencerekords`
--
ALTER TABLE `absencerekords`
  ADD PRIMARY KEY (`id_absenceRekord`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `extraVacationDay_id` (`extraVacationDay_id`),
  ADD KEY `absenceType_id` (`absenceType_id`);

--
-- Indexes for table `absencetosettlement_aftersettlement`
--
ALTER TABLE `absencetosettlement_aftersettlement`
  ADD PRIMARY KEY (`id_AbsenceToSettlement_AfterSettlement`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `workingtimesettlement_id` (`workingtimesettlement_id`),
  ADD KEY `absenceType_id` (`absenceType_id`);

--
-- Indexes for table `absencetypes`
--
ALTER TABLE `absencetypes`
  ADD PRIMARY KEY (`id_absenceType`);

--
-- Indexes for table `daysofvacation`
--
ALTER TABLE `daysofvacation`
  ADD PRIMARY KEY (`id_daysOfVacation`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `daysofvacations_logs`
--
ALTER TABLE `daysofvacations_logs`
  ADD PRIMARY KEY (`id_daysOfVacations_logs`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `absenceRecord_id` (`absenceRecord_id`);

--
-- Indexes for table `daysofvacations_transfer`
--
ALTER TABLE `daysofvacations_transfer`
  ADD PRIMARY KEY (`id_daysOfVacations_transfer`);

--
-- Indexes for table `extravacationdays`
--
ALTER TABLE `extravacationdays`
  ADD PRIMARY KEY (`id_extraVacationDays`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `workdays_id` (`workday_id`),
  ADD KEY `holiday_id` (`holiday_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id_group`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id_holiday`);

--
-- Indexes for table `nighthours`
--
ALTER TABLE `nighthours`
  ADD PRIMARY KEY (`id_nightHours`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id_section`),
  ADD KEY `menagerOfSection` (`menagerOfSection`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id_shift`);

--
-- Indexes for table `shiftsofgroups`
--
ALTER TABLE `shiftsofgroups`
  ADD PRIMARY KEY (`id_shiftsOfGroups`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `shift_id` (`shift_id`);

--
-- Indexes for table `userlogs`
--
ALTER TABLE `userlogs`
  ADD PRIMARY KEY (`id_logs`);

--
-- Indexes for table `workdays`
--
ALTER TABLE `workdays`
  ADD PRIMARY KEY (`id_workDay`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id_worker`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `workingtimesettlement`
--
ALTER TABLE `workingtimesettlement`
  ADD PRIMARY KEY (`id_workingTimeSettlement`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absencerekords`
--
ALTER TABLE `absencerekords`
  MODIFY `id_absenceRekord` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `absencetosettlement_aftersettlement`
--
ALTER TABLE `absencetosettlement_aftersettlement`
  MODIFY `id_AbsenceToSettlement_AfterSettlement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `absencetypes`
--
ALTER TABLE `absencetypes`
  MODIFY `id_absenceType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `daysofvacation`
--
ALTER TABLE `daysofvacation`
  MODIFY `id_daysOfVacation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daysofvacations_logs`
--
ALTER TABLE `daysofvacations_logs`
  MODIFY `id_daysOfVacations_logs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daysofvacations_transfer`
--
ALTER TABLE `daysofvacations_transfer`
  MODIFY `id_daysOfVacations_transfer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extravacationdays`
--
ALTER TABLE `extravacationdays`
  MODIFY `id_extraVacationDays` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id_holiday` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `nighthours`
--
ALTER TABLE `nighthours`
  MODIFY `id_nightHours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id_section` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id_shift` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shiftsofgroups`
--
ALTER TABLE `shiftsofgroups`
  MODIFY `id_shiftsOfGroups` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlogs`
--
ALTER TABLE `userlogs`
  MODIFY `id_logs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workdays`
--
ALTER TABLE `workdays`
  MODIFY `id_workDay` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `id_worker` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workingtimesettlement`
--
ALTER TABLE `workingtimesettlement`
  MODIFY `id_workingTimeSettlement` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absencerekords`
--
ALTER TABLE `absencerekords`
  ADD CONSTRAINT `absencerekords_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id_worker`),
  ADD CONSTRAINT `absencerekords_ibfk_2` FOREIGN KEY (`extraVacationDay_id`) REFERENCES `extravacationdays` (`id_extraVacationDays`),
  ADD CONSTRAINT `absencerekords_ibfk_3` FOREIGN KEY (`absenceType_id`) REFERENCES `absencetypes` (`id_absenceType`);

--
-- Constraints for table `absencetosettlement_aftersettlement`
--
ALTER TABLE `absencetosettlement_aftersettlement`
  ADD CONSTRAINT `absencetosettlement_aftersettlement_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id_worker`),
  ADD CONSTRAINT `absencetosettlement_aftersettlement_ibfk_2` FOREIGN KEY (`workingtimesettlement_id`) REFERENCES `workingtimesettlement` (`id_workingTimeSettlement`),
  ADD CONSTRAINT `absencetosettlement_aftersettlement_ibfk_3` FOREIGN KEY (`absenceType_id`) REFERENCES `absencetypes` (`id_absenceType`);

--
-- Constraints for table `daysofvacation`
--
ALTER TABLE `daysofvacation`
  ADD CONSTRAINT `daysofvacation_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id_worker`);

--
-- Constraints for table `daysofvacations_logs`
--
ALTER TABLE `daysofvacations_logs`
  ADD CONSTRAINT `daysofvacations_logs_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id_worker`),
  ADD CONSTRAINT `daysofvacations_logs_ibfk_2` FOREIGN KEY (`absenceRecord_id`) REFERENCES `absencerekords` (`id_absenceRekord`);

--
-- Constraints for table `extravacationdays`
--
ALTER TABLE `extravacationdays`
  ADD CONSTRAINT `extravacationdays_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id_worker`),
  ADD CONSTRAINT `extravacationdays_ibfk_2` FOREIGN KEY (`workday_id`) REFERENCES `workdays` (`id_workDay`),
  ADD CONSTRAINT `extravacationdays_ibfk_3` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id_holiday`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`menagerOfSection`) REFERENCES `workers` (`id_worker`);

--
-- Constraints for table `shiftsofgroups`
--
ALTER TABLE `shiftsofgroups`
  ADD CONSTRAINT `shiftsofgroups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id_group`),
  ADD CONSTRAINT `shiftsofgroups_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id_shift`);

--
-- Constraints for table `workdays`
--
ALTER TABLE `workdays`
  ADD CONSTRAINT `workdays_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id_worker`);

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id_group`),
  ADD CONSTRAINT `workers_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id_section`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
