CREATE DATABASE /*!32312 IF NOT EXISTS*/`zsdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `zsdb`;

/*Table structure for table `ACT_GE_BYTEARRAY` */

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `login_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;