/*
SQLyog Community Edition- MySQL GUI v8.12 
MySQL - 5.0.37-community-nt : Database - travel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`travel` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `travel`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `bookpoint` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `account` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `dateandtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `packageid` varchar(45) NOT NULL,
  `status` varchar(45) default 'Book',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `createaccount` */

DROP TABLE IF EXISTS `createaccount`;

CREATE TABLE `createaccount` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `contactno` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `dateandtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `accountno` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `money` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `package` */

DROP TABLE IF EXISTS `package`;

CREATE TABLE `package` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `spoint` varchar(45) NOT NULL,
  `epoint` varchar(45) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `price` varchar(45) NOT NULL,
  `Description` text NOT NULL,
  `file` longblob NOT NULL,
  `datetime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `reg1` */

DROP TABLE IF EXISTS `reg1`;

CREATE TABLE `reg1` (
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `ContactNo` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `image` longblob NOT NULL,
  `timedate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
