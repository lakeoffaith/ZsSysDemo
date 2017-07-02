# Host: localhost  (Version 5.7.10)
# Date: 2017-07-02 09:25:00
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "bn_clean_state_tbl"
#

DROP TABLE IF EXISTS `bn_clean_state_tbl`;
CREATE TABLE `bn_clean_state_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗状态';

#
# Data for table "bn_clean_state_tbl"
#


#
# Structure for table "bn_clean_tbl"
#

DROP TABLE IF EXISTS `bn_clean_tbl`;
CREATE TABLE `bn_clean_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) DEFAULT NULL,
  `clean_type_id` int(11) DEFAULT NULL,
  `clean_scour_id` int(11) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL COMMENT '清洗的人。',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '清洗结束时间',
  `oauth_user_id` int(11) DEFAULT NULL,
  `oauth_time` datetime DEFAULT NULL COMMENT '审核时间',
  `clean_uid` varchar(255) DEFAULT NULL COMMENT '清洗锅次',
  `priority` int(11) DEFAULT NULL COMMENT '清洗过程的先后',
  `clean_state_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗表';

#
# Data for table "bn_clean_tbl"
#


#
# Structure for table "bn_clean_type_tbl"
#

DROP TABLE IF EXISTS `bn_clean_type_tbl`;
CREATE TABLE `bn_clean_type_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗类型';

#
# Data for table "bn_clean_type_tbl"
#


#
# Structure for table "bn_company_tbl"
#

DROP TABLE IF EXISTS `bn_company_tbl`;
CREATE TABLE `bn_company_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构或者公司的表';

#
# Data for table "bn_company_tbl"
#


#
# Structure for table "bn_goods_tbl"
#

DROP TABLE IF EXISTS `bn_goods_tbl`;
CREATE TABLE `bn_goods_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包内的物品';

#
# Data for table "bn_goods_tbl"
#


#
# Structure for table "bn_goods_unit_tbl"
#

DROP TABLE IF EXISTS `bn_goods_unit_tbl`;
CREATE TABLE `bn_goods_unit_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `delete` int(11) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品的单位表';

#
# Data for table "bn_goods_unit_tbl"
#


#
# Structure for table "bn_machine_tbl"
#

DROP TABLE IF EXISTS `bn_machine_tbl`;
CREATE TABLE `bn_machine_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器表';

#
# Data for table "bn_machine_tbl"
#


#
# Structure for table "bn_package_clean_tbl"
#

DROP TABLE IF EXISTS `bn_package_clean_tbl`;
CREATE TABLE `bn_package_clean_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `clean_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包和清洗的中间表';

#
# Data for table "bn_package_clean_tbl"
#


#
# Structure for table "bn_package_goos_tbl"
#

DROP TABLE IF EXISTS `bn_package_goos_tbl`;
CREATE TABLE `bn_package_goos_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `goos_id` int(11) DEFAULT NULL,
  `package_id` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '物品的数量',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包和物品的中间表';

#
# Data for table "bn_package_goos_tbl"
#


#
# Structure for table "bn_package_material_tbl"
#

DROP TABLE IF EXISTS `bn_package_material_tbl`;
CREATE TABLE `bn_package_material_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包装材料分类';

#
# Data for table "bn_package_material_tbl"
#


#
# Structure for table "bn_package_process_tbl"
#

DROP TABLE IF EXISTS `bn_package_process_tbl`;
CREATE TABLE `bn_package_process_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `process_id` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包和过程的多对多维护';

#
# Data for table "bn_package_process_tbl"
#


#
# Structure for table "bn_package_stln_time_tbl"
#

DROP TABLE IF EXISTS `bn_package_stln_time_tbl`;
CREATE TABLE `bn_package_stln_time_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL COMMENT '有效时间小时为单位',
  `package_type_id` int(11) DEFAULT NULL COMMENT '关联包类型的外键',
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建者的id',
  `delete` varchar(255) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包灭菌的有效时间';

#
# Data for table "bn_package_stln_time_tbl"
#


#
# Structure for table "bn_package_tbl"
#

DROP TABLE IF EXISTS `bn_package_tbl`;
CREATE TABLE `bn_package_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL COMMENT '条形码',
  `package_process_id` int(11) DEFAULT NULL COMMENT '包所在的过程的外键',
  `package_type_id` int(11) DEFAULT NULL,
  `package_material_id` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL COMMENT '单包的价格',
  `income_type` int(11) DEFAULT '0' COMMENT '外来包是否(0:本院)',
  `hospital_id` int(11) DEFAULT NULL COMMENT '包来源医院的外键',
  `company_id` int(11) DEFAULT NULL,
  `implant_id` varchar(255) DEFAULT NULL COMMENT '植入物的外键',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包';

#
# Data for table "bn_package_tbl"
#


#
# Structure for table "bn_package_type"
#

DROP TABLE IF EXISTS `bn_package_type`;
CREATE TABLE `bn_package_type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete` int(11) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包的类别';

#
# Data for table "bn_package_type"
#


#
# Structure for table "bn_package_warning_tbl"
#

DROP TABLE IF EXISTS `bn_package_warning_tbl`;
CREATE TABLE `bn_package_warning_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `warning_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包和异常的多对多表';

#
# Data for table "bn_package_warning_tbl"
#


#
# Structure for table "bn_process_tbl"
#

DROP TABLE IF EXISTS `bn_process_tbl`;
CREATE TABLE `bn_process_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '代表处理的过程顺序',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包过程的表';

#
# Data for table "bn_process_tbl"
#


#
# Structure for table "bn_requisition_item_tbl"
#

DROP TABLE IF EXISTS `bn_requisition_item_tbl`;
CREATE TABLE `bn_requisition_item_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `package_id` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='领取单的子项表';

#
# Data for table "bn_requisition_item_tbl"
#


#
# Structure for table "bn_requisition_tbl"
#

DROP TABLE IF EXISTS `bn_requisition_tbl`;
CREATE TABLE `bn_requisition_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL COMMENT '发放的医院',
  `department_id` int(11) DEFAULT NULL COMMENT '发送的科室',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='领取单';

#
# Data for table "bn_requisition_tbl"
#


#
# Structure for table "bn_scour_tbl"
#

DROP TABLE IF EXISTS `bn_scour_tbl`;
CREATE TABLE `bn_scour_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='清洗液的表';

#
# Data for table "bn_scour_tbl"
#


#
# Structure for table "bn_sterilization_tbl"
#

DROP TABLE IF EXISTS `bn_sterilization_tbl`;
CREATE TABLE `bn_sterilization_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `machine_id` varchar(255) DEFAULT NULL COMMENT '灭菌仪器的外键',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_user_id` int(11) DEFAULT NULL COMMENT '执行人的外键',
  `oauth_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='灭菌';

#
# Data for table "bn_sterilization_tbl"
#


#
# Structure for table "bn_warning_tbl"
#

DROP TABLE IF EXISTS `bn_warning_tbl`;
CREATE TABLE `bn_warning_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete` int(11) DEFAULT NULL COMMENT '删除标志',
  `create_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包异常表';

#
# Data for table "bn_warning_tbl"
#


#
# Structure for table "bn_worklist_state_tbl"
#

DROP TABLE IF EXISTS `bn_worklist_state_tbl`;
CREATE TABLE `bn_worklist_state_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete` int(11) DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工单的状态表';

#
# Data for table "bn_worklist_state_tbl"
#


#
# Structure for table "bn_worklist_type_tbl"
#

DROP TABLE IF EXISTS `bn_worklist_type_tbl`;
CREATE TABLE `bn_worklist_type_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete` int(11) DEFAULT NULL COMMENT '删除的标志',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工单加急的类型';

#
# Data for table "bn_worklist_type_tbl"
#


#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete` int(11) DEFAULT NULL COMMENT '是否删除了',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科室表';

#
# Data for table "department"
#


#
# Structure for table "emp_role"
#

DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role` (
  `empId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联的表';

#
# Data for table "emp_role"
#

INSERT INTO `emp_role` VALUES (1,6),(2,2),(3,3),(4,4),(5,5),(6,1);

#
# Structure for table "employee"
#

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `login_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "employee"
#

INSERT INTO `employee` VALUES (1,'admin','admin','12345',NULL),(2,'组长张','zuzhang','12345',NULL),(3,'回收刘','huishouliu','12345',NULL),(4,'清洗李','qingxili','12345',NULL),(5,'消毒王','xiaoduwang','12345',NULL),(6,'科长钱','kezhangqian','12345',NULL);

#
# Structure for table "bn_worklist_tbl"
#

DROP TABLE IF EXISTS `bn_worklist_tbl`;
CREATE TABLE `bn_worklist_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_dep_id` int(11) DEFAULT NULL COMMENT '申领的科室',
  `apply_time` datetime DEFAULT NULL COMMENT '申领时间',
  `pick_time` datetime DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '工单类型外键',
  `state_id` int(11) DEFAULT NULL COMMENT '工单状态外键',
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `delete` int(11) DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`),
  KEY `fk_type` (`type_id`),
  KEY `fk_state` (`state_id`),
  KEY `fk_dep` (`apply_dep_id`),
  KEY `fk_create_user` (`create_user_id`),
  CONSTRAINT `fk_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dep` FOREIGN KEY (`apply_dep_id`) REFERENCES `department` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_state` FOREIGN KEY (`state_id`) REFERENCES `bn_worklist_state_tbl` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `bn_worklist_type_tbl` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "bn_worklist_tbl"
#


#
# Structure for table "his_hospital_tbl"
#

DROP TABLE IF EXISTS `his_hospital_tbl`;
CREATE TABLE `his_hospital_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院表';

#
# Data for table "his_hospital_tbl"
#


#
# Structure for table "his_patient_tbl"
#

DROP TABLE IF EXISTS `his_patient_tbl`;
CREATE TABLE `his_patient_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_type_id` int(11) DEFAULT NULL COMMENT '病人类型的外键',
  `indoor_number` varchar(255) DEFAULT NULL COMMENT '住院号',
  `door_number` varchar(255) DEFAULT NULL COMMENT '门诊号',
  `name` varchar(255) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `age` decimal(4,1) DEFAULT NULL COMMENT '年龄（0.表示几个月）',
  `influence_state` int(11) DEFAULT '0' COMMENT '是否感染',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='病人的表';

#
# Data for table "his_patient_tbl"
#


#
# Structure for table "resource"
#

DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `blockType` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

#
# Data for table "resource"
#

INSERT INTO `resource` VALUES (1,'0','回收','huishou',1,'icon-trash','/huishou/index',1),(2,'0','配包','peibao',1,'icon-landscape','/peibao/index',1),(3,'0','入库','ruku',1,' icon-download','/ruku/index',1),(4,'0','清洗','clean',1,' icon-air','/clean/index',1),(5,'0','灭菌','miejun',1,' icon-briefcase-2','/miejun/index',1),(6,'0','发放','fafang',1,'icon-upload-3','/fafang/index',1),(7,'0','清洗审核','clean:shenhe',1,'icon-air','/clean/shenhe',1),(8,'0','灭菌审核','miejun:shenhe',1,'icon-briefcase-2','/miejun/shenhe',1),(9,'0','工单汇总','gongdan:huizong',1,' icon-statistics','/gongdan/huizong',1),(10,'0','手术排班记录','shoushupaiban',1,' icon-calendar','/shoushupaiban/index',2),(11,'0','通告管理','tongzhi',1,' icon-bell-2','/tongzhi/index',2),(12,'0','系统设置','setting',1,'icon-cog-3','/setting',2),(13,'0','追溯','zhuisu',1,'icon-loop-3','/zhuisu/index',0),(14,'0','成本核算','chengben',1,' icon-keyboard-2','/chengben/index',0),(15,'0','异常处理','warning',1,'icon-notification','/warning/index',0),(16,'0','清洗统计','clean:tongji',1,' icon-bars','/clean/tongji',0),(17,'0','统计报表','tongji',1,' icon-stats','/tongji/index',0),(18,'0','包监控','bao:jiankong',1,'icon-views','/bao/jiankong',0),(19,'0','灭菌统计','miejun:tongji',1,' icon-chart','/miejun/tongji',0),(21,NULL,'员工查询','employee:list',NULL,NULL,NULL,NULL),(22,NULL,'主页',NULL,1,' icon-home-2','/index',0);

#
# Structure for table "role"
#

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "role"
#

INSERT INTO `role` VALUES (1,'deper','供应室科长'),(2,'zuzhanger','组长'),(3,'huishouer','回收负责人'),(4,'qingxisher','清洗负责人'),(5,'xiaoduer','消毒负责人'),(6,'admin','系统管理员');

#
# Structure for table "role_resource"
#

DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `roleId` int(11) NOT NULL,
  `resourceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "role_resource"
#

INSERT INTO `role_resource` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(2,4),(2,7),(2,16),(3,1),(4,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(6,19),(6,20),(1,21);

#
# Structure for table "sys_webset"
#

DROP TABLE IF EXISTS `sys_webset`;
CREATE TABLE `sys_webset` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '网站名',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `url` varchar(255) DEFAULT NULL COMMENT '网站首页',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站说明';

#
# Data for table "sys_webset"
#

