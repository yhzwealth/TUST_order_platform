/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.21 : Database - aidatabase
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`aidatabase` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `aidatabase`;

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `title` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `route` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`title`,`date`,`route`) values ('新闻测试','2020-01-01','/news/NewsTest'),('我校人工智能与大数据体验馆正式开馆','2020-09-27','/news/News1'),('新闻测试2','2020-01-02','/news/NewsTest'),('新闻测试3','2020-01-03','/news/NewsTest'),('新闻测试4','2020-01-04','/news/NewsTest'),('新闻测试5','2020-01-05','/news/NewsTest'),('新闻测试6','2020-01-06','/news/NewsTest'),('新闻测试7','2020-01-07','/news/NewsTest'),('新闻测试8','2020-01-08','/news/NewsTest'),('新闻测试9','2020-01-09','/news/NewsTest'),('新闻测试10','2020-01-10','/news/NewsTest'),('新闻测试11','2020-01-11','/news/NewsTest'),('新闻测试12','2020-01-12','/news/NewsTest'),('新闻测试13','2020-01-13','/news/NewsTest'),('新闻测试14','2020-01-14','/news/NewsTest'),('新闻测试15 LongLongLongLongLongLongLongLong','2020-01-15','/news/NewsTest'),('新闻测试16','2020-01-16','/news/NewsTest'),('新闻测试17','2020-01-17','/news/NewsTest'),('人工智能科普基地和人工智能与大数据体验馆志愿者招募活动正式启动','2020-10-27','/news/News2'),('我校人工智能与大数据体验馆迎来2020级新生','2020-10-27','/news/News3');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` varchar(200) NOT NULL,
  `place` tinyint(1) DEFAULT NULL COMMENT '参观场馆',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '团体名称',
  `person` tinyint(1) DEFAULT NULL COMMENT '校内外人员',
  `identify` tinyint(1) DEFAULT NULL COMMENT '参观人员身份',
  `number` int DEFAULT NULL COMMENT '参观人数',
  `guest` tinyint(1) DEFAULT NULL COMMENT '是否有重要嘉宾',
  `commentary` tinyint(1) DEFAULT NULL COMMENT '是否需要解说员',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `date` date DEFAULT NULL COMMENT '预约日期',
  `time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预约时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`id`,`place`,`name`,`person`,`identify`,`number`,`guest`,`commentary`,`leader`,`phone`,`email`,`date`,`time`) values ('02eca0b0-995a-4577-b8fe-23457dded09c',1,'team2',0,1,20,1,1,'李四','987654321','lisi@ls.com','2020-11-21','15:00-16:00'),('10284d89-ef49-401e-b8b6-9b60c8edc2b5',0,'teamTest',0,1,10,0,0,'张三','123456789','zhangsan@zs.com','2020-11-14','15:00-16:00'),('30960718-6ec9-4107-b815-dabe2ea5375c',0,'date2',0,1,10,0,0,'张三','123456789','zhangsan@zs.com','2020-11-10','15:00-16:00'),('5ffef694-6cb5-4432-92c2-9faa52924f58',0,'teamTest',0,1,10,0,0,'张三','123456789','zhangsanTest@zhangsan.com','2020-11-06','09:00-10:00'),('67e9c28a-1d4e-4b1a-bfd6-118794dda1c5',0,'teamTest',0,1,10,0,0,'张三','123456789','zhangsanTest@zhangsan.com','2020-11-14','14:00-15:00'),('6dcb480b-43aa-4089-81e7-3486c7767ae2',0,'dateSelect',0,1,10,0,0,'张三','123456789','zhangsan@zs.com','2020-11-14','11:00-12:00'),('81eb758f-5ea6-4d96-83ae-4986baf3d528',0,'select',1,3,10,0,0,'李四','987654321','lisi@ls.com','2020-11-15','14:00-15:00'),('9720e9a9-db77-42c9-b170-774d70108587',1,'team',1,3,10,0,1,'张三','123456789','zhangsan@zs.com','2020-11-16','09:00-10:00'),('a687ece7-97cc-4e21-8ce5-4dab961c2179',1,'flush',1,3,10,0,0,'张三','123456789','zhangsan@zs.com','2020-11-14','09:00-10:00'),('b0cd3985-2c56-4f72-9246-2e5a26ad7590',0,'dateTest',0,1,10,0,0,'张三','123456789','zhangsan@zs.com','2020-11-11','15:00-16:00'),('e37832ad-78ef-4b53-a511-d2243808fc6c',0,'teamTest',0,1,10,0,0,'张三','123456789','zhangsanTest@zhangsan.com','2020-11-10','09:00-10:00'),('e3df64d0-a2e0-4933-8eb4-b4e4691b5536',0,'teamTest',0,1,10,0,0,'张三','123456789','zhangsanTest@zhangsan.com','2020-11-08','09:00-10:00'),('ec7bad43-35d1-4932-852a-9f2aae7cca85',0,'DateOption',0,1,10,0,0,'李四','987654321','lisi@ls.com','2020-11-12','14:00-15:00'),('f64bbc73-2090-4f20-ad21-71ed41a668c2',0,'teamTest',0,1,10,0,0,'张三','123456789','zhangsanTest@zhangsan.com','2020-11-03','09:00-10:00'),('fc8c1a4b-3c88-4c22-a8b6-0350a2492585',0,'select2',0,1,10,0,0,'李四','987654321','lisi@ls.com','2020-11-25','15:00-16:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
