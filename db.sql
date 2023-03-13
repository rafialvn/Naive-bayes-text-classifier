/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.21-MariaDB : Database - ml
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ml` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ml`;

/*Table structure for table `naivebayes_textclassifier` */

DROP TABLE IF EXISTS `naivebayes_textclassifier`;

CREATE TABLE `naivebayes_textclassifier` (
  `dataset_id` int(11) NOT NULL AUTO_INCREMENT,
  `response` text DEFAULT NULL,
  `label` varchar(30) NOT NULL,
  PRIMARY KEY (`dataset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `naivebayes_textclassifier` */

insert  into `naivebayes_textclassifier`(`dataset_id`,`response`,`label`) values 
(1,'pelayananya baik sekali','positive'),
(2,'kualitas pelayanan terjaga','positive'),
(3,'petugasnya ramah sekali','positive'),
(4,'ketepatan waktu terjamin, bagus','positive'),
(5,'gedung bangunan kurang memadahi','negative'),
(6,'pelayanan kurang baik, kadang petugas tidak ada','negative'),
(7,'pegawainya kurang senyum','negative');

/* Function  structure for function  `json_extract_c` */

/*!50003 DROP FUNCTION IF EXISTS `json_extract_c` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `json_extract_c`(details TEXT,
  required_field VARCHAR (255)
) RETURNS text CHARSET latin1
BEGIN
  /* get key from function passed required field value */
  set @JSON_key = SUBSTRING_INDEX(required_field,'$.', -1); 
  /* get everything to the right of the 'key = <required_field>' */
  set @JSON_entry = SUBSTRING_INDEX(details,CONCAT('"', @JSON_key, '"'), -1 ); 
  /* get everything to the left of the trailing comma */
  set @JSON_entry_no_trailing_comma = SUBSTRING_INDEX(@JSON_entry, ",", 1); 
  /* get everything to the right of the leading colon after trimming trailing and leading whitespace */
  set @JSON_entry_no_leading_colon = TRIM(LEADING ':' FROM TRIM(@JSON_entry_no_trailing_comma)); 
  /* trim off the leading and trailing double quotes after trimming trailing and leading whitespace*/
  set @JSON_extracted_entry = TRIM(BOTH '"' FROM TRIM(@JSON_entry_no_leading_colon));
  RETURN @JSON_extracted_entry;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
