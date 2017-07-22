-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql1.scaledsystems.com
-- Generation Time: May 28, 2017 at 12:39 PM
-- Server version: 5.5.52-log
-- PHP Version: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `3022_fisif`
--
CREATE DATABASE IF NOT EXISTS `fisif_tools` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fisif_tools`;

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
CREATE TABLE `agencies` (
  `id` mediumint(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `address2` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `zip` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `activation_requested` varchar(255) NOT NULL DEFAULT '',
  `active` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agent_commissions`
--

DROP TABLE IF EXISTS `agent_commissions`;
CREATE TABLE `agent_commissions` (
  `AgencyName` varchar(255) NOT NULL,
  `AgencyAddr1` varchar(255) NOT NULL,
  `AgencyAddr2` varchar(255) NOT NULL,
  `AgencyCity` varchar(255) NOT NULL,
  `AgencyState` varchar(255) NOT NULL,
  `AgencyZip` varchar(255) NOT NULL,
  `AgencyPhone` varchar(255) NOT NULL,
  `AgencyFax` varchar(255) NOT NULL,
  `YearCode` varchar(255) NOT NULL,
  `PeriodBeginDate` varchar(255) NOT NULL,
  `PeriodEndDate` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agent_commissions_members`
--

DROP TABLE IF EXISTS `agent_commissions_members`;
CREATE TABLE `agent_commissions_members` (
  `AgencyName` varchar(255) NOT NULL,
  `AuditDate` varchar(255) NOT NULL,
  `CorpBilledID` varchar(255) NOT NULL,
  `BilledName` varchar(255) NOT NULL,
  `PolicyBeginDate` varchar(255) NOT NULL,
  `PolicyEndDate` varchar(255) NOT NULL,
  `Premium` varchar(255) NOT NULL,
  `Earned` varchar(255) NOT NULL,
  `PremiumPaid` varchar(255) NOT NULL,
  `PaidPremiumEarned` varchar(255) NOT NULL,
  `Rate` varchar(255) NOT NULL,
  `ComEarned` varchar(255) NOT NULL,
  `ComPaid` varchar(255) NOT NULL,
  `BalanceDue` varchar(255) NOT NULL,
  `AmountPaid` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ar_fundyears`
--

DROP TABLE IF EXISTS `ar_fundyears`;
CREATE TABLE `ar_fundyears` (
  `BilledID` varchar(255) NOT NULL DEFAULT '',
  `YearCode` varchar(255) NOT NULL DEFAULT '',
  `YearTrans` varchar(20) NOT NULL DEFAULT '',
  `YearCharges` float(8,2) NOT NULL DEFAULT '0.00',
  `YearPayments` float(8,2) NOT NULL DEFAULT '0.00',
  `YearOther` float(8,2) NOT NULL DEFAULT '0.00',
  `YearBalance` float(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ar_main`
--

DROP TABLE IF EXISTS `ar_main`;
CREATE TABLE `ar_main` (
  `BilledID` varchar(10) NOT NULL DEFAULT '',
  `AgencyID` varchar(10) NOT NULL DEFAULT '',
  `StartDate` varchar(20) NOT NULL DEFAULT '',
  `MemberTrans` varchar(20) NOT NULL DEFAULT '',
  `MemberCharges` float(8,2) NOT NULL DEFAULT '0.00',
  `MemberPayments` float(8,2) NOT NULL DEFAULT '0.00',
  `MemberOther` float(8,2) NOT NULL DEFAULT '0.00',
  `MemberBalance` float(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ar_transactions`
--

DROP TABLE IF EXISTS `ar_transactions`;
CREATE TABLE `ar_transactions` (
  `BilledID` varchar(255) NOT NULL DEFAULT '',
  `YearCode` varchar(255) NOT NULL DEFAULT '',
  `Invoice` varchar(20) NOT NULL DEFAULT '',
  `TransDate` varchar(20) NOT NULL DEFAULT '',
  `Comment` varchar(255) NOT NULL DEFAULT '',
  `TransType` varchar(10) NOT NULL DEFAULT '',
  `Charges` float(8,2) NOT NULL DEFAULT '0.00',
  `Payments` float(8,2) NOT NULL DEFAULT '0.00',
  `Other` float(8,2) NOT NULL DEFAULT '0.00',
  `Balance` float(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `import_log`
--

DROP TABLE IF EXISTS `import_log`;
CREATE TABLE `import_log` (
  `import_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `success` varchar(1) NOT NULL,
  `errors` text NOT NULL,
  `remote_addr` varchar(255) NOT NULL,
  `http_x_forwarded_for` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lossruns_claims`
--

DROP TABLE IF EXISTS `lossruns_claims`;
CREATE TABLE `lossruns_claims` (
  `ClaimID` varchar(255) NOT NULL DEFAULT '',
  `BilledID` varchar(255) NOT NULL DEFAULT '',
  `YearCode` varchar(255) NOT NULL DEFAULT '',
  `ClaimStatus` varchar(255) NOT NULL DEFAULT '',
  `ClaimantName` varchar(255) NOT NULL DEFAULT '',
  `JobTitle` varchar(255) NOT NULL DEFAULT '',
  `Location` varchar(255) NOT NULL DEFAULT '',
  `LocationID` varchar(255) NOT NULL DEFAULT '',
  `ClassCode` varchar(255) NOT NULL DEFAULT '',
  `ClassDescription` varchar(255) NOT NULL DEFAULT '',
  `DateClosed` varchar(255) NOT NULL DEFAULT '',
  `InjuryDate` varchar(255) NOT NULL DEFAULT '',
  `ClaimDescription` varchar(255) NOT NULL DEFAULT '',
  `AccidentDescription` varchar(255) NOT NULL DEFAULT '',
  `InjuryDescription` varchar(255) NOT NULL DEFAULT '',
  `BodyPart` varchar(255) NOT NULL DEFAULT '',
  `Adjuster` varchar(255) NOT NULL DEFAULT '',
  `IndemnityReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `IndemnityPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `MedicalReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `MedicalPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `LegalReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `LegalPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `OtherReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `OtherPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `TotalReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `TotalPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `Recovery` float(8,2) NOT NULL DEFAULT '0.00',
  `Incurred` float(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lossruns_fundyears`
--

DROP TABLE IF EXISTS `lossruns_fundyears`;
CREATE TABLE `lossruns_fundyears` (
  `BilledID` varchar(255) NOT NULL DEFAULT '',
  `YearCode` varchar(255) NOT NULL DEFAULT '',
  `ExMod` varchar(255) NOT NULL DEFAULT '',
  `FY_IndReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_MedReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_LegReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_OthReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_IndPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_MedPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_LegPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_OthPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_Recovery` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_Incurred` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_Premium` float(8,2) NOT NULL DEFAULT '0.00',
  `FY_LossRatio` float(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lossruns_main`
--

DROP TABLE IF EXISTS `lossruns_main`;
CREATE TABLE `lossruns_main` (
  `BilledID` varchar(10) NOT NULL DEFAULT '',
  `BilledName` varchar(255) NOT NULL DEFAULT '',
  `MB_IndReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_MedReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_LegReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_OthReserves` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_IndPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_MedPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_LegPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_OthPaid` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_Recovery` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_Incurred` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_Premium` float(8,2) NOT NULL DEFAULT '0.00',
  `MB_LossRatio` float(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` varchar(10) NOT NULL DEFAULT '0',
  `agencyid` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `address2` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `zip` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `activation_requested` varchar(255) NOT NULL DEFAULT '',
  `active` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members_coi`
--

DROP TABLE IF EXISTS `members_coi`;
CREATE TABLE `members_coi` (
  `CorpBilledID` varchar(255) NOT NULL,
  `BilledName` varchar(255) NOT NULL,
  `YearCode` varchar(255) NOT NULL,
  `Endorsements` varchar(255) NOT NULL,
  `PolicyLimit` varchar(255) NOT NULL,
  `MemberAddr1` varchar(255) NOT NULL,
  `MemberAddr2` varchar(255) NOT NULL,
  `MemberCityLine` varchar(255) NOT NULL,
  `MemberPhone` varchar(255) NOT NULL,
  `MemberFax` varchar(255) NOT NULL,
  `BeginDate` varchar(255) NOT NULL,
  `EndDate` varchar(255) NOT NULL,
  `AgencyName` varchar(255) NOT NULL,
  `AgencyAddr1` varchar(255) NOT NULL,
  `AgencyAddr2` varchar(255) NOT NULL,
  `AgencyCityLine` varchar(255) NOT NULL,
  `AgencyPhone` varchar(255) NOT NULL,
  `AgencyFax` varchar(255) NOT NULL,
  `CoverageBLiability` varchar(255) NOT NULL,
  `AggregateLimit` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members_prr`
--

DROP TABLE IF EXISTS `members_prr`;
CREATE TABLE `members_prr` (
  `CorpBilledID` varchar(255) NOT NULL,
  `BilledName` varchar(255) NOT NULL,
  `MemberAddr1` varchar(255) NOT NULL,
  `MemberAddr2` varchar(255) NOT NULL,
  `MemberCityLine` varchar(255) NOT NULL,
  `CarrierName` varchar(255) NOT NULL,
  `CarrierAddr1` varchar(255) NOT NULL,
  `CarrierAddr2` varchar(255) NOT NULL,
  `CarrierCityLine` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members_prr_classcodes`
--

DROP TABLE IF EXISTS `members_prr_classcodes`;
CREATE TABLE `members_prr_classcodes` (
  `CorpBilledID` varchar(255) NOT NULL,
  `YearCode` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `ClassCode` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Rate` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members_prr_discount`
--

DROP TABLE IF EXISTS `members_prr_discount`;
CREATE TABLE `members_prr_discount` (
  `CorpBilledID` varchar(255) NOT NULL,
  `YearCode` varchar(255) NOT NULL,
  `DiscDescription` varchar(255) NOT NULL,
  `DiscRate` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members_prr_fundyear`
--

DROP TABLE IF EXISTS `members_prr_fundyear`;
CREATE TABLE `members_prr_fundyear` (
  `CorpBilledID` varchar(255) NOT NULL,
  `YearCode` varchar(255) NOT NULL,
  `ExMod` varchar(255) NOT NULL,
  `VolumeDiscount` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pc_classcodes`
--

DROP TABLE IF EXISTS `pc_classcodes`;
CREATE TABLE `pc_classcodes` (
  `BilledID` varchar(255) NOT NULL DEFAULT '',
  `ClassCode` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Exposure` float(20,2) NOT NULL DEFAULT '0.00',
  `Rate` float(20,2) NOT NULL DEFAULT '0.00',
  `Premium` float(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pc_discounts`
--

DROP TABLE IF EXISTS `pc_discounts`;
CREATE TABLE `pc_discounts` (
  `BilledID` varchar(255) NOT NULL DEFAULT '',
  `Discount` varchar(255) NOT NULL DEFAULT '',
  `DiscountAmount` float(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pc_main`
--

DROP TABLE IF EXISTS `pc_main`;
CREATE TABLE `pc_main` (
  `BilledID` varchar(10) NOT NULL DEFAULT '',
  `AgencyID` varchar(10) NOT NULL DEFAULT '',
  `YearCode` varchar(20) NOT NULL DEFAULT '',
  `StartDate` varchar(20) NOT NULL DEFAULT '',
  `EndDate` varchar(20) NOT NULL DEFAULT '',
  `ManualPremium` float(8,2) NOT NULL DEFAULT '0.00',
  `ExMod` varchar(10) NOT NULL DEFAULT '',
  `StandardPremium` float(8,2) NOT NULL DEFAULT '0.00',
  `VolumeDiscount` float(8,2) NOT NULL DEFAULT '0.00',
  `VolumeDiscountRate` varchar(10) NOT NULL DEFAULT '',
  `Total` float(8,2) NOT NULL DEFAULT '0.00',
  `AdminCharges` float(8,2) NOT NULL DEFAULT '0.00',
  `GrandTotal` float(8,2) NOT NULL DEFAULT '0.00',
  `PRReport` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pe_discounts`
--

DROP TABLE IF EXISTS `pe_discounts`;
CREATE TABLE `pe_discounts` (
  `base` bigint(20) NOT NULL DEFAULT '0',
  `top` bigint(20) NOT NULL DEFAULT '0',
  `discount` float(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
CREATE TABLE `rates` (
  `classcode` varchar(6) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `rate` float(4,2) NOT NULL DEFAULT '0.00',
  `minimumpremium` mediumint(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_commissions`
--
ALTER TABLE `agent_commissions`
  ADD KEY `AgencyName` (`AgencyName`);

--
-- Indexes for table `import_log`
--
ALTER TABLE `import_log`
  ADD PRIMARY KEY (`import_id`),
  ADD UNIQUE KEY `report_id` (`import_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`classcode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `import_log`
--
ALTER TABLE `import_log`
  MODIFY `import_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
