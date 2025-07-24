-- MySQL dump 10.13  Distrib 5.1.53, for suse-linux-gnu (x86_64)
--
-- Host: localhost    Database: dbt3
-- ------------------------------------------------------
-- Server version	5.6.5-m8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `c_custkey` int(11) NOT NULL,
  `c_name` varchar(25) DEFAULT NULL,
  `c_address` varchar(40) DEFAULT NULL,
  `c_nationkey` int(11) DEFAULT NULL,
  `c_phone` char(15) DEFAULT NULL,
  `c_acctbal` double DEFAULT NULL,
  `c_mktsegment` char(10) DEFAULT NULL,
  `c_comment` varchar(117) DEFAULT NULL,
  PRIMARY KEY (`c_custkey`),
  KEY `i_c_nationkey` (`c_nationkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lineitem`
--

DROP TABLE IF EXISTS `lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineitem` (
  `l_orderkey` int(11) NOT NULL DEFAULT '0',
  `l_partkey` int(11) DEFAULT NULL,
  `l_suppkey` int(11) DEFAULT NULL,
  `l_linenumber` int(11) NOT NULL DEFAULT '0',
  `l_quantity` double DEFAULT NULL,
  `l_extendedprice` double DEFAULT NULL,
  `l_discount` double DEFAULT NULL,
  `l_tax` double DEFAULT NULL,
  `l_returnflag` char(1) DEFAULT NULL,
  `l_linestatus` char(1) DEFAULT NULL,
  `l_shipDATE` date DEFAULT NULL,
  `l_commitDATE` date DEFAULT NULL,
  `l_receiptDATE` date DEFAULT NULL,
  `l_shipinstruct` char(25) DEFAULT NULL,
  `l_shipmode` char(10) DEFAULT NULL,
  `l_comment` varchar(44) DEFAULT NULL,
  PRIMARY KEY (`l_orderkey`,`l_linenumber`),
  KEY `i_l_shipdate` (`l_shipDATE`),
  KEY `i_l_suppkey_partkey` (`l_partkey`,`l_suppkey`),
  KEY `i_l_partkey` (`l_partkey`),
  KEY `i_l_suppkey` (`l_suppkey`),
  KEY `i_l_receiptdate` (`l_receiptDATE`),
  KEY `i_l_orderkey` (`l_orderkey`),
  KEY `i_l_orderkey_quantity` (`l_orderkey`,`l_quantity`),
  KEY `i_l_commitdate` (`l_commitDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nation`
--

DROP TABLE IF EXISTS `nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nation` (
  `n_nationkey` int(11) NOT NULL,
  `n_name` char(25) DEFAULT NULL,
  `n_regionkey` int(11) DEFAULT NULL,
  `n_comment` varchar(152) DEFAULT NULL,
  PRIMARY KEY (`n_nationkey`),
  KEY `i_n_regionkey` (`n_regionkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `o_orderkey` int(11) NOT NULL,
  `o_custkey` int(11) DEFAULT NULL,
  `o_orderstatus` char(1) DEFAULT NULL,
  `o_totalprice` double DEFAULT NULL,
  `o_orderDATE` date DEFAULT NULL,
  `o_orderpriority` char(15) DEFAULT NULL,
  `o_clerk` char(15) DEFAULT NULL,
  `o_shippriority` int(11) DEFAULT NULL,
  `o_comment` varchar(79) DEFAULT NULL,
  PRIMARY KEY (`o_orderkey`),
  KEY `i_o_orderdate` (`o_orderDATE`),
  KEY `i_o_custkey` (`o_custkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part` (
  `p_partkey` int(11) NOT NULL,
  `p_name` varchar(55) DEFAULT NULL,
  `p_mfgr` char(25) DEFAULT NULL,
  `p_brand` char(10) DEFAULT NULL,
  `p_type` varchar(25) DEFAULT NULL,
  `p_size` int(11) DEFAULT NULL,
  `p_container` char(10) DEFAULT NULL,
  `p_retailprice` double DEFAULT NULL,
  `p_comment` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`p_partkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partsupp`
--

DROP TABLE IF EXISTS `partsupp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partsupp` (
  `ps_partkey` int(11) NOT NULL DEFAULT '0',
  `ps_suppkey` int(11) NOT NULL DEFAULT '0',
  `ps_availqty` int(11) DEFAULT NULL,
  `ps_supplycost` double DEFAULT NULL,
  `ps_comment` varchar(199) DEFAULT NULL,
  PRIMARY KEY (`ps_partkey`,`ps_suppkey`),
  KEY `i_ps_partkey` (`ps_partkey`),
  KEY `i_ps_suppkey` (`ps_suppkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `r_regionkey` int(11) NOT NULL,
  `r_name` char(25) DEFAULT NULL,
  `r_comment` varchar(152) DEFAULT NULL,
  PRIMARY KEY (`r_regionkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `s_suppkey` int(11) NOT NULL,
  `s_name` char(25) DEFAULT NULL,
  `s_address` varchar(40) DEFAULT NULL,
  `s_nationkey` int(11) DEFAULT NULL,
  `s_phone` char(15) DEFAULT NULL,
  `s_acctbal` double DEFAULT NULL,
  `s_comment` varchar(101) DEFAULT NULL,
  PRIMARY KEY (`s_suppkey`),
  KEY `i_s_nationkey` (`s_nationkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_statistics`
--

DROP TABLE IF EXISTS `time_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_statistics` (
  `task_name` varchar(40) DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-24 16:26:49
