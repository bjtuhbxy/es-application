SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `notice_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `notice_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `item_id` varchar(50) NOT NULL COMMENT '项目ID',
  `notice_id` varchar(50) NOT NULL COMMENT '公告ID',
  `project_name` varchar(300) NOT NULL COMMENT '项目名称',
  `project_code` varchar(50) NOT NULL COMMENT '项目编号',
  `title` varchar(300) NOT NULL COMMENT '公告标题',
  `pub_time` datetime NOT NULL COMMENT '发布时间',
  `pub_person` varchar(200) NOT NULL COMMENT '发布人',
  `notice_type_id` varchar(50) NOT NULL COMMENT '公告类型ID',
  `notice_type_name` varchar(200) NOT NULL COMMENT '公告类型名称',
  `source_id` varchar(50) NOT NULL,
  `source_name` varchar(50) NOT NULL,
  `tender_sale_deadline` datetime DEFAULT NULL COMMENT '标书售卖截止时间',
  `back_date` datetime DEFAULT NULL COMMENT '回标截止时间',
  `start_time` datetime DEFAULT NULL COMMENT '公示开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '公示结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_notice_info_notice_id` ON `notice_info`(`notice_id`);  

-- ----------------------------
-- Table structure for `notice_product_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `notice_product_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `notice_id` varchar(50) NOT NULL COMMENT '公告ID',
  `catalog_big_id` varchar(255) NULL COMMENT '大类ID',
  `catalog_big_name` varchar(255) NULL COMMENT '大类名称',
  `catalog_middle_id` varchar(255) NULL COMMENT '中类ID',
  `catalog_middle_name` varchar(255) NULL COMMENT '中类名称',
  `catalog_small_id` varchar(255) NULL COMMENT '小类ID',
  `catalog_small_name` varchar(255) NULL COMMENT '小类名称',
  `product_id` varchar(255) NOT NULL COMMENT '产品ID',
  `product_name` varchar(255) NOT NULL COMMENT '产品名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_notice_product_info_notice_id` ON `notice_product_info`(`notice_id`);
CREATE INDEX `idx_notice_product_info_catalog_big_id` ON `notice_product_info`(`catalog_big_id`);
CREATE INDEX `idx_notice_product_info_catalog_middle_id` ON `notice_product_info`(`catalog_middle_id`);
CREATE INDEX `idx_notice_product_info_catalog_small_id` ON `notice_product_info`(`catalog_small_id`);

-- ----------------------------
-- Table structure for `notice_detail_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `notice_detail_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `notice_id` varchar(50) NOT NULL COMMENT '公告ID',
  `content` longtext NOT NULL COMMENT '公告内容',
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_notice_detail_info_notice_id` ON `notice_detail_info`(`notice_id`);

-- ----------------------------
-- Table structure for `notice_attachment_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `notice_attachment_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `notice_id` varchar(200) NOT NULL COMMENT '公告ID',
  `attachment_type` varchar(20) NOT NULL COMMENT '附件扩展名',
  `attachment_mode` varchar(20) NOT NULL COMMENT '存储类型（ftp,url)',
  `attachement_url` varchar(500) NOT NULL COMMENT '加密的文件路径',
  `attachment_name` varchar(200) NOT NULL COMMENT '原始文件名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_notice_attachment_info_notice_id` ON `notice_attachment_info`(`notice_id`);

-- ----------------------------
-- Table structure for AGENT_INFO
-- ----------------------------
create table if not exists `agent_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(200) NOT NULL COMMENT '招标代理用户ID',
  `user_name` varchar(200) NOT NULL COMMENT '招标代理用户名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '修改时间',
  `manager_name` varchar(100) NOT NULL COMMENT '代理机构管理员名称',
  `code_type_id` varchar(2) NOT NULL COMMENT '招标代理机构代码类型ID',
  `code` varchar(32) NOT NULL COMMENT '招标代理机构代码',
  `card_type_id` varchar(72) NOT NULL COMMENT '法人代表/负责人证件类型代码',
  `card_type_name` varchar(72) NOT NULL COMMENT '法人代表/负责人证件类型名称',
  `card_number` varchar(72) NOT NULL COMMENT '法人代表/负责人证件号',
  `trade_subject_id` varchar(72) NOT NULL COMMENT '招标交易主体类型ID',
  `trade_subject_name` varchar(72) NOT NULL COMMENT '招标交易主体类型名称',
  `industry_code` varchar(72) NOT NULL COMMENT '行业代码',
  `credit_status` varchar(72) NOT NULL COMMENT '资信等级',
  `bank_id` varchar(72) NOT NULL COMMENT '开户银行代码',
  `bank_name` varchar(72) NOT NULL COMMENT '开户银行名称',
  `bank_account` varchar(72) NOT NULL COMMENT '基本账户账号',
  `contact_phone` varchar(72) NOT NULL COMMENT '机构联系电话',
  `registered_capital` varchar(72) NOT NULL COMMENT '注册资本',
  `registry_currency_id` varchar(72) NOT NULL COMMENT '注册资本币种ID',
  `registry_currency_name` varchar(72) NOT NULL COMMENT '注册资本币种名称',
  `registry_unit_id` varchar(72) NOT NULL COMMENT '注册资本单位ID',
  `registry_unit_name` varchar(72) NOT NULL COMMENT '注册资本单位名称',
  `legal_person` varchar(200) NOT NULL COMMENT '法人代表/负责人姓名',
  `state` varchar(500) NOT NULL COMMENT '国别/地区',
  `region` varchar(500) NOT NULL COMMENT '行政区域代码',
  `declaration` varchar(200) NOT NULL COMMENT '信息申报责任人',
  `post_code` char(6) NOT NULL COMMENT '邮政编码',
  `address` varchar(100) default NULL COMMENT '通讯地址',
  `email` varchar(100) default NULL COMMENT '业务联系邮箱',
  `mobile_phone` varchar(15) default NULL COMMENT '业务联系手机号',
  `phone` varchar(15) default NULL COMMENT '代理机构电话',
  `fax` varchar(50) default NULL COMMENT '公司传真',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_agent_info_user_id` ON `agent_info`(`user_id`);

-- ----------------------------
-- Table structure for EXPERT_INFO
-- ----------------------------
create table if not exists `expert_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(200) NOT NULL COMMENT '用户ID',
  `user_name` varchar(200) NOT NULL COMMENT '用户姓名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '修改时间',
  `sex_id` varchar(2) default NULL COMMENT '性别ID',
  `sex_name` varchar(2) default NULL COMMENT '性别名称',
  `job_title` varchar(100) default NULL COMMENT '现任职务',
  `professional` varchar(4000) default NULL COMMENT '专业领域建树',
  `company` varchar(35) NOT NULL COMMENT '工作单位',
  `dept` varchar(100) default NULL COMMENT '工作部门',
  `email` varchar(100) default NULL COMMENT '邮箱',
  `expert_level_id` varchar(100) default NULL COMMENT '专家级别ID',
  `expert_level_name` varchar(100) default NULL COMMENT '专家级别名称',
  `group_expert_level_id` varchar(100) default NULL COMMENT '集团技术专家等级ID',
  `group_expert_level_name` varchar(100) default NULL COMMENT '集团技术专家等级名称',
  `expert_in` varchar(1000) default NULL COMMENT '专业领域建树',
  `expert_product` varchar(1000) default NULL COMMENT '所熟悉的产品',
  `other_certificate` varchar(1000) default NULL COMMENT '其它资质',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_expert_info_user_id` ON `expert_info`(`user_id`);

-- ----------------------------
-- Table structure for NOTICE_SUPPLIER_INFO
-- ----------------------------
create table if not exists `notice_supplier_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `project_id` varchar(35) NOT NULL COMMENT '项目ID',
  `package_id` varchar(35) NOT NULL COMMENT '包编号',
  `notice_id` varchar(35) NOT NULL COMMENT '通知书编号',
  `supplier_id` varchar(50) NOT NULL COMMENT '供应商ID',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_notice_supplier_info_project_id` ON `notice_supplier_info`(`project_id`);
CREATE INDEX `idx_notice_supplier_info_package_id` ON `notice_supplier_info`(`package_id`);
CREATE INDEX `idx_notice_supplier_info_notice_id` ON `notice_supplier_info`(`notice_id`);
CREATE INDEX `idx_notice_supplier_info_supplier_id` ON `notice_supplier_info`(`supplier_id`);

-- ----------------------------
-- Table structure for PROJECT_EXPERT_INFO
-- ----------------------------
create table if not exists `project_expert_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `expert_id` varchar(35) NOT NULL COMMENT '专家ID',
  `expert_name` varchar(200) NOT NULL COMMENT '专家名称',
  `project_id` varchar(35) NOT NULL COMMENT '项目ID',
  `project_name` varchar(180) NOT NULL COMMENT '项目名称',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_project_expert_info_project_id` ON `project_expert_info`(`project_id`);
CREATE INDEX `idx_project_expert_info_expert_id` ON `project_expert_info`(`expert_id`);

-- ----------------------------
-- Table structure for PROJECT_SUPPLIER_INFO
-- ----------------------------
create table if not exists `project_supplier_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `supplier_id` varchar(50) NOT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) NOT NULL COMMENT '供应商名称',
  `project_id` varchar(35) NOT NULL COMMENT '项目id',
  `project_name` varchar(180) NOT NULL COMMENT '项目名称',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_project_supplier_info_supplier_id` ON `project_supplier_info`(`supplier_id`);
CREATE INDEX `idx_project_supplier_info_project_id` ON `project_supplier_info`(`project_id`);

-- ----------------------------
-- Table structure for PROJECT_BASE_INFO
-- ----------------------------
create table if not exists `project_base_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `project_id` varchar(35) NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `project_code` varchar(35) NOT NULL COMMENT '项目编号',
  `purchase_style_id` varchar(2) NOT NULL COMMENT '项目类型ID（采购方式）',
  `purchase_style_name` varchar(50) NOT NULL COMMENT '项目类型名称（采购方式）',
  `purchase` varchar(200) default NULL COMMENT '采购方式显示字段',
  `status_id` varchar(35) NOT NULL COMMENT '项目状态ID',
  `status_name` varchar(35) NOT NULL COMMENT '项目状态名称',
  `is_zgys` char(1) default NULL COMMENT '是否资格预审',
  `is_open` varchar(2) default NULL COMMENT '是否公开',
  `stop_time` datetime NOT NULL COMMENT '应答截止时间',
  `is_zgys_end` char(1) NOT NULL COMMENT '是否资格预审结束',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_project_base_info_is_zgys` ON `project_base_info`(`is_zgys`);  
CREATE INDEX `idx_project_base_info_project_id` ON `project_base_info`(`project_id`);  

-- ----------------------------
-- Table structure for PROJECT_DETAIL_INFO
-- ----------------------------
create table if not exists `project_detail_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(35) NOT NULL COMMENT '用户ID',
  `project_id` varchar(35) NOT NULL COMMENT '项目ID',
  `project_name` varchar(180) NOT NULL COMMENT '项目名称',
  `project_code` varchar(35) NOT NULL COMMENT '项目名称',
  `agent_id` varchar(72) default NULL COMMENT '代理机构ID',
  `agent_name` varchar(180) default NULL COMMENT '代理机构名称',
  `staff_id` varchar(72) NOT NULL COMMENT '内部员工ID',
  `staff_name` varchar(72) NOT NULL COMMENT '内部员工名称',
  `is_zgys` char(2) NOT NULL COMMENT '是否资格预审项目',
  `purchase_style_id` varchar(2) NOT NULL COMMENT '项目类型ID（采购方式）',
  `purchase_style_name` varchar(32) NOT NULL COMMENT '项目类型名称（采购方式）',
  `project_time` datetime NOT NULL COMMENT '立项时间',
  `big_status_id` varchar(35) NOT NULL COMMENT '项目大状态ID',
  `big_status_name` varchar(100) NOT NULL COMMENT '项目大状态名称',
  `small_status_id` varchar(35) NOT NULL COMMENT '项目小状态ID',
  `small_status_name` varchar(100) NOT NULL COMMENT '项目小状态名称',
  `is_check` varchar(2) NOT NULL COMMENT '文档检查',
  `material_type_id` varchar(10) NOT NULL COMMENT '物资类型ID',
  `material_type_name` varchar(255) NOT NULL COMMENT '物资类型名称',
  `is_dele` varchar(2) NOT NULL COMMENT '是否委托',
  `is_fail` varchar(2) NOT NULL COMMENT '是否采购失败',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_project_detail_info_project_id` ON `project_detail_info`(`project_id`);  

-- ----------------------------
-- Table structure for PROJECT_NOTICE_INFO
-- ----------------------------
create table if not exists `project_notice_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `project_id` varchar(35) NOT NULL COMMENT '项目ID',
  `package_id` varchar(35) NOT NULL COMMENT '包编号',
  `notice_id` varchar(35) NOT NULL COMMENT '通知书编号',
  `notice_type` char(1) NOT NULL COMMENT '通知书类型',
  `title` varchar(500) NOT NULL COMMENT '通知书标题',
  `content` longtext NOT NULL COMMENT '通知书内容',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_project_notice_info_project_id` ON `project_notice_info`(`project_id`);  
CREATE INDEX `idx_project_notice_info_package_id` ON `project_notice_info`(`package_id`);  
CREATE INDEX `idx_project_notice_info_notice_id` ON `project_notice_info`(`notice_id`);  
CREATE INDEX `idx_project_notice_info_notice_type` ON `project_notice_info`(`notice_type`);  

-- ----------------------------
-- Table structure for PROJECT_PACKAGE_INFO
-- ----------------------------
create table if not exists `project_package_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `project_id` varchar(35) NOT NULL COMMENT '项目ID',
  `tender_id` varchar(35) DEFAULT NULL COMMENT '标编号',
  `package_id` varchar(35) NOT NULL COMMENT '包编号',
  `package_name` varchar(50) NOT NULL COMMENT '包名称',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_project_package_info_project_id` ON `project_package_info`(`project_id`);
CREATE INDEX `idx_project_package_info_tender_id` ON `project_package_info`(`tender_id`);
CREATE INDEX `idx_project_package_info_package_id` ON `project_package_info`(`package_id`);

-- ----------------------------
-- Table structure for PROJECT_TENDER_INFO
-- ----------------------------
create table if not exists `project_tender_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `project_id` varchar(35) NOT NULL COMMENT '项目ID',
  `tender_id` varchar(35) DEFAULT NULL COMMENT '标编号',
  `tender_name` varchar(50) DEFAULT NULL COMMENT '标名称',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_project_tender_info_project_id` ON `project_tender_info`(`project_id`);
CREATE INDEX `idx_project_tender_info_tender_id` ON `project_tender_info`(`tender_id`);

-- ----------------------------
-- Table structure for supplier_info
-- ----------------------------
CREATE TABLE IF NOT EXISTS `supplier_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_id` varchar(50) DEFAULT NULL COMMENT '供应商id',
  `supplier_name` varchar(200) DEFAULT NULL COMMENT '企业名称',
  `user_id` varchar(200) NOT NULL COMMENT '登录名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `audit_status` char(1) DEFAULT NULL,
  `user_status` char(1) DEFAULT NULL COMMENT '用户状态',
  `registry_address` varchar(600) DEFAULT NULL COMMENT '企业住所',
  `legal_person` varchar(200) DEFAULT NULL COMMENT '法人代表',
  `supplier_type_id` varchar(150) DEFAULT NULL COMMENT '供应商类别ID',
  `supplier_type_name` varchar(150) DEFAULT NULL COMMENT '供应商类别',
  `unified_code` varchar(200) DEFAULT NULL COMMENT '统一社会信用代码',
  `business_license_id` varchar(75) DEFAULT NULL COMMENT '营业执照注册号',
  `enterprise_type_id` varchar(75) DEFAULT NULL COMMENT '企业类型',
  `enterprise_type_name` varchar(75) DEFAULT NULL COMMENT '企业类型',
  `certificate_style_id` char(1) DEFAULT NULL COMMENT '证书样式ID',
  `certificate_style_name` varchar(50) DEFAULT NULL COMMENT '证书样式名称',
  `organization_id` varchar(50) DEFAULT NULL COMMENT '组织机构代码证号',
  `national_tax_id` varchar(30) DEFAULT NULL COMMENT '国税登记证号',
  `local_tax_id` varchar(75) DEFAULT NULL COMMENT '地税登记证号',
  `tax_address` varchar(600) DEFAULT NULL COMMENT '税务登记地址',
  `tax_flag` varchar(50) DEFAULT NULL COMMENT '纳税标识',
  `company_property_id` varchar(200) DEFAULT NULL COMMENT '公司性质',
  `company_property_name` varchar(200) DEFAULT NULL COMMENT '公司性质',
  `found_time` date DEFAULT NULL COMMENT '成立时间',
  `registry_fund` varchar(75) DEFAULT NULL COMMENT '注册资本',
  `registry_currency` varchar(75) DEFAULT NULL COMMENT '注册资本币种名称',
  `paiclup_capital` varchar(75) DEFAULT NULL COMMENT '实收资本',
  `paiclup_currency` varchar(75) DEFAULT NULL COMMENT '实收资本币种名称',
  `state_id` varchar(100) DEFAULT NULL COMMENT '地区（国）编码',
  `state_name` varchar(500) DEFAULT NULL COMMENT '所属地区（国）',
  `province_id` varchar(100) DEFAULT NULL COMMENT '省编码',
  `province` varchar(500) DEFAULT NULL COMMENT '所属地区（省）',
  `city_id` varchar(100) DEFAULT NULL COMMENT '市编码',
  `city` varchar(500) DEFAULT NULL COMMENT '所属地区（市）',
  `stock_status` char(1) DEFAULT NULL COMMENT '上市公司与否',
  `stock_plac` varchar(500) DEFAULT NULL COMMENT '上市地',
  `business_range` varchar(4000) DEFAULT NULL COMMENT '经营范围',
  `communication_address` varchar(300) DEFAULT NULL COMMENT '通讯地址',
  `contact_person_email` varchar(75) DEFAULT NULL COMMENT '业务联系邮箱',
  `contact_person_mobile` varchar(75) DEFAULT NULL COMMENT '业务联系手机号',
  `phone` varchar(75) DEFAULT NULL COMMENT '公司固定电话',
  `fax` varchar(75) DEFAULT NULL COMMENT '公司传真',
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_supplier_info_supplier_id` ON `supplier_info`(`supplier_id`);  
CREATE INDEX `idx_supplier_info_user_id` ON `supplier_info`(`user_id`);  

-- ----------------------------
-- Table structure for SUPPLIER_MESSAGE
-- ----------------------------
create table if not exists `supplier_message` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `message_id` varchar(35) NOT NULL COMMENT '消息ID',
  `supplier_id` varchar(35) NOT NULL COMMENT '供应商ID',
  `receive_time` datetime NOT NULL COMMENT '接收时间',
  `message_type` varchar(35) NOT NULL COMMENT '消息类型',
  `message` varchar(1000) NOT NULL COMMENT '消息内容',
  PRIMARY KEY  (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_supplier_message_supplier_id` ON `supplier_message`(`supplier_id`);  
CREATE INDEX `idx_supplier_message_message_type` ON `supplier_message`(`message_type`);  


-- ----------------------------
-- Table structure for `subscribe_info`
-- ----------------------------
-- DROP TABLE IF NOT EXISTS `subscribe_info`;
CREATE TABLE IF NOT EXISTS `subscribe_info` (
  `subscribe_id` varchar(32) NOT NULL COMMENT '主键',
  `subscribe_name` varchar(200) DEFAULT NULL COMMENT '订阅器名称',
  `subscribe_user` varchar(100) DEFAULT NULL COMMENT '所属用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `keywords` varchar(200) DEFAULT NULL COMMENT '订阅关键字',
  `publish_peroid_type` varchar(10) DEFAULT NULL COMMENT '发布周期类型',
  PRIMARY KEY (`subscribe_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_subscribe_info_subscribe_id` ON `subscribe_info`(`subscribe_id`);  
CREATE INDEX `idx_subscribe_info_subscribe_user` ON `subscribe_info`(`subscribe_user`);  

-- ----------------------------
-- Table structure for `subscribe_region`
-- ----------------------------
-- DROP TABLE IF EXISTS `subscribe_region`;
CREATE TABLE IF NOT EXISTS `subscribe_region` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subscribe_id` varchar(32) NOT NULL COMMENT '关联的订阅器id',
  `region_id` varchar(20) NOT NULL COMMENT '区域id',
  `region_name` varchar(200) NOT NULL COMMENT '区域名称',
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_subscribe_region_subscribe_id` ON `subscribe_region`(`subscribe_id`);  
CREATE INDEX `idx_subscribe_region_region_id` ON `subscribe_region`(`region_id`); 

-- ----------------------------
-- Table structure for `subscribe_catalog`
-- ----------------------------
-- DROP TABLE IF EXISTS `subscribe_catalog`;
CREATE TABLE IF NOT EXISTS `subscribe_catalog` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `subscribe_id` varchar(32) NOT NULL COMMENT '关联的订阅器id',
  `catalog_big_id` varchar(255) NOT NULL COMMENT '采购大类id',
  `catalog_big_name` varchar(200) NOT NULL COMMENT '采购大类名称',
  `catalog_middle_id` varchar(255) NOT NULL COMMENT '采购中类id',
  `catalog_middle_name` varchar(200) NOT NULL COMMENT '采购中类名称',
  `catalog_small_id` varchar(255) NOT NULL COMMENT '采购小类id',
  `catalog_small_name` varchar(200) NOT NULL COMMENT '采购小类名称',
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_subscribe_catalog_subscribe_id` ON `subscribe_catalog`(`subscribe_id`);  
CREATE INDEX `idx_subscribe_catalog_catalog_big_id` ON `subscribe_catalog`(`catalog_big_id`); 
CREATE INDEX `idx_subscribe_catalog_catalog_middle_id` ON `subscribe_catalog`(`catalog_middle_id`);  
CREATE INDEX `idx_subscribe_catalog_catalog_small_id` ON `subscribe_catalog`(`catalog_small_id`); 

-- ----------------------------
-- Table structure for `catalog_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `catalog_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `catalog_big_id` varchar(255) DEFAULT NULL COMMENT '大类ID',
  `catalog_big_name` varchar(255) DEFAULT NULL COMMENT '大类名称',
  `product_catalog_status1` varchar(255) DEFAULT NULL COMMENT '大类状态',
  `catalog_middle_id` varchar(255) DEFAULT NULL COMMENT '中类ID',
  `catalog_middle_name` varchar(255) DEFAULT NULL COMMENT '中类名称',
  `product_catalog_status2` varchar(255) DEFAULT NULL COMMENT '中类状态',
  `catalog_small_id` varchar(255) DEFAULT NULL COMMENT '小类ID',
  `catalog_small_name` varchar(255) DEFAULT NULL COMMENT '小类名称',
  `product_catalog_status3` varchar(255) DEFAULT NULL COMMENT '小类状态',
  `last_update_date` varchar(255) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_catalog_info_catalog_big_id` ON `catalog_info`(`catalog_big_id`); 
CREATE INDEX `idx_catalog_info_catalog_middle_id` ON `catalog_info`(`catalog_middle_id`);  
CREATE INDEX `idx_catalog_info_catalog_small_id` ON `catalog_info`(`catalog_small_id`); 

--DELETE FROM `catalog_info`;
---- ----------------------------
---- Records of catalog_info
---- ----------------------------
--INSERT INTO `catalog_info` VALUES ('2', '11', '核心网设备', '', '01', '电路域', '', '01', '移动端局(MSC)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('3', '11', '核心网设备', '', '01', '电路域', '', '02', '移动交换服务器(MSC-SERVER)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('4', '11', '核心网设备', '', '01', '电路域', '', '03', '移动交换服务器(MSC-SERVER)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('5', '11', '核心网设备', '', '01', '电路域', '', '04', '媒体网关(MGW)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('6', '11', '核心网设备', '', '01', '电路域', '', '05', '媒体网关(MGW)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('7', '11', '核心网设备', '', '01', '电路域', '', '06', '移动端局(MSC)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('8', '11', '核心网设备', '', '01', '电路域', '', '07', '归属位置寄存嚣(HLR)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('9', '11', '核心网设备', '', '01', '电路域', '', '08', '归属位置寄存嚣(HLR)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('10', '11', '核心网设备', '', '01', '电路域', '', '09', '信令转接点(STP)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('11', '11', '核心网设备', '', '01', '电路域', '', '10', '信令转接点(STP)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('12', '11', '核心网设备', '', '01', '电路域', '', '11', '信令网关设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('13', '11', '核心网设备', '', '01', '电路域', '', '12', '关口局软交换机(GMSC SERVER)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('14', '11', '核心网设备', '', '01', '电路域', '', '13', '关口局软交换机(GMSC SERVER)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('15', '11', '核心网设备', '', '01', '电路域', '', '14', '关口局媒体网关(GMGW)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('16', '11', '核心网设备', '', '01', '电路域', '', '15', '关口局媒体网关(GMGW)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('17', '11', '核心网设备', '', '02', '分组域', '', '01', 'GPRS分组控制单元(SGSN)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('18', '11', '核心网设备', '', '02', '分组域', '', '02', 'GPRS分组控制单元(SGSN)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('19', '11', '核心网设备', '', '02', '分组域', '', '03', 'GPRS业务支持节点(GGSN)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('20', '11', '核心网设备', '', '02', '分组域', '', '04', 'GPRS业务支持节点(GGSN)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('21', '11', '核心网设备', '', '02', '分组域', '', '05', '策略与计费规则功能单元(PCRF)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('22', '11', '核心网设备', '', '02', '分组域', '', '06', '策略与计费规则功能单元(PCRF)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('23', '11', '核心网设备', '', '02', '分组域', '', '07', '计费网关(CG)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('24', '11', '核心网设备', '', '02', '分组域', '', '08', '计费网关(CG)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('25', '11', '核心网设备', '', '03', '融合核心网设备', '', '01', '归属签约用户服务器(HSS)/归属位置寄存嚣(HLR)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('26', '11', '核心网设备', '', '03', '融合核心网设备', '', '02', '归属签约用户服务器(HSS)/归属位置寄存嚣(HLR)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('27', '11', '核心网设备', '', '03', '融合核心网设备', '', '03', '移动管理实体设备(MME)/GPRS分组控制单元(SGSN)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('28', '11', '核心网设备', '', '03', '融合核心网设备', '', '03', '移动管理实体设备(MME)/GPRS分组控制单元(SGSN)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('29', '11', '核心网设备', '', '03', '融合核心网设备', '', '04', '移动管理实体设备(MME)/GPRS分组控制单元(SGSN)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('30', '11', '核心网设备', '', '03', '融合核心网设备', '', '05', '系统架构演进网关(SAE GW)/GPRS业务支持节点(GGSN)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('31', '11', '核心网设备', '', '03', '融合核心网设备', '', '06', '系统架构演进网关(SAE GW)/GPRS业务支持节点(GGSN)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('32', '11', '核心网设备', '', '03', '融合核心网设备', '', '07', '融合策略与计费规则功能单元(融合PCRF)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('33', '11', '核心网设备', '', '03', '融合核心网设备', '', '08', '融合策略与计费规则功能单元(融合PCRF)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('34', '11', '核心网设备', '', '03', '融合核心网设备', '', '09', '融合计费网关(融合CG)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('35', '11', '核心网设备', '', '03', '融合核心网设备', '', '10', '融合计费网关(融合CG)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('36', '11', '核心网设备', '', '03', '融合核心网设备', '', '11', 'DIAMETER信令网设备(DRA)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('37', '11', '核心网设备', '', '03', '融合核心网设备', '', '12', 'DIAMETER信令网设备(DRA)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('38', '11', '核心网设备', '', '04', 'IMS域', '', '01', '出网网关控制功能(BGCF)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('39', '11', '核心网设备', '', '04', 'IMS域', '', '02', '出网网关控制功能(BGCF)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('40', '11', '核心网设备', '', '04', 'IMS域', '', '03', '电话号码影射/域名系统(ENUM/DNS)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('41', '11', '核心网设备', '', '04', 'IMS域', '', '03', '电话号码影射/域名系统(ENUM/DNS)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('42', '11', '核心网设备', '', '04', 'IMS域', '', '04', '电话号码影射/域名系统(ENUM/DNS)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('43', '11', '核心网设备', '', '04', 'IMS域', '', '05', '归属用户服务器/签约位置功能(IMS-HSS/SLF)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('44', '11', '核心网设备', '', '04', 'IMS域', '', '06', '归属用户服务器/签约位置功能(IMS-HSS/SLF)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('45', '11', '核心网设备', '', '04', 'IMS域', '', '07', '呼叫会话控制功能(CSCF)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('46', '11', '核心网设备', '', '04', 'IMS域', '', '07', '呼叫会话控制功能(CSCF)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('47', '11', '核心网设备', '', '04', 'IMS域', '', '08', '呼叫会话控制功能(CSCF)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('48', '11', '核心网设备', '', '04', 'IMS域', '', '09', '会话边界控制(SBC)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('49', '11', '核心网设备', '', '04', 'IMS域', '', '10', '会话边界控制(SBC)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('50', '11', '核心网设备', '', '04', 'IMS域', '', '11', '计费网关(IMS-CG)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('51', '11', '核心网设备', '', '04', 'IMS域', '', '12', '计费网关(IMS-CG)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('52', '11', '核心网设备', '', '04', 'IMS域', '', '13', '媒体网关(IMS-MGW)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('53', '11', '核心网设备', '', '04', 'IMS域', '', '14', '媒体网关(IMS-MGW)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('54', '11', '核心网设备', '', '04', 'IMS域', '', '15', '媒体网关控制功能(MGCF)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('55', '11', '核心网设备', '', '04', 'IMS域', '', '16', '媒体网关控制功能(MGCF)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('56', '11', '核心网设备', '', '04', 'IMS域', '', '17', '视频互通网关(VIG)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('57', '11', '核心网设备', '', '04', 'IMS域', '', '18', '视频互通网关(VIG)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('58', '11', '核心网设备', '', '04', 'IMS域', '', '19', 'TDM中继接入网关控制功能（AGCF）', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('59', '11', '核心网设备', '', '04', 'IMS域', '', '20', 'TDM 中继接入网关控制功能(AGCF)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('60', '11', '核心网设备', '', '04', 'IMS域', '', '21', '接入网关（TG）', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('61', '11', '核心网设备', '', '04', 'IMS域', '', '22', '接入网关（TG）配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('62', '11', '核心网设备', '', '04', 'IMS域', '', '23', 'VOLTE会话边界控制(VOLTE SBC)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('63', '11', '核心网设备', '', '04', 'IMS域', '', '24', 'VOLTE会话边界控制(VOLTE SBC)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('64', '11', '核心网设备', '', '04', 'IMS域', '', '25', '网间会话边界控制(I-SBC)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('65', '11', '核心网设备', '', '04', 'IMS域', '', '26', '网间会话边界控制(I-SBC)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('66', '11', '核心网设备', '', '04', 'IMS域', '', '27', '接入开通网关', '', '2015-02-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('67', '11', '核心网设备', '', '04', 'IMS域', '', '28', '接入开通网关配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('68', '11', '核心网设备', '', '05', '操作维护中心', '', '01', '操作维护中心设备(OMC)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('69', '11', '核心网设备', '', '05', '操作维护中心', '', '01', '操作维护中心设备(OMC)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('70', '11', '核心网设备', '', '05', '操作维护中心', '', '02', '操作维护中心设备(OMC)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('71', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '01', 'GSM宏基站(BTS)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('72', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '02', 'GSM宏基站(BTS)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('73', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '03', 'GSM分布式基站(BTS)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('74', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '04', 'GSM分布式基站(BTS)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('75', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '05', 'GSM基站控制器(BSC)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('76', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '06', 'GSM基站控制器(BSC)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('77', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '06', 'GSM基站控制器(BSC)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('78', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '07', 'G网无线网操作维护中心(OMC-R)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('79', '12', '无线及接入网设备', '', '01', 'GSM无线网接入设备', '', '08', 'G网无线网操作维护中心(OMC-R)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('80', '12', '无线及接入网设备', '', '02', 'TD-SCDMA无线网接入设备', '', '01', 'TD-SCDMA基站设备(NODE-B)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('81', '12', '无线及接入网设备', '', '02', 'TD-SCDMA无线网接入设备', '', '02', 'TD-SCDMA基站设备(NODE-B)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('82', '12', '无线及接入网设备', '', '02', 'TD-SCDMA无线网接入设备', '', '02', 'TD-SCDMA基站设备(NODE-B)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('83', '12', '无线及接入网设备', '', '02', 'TD-SCDMA无线网接入设备', '', '03', 'TD-SCDMA无线网络控制器(RNC)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('84', '12', '无线及接入网设备', '', '02', 'TD-SCDMA无线网接入设备', '', '03', 'TD-SCDMA无线网络控制器(RNC)', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('85', '12', '无线及接入网设备', '', '02', 'TD-SCDMA无线网接入设备', '', '04', 'TD-SCDMA无线网络控制器(RNC)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('86', '12', '无线及接入网设备', '', '02', 'TD-SCDMA无线网接入设备', '', '05', 'TD-SCDMA无线网操作维护中心(OMC-R)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('87', '12', '无线及接入网设备', '', '02', 'TD-SCDMA无线网接入设备', '', '06', 'TD-SCDMA无线网操作维护中心(OMC-R)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('88', '12', '无线及接入网设备', '', '03', 'TD-LTE无线网接入设备', '', '01', 'TD-LTE宏基站(ENODE B)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('89', '12', '无线及接入网设备', '', '03', 'TD-LTE无线网接入设备', '', '02', 'TD-LTE宏基站(ENODE B)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('90', '12', '无线及接入网设备', '', '03', 'TD-LTE无线网接入设备', '', '02', 'TD-LTE宏基站(ENODE B)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('91', '12', '无线及接入网设备', '', '03', 'TD-LTE无线网接入设备', '', '03', 'TD-LTE无线网操作维护中心(OMC-R)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('92', '12', '无线及接入网设备', '', '03', 'TD-LTE无线网接入设备', '', '04', 'TD-LTE无线网操作维护中心(OMC-R)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('93', '12', '无线及接入网设备', '', '03', 'TD-LTE无线网接入设备', '', '04', 'TD-LTE无线网操作维护中心(OMC-R)配件', '', '2015-01-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('94', '12', '无线及接入网设备', '', '03', 'TD-LTE无线网接入设备', '', '04', 'TD-LTE无线网操作维护中心(OMC-R)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('95', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '01', 'IP专用交换机(IP PBX)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('96', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '02', 'IP专用交换机(IP PBX)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('97', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '03', 'SIP协议网关(SIP GW)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('98', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '04', 'SIP协议网关(SIP GW)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('99', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '05', '接入网关(AG)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('100', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '06', '接入网关(AG)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('101', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '07', '企业融合网关设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('102', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '08', '企业融合网关设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('103', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '09', '综合接入设备( IAD )', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('104', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '09', '综合接入设备( IAD )', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('105', '12', '无线及接入网设备', '', '04', 'IMS接入设备', '', '10', '综合接入设备( IAD )配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('106', '12', '无线及接入网设备', '', '05', 'WLAN接入设备', '', '01', '接入点AP', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('107', '12', '无线及接入网设备', '', '05', 'WLAN接入设备', '', '01', '接入点AP', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('108', '12', '无线及接入网设备', '', '05', 'WLAN接入设备', '', '02', '接入点AP配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('109', '12', '无线及接入网设备', '', '05', 'WLAN接入设备', '', '03', '接入控制器AC', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('110', '12', '无线及接入网设备', '', '05', 'WLAN接入设备', '', '03', '接入控制器AC', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('111', '12', '无线及接入网设备', '', '05', 'WLAN接入设备', '', '04', '接入控制器AC配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('112', '12', '无线及接入网设备', '', '05', 'WLAN接入设备', '', '05', '其它WLAN接入设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('113', '13', '传输网设备', '', '01', '光传输设备', '', '01', 'PON', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('114', '13', '传输网设备', '', '01', '光传输设备', '', '01', 'PON', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('115', '13', '传输网设备', '', '01', '光传输设备', '', '02', 'PON设备配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('116', '13', '传输网设备', '', '01', '光传输设备', '', '02', 'PON设备配件', '', '2015-01-13 00:00:00');
--INSERT INTO `catalog_info` VALUES ('117', '13', '传输网设备', '', '01', '光传输设备', '', '02', 'PON设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('118', '13', '传输网设备', '', '01', '光传输设备', '', '05', 'PTN', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('119', '13', '传输网设备', '', '01', '光传输设备', '', '05', 'PTN', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('120', '13', '传输网设备', '', '01', '光传输设备', '', '06', 'PTN设备配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('121', '13', '传输网设备', '', '01', '光传输设备', '', '06', 'PTN设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('122', '13', '传输网设备', '', '01', '光传输设备', '', '07', 'SDH', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('123', '13', '传输网设备', '', '01', '光传输设备', '', '08', 'SDH设备配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('124', '13', '传输网设备', '', '01', '光传输设备', '', '08', 'SDH设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('125', '13', '传输网设备', '', '01', '光传输设备', '', '09', 'WDM/OTN', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('126', '13', '传输网设备', '', '01', '光传输设备', '', '09', 'WDM/OTN', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('127', '13', '传输网设备', '', '01', '光传输设备', '', '10', 'WDM/OTN设备配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('128', '13', '传输网设备', '', '01', '光传输设备', '', '10', 'WDM/OTN设备配件', '', '2015-01-13 00:00:00');
--INSERT INTO `catalog_info` VALUES ('129', '13', '传输网设备', '', '01', '光传输设备', '', '10', 'WDM/OTN设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('130', '13', '传输网设备', '', '01', '光传输设备', '', '11', '小型化接入PTN', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('131', '13', '传输网设备', '', '01', '光传输设备', '', '12', '小型化接入PTN配件', '', '2015-06-03 00:00:00');
--INSERT INTO `catalog_info` VALUES ('132', '13', '传输网设备', '', '01', '光传输设备', '', '12', '小型化接入PTN配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('133', '13', '传输网设备', '', '01', '光传输设备', '', '13', 'EPON', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('134', '13', '传输网设备', '', '01', '光传输设备', '', '14', 'GPON', '', '2016-02-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('135', '13', '传输网设备', '', '01', '光传输设备', '', '14', 'GPON', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('136', '13', '传输网设备', '', '02', '同步网设备', '', '01', '时间同步服务器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('137', '13', '传输网设备', '', '02', '同步网设备', '', '02', '时间同步网设备配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('138', '13', '传输网设备', '', '02', '同步网设备', '', '03', 'BITS', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('139', '13', '传输网设备', '', '02', '同步网设备', '', '04', '时钟同步网设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('140', '13', '传输网设备', '', '03', '微波传输设备', '', '01', 'FSO设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('141', '13', '传输网设备', '', '03', '微波传输设备', '', '02', 'IP数字微波设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('142', '13', '传输网设备', '', '03', '微波传输设备', '', '03', 'PDH微波', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('143', '13', '传输网设备', '', '03', '微波传输设备', '', '03', 'PDH微波', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('144', '13', '传输网设备', '', '03', '微波传输设备', '', '04', 'SDH微波', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('145', '13', '传输网设备', '', '03', '微波传输设备', '', '05', '微波天线', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('146', '13', '传输网设备', '', '03', '微波传输设备', '', '06', '微波设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('147', '13', '传输网设备', '', '04', '卫星传输设备', '', '01', '卫星转发器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('148', '13', '传输网设备', '', '04', '卫星传输设备', '', '02', '卫星天线', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('149', '13', '传输网设备', '', '04', '卫星传输设备', '', '03', '卫星射频设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('150', '13', '传输网设备', '', '04', '卫星传输设备', '', '04', '卫星基带设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('151', '13', '传输网设备', '', '04', '卫星传输设备', '', '05', '卫星通信设备配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('152', '13', '传输网设备', '', '05', '其他接入设备', '', '01', 'CPE', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('153', '14', '通信网络配套', '', '01', '天线', '', '01', 'GSM基站天线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('154', '14', '通信网络配套', '', '01', '天线', '', '01', 'GSM基站天线', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('155', '14', '通信网络配套', '', '01', '天线', '', '02', 'TDD基站天线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('156', '14', '通信网络配套', '', '01', '天线', '', '02', 'TDD基站天线', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('157', '14', '通信网络配套', '', '01', '天线', '', '02', 'TDD基站天线', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('158', '14', '通信网络配套', '', '01', '天线', '', '04', '多制式天线', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('159', '14', '通信网络配套', '', '01', '天线', '', '05', 'WLAN室外定向天线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('160', '14', '通信网络配套', '', '01', '天线', '', '06', '分布系统天线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('161', '14', '通信网络配套', '', '01', '天线', '', '06', '分布系统天线', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('162', '14', '通信网络配套', '', '01', '天线', '', '07', '基站用美化天线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('163', '14', '通信网络配套', '', '01', '天线', '', '07', '基站用美化天线', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('164', '14', '通信网络配套', '', '01', '天线', '', '09', '美化天线罩', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('165', '14', '通信网络配套', '', '01', '天线', '', '10', '室分及小区覆盖美化天线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('166', '14', '通信网络配套', '', '01', '天线', '', '10', '室分及小区覆盖美化天线', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('167', '14', '通信网络配套', '', '01', '天线', '', '11', '基站天线配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('168', '14', '通信网络配套', '', '02', '网络优化产品', '', '01', '数字直放站', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('169', '14', '通信网络配套', '', '02', '网络优化产品', '', '01', '数字直放站', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('170', '14', '通信网络配套', '', '02', '网络优化产品', '', '01', '数字直放站', '', '2016-04-13 00:00:00');
--INSERT INTO `catalog_info` VALUES ('171', '14', '通信网络配套', '', '02', '网络优化产品', '', '02', '模拟直放站', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('172', '14', '通信网络配套', '', '02', '网络优化产品', '', '03', '干线放大器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('173', '14', '通信网络配套', '', '02', '网络优化产品', '', '03', '干线放大器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('174', '14', '通信网络配套', '', '02', '网络优化产品', '', '04', '基站放大器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('175', '14', '通信网络配套', '', '02', '网络优化产品', '', '04', '基站放大器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('176', '14', '通信网络配套', '', '02', '网络优化产品', '', '05', '塔顶放大器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('177', '14', '通信网络配套', '', '02', '网络优化产品', '', '06', '功分器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('178', '14', '通信网络配套', '', '02', '网络优化产品', '', '06', '功分器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('179', '14', '通信网络配套', '', '02', '网络优化产品', '', '07', '合路器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('180', '14', '通信网络配套', '', '02', '网络优化产品', '', '07', '合路器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('181', '14', '通信网络配套', '', '02', '网络优化产品', '', '08', '耦合器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('182', '14', '通信网络配套', '', '02', '网络优化产品', '', '09', '衰减器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('183', '14', '通信网络配套', '', '02', '网络优化产品', '', '10', '3DB电桥', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('184', '14', '通信网络配套', '', '02', '网络优化产品', '', '10', '3DB电桥', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('185', '14', '通信网络配套', '', '02', '网络优化产品', '', '11', '负载', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('186', '14', '通信网络配套', '', '02', '网络优化产品', '', '11', '负载', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('187', '14', '通信网络配套', '', '02', '网络优化产品', '', '12', '基站用滤波器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('188', '14', '通信网络配套', '', '02', '网络优化产品', '', '13', '干扰器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('189', '14', '通信网络配套', '', '02', '网络优化产品', '', '14', '效果监控设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('190', '14', '通信网络配套', '', '02', '网络优化产品', '', '15', '微型基站', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('191', '14', '通信网络配套', '', '02', '网络优化产品', '', '15', '微型基站', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('192', '14', '通信网络配套', '', '02', '网络优化产品', '', '16', '小基站网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('193', '14', '通信网络配套', '', '03', '铁塔及桅杆', '', '01', '常规铁塔', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('194', '14', '通信网络配套', '', '03', '铁塔及桅杆', '', '05', '美化塔', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('195', '14', '通信网络配套', '', '03', '铁塔及桅杆', '', '06', '通用塔桅杆', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('196', '14', '通信网络配套', '', '03', '铁塔及桅杆', '', '07', '塔房一体基站', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('197', '14', '通信网络配套', '', '03', '铁塔及桅杆', '', '10', '铁塔及桅杆附属材料', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('198', '14', '通信网络配套', '', '04', '机房及附属材料', '', '01', '活动机房', '', '2015-12-01 00:00:00');
--INSERT INTO `catalog_info` VALUES ('199', '14', '通信网络配套', '', '04', '机房及附属材料', '', '01', '活动机房', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('200', '14', '通信网络配套', '', '04', '机房及附属材料', '', '02', '美化机房', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('201', '14', '通信网络配套', '', '04', '机房及附属材料', '', '03', '机柜附属材料', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('202', '14', '通信网络配套', '', '04', '机房及附属材料', '', '04', '室外标准化机柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('203', '14', '通信网络配套', '', '04', '机房及附属材料', '', '05', '室外一体化机柜', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('204', '14', '通信网络配套', '', '04', '机房及附属材料', '', '07', '网络综合机柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('205', '14', '通信网络配套', '', '04', '机房及附属材料', '', '07', '网络综合机柜', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('206', '14', '通信网络配套', '', '04', '机房及附属材料', '', '08', '活动机房配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('207', '14', '通信网络配套', '', '04', '机房及附属材料', '', '09', '网络综合机柜配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('208', '14', '通信网络配套', '', '05', '通信管材', '', '01', '钢管', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('209', '14', '通信网络配套', '', '05', '通信管材', '', '01', '钢管', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('210', '14', '通信网络配套', '', '05', '通信管材', '', '02', '水泥管', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('211', '14', '通信网络配套', '', '05', '通信管材', '', '03', '塑料管', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('212', '14', '通信网络配套', '', '05', '通信管材', '', '03', '塑料管', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('213', '14', '通信网络配套', '', '05', '通信管材', '', '04', '通信管道', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('214', '14', '通信网络配套', '', '05', '通信管材', '', '05', '波纹管购置', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('215', '14', '通信网络配套', '', '05', '通信管材', '', '06', '梅花管购置', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('216', '14', '通信网络配套', '', '05', '通信管材', '', '07', '顶管购置', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('217', '14', '通信网络配套', '', '05', '通信管材', '', '99', '通信管材辅件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('218', '14', '通信网络配套', '', '06', '通信杆', '', '01', '钢管杆', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('219', '14', '通信网络配套', '', '06', '通信杆', '', '02', '水泥杆', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('220', '14', '通信网络配套', '', '06', '通信杆', '', '03', '油木杆', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('221', '14', '通信网络配套', '', '07', '布线产品', '', '01', '走线槽', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('222', '14', '通信网络配套', '', '07', '布线产品', '', '01', '走线槽', '', '2016-01-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('223', '14', '通信网络配套', '', '07', '布线产品', '', '01', '走线槽', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('224', '14', '通信网络配套', '', '07', '布线产品', '', '02', '走线架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('225', '14', '通信网络配套', '', '07', '布线产品', '', '02', '走线架', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('226', '14', '通信网络配套', '', '07', '布线产品', '', '99', '布线产品辅件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('227', '14', '通信网络配套', '', '08', '加固套件', '', '01', '加固底座', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('228', '14', '通信网络配套', '', '08', '加固套件', '', '02', '加固槽钢横梁', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('229', '14', '通信网络配套', '', '09', '传输线路辅件', '', '01', '接地类辅件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('230', '14', '通信网络配套', '', '09', '传输线路辅件', '', '02', '传输线路标识', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('231', '14', '通信网络配套', '', '09', '传输线路辅件', '', '02', '传输线路标识', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('232', '14', '通信网络配套', '', '09', '传输线路辅件', '', '03', '支撑物', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('233', '14', '通信网络配套', '', '09', '传输线路辅件', '', '03', '支撑物', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('234', '14', '通信网络配套', '', '09', '传输线路辅件', '', '04', '抱箍类', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('235', '14', '通信网络配套', '', '09', '传输线路辅件', '', '04', '抱箍类', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('236', '14', '通信网络配套', '', '09', '传输线路辅件', '', '05', '线担类', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('237', '14', '通信网络配套', '', '09', '传输线路辅件', '', '06', '夹板', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('238', '14', '通信网络配套', '', '09', '传输线路辅件', '', '06', '夹板', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('239', '14', '通信网络配套', '', '09', '传输线路辅件', '', '07', '底盘类', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('240', '14', '通信网络配套', '', '09', '传输线路辅件', '', '08', '地锚类', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('241', '14', '通信网络配套', '', '09', '传输线路辅件', '', '09', '电缆挂钩', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('242', '14', '通信网络配套', '', '09', '传输线路辅件', '', '10', '穿钉', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('243', '14', '通信网络配套', '', '09', '传输线路辅件', '', '10', '穿钉', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('244', '14', '通信网络配套', '', '09', '传输线路辅件', '', '11', '光缆预留架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('245', '14', '通信网络配套', '', '09', '传输线路辅件', '', '12', '拉线隔电子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('246', '14', '通信网络配套', '', '09', '传输线路辅件', '', '13', '电力保护套', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('247', '14', '通信网络配套', '', '09', '传输线路辅件', '', '14', '拉线保护管', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('248', '14', '通信网络配套', '', '09', '传输线路辅件', '', '15', '光缆保护管', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('249', '14', '通信网络配套', '', '09', '传输线路辅件', '', '16', '拉线衬环', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('250', '14', '通信网络配套', '', '09', '传输线路辅件', '', '17', 'H杆腰梁', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('251', '14', '通信网络配套', '', '09', '传输线路辅件', '', '18', '茶托拉板', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('252', '14', '通信网络配套', '', '09', '传输线路辅件', '', '19', '钢绞线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('253', '14', '通信网络配套', '', '09', '传输线路辅件', '', '20', '镀锌铁线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('254', '14', '通信网络配套', '', '09', '传输线路辅件', '', '21', '螺栓', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('255', '14', '通信网络配套', '', '09', '传输线路辅件', '', '22', ' ', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('256', '14', '通信网络配套', '', '09', '传输线路辅件', '', '23', 'U型钢卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('257', '14', '通信网络配套', '', '09', '传输线路辅件', '', '24', '电缆卡子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('258', '14', '通信网络配套', '', '09', '传输线路辅件', '', '25', '卡子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('259', '14', '通信网络配套', '', '09', '传输线路辅件', '', '26', '卡钉', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('260', '14', '通信网络配套', '', '09', '传输线路辅件', '', '27', '钢板', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('261', '14', '通信网络配套', '', '09', '传输线路辅件', '', '28', '托架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('262', '14', '通信网络配套', '', '09', '传输线路辅件', '', '29', '升高支架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('263', '14', '通信网络配套', '', '09', '传输线路辅件', '', '30', '升高器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('264', '14', '通信网络配套', '', '09', '传输线路辅件', '', '31', '支架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('265', '14', '通信网络配套', '', '09', '传输线路辅件', '', '32', '电缆托架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('266', '14', '通信网络配套', '', '09', '传输线路辅件', '', '33', '电缆托板', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('267', '14', '通信网络配套', '', '09', '传输线路辅件', '', '34', '积水灌', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('268', '14', '通信网络配套', '', '09', '传输线路辅件', '', '35', '拉力环', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('269', '14', '通信网络配套', '', '09', '传输线路辅件', '', '36', '圆钢', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('270', '14', '通信网络配套', '', '09', '传输线路辅件', '', '37', '井圈井盖', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('271', '14', '通信网络配套', '', '09', '传输线路辅件', '', '37', '井圈井盖', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('272', '14', '通信网络配套', '', '10', '传输配套设备', '', '01', '光纤配线架(ODF)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('273', '14', '通信网络配套', '', '10', '传输配套设备', '', '01', '光纤配线架(ODF)', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('274', '14', '通信网络配套', '', '10', '传输配套设备', '', '02', '光纤配线架(ODF)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('275', '14', '通信网络配套', '', '10', '传输配套设备', '', '02', '光纤配线架(ODF)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('276', '14', '通信网络配套', '', '10', '传输配套设备', '', '03', '数字配线架(DDF)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('277', '14', '通信网络配套', '', '10', '传输配套设备', '', '04', '数字配线架(DDF)配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('278', '14', '通信网络配套', '', '10', '传输配套设备', '', '05', '光缆交接箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('279', '14', '通信网络配套', '', '10', '传输配套设备', '', '05', '光缆交接箱', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('280', '14', '通信网络配套', '', '10', '传输配套设备', '', '06', '综合业务接入箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('281', '14', '通信网络配套', '', '10', '传输配套设备', '', '06', '综合业务接入箱', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('282', '14', '通信网络配套', '', '10', '传输配套设备', '', '07', '多媒体箱', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('283', '14', '通信网络配套', '', '10', '传输配套设备', '', '08', '分线箱和分线盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('284', '14', '通信网络配套', '', '10', '传输配套设备', '', '08', '分线箱和分线盒', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('285', '14', '通信网络配套', '', '10', '传输配套设备', '', '09', '光缆接头盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('286', '14', '通信网络配套', '', '10', '传输配套设备', '', '09', '光缆接头盒', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('287', '14', '通信网络配套', '', '10', '传输配套设备', '', '10', '光缆终端盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('288', '14', '通信网络配套', '', '10', '传输配套设备', '', '10', '光缆终端盒', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('289', '14', '通信网络配套', '', '10', '传输配套设备', '', '11', '皮线光缆接续保护盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('290', '14', '通信网络配套', '', '10', '传输配套设备', '', '12', '光分路器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('291', '14', '通信网络配套', '', '10', '传输配套设备', '', '12', '光分路器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('292', '14', '通信网络配套', '', '10', '传输配套设备', '', '13', '光中继器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('293', '14', '通信网络配套', '', '10', '传输配套设备', '', '14', '光纤连接器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('294', '14', '通信网络配套', '', '10', '传输配套设备', '', '15', '光纤连接器配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('295', '14', '通信网络配套', '', '10', '传输配套设备', '', '16', '自动倒换设备', '', '2015-12-03 00:00:00');
--INSERT INTO `catalog_info` VALUES ('296', '14', '通信网络配套', '', '10', '传输配套设备', '', '16', '自动倒换设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('297', '14', '通信网络配套', '', '10', '传输配套设备', '', '17', '电话配线模块', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('298', '14', '通信网络配套', '', '10', '传输配套设备', '', '18', '壁挂式网络箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('299', '14', '通信网络配套', '', '10', '传输配套设备', '', '19', '基站用综合柜', '', '2016-01-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('300', '14', '通信网络配套', '', '10', '传输配套设备', '', '20', '数据配线模块', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('301', '14', '通信网络配套', '', '10', '传输配套设备', '', '21', '总配线架(MDF)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('302', '14', '通信网络配套', '', '10', '传输配套设备', '', '22', '协议转换器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('303', '14', '通信网络配套', '', '10', '传输配套设备', '', '22', '协议转换器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('304', '14', '通信网络配套', '', '10', '传输配套设备', '', '23', '协议转换器配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('305', '14', '通信网络配套', '', '10', '传输配套设备', '', '24', '光纤收发器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('306', '14', '通信网络配套', '', '10', '传输配套设备', '', '24', '光纤收发器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('307', '14', '通信网络配套', '', '10', '传输配套设备', '', '25', '光纤收发器配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('308', '14', '通信网络配套', '', '10', '传输配套设备', '', '26', '光调制解调器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('309', '14', '通信网络配套', '', '10', '传输配套设备', '', '26', '光调制解调器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('310', '14', '通信网络配套', '', '10', '传输配套设备', '', '27', '光调制解调器配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('311', '14', '通信网络配套', '', '10', '传输配套设备', '', '28', 'MSAP多业务接入节点', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('312', '14', '通信网络配套', '', '10', '传输配套设备', '', '28', 'MSAP多业务接入节点', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('313', '14', '通信网络配套', '', '10', '传输配套设备', '', '29', 'MSAP多业务接入节点配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('314', '14', '通信网络配套', '', '10', '传输配套设备', '', '30', '其它接入设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('315', '14', '通信网络配套', '', '10', '传输配套设备', '', '31', '光缆接头盒组配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('316', '14', '通信网络配套', '', '10', '传输配套设备', '', '32', '数据链路采集设备', '', '2015-02-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('317', '14', '通信网络配套', '', '10', '传输配套设备', '', '32', '数据链路采集设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('318', '14', '通信网络配套', '', '10', '传输配套设备', '', '33', '基站用综合柜配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('319', '14', '通信网络配套', '', '10', '传输配套设备', '', '34', '光缆交接箱配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('320', '14', '通信网络配套', '', '11', '配线架/柜', '', '01', '室外一体化箱', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('321', '14', '通信网络配套', '', '11', '配线架/柜', '', '02', '光纤分配箱', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('322', '14', '通信网络配套', '', '11', '配线架/柜', '', '03', '光分路箱', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('323', '14', '通信网络配套', '', '99', '其他有线网络接入配套', '', '01', '冷接子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('324', '14', '通信网络配套', '', '99', '其他有线网络接入配套', '', '02', '阻抗转换器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('325', '14', '通信网络配套', '', '99', '其他有线网络接入配套', '', '03', '交流电源线隔离套管', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('326', '15', '业务网', '', '01', '基础能力类业务系统', '', '01', 'WAP网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('327', '15', '业务网', '', '01', '基础能力类业务系统', '', '02', '彩信网关', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('328', '15', '业务网', '', '01', '基础能力类业务系统', '', '03', '彩信中心', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('329', '15', '业务网', '', '01', '基础能力类业务系统', '', '04', '梦网短信网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('330', '15', '业务网', '', '01', '基础能力类业务系统', '', '05', '短信中心', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('331', '15', '业务网', '', '01', '基础能力类业务系统', '', '06', '互联互通短信网关', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('332', '15', '业务网', '', '01', '基础能力类业务系统', '', '07', '话音业务系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('333', '15', '业务网', '', '01', '基础能力类业务系统', '', '08', '小区短信', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('334', '15', '业务网', '', '01', '基础能力类业务系统', '', '09', '彩信互联网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('335', '15', '业务网', '', '01', '基础能力类业务系统', '', '10', '行业网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('336', '15', '业务网', '', '01', '基础能力类业务系统', '', '11', '综合计入网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('337', '15', '业务网', '', '01', '基础能力类业务系统', '', '12', 'ENUM DNS', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('338', '15', '业务网', '', '01', '基础能力类业务系统', '', '13', '统一DPI设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('339', '15', '业务网', '', '01', '基础能力类业务系统', '', '99', '其它基础能力类业务系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('340', '15', '业务网', '', '02', '增值业务系统', '', '01', '12580综合信息服务门户', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('341', '15', '业务网', '', '02', '增值业务系统', '', '02', '139邮箱系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('342', '15', '业务网', '', '02', '增值业务系统', '', '03', '2G彩铃业务平台', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('343', '15', '业务网', '', '02', '增值业务系统', '', '04', 'OTA平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('344', '15', '业务网', '', '02', '增值业务系统', '', '05', '大众邮件代理网关系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('345', '15', '业务网', '', '02', '增值业务系统', '', '06', '短信增值业务系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('346', '15', '业务网', '', '02', '增值业务系统', '', '06', '短信增值业务系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('347', '15', '业务网', '', '02', '增值业务系统', '', '08', '号簿管家平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('348', '15', '业务网', '', '02', '增值业务系统', '', '09', '快讯业务平台(DCD)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('349', '15', '业务网', '', '02', '增值业务系统', '', '10', '垃圾短信实时拦截系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('350', '15', '业务网', '', '02', '增值业务系统', '', '10', '垃圾短信实时拦截系统', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('351', '15', '业务网', '', '02', '增值业务系统', '', '11', '来电提醒系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('352', '15', '业务网', '', '02', '增值业务系统', '', '12', '物联网平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('353', '15', '业务网', '', '02', '增值业务系统', '', '13', '智能网平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('354', '15', '业务网', '', '02', '增值业务系统', '', '13', '智能网平台', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('355', '15', '业务网', '', '02', '增值业务系统', '', '99', '其他增值业务系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('356', '15', '业务网', '', '02', '增值业务系统', '', '99', '其他增值业务系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('357', '15', '业务网', '', '03', '互联网业务系统', '', '01', 'CMNET网间流量控制系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('358', '15', '业务网', '', '03', '互联网业务系统', '', '02', 'P2P WEBCACHE', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('359', '15', '业务网', '', '03', '互联网业务系统', '', '03', 'WEBCACHE', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('360', '15', '业务网', '', '03', '互联网业务系统', '', '04', 'WEB平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('361', '15', '业务网', '', '03', '互联网业务系统', '', '05', 'WEB网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('362', '15', '业务网', '', '03', '互联网业务系统', '', '06', '互联网CACHE系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('363', '15', '业务网', '', '03', '互联网业务系统', '', '07', '互联网服务平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('364', '15', '业务网', '', '03', '互联网业务系统', '', '08', '内容分发(CDN)系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('365', '15', '业务网', '', '03', '互联网业务系统', '', '09', 'WLAN/有线宽带认证中心系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('366', '15', '业务网', '', '03', '互联网业务系统', '', '10', '省内数据业务分析及流量控制系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('367', '15', '业务网', '', '03', '互联网业务系统', '', '11', '数据业务管理平台(DSMP)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('368', '15', '业务网', '', '03', '互联网业务系统', '', '12', '不良信息监测系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('369', '15', '业务网', '', '03', '互联网业务系统', '', '13', '用户日志留存/查询/上报系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('370', '15', '业务网', '', '03', '互联网业务系统', '', '99', '其它互联网业务系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('371', '15', '业务网', '', '03', '互联网业务系统', '', '99', '其它互联网业务系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('372', '15', '业务网', '', '04', '集团客户类业务系统', '', '01', 'ADC业务平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('373', '15', '业务网', '', '04', '集团客户类业务系统', '', '02', 'MAS管理平台及MAS设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('374', '15', '业务网', '', '04', '集团客户类业务系统', '', '03', '行业应用移动终端监控平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('375', '15', '业务网', '', '04', '集团客户类业务系统', '', '04', '企业邮件推送业务代理网关', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('376', '15', '业务网', '', '04', '集团客户类业务系统', '', '05', '企业邮件推送业务平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('377', '15', '业务网', '', '04', '集团客户类业务系统', '', '06', '省级集团客户行业应用网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('378', '15', '业务网', '', '04', '集团客户类业务系统', '', '07', '信息点播系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('379', '15', '业务网', '', '04', '集团客户类业务系统', '', '08', '总部集团客户行业应用网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('380', '15', '业务网', '', '04', '集团客户类业务系统', '', '09', '总部集团客户行业应用网关容灾备份', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('381', '15', '业务网', '', '04', '集团客户类业务系统', '', '99', '其他集团客户类业务系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('382', '15', '业务网', '', '05', 'IMS网络业务平台', '', '01', 'MMTEL业务平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('383', '15', '业务网', '', '05', 'IMS网络业务平台', '', '02', '点击拨号平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('384', '15', '业务网', '', '05', 'IMS网络业务平台', '', '03', '统一CENTREX业务平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('385', '15', '业务网', '', '05', 'IMS网络业务平台', '', '04', '多媒体彩铃业务平台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('386', '15', '业务网', '', '05', 'IMS网络业务平台', '', '05', 'VoLTE多媒体电话业务平台（VoLTE AS）', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('387', '15', '业务网', '', '05', 'IMS网络业务平台', '', '06', '业务设置代理网关', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('388', '15', '业务网', '', '05', 'IMS网络业务平台', '', '07', 'IP短信网关（IP-SM-GW）', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('389', '16', 'IT硬件产品', '', '01', '服务器', '', '01', '小型机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('390', '16', 'IT硬件产品', '', '01', '服务器', '', '01', '小型机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('391', '16', 'IT硬件产品', '', '01', '服务器', '', '03', '通用PC服务器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('392', '16', 'IT硬件产品', '', '01', '服务器', '', '03', '通用PC服务器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('393', '16', 'IT硬件产品', '', '01', '服务器', '', '05', '定制化服务器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('394', '16', 'IT硬件产品', '', '01', '服务器', '', '07', '多电脑切换器(KVM)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('395', '16', 'IT硬件产品', '', '01', '服务器', '', '98', '其他服务器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('396', '16', 'IT硬件产品', '', '01', '服务器', '', '99', '其他服务器配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('397', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '01', '台式计算机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('398', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '01', '台式计算机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('399', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '01', '台式计算机', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('400', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '03', '笔记本计算机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('401', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '03', '笔记本计算机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('402', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '05', '工作站', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('403', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '07', '瘦客户机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('404', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '07', '瘦客户机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('405', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '98', '其他客户端', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('406', '16', 'IT硬件产品', '', '02', '客户端(PC)', '', '99', '客户端(PC)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('407', '16', 'IT硬件产品', '', '03', '存储设备', '', '01', '磁盘阵列', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('408', '16', 'IT硬件产品', '', '03', '存储设备', '', '01', '磁盘阵列', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('409', '16', 'IT硬件产品', '', '03', '存储设备', '', '02', '磁盘阵列配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('410', '16', 'IT硬件产品', '', '03', '存储设备', '', '03', 'NAS存储', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('411', '16', 'IT硬件产品', '', '03', '存储设备', '', '04', 'NAS存储配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('412', '16', 'IT硬件产品', '', '03', '存储设备', '', '05', '分布式存储', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('413', '16', 'IT硬件产品', '', '03', '存储设备', '', '06', '分布式存储配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('414', '16', 'IT硬件产品', '', '03', '存储设备', '', '07', '虚拟磁带库', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('415', '16', 'IT硬件产品', '', '03', '存储设备', '', '08', '虚拟磁带库配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('416', '16', 'IT硬件产品', '', '03', '存储设备', '', '09', '磁带库', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('417', '16', 'IT硬件产品', '', '03', '存储设备', '', '10', '磁带库配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('418', '16', 'IT硬件产品', '', '03', '存储设备', '', '11', '光纤通道交换机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('419', '16', 'IT硬件产品', '', '03', '存储设备', '', '11', '光纤通道交换机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('420', '16', 'IT硬件产品', '', '03', '存储设备', '', '12', '光纤通道交换机配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('421', '16', 'IT硬件产品', '', '03', '存储设备', '', '98', '其它存储设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('422', '16', 'IT硬件产品', '', '03', '存储设备', '', '99', '其它存储设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('423', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '01', '以太网交换机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('424', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '01', '以太网交换机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('425', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '02', '以太网交换机配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('426', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '03', '数据中心交换机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('427', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '03', '数据中心交换机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('428', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '04', '数据中心交换机配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('429', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '05', '路由器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('430', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '05', '路由器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('431', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '06', '路由器配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('432', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '07', '宽带远程接入服务器(BRAS)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('433', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '08', '宽带远程接入服务器(BRAS)配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('434', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '09', '负载均衡器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('435', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '09', '负载均衡器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('436', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '10', '负载均衡器配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('437', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '11', '隔离设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('438', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '12', '企业客户接入设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('439', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '12', '企业客户接入设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('440', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '98', '其他网络设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('441', '16', 'IT硬件产品', '', '04', 'IT网络设备', '', '99', '其他网络设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('442', '16', 'IT硬件产品', '', '05', '安全产品', '', '01', '防火墙', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('443', '16', 'IT硬件产品', '', '05', '安全产品', '', '02', '防火墙配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('444', '16', 'IT硬件产品', '', '05', '安全产品', '', '03', '入侵检测设备(IDS)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('445', '16', 'IT硬件产品', '', '05', '安全产品', '', '05', '入侵防御设备(IPS)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('446', '16', 'IT硬件产品', '', '05', '安全产品', '', '07', '安全漏洞扫描器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('447', '16', 'IT硬件产品', '', '05', '安全产品', '', '09', 'VPN网关', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('448', '16', 'IT硬件产品', '', '05', '安全产品', '', '10', 'VPN网关配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('449', '16', 'IT硬件产品', '', '05', '安全产品', '', '11', '垃圾邮件过滤', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('450', '16', 'IT硬件产品', '', '05', '安全产品', '', '13', '综合安全网关(UTM)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('451', '16', 'IT硬件产品', '', '05', '安全产品', '', '15', '防篡改产品', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('452', '16', 'IT硬件产品', '', '05', '安全产品', '', '17', '安全扫描产品', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('453', '16', 'IT硬件产品', '', '05', '安全产品', '', '19', '安全审计产品', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('454', '16', 'IT硬件产品', '', '05', '安全产品', '', '21', '抗DOS攻击设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('455', '16', 'IT硬件产品', '', '05', '安全产品', '', '22', '安全接入产品', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('456', '16', 'IT硬件产品', '', '05', '安全产品', '', '98', '其他安全产品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('457', '16', 'IT硬件产品', '', '05', '安全产品', '', '98', '其他安全产品', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('458', '16', 'IT硬件产品', '', '05', '安全产品', '', '99', '其他安全产品配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('459', '16', 'IT硬件产品', '', '06', 'IT系统配套设备', '', '03', '串口管理器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('460', '16', 'IT硬件产品', '', '06', 'IT系统配套设备', '', '04', '串口管理器配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('461', '16', 'IT硬件产品', '', '06', 'IT系统配套设备', '', '05', 'LCD一体机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('462', '16', 'IT硬件产品', '', '06', 'IT系统配套设备', '', '06', 'LCD一体机配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('463', '16', 'IT硬件产品', '', '06', 'IT系统配套设备', '', '98', '其他配套设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('464', '16', 'IT硬件产品', '', '06', 'IT系统配套设备', '', '99', '其他配套设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('465', '16', 'IT硬件产品', '', '07', '计算机配件', '', '01', '计算机配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('466', '17', '软件产品', '', '01', '操作系统', '', '01', 'LINUX', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('467', '17', '软件产品', '', '01', '操作系统', '', '02', 'UNIX', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('468', '17', '软件产品', '', '01', '操作系统', '', '03', 'WINDOWS', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('469', '17', '软件产品', '', '01', '操作系统', '', '99', '其他操作系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('470', '17', '软件产品', '', '02', '虚拟化及云平台软件', '', '01', '虚拟化软件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('471', '17', '软件产品', '', '02', '虚拟化及云平台软件', '', '01', '虚拟化软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('472', '17', '软件产品', '', '02', '虚拟化及云平台软件', '', '02', '桌面云软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('473', '17', '软件产品', '', '02', '虚拟化及云平台软件', '', '99', '其他云平台软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('474', '17', '软件产品', '', '03', '数据库', '', '01', '关系型数据库', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('475', '17', '软件产品', '', '03', '数据库', '', '01', '关系型数据库', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('476', '17', '软件产品', '', '03', '数据库', '', '02', '非关系型数据库', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('477', '17', '软件产品', '', '03', '数据库', '', '03', '数据仓库', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('478', '17', '软件产品', '', '03', '数据库', '', '99', '其他数据库', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('479', '17', '软件产品', '', '04', '中间件软件', '', '01', '基础中间件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('480', '17', '软件产品', '', '04', '中间件软件', '', '03', '业务中间件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('481', '17', '软件产品', '', '04', '中间件软件', '', '99', '其他中间件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('482', '17', '软件产品', '', '06', '安全软件', '', '01', '系统安全软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('483', '17', '软件产品', '', '06', '安全软件', '', '02', '数据安全软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('484', '17', '软件产品', '', '06', '安全软件', '', '03', '网络安全软件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('485', '17', '软件产品', '', '06', '安全软件', '', '03', '网络安全软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('486', '17', '软件产品', '', '06', '安全软件', '', '99', '其他安全软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('487', '17', '软件产品', '', '08', '应用软件', '', '01', '网络支撑软件(OSS)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('488', '17', '软件产品', '', '08', '应用软件', '', '01', '网络支撑软件(OSS)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('489', '17', '软件产品', '', '08', '应用软件', '', '02', '业务支撑软件(BSS)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('490', '17', '软件产品', '', '08', '应用软件', '', '02', '业务支撑软件(BSS)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('491', '17', '软件产品', '', '08', '应用软件', '', '03', '信息化支撑软件(MSS)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('492', '17', '软件产品', '', '08', '应用软件', '', '03', '信息化支撑软件(MSS)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('493', '17', '软件产品', '', '08', '应用软件', '', '04', '办公软件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('494', '17', '软件产品', '', '08', '应用软件', '', '04', '办公软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('495', '17', '软件产品', '', '08', '应用软件', '', '05', '设计开发软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('496', '17', '软件产品', '', '08', '应用软件', '', '06', '行业应用软件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('497', '17', '软件产品', '', '08', '应用软件', '', '06', '行业应用软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('498', '17', '软件产品', '', '08', '应用软件', '', '99', '其他应用软件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('499', '18', '线缆及配件', '', '01', '电力电缆', '', '01', '建筑用电力电缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('500', '18', '线缆及配件', '', '01', '电力电缆', '', '01', '建筑用电力电缆', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('501', '18', '线缆及配件', '', '01', '电力电缆', '', '02', '通信用电力电缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('502', '18', '线缆及配件', '', '01', '电力电缆', '', '02', '通信用电力电缆', '', '2015-01-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('503', '18', '线缆及配件', '', '01', '电力电缆', '', '02', '通信用电力电缆', '', '2015-02-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('504', '18', '线缆及配件', '', '01', '电力电缆', '', '02', '通信用电力电缆', '', '2015-03-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('505', '18', '线缆及配件', '', '01', '电力电缆', '', '03', '电力电缆连接头', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('506', '18', '线缆及配件', '', '02', '通信电缆', '', '02', '室内通信电缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('507', '18', '线缆及配件', '', '02', '通信电缆', '', '03', '电话线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('508', '18', '线缆及配件', '', '02', '通信电缆', '', '03', '电话线', '', '2015-05-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('509', '18', '线缆及配件', '', '02', '通信电缆', '', '04', '通信电缆接头', '', '2015-05-22 00:00:00');
--INSERT INTO `catalog_info` VALUES ('510', '18', '线缆及配件', '', '03', '通信光缆', '', '01', '普通光缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('511', '18', '线缆及配件', '', '03', '通信光缆', '', '01', '普通光缆', '', '2015-01-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('512', '18', '线缆及配件', '', '03', '通信光缆', '', '01', '普通光缆', '', '2015-03-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('513', '18', '线缆及配件', '', '03', '通信光缆', '', '02', '蝶形光缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('514', '18', '线缆及配件', '', '03', '通信光缆', '', '02', '蝶形光缆', '', '2015-01-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('515', '18', '线缆及配件', '', '03', '通信光缆', '', '02', '蝶形光缆', '', '2015-02-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('516', '18', '线缆及配件', '', '03', '通信光缆', '', '03', '非骨架式带状光缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('517', '18', '线缆及配件', '', '03', '通信光缆', '', '03', '非骨架式带状光缆', '', '2015-01-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('518', '18', '线缆及配件', '', '03', '通信光缆', '', '03', '非骨架式带状光缆', '', '2015-02-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('519', '18', '线缆及配件', '', '03', '通信光缆', '', '04', '骨架式带状光缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('520', '18', '线缆及配件', '', '03', '通信光缆', '', '04', '骨架式带状光缆', '', '2015-01-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('521', '18', '线缆及配件', '', '03', '通信光缆', '', '04', '骨架式带状光缆', '', '2015-02-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('522', '18', '线缆及配件', '', '03', '通信光缆', '', '05', '通信用移动式光缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('523', '18', '线缆及配件', '', '03', '通信光缆', '', '06', '通信用设备光缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('524', '18', '线缆及配件', '', '03', '通信光缆', '', '07', '通信用特殊光缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('525', '18', '线缆及配件', '', '03', '通信光缆', '', '08', '光缆配件', '', '2015-10-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('526', '18', '线缆及配件', '', '03', '通信光缆', '', '08', '光缆配件', '', '2015-12-01 00:00:00');
--INSERT INTO `catalog_info` VALUES ('527', '18', '线缆及配件', '', '03', '通信光缆', '', '09', '特种光缆', '', '2016-02-15 00:00:00');
--INSERT INTO `catalog_info` VALUES ('528', '18', '线缆及配件', '', '04', '光纤', '', '01', 'G.651光纤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('529', '18', '线缆及配件', '', '04', '光纤', '', '02', 'G.652光纤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('530', '18', '线缆及配件', '', '04', '光纤', '', '03', 'G.655光纤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('531', '18', '线缆及配件', '', '04', '光纤', '', '04', 'G.657光纤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('532', '18', '线缆及配件', '', '04', '光纤', '', '05', '光纤', '', '2015-06-18 00:00:00');
--INSERT INTO `catalog_info` VALUES ('533', '18', '线缆及配件', '', '05', '跳纤/尾纤', '', '01', '多芯跳纤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('534', '18', '线缆及配件', '', '05', '跳纤/尾纤', '', '01', '多芯跳纤', '', '2015-11-25 00:00:00');
--INSERT INTO `catalog_info` VALUES ('535', '18', '线缆及配件', '', '05', '跳纤/尾纤', '', '02', '多芯尾纤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('536', '18', '线缆及配件', '', '05', '跳纤/尾纤', '', '03', '单芯跳纤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('537', '18', '线缆及配件', '', '05', '跳纤/尾纤', '', '03', '单芯跳纤', '', '2015-03-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('538', '18', '线缆及配件', '', '05', '跳纤/尾纤', '', '03', '单芯跳纤', '', '2015-08-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('539', '18', '线缆及配件', '', '05', '跳纤/尾纤', '', '06', '单芯尾纤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('540', '18', '线缆及配件', '', '06', '数据线及附件', '', '01', '超五类线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('541', '18', '线缆及配件', '', '06', '数据线及附件', '', '02', '六类线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('542', '18', '线缆及配件', '', '06', '数据线及附件', '', '02', '六类线', '', '2015-05-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('543', '18', '线缆及配件', '', '06', '数据线及附件', '', '03', '五类线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('544', '18', '线缆及配件', '', '06', '数据线及附件', '', '03', '五类线', '', '2015-01-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('545', '18', '线缆及配件', '', '06', '数据线及附件', '', '03', '五类线', '', '2015-03-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('546', '18', '线缆及配件', '', '06', '数据线及附件', '', '04', '网线连接头', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('547', '18', '线缆及配件', '', '06', '数据线及附件', '', '05', '信息模块', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('548', '18', '线缆及配件', '', '06', '数据线及附件', '', '05', '信息模块', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('549', '18', '线缆及配件', '', '06', '数据线及附件', '', '06', '信息模块插头', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('550', '18', '线缆及配件', '', '06', '数据线及附件', '', '07', '信息模块插座', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('551', '18', '线缆及配件', '', '06', '数据线及附件', '', '08', '门头盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('552', '18', '线缆及配件', '', '06', '数据线及附件', '', '09', '信息面板', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('553', '18', '线缆及配件', '', '06', '数据线及附件', '', '09', '信息面板', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('554', '18', '线缆及配件', '', '06', '数据线及附件', '', '10', '数据线缆', '', '2016-01-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('555', '18', '线缆及配件', '', '07', '馈线及辅件', '', '01', '馈线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('556', '18', '线缆及配件', '', '07', '馈线及辅件', '', '01', '馈线', '', '2015-02-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('557', '18', '线缆及配件', '', '07', '馈线及辅件', '', '01', '馈线', '', '2016-03-09 00:00:00');
--INSERT INTO `catalog_info` VALUES ('558', '18', '线缆及配件', '', '07', '馈线及辅件', '', '02', '漏泄电缆', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('559', '18', '线缆及配件', '', '07', '馈线及辅件', '', '02', '漏泄电缆', '', '2015-08-03 00:00:00');
--INSERT INTO `catalog_info` VALUES ('560', '18', '线缆及配件', '', '07', '馈线及辅件', '', '02', '漏泄电缆', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('561', '18', '线缆及配件', '', '07', '馈线及辅件', '', '02', '漏泄电缆', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('562', '18', '线缆及配件', '', '07', '馈线及辅件', '', '03', '馈线接地件/卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('563', '18', '线缆及配件', '', '07', '馈线及辅件', '', '04', '馈线连接器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('564', '18', '线缆及配件', '', '07', '馈线及辅件', '', '04', '馈线连接器', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('565', '18', '线缆及配件', '', '07', '馈线及辅件', '', '05', '馈线密封盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('566', '18', '线缆及配件', '', '07', '馈线及辅件', '', '06', '馈线跳线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('567', '18', '线缆及配件', '', '07', '馈线及辅件', '', '06', '馈线跳线', '', '2015-07-13 00:00:00');
--INSERT INTO `catalog_info` VALUES ('568', '18', '线缆及配件', '', '07', '馈线及辅件', '', '07', '馈线卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('569', '18', '线缆及配件', '', '07', '馈线及辅件', '', '07', '馈线卡', '', '2015-08-03 00:00:00');
--INSERT INTO `catalog_info` VALUES ('570', '18', '线缆及配件', '', '07', '馈线及辅件', '', '07', '馈线卡', '', '2016-03-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('571', '18', '线缆及配件', '', '07', '馈线及辅件', '', '08', '漏泄电缆馈线卡 （停用）', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('572', '18', '线缆及配件', '', '07', '馈线及辅件', '', '09', '室内外地线排', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('573', '18', '线缆及配件', '', '07', '馈线及辅件', '', '10', '馈线窗', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('574', '18', '线缆及配件', '', '07', '馈线及辅件', '', '10', '馈线窗', '', '2015-01-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('575', '18', '线缆及配件', '', '07', '馈线及辅件', '', '10', '馈线窗', '', '2015-03-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('576', '18', '线缆及配件', '', '07', '馈线及辅件', '', '11', '防水组件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('577', '18', '线缆及配件', '', '07', '馈线及辅件', '', '12', '冷缩管', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('578', '18', '线缆及配件', '', '07', '馈线及辅件', '', '13', '馈线接地线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('579', '18', '线缆及配件', '', '07', '馈线及辅件', '', '14', '扎带', '', '2015-07-01 00:00:00');
--INSERT INTO `catalog_info` VALUES ('580', '18', '线缆及配件', '', '07', '馈线及辅件', '', '14', '扎带', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('581', '18', '线缆及配件', '', '07', '馈线及辅件', '', '15', '馈线避雷器', '', '2015-01-19 00:00:00');
--INSERT INTO `catalog_info` VALUES ('582', '19', '电源及动力环境设备', '', '01', '高压配电设备', '', '01', '高压开关柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('583', '19', '电源及动力环境设备', '', '01', '高压配电设备', '', '02', '高压补偿柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('584', '19', '电源及动力环境设备', '', '01', '高压配电设备', '', '08', '高压接地柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('585', '19', '电源及动力环境设备', '', '01', '高压配电设备', '', '09', '直流操作电源', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('586', '19', '电源及动力环境设备', '', '01', '高压配电设备', '', '09', '直流操作电源', '', '2015-05-13 00:00:00');
--INSERT INTO `catalog_info` VALUES ('587', '19', '电源及动力环境设备', '', '01', '高压配电设备', '', '10', '高压配电配套设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('588', '19', '电源及动力环境设备', '', '02', '变压器及配件', '', '01', '变压器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('589', '19', '电源及动力环境设备', '', '02', '变压器及配件', '', '01', '变压器', '', '2014-12-25 00:00:00');
--INSERT INTO `catalog_info` VALUES ('590', '19', '电源及动力环境设备', '', '02', '变压器及配件', '', '01', '变压器', '', '2015-02-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('591', '19', '电源及动力环境设备', '', '02', '变压器及配件', '', '01', '变压器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('592', '19', '电源及动力环境设备', '', '02', '变压器及配件', '', '02', '箱式变电站', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('593', '19', '电源及动力环境设备', '', '02', '变压器及配件', '', '04', '变压器配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('594', '19', '电源及动力环境设备', '', '02', '变压器及配件', '', '04', '变压器配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('595', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '01', '低压开关柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('596', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '02', '低压补偿柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('597', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '06', '交流列头柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('598', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '06', '交流列头柜', '', '2015-03-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('599', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '07', '交流配电屏/箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('600', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '07', '交流配电屏/箱', '', '2015-03-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('601', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '11', '双路电源转换柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('602', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '12', 'STS转换柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('603', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '13', '低压设备配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('604', '19', '电源及动力环境设备', '', '03', '低压配电设备', '', '14', 'ATS转换柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('605', '19', '电源及动力环境设备', '', '04', '滤波及补偿装置', '', '01', '高压无功功率补偿装置', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('606', '19', '电源及动力环境设备', '', '04', '滤波及补偿装置', '', '03', '无功功率补偿装置配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('607', '19', '电源及动力环境设备', '', '04', '滤波及补偿装置', '', '04', '滤波设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('608', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '01', '柴油发电机组', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('609', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '01', '柴油发电机组', '', '2015-02-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('610', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '06', '燃气轮发电机组', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('611', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '08', '汽油发电机组', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('612', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '08', '汽油发电机组', '', '2015-02-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('613', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '09', '储油设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('614', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '10', '发电机组配电控制设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('615', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '11', '发电机组配套设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('616', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '11', '发电机组配套设备', '', '2015-01-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('617', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '11', '发电机组配套设备', '', '2015-05-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('618', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '11', '发电机组配套设备', '', '2015-09-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('619', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '11', '发电机组配套设备', '', '2016-01-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('620', '19', '电源及动力环境设备', '', '05', '普通发电机组及配套', '', '11', '发电机组配套设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('621', '19', '电源及动力环境设备', '', '06', '交流不间断电源', '', '01', 'UPS', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('622', '19', '电源及动力环境设备', '', '06', '交流不间断电源', '', '01', 'UPS', '', '2015-03-31 00:00:00');
--INSERT INTO `catalog_info` VALUES ('623', '19', '电源及动力环境设备', '', '06', '交流不间断电源', '', '01', 'UPS', '', '2016-01-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('624', '19', '电源及动力环境设备', '', '06', '交流不间断电源', '', '02', '模块化UPS', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('625', '19', '电源及动力环境设备', '', '06', '交流不间断电源', '', '04', 'UPS电池开关设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('626', '19', '电源及动力环境设备', '', '06', '交流不间断电源', '', '05', 'UPS配套设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('627', '19', '电源及动力环境设备', '', '06', '交流不间断电源', '', '06', '备用电源/应急电源(EPS)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('628', '19', '电源及动力环境设备', '', '07', '直流设备', '', '01', '整流器柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('629', '19', '电源及动力环境设备', '', '07', '直流设备', '', '02', '开关电源', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('630', '19', '电源及动力环境设备', '', '07', '直流设备', '', '02', '开关电源', '', '2015-01-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('631', '19', '电源及动力环境设备', '', '07', '直流设备', '', '02', '开关电源', '', '2015-03-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('632', '19', '电源及动力环境设备', '', '07', '直流设备', '', '02', '开关电源', '', '2015-03-23 00:00:00');
--INSERT INTO `catalog_info` VALUES ('633', '19', '电源及动力环境设备', '', '07', '直流设备', '', '02', '开关电源', '', '2015-11-25 00:00:00');
--INSERT INTO `catalog_info` VALUES ('634', '19', '电源及动力环境设备', '', '07', '直流设备', '', '02', '开关电源', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('635', '19', '电源及动力环境设备', '', '07', '直流设备', '', '03', '监控模块', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('636', '19', '电源及动力环境设备', '', '07', '直流设备', '', '03', '监控模块', '', '2015-02-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('637', '19', '电源及动力环境设备', '', '07', '直流设备', '', '04', '整流模块', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('638', '19', '电源及动力环境设备', '', '07', '直流设备', '', '04', '整流模块', '', '2015-02-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('639', '19', '电源及动力环境设备', '', '07', '直流设备', '', '05', '直流配电屏\\箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('640', '19', '电源及动力环境设备', '', '07', '直流设备', '', '05', '直流配电屏\\箱', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('641', '19', '电源及动力环境设备', '', '07', '直流设备', '', '06', '直流列头柜', '', '2016-02-23 00:00:00');
--INSERT INTO `catalog_info` VALUES ('642', '19', '电源及动力环境设备', '', '07', '直流设备', '', '06', '直流列头柜', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('643', '19', '电源及动力环境设备', '', '07', '直流设备', '', '08', '开关电源配套设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('644', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '01', '铅酸蓄电池', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('645', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '01', '铅酸蓄电池', '', '2016-03-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('646', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '02', '锂电池', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('647', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '03', '其它蓄电池', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('648', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '04', '蓄电池恒温箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('649', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '05', '蓄电池组配套', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('650', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '05', '蓄电池组配套', '', '2015-01-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('651', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '06', '磷酸铁锂电池容量范围', '', '2015-04-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('652', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '06', '磷酸铁锂电池容量范围', '', '2015-05-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('653', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '06', '磷酸铁锂电池容量范围', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('654', '19', '电源及动力环境设备', '', '08', '蓄电池', '', '07', '磷酸铁锂电池选配件', '', '2015-04-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('655', '19', '电源及动力环境设备', '', '09', '户外电源', '', '01', '一体化户外电源', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('656', '19', '电源及动力环境设备', '', '09', '户外电源', '', '02', '一体化机柜', '', '2015-07-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('657', '19', '电源及动力环境设备', '', '10', '远供电设备', '', '01', '远供电设备分配单元', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('658', '19', '电源及动力环境设备', '', '10', '远供电设备', '', '02', '远供局端机(远供局端电源设备)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('659', '19', '电源及动力环境设备', '', '10', '远供电设备', '', '03', '远供远端机(远供电源适配器)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('660', '19', '电源及动力环境设备', '', '10', '远供电设备', '', '03', '远供远端机(远供电源适配器)', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('661', '19', '电源及动力环境设备', '', '10', '远供电设备', '', '04', '远供电设备配件以及服务费', '', '2015-01-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('662', '19', '电源及动力环境设备', '', '11', '绿色发电机组及配套', '', '01', '风能发电系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('663', '19', '电源及动力环境设备', '', '11', '绿色发电机组及配套', '', '03', '太阳能发电系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('664', '19', '电源及动力环境设备', '', '11', '绿色发电机组及配套', '', '05', '绿色发电配套设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('665', '19', '电源及动力环境设备', '', '11', '绿色发电机组及配套', '', '05', '绿色发电配套设备', '', '2015-01-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('666', '19', '电源及动力环境设备', '', '11', '绿色发电机组及配套', '', '05', '绿色发电配套设备', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('667', '19', '电源及动力环境设备', '', '12', '变换设备', '', '01', 'DC/DC变换设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('668', '19', '电源及动力环境设备', '', '12', '变换设备', '', '02', '逆变设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('669', '19', '电源及动力环境设备', '', '13', '开关器件', '', '01', '框架式断路器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('670', '19', '电源及动力环境设备', '', '13', '开关器件', '', '02', '塑壳式断路器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('671', '19', '电源及动力环境设备', '', '13', '开关器件', '', '03', '微型断路器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('672', '19', '电源及动力环境设备', '', '13', '开关器件', '', '04', '熔断器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('673', '19', '电源及动力环境设备', '', '13', '开关器件', '', '05', '自动转换开关', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('674', '19', '电源及动力环境设备', '', '13', '开关器件', '', '98', '其它电源通用配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('675', '19', '电源及动力环境设备', '', '13', '开关器件', '', '99', '其它开关', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('676', '19', '电源及动力环境设备', '', '14', '铜母线', '', '01', '铜排', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('677', '19', '电源及动力环境设备', '', '14', '铜母线', '', '02', '母线槽', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('678', '19', '电源及动力环境设备', '', '14', '铜母线', '', '03', '铜母线配件', '', '2015-01-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('679', '19', '电源及动力环境设备', '', '15', '避雷产品', '', '02', '电涌保护器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('680', '19', '电源及动力环境设备', '', '15', '避雷产品', '', '06', '防雷箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('681', '19', '电源及动力环境设备', '', '15', '避雷产品', '', '07', '防雷箱配套', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('682', '19', '电源及动力环境设备', '', '15', '避雷产品', '', '08', '接闪器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('683', '19', '电源及动力环境设备', '', '15', '避雷产品', '', '09', '接地装置', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('684', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '01', '通信用专用空调', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('685', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '01', '通信用专用空调', '', '2015-02-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('686', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '03', '中央空调', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('687', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '04', '普通舒适型空调', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('688', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '05', '热管换热机组', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('689', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '06', '智能换热系统', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('690', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '07', '智能通风系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('691', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '08', '空调主要配套设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('692', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '08', '空调主要配套设备', '', '2015-12-31 00:00:00');
--INSERT INTO `catalog_info` VALUES ('693', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '09', '空调其他配套设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('694', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '09', '空调其他配套设备', '', '2015-02-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('695', '19', '电源及动力环境设备', '', '16', '空调及其配套', '', '09', '空调其他配套设备', '', '2015-06-05 00:00:00');
--INSERT INTO `catalog_info` VALUES ('696', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '01', '环境类传感变送器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('697', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '02', '动力类传感变送器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('698', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '02', '动力类传感变送器', '', '2015-02-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('699', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '03', '安全类传感变送器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('700', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '04', '监控数据采集设备', '', '2015-02-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('701', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '04', '监控数据采集设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('702', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '04', '监控数据采集设备', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('703', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '08', '中心数据汇聚传输设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('704', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '08', '中心数据汇聚传输设备', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('705', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '09', '动力环境监控设备配件', '', '2015-02-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('706', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '09', '动力环境监控设备配件', '', '2015-11-03 00:00:00');
--INSERT INTO `catalog_info` VALUES ('707', '19', '电源及动力环境设备', '', '17', '动力环境监控设备及配件', '', '09', '动力环境监控设备配件', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('708', '19', '电源及动力环境设备', '', '18', '稳压设备', '', '01', '稳压器', '', '2016-03-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('709', '19', '电源及动力环境设备', '', '19', '高低压配电设备', '', '01', '模拟屏', '', '2016-03-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('710', '19', '电源及动力环境设备', '', '20', '冷水机组', '', '01', '高压离心冷水机组', '', '2015-07-30 00:00:00');
--INSERT INTO `catalog_info` VALUES ('711', '19', '电源及动力环境设备', '', '20', '冷水机组', '', '01', '高压离心冷水机组', '', '2015-12-09 00:00:00');
--INSERT INTO `catalog_info` VALUES ('712', '19', '电源及动力环境设备', '', '21', '冷却塔', '', '01', '横流式冷却塔', '', '2016-03-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('713', '19', '电源及动力环境设备', '', '21', '冷却塔', '', '02', '逆流式冷却塔', '', '2016-03-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('714', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '01', '自动路测终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('715', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '02', '测试终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('716', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '03', '路测软件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('717', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '04', '频谱分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('718', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '05', '扫频仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('719', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '06', '信号发生器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('720', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '07', '基站综合测试仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('721', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '08', '频率计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('722', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '09', '功率计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('723', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '10', '示波器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('724', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '10', '示波器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('725', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '11', '天馈线测试仪', '', '2015-01-05 00:00:00');
--INSERT INTO `catalog_info` VALUES ('726', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '12', '自动拨测仪', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('727', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '13', '矢量网络分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('728', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '14', '矢量信号分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('729', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '15', '多阶互调分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('730', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '15', '多阶互调分析仪', '', '2015-05-22 00:00:00');
--INSERT INTO `catalog_info` VALUES ('731', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '16', '噪声系数分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('732', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '17', '电磁辐射测量仪', '', '2015-01-05 00:00:00');
--INSERT INTO `catalog_info` VALUES ('733', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '18', '信令监测仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('734', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '19', '空口监测仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('735', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '20', '业务平台仿真仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('736', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '21', '终端仿真仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('737', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '22', 'IR接口仿真仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('738', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '23', '无线网络仿真仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('739', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '24', '无线信道仿真仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('740', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '25', '空口一致性测试工具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('741', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '27', '三网对比测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('742', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '29', 'WLAN综测仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('743', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '31', 'WLAN AC性能测试工具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('744', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '32', '自动场景分析与参数配置平台ASPS', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('745', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '33', '自动频率规划优化软件AFOS', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('746', '20', '仪器仪表及工具', '', '01', '无线类测试仪表', '', '34', '干扰抑制仪表', '', '2015-02-09 00:00:00');
--INSERT INTO `catalog_info` VALUES ('747', '20', '仪器仪表及工具', '', '02', '核心网测试仪表', '', '01', 'PS性能测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('748', '20', '仪器仪表及工具', '', '02', '核心网测试仪表', '', '02', '软交换性能测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('749', '20', '仪器仪表及工具', '', '02', '核心网测试仪表', '', '03', '核心网信令监测工具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('750', '20', '仪器仪表及工具', '', '02', '核心网测试仪表', '', '04', 'NGN网络综合测试仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('751', '20', '仪器仪表及工具', '', '03', '业务类测试仪表', '', '02', 'MOS测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('752', '20', '仪器仪表及工具', '', '04', '终端类测试仪表', '', '01', '终端射频一致性测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('753', '20', '仪器仪表及工具', '', '04', '终端类测试仪表', '', '02', '终端RRM一致性测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('754', '20', '仪器仪表及工具', '', '04', '终端类测试仪表', '', '03', '终端业务一致性测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('755', '20', '仪器仪表及工具', '', '04', '终端类测试仪表', '', '04', '终端协议一致性测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('756', '20', '仪器仪表及工具', '', '04', '终端类测试仪表', '', '05', '机卡接口一致性测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('757', '20', '仪器仪表及工具', '', '04', '终端类测试仪表', '', '07', '终端测试仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('758', '20', '仪器仪表及工具', '', '04', '终端类测试仪表', '', '07', '终端测试仪', '', '2015-12-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('759', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '01', 'OTDR光时域反射仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('760', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '04', 'OTN/SDH/MSTP测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('761', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '04', 'OTN/SDH/MSTP测试仪表', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('762', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '05', 'OTN/SDH测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('763', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '07', 'SDH/MSTP测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('764', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '08', 'PON网络测试OTDR', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('765', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '09', 'PON网络测试光功率计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('766', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '10', 'PTN测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('767', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '12', '管线路由探测器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('768', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '13', '光功率计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('769', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '14', '光接头测试仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('770', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '15', '光可变衰耗器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('771', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '16', '光谱分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('772', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '17', '光纤熔接仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('773', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '18', '光纤识别仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('774', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '19', '时间分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('775', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '20', '数字传输分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('776', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '20', '数字传输分析仪', '', '2015-01-19 00:00:00');
--INSERT INTO `catalog_info` VALUES ('777', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '20', '数字传输分析仪', '', '2015-07-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('778', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '22', '数字宽带示波器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('779', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '23', '稳定光源', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('780', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '24', '以太网测试仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('781', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '26', '2M 误码仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('782', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '27', '以太网测线器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('783', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '29', '数据抓包分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('784', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '30', '偏振模色散测试仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('785', '20', '仪器仪表及工具', '', '06', '传输类仪表', '', '31', '多波长计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('786', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '01', '复合压力表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('787', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '02', '气压计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('788', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '03', '成像仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('789', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '03', '成像仪表', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('790', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '04', '电力质量分析仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('791', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '04', '电力质量分析仪', '', '2015-01-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('792', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '05', '智能电网监测仪', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('793', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '06', '电流表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('794', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '07', '电源示波器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('795', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '07', '电源示波器', '', '2015-01-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('796', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '08', '电阻测试仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('797', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '08', '电阻测试仪', '', '2015-01-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('798', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '09', '负载仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('799', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '10', '万用表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('800', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '11', '温湿度测试仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('801', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '12', '蓄电池组采集仪', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('802', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '13', ' ', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('803', '20', '仪器仪表及工具', '', '07', '动力环境测试仪表', '', '99', '其他动力环境测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('804', '20', '仪器仪表及工具', '', '08', '网络工具', '', '01', '手持GPS定位仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('805', '20', '仪器仪表及工具', '', '08', '网络工具', '', '02', '同轴电缆测试仪表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('806', '20', '仪器仪表及工具', '', '08', '网络工具', '', '04', '压线钳', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('807', '20', '仪器仪表及工具', '', '08', '网络工具', '', '05', '网优类仪表', '', '2015-07-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('808', '20', '仪器仪表及工具', '', '08', '网络工具', '', '06', '互联网类仪表', '', '2015-07-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('809', '20', '仪器仪表及工具', '', '09', '仪器仪表配件', '', '01', '仪器仪表配件', '', '2015-01-15 00:00:00');
--INSERT INTO `catalog_info` VALUES ('810', '21', '服务', '', '01', '通信工程服务', '', '01', '通信工程规划', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('811', '21', '服务', '', '01', '通信工程服务', '', '01', '通信工程规划', '', '2015-02-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('812', '21', '服务', '', '01', '通信工程服务', '', '01', '通信工程规划', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('813', '21', '服务', '', '01', '通信工程服务', '', '02', '通信工程可研', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('814', '21', '服务', '', '01', '通信工程服务', '', '02', '通信工程可研', '', '2015-11-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('815', '21', '服务', '', '01', '通信工程服务', '', '03', '通信工程勘察设计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('816', '21', '服务', '', '01', '通信工程服务', '', '03', '通信工程勘察设计', '', '2015-03-09 00:00:00');
--INSERT INTO `catalog_info` VALUES ('817', '21', '服务', '', '01', '通信工程服务', '', '03', '通信工程勘察设计', '', '2015-11-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('818', '21', '服务', '', '01', '通信工程服务', '', '04', '通信工程施工', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('819', '21', '服务', '', '01', '通信工程服务', '', '04', '通信工程施工', '', '2014-12-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('820', '21', '服务', '', '01', '通信工程服务', '', '04', '通信工程施工', '', '2015-05-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('821', '21', '服务', '', '01', '通信工程服务', '', '04', '通信工程施工', '', '2015-05-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('822', '21', '服务', '', '01', '通信工程服务', '', '04', '通信工程施工', '', '2015-11-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('823', '21', '服务', '', '01', '通信工程服务', '', '04', '通信工程施工', '', '2016-02-25 00:00:00');
--INSERT INTO `catalog_info` VALUES ('824', '21', '服务', '', '01', '通信工程服务', '', '05', '通信工程监理', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('825', '21', '服务', '', '01', '通信工程服务', '', '05', '通信工程监理', '', '2014-12-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('826', '21', '服务', '', '01', '通信工程服务', '', '05', '通信工程监理', '', '2015-04-28 00:00:00');
--INSERT INTO `catalog_info` VALUES ('827', '21', '服务', '', '01', '通信工程服务', '', '05', '通信工程监理', '', '2015-08-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('828', '21', '服务', '', '01', '通信工程服务', '', '06', '技术支持服务费', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('829', '21', '服务', '', '01', '通信工程服务', '', '07', '工程服务费', '', '2015-02-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('830', '21', '服务', '', '01', '通信工程服务', '', '07', '工程服务费', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('831', '21', '服务', '', '01', '通信工程服务', '', '08', '通信工程后评估', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('832', '21', '服务', '', '01', '通信工程服务', '', '99', '其他通信工程服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('833', '21', '服务', '', '02', '土建服务', '', '01', '前期评估', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('834', '21', '服务', '', '02', '土建服务', '', '02', '土建可研', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('835', '21', '服务', '', '02', '土建服务', '', '03', '土建设计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('836', '21', '服务', '', '02', '土建服务', '', '04', '土建勘察', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('837', '21', '服务', '', '02', '土建服务', '', '04', '土建勘察', '', '2015-07-01 00:00:00');
--INSERT INTO `catalog_info` VALUES ('838', '21', '服务', '', '02', '土建服务', '', '04', '土建勘察', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('839', '21', '服务', '', '02', '土建服务', '', '05', '土建造价', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('840', '21', '服务', '', '02', '土建服务', '', '06', '土建项目管理', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('841', '21', '服务', '', '02', '土建服务', '', '07', '土建施工', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('842', '21', '服务', '', '02', '土建服务', '', '08', '土建监理', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('843', '21', '服务', '', '02', '土建服务', '', '09', '征地', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('844', '21', '服务', '', '02', '土建服务', '', '99', '其他土建工程服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('845', '21', '服务', '', '03', '通信网络服务', '', '01', '通信网络代维', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('846', '21', '服务', '', '03', '通信网络服务', '', '01', '通信网络代维', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('847', '21', '服务', '', '03', '通信网络服务', '', '01', '通信网络代维', '', '2016-04-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('848', '21', '服务', '', '03', '通信网络服务', '', '02', '网络优化', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('849', '21', '服务', '', '03', '通信网络服务', '', '03', '数据业务运营支撑', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('850', '21', '服务', '', '03', '通信网络服务', '', '04', '通信产品质量检测', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('851', '21', '服务', '', '03', '通信网络服务', '', '05', '测试服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('852', '21', '服务', '', '03', '通信网络服务', '', '99', '其他通信网络服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('853', '21', '服务', '', '04', '系统实施服务', '', '01', '网管软件开发', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('854', '21', '服务', '', '04', '系统实施服务', '', '01', '网管软件开发', '', '2015-01-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('855', '21', '服务', '', '04', '系统实施服务', '', '01', '网管软件开发', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('856', '21', '服务', '', '04', '系统实施服务', '', '02', '业务支撑软件开发', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('857', '21', '服务', '', '04', '系统实施服务', '', '02', '业务支撑软件开发', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('858', '21', '服务', '', '04', '系统实施服务', '', '03', 'IT应用软件开发', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('859', '21', '服务', '', '04', '系统实施服务', '', '04', '系统集成服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('860', '21', '服务', '', '04', '系统实施服务', '', '04', '系统集成服务', '', '2015-01-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('861', '21', '服务', '', '04', '系统实施服务', '', '04', '系统集成服务', '', '2015-12-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('862', '21', '服务', '', '04', '系统实施服务', '', '04', '系统集成服务', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('863', '21', '服务', '', '04', '系统实施服务', '', '99', '其他系统实施服务', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('864', '21', '服务', '', '05', '维保维修', '', '01', '通信基础网络设施维保', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('865', '21', '服务', '', '05', '维保维修', '', '01', '通信基础网络设施维保', '', '2015-01-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('866', '21', '服务', '', '05', '维保维修', '', '01', '通信基础网络设施维保', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('867', '21', '服务', '', '05', '维保维修', '', '02', 'IT设施维保', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('868', '21', '服务', '', '05', '维保维修', '', '02', 'IT设施维保', '', '2015-04-28 00:00:00');
--INSERT INTO `catalog_info` VALUES ('869', '21', '服务', '', '05', '维保维修', '', '03', '通信配套设施维保', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('870', '21', '服务', '', '05', '维保维修', '', '04', '备板备件返修', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('871', '21', '服务', '', '05', '维保维修', '', '05', '应急通信设备维保', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('872', '21', '服务', '', '05', '维保维修', '', '06', '营业设施维保', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('873', '21', '服务', '', '05', '维保维修', '', '07', '消防系统设施维保', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('874', '21', '服务', '', '05', '维保维修', '', '08', '房屋维修', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('875', '21', '服务', '', '05', '维保维修', '', '08', '房屋维修', '', '2016-04-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('876', '21', '服务', '', '05', '维保维修', '', '09', '办公设施维保', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('877', '21', '服务', '', '05', '维保维修', '', '99', '其他维保维修服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('878', '21', '服务', '', '06', '广告与宣传', '', '01', '广告制作', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('879', '21', '服务', '', '06', '广告与宣传', '', '02', '广告媒介投放', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('880', '21', '服务', '', '06', '广告与宣传', '', '02', '广告媒介投放', '', '2015-12-01 00:00:00');
--INSERT INTO `catalog_info` VALUES ('881', '21', '服务', '', '06', '广告与宣传', '', '02', '广告媒介投放', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('882', '21', '服务', '', '06', '广告与宣传', '', '03', '广告监测服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('883', '21', '服务', '', '06', '广告与宣传', '', '04', '广告创意服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('884', '21', '服务', '', '06', '广告与宣传', '', '05', '展览展示', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('885', '21', '服务', '', '06', '广告与宣传', '', '06', '传播效果评估与消费者调研', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('886', '21', '服务', '', '06', '广告与宣传', '', '07', '媒介策略服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('887', '21', '服务', '', '06', '广告与宣传', '', '08', '公关活动服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('888', '21', '服务', '', '06', '广告与宣传', '', '09', '代言人服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('889', '21', '服务', '', '06', '广告与宣传', '', '10', '活动与演出服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('890', '21', '服务', '', '06', '广告与宣传', '', '99', '其他广告与宣传服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('891', '21', '服务', '', '06', '广告与宣传', '', '99', '其他广告与宣传服务', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('892', '21', '服务', '', '06', '广告与宣传', '', '99', '其他广告与宣传服务', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('893', '21', '服务', '', '99', '其他服务', '', '01', '招标代理', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('894', '21', '服务', '', '99', '其他服务', '', '02', '专业咨询', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('895', '21', '服务', '', '99', '其他服务', '', '02', '专业咨询', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('896', '21', '服务', '', '99', '其他服务', '', '03', '行政代理', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('897', '21', '服务', '', '99', '其他服务', '', '03', '行政代理', '', '2016-04-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('898', '21', '服务', '', '99', '其他服务', '', '04', '劳务外包', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('899', '21', '服务', '', '99', '其他服务', '', '04', '劳务外包', '', '2015-10-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('900', '21', '服务', '', '99', '其他服务', '', '04', '劳务外包', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('901', '21', '服务', '', '99', '其他服务', '', '04', '劳务外包', '', '2016-05-04 00:00:00');
--INSERT INTO `catalog_info` VALUES ('902', '21', '服务', '', '99', '其他服务', '', '05', '包装服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('903', '21', '服务', '', '99', '其他服务', '', '06', '物流服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('904', '21', '服务', '', '99', '其他服务', '', '07', '仓储服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('905', '21', '服务', '', '99', '其他服务', '', '08', '租赁服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('906', '21', '服务', '', '99', '其他服务', '', '08', '租赁服务', '', '2015-01-09 00:00:00');
--INSERT INTO `catalog_info` VALUES ('907', '21', '服务', '', '99', '其他服务', '', '08', '租赁服务', '', '2015-05-06 00:00:00');
--INSERT INTO `catalog_info` VALUES ('908', '21', '服务', '', '99', '其他服务', '', '08', '租赁服务', '', '2015-09-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('909', '21', '服务', '', '99', '其他服务', '', '08', '租赁服务', '', '2015-09-25 00:00:00');
--INSERT INTO `catalog_info` VALUES ('910', '21', '服务', '', '99', '其他服务', '', '08', '租赁服务', '', '2015-11-03 00:00:00');
--INSERT INTO `catalog_info` VALUES ('911', '21', '服务', '', '99', '其他服务', '', '09', '废旧物资处理', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('912', '21', '服务', '', '99', '其他服务', '', '10', '产品质量检测服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('913', '21', '服务', '', '99', '其他服务', '', '10', '产品质量检测服务', '', '2015-09-28 00:00:00');
--INSERT INTO `catalog_info` VALUES ('914', '21', '服务', '', '99', '其他服务', '', '11', '保险服务', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('915', '21', '服务', '', '99', '其他服务', '', '12', '专利申请服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('916', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('917', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2015-05-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('918', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2015-09-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('919', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2015-09-23 00:00:00');
--INSERT INTO `catalog_info` VALUES ('920', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2015-11-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('921', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2015-12-15 00:00:00');
--INSERT INTO `catalog_info` VALUES ('922', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2016-02-23 00:00:00');
--INSERT INTO `catalog_info` VALUES ('923', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2016-03-09 00:00:00');
--INSERT INTO `catalog_info` VALUES ('924', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('925', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('926', '21', '服务', '', '99', '其他服务', '', '99', '其他专业服务', '', '2016-04-28 00:00:00');
--INSERT INTO `catalog_info` VALUES ('927', '22', '业务产品', '', '01', '终端', '', '01', '手机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('928', '22', '业务产品', '', '01', '终端', '', '02', '数据卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('929', '22', '业务产品', '', '01', '终端', '', '03', '卫星电话', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('930', '22', '业务产品', '', '01', '终端', '', '04', '无线座机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('931', '22', '业务产品', '', '01', '终端', '', '05', 'POS终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('932', '22', '业务产品', '', '01', '终端', '', '06', '终端配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('933', '22', '业务产品', '', '01', '终端', '', '07', '家庭网关', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('934', '22', '业务产品', '', '01', '终端', '', '08', '个人便携式网关', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('935', '22', '业务产品', '', '01', '终端', '', '09', '小企业/公共WIFI终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('936', '22', '业务产品', '', '01', '终端', '', '10', '电子书阅读器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('937', '22', '业务产品', '', '01', '终端', '', '11', 'USB手柄终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('938', '22', '业务产品', '', '01', '终端', '', '12', '物联通通信模块', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('939', '22', '业务产品', '', '01', '终端', '', '12', '物联通通信模块', '', '2015-05-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('940', '22', '业务产品', '', '01', '终端', '', '13', '卫生移动执法终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('941', '22', '业务产品', '', '01', '终端', '', '14', '林业防火监控终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('942', '22', '业务产品', '', '01', '终端', '', '15', '保险定损终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('943', '22', '业务产品', '', '01', '终端', '', '16', '大棚温控终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('944', '22', '业务产品', '', '01', '终端', '', '17', '护林员定位终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('945', '22', '业务产品', '', '01', '终端', '', '18', '便携式导航终端(PND)', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('946', '22', '业务产品', '', '01', '终端', '', '19', '视频监控摄像机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('947', '22', '业务产品', '', '01', '终端', '', '19', '视频监控摄像机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('948', '22', '业务产品', '', '01', '终端', '', '20', '视频监控编码器', '', '2015-11-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('949', '22', '业务产品', '', '01', '终端', '', '21', 'IAD固话', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('950', '22', '业务产品', '', '01', '终端', '', '22', '商户管家终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('951', '22', '业务产品', '', '01', '终端', '', '23', 'POC终端', '', '2015-12-17 00:00:00');
--INSERT INTO `catalog_info` VALUES ('952', '22', '业务产品', '', '01', '终端', '', '24', '校讯通终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('953', '22', '业务产品', '', '01', '终端', '', '99', '其他终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('954', '22', '业务产品', '', '01', '终端', '', '99', '其他终端', '', '2015-11-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('955', '22', '业务产品', '', '01', '终端', '', '99', '其他终端', '', '2015-12-01 00:00:00');
--INSERT INTO `catalog_info` VALUES ('956', '22', '业务产品', '', '01', '终端', '', '99', '其他终端', '', '2015-12-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('957', '22', '业务产品', '', '02', '业务卡', '', '01', 'SIM卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('958', '22', '业务产品', '', '02', '业务卡', '', '01', 'SIM卡', '', '2015-01-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('959', '22', '业务产品', '', '02', '业务卡', '', '01', 'SIM卡', '', '2015-02-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('960', '22', '业务产品', '', '02', '业务卡', '', '01', 'SIM卡', '', '2015-03-03 00:00:00');
--INSERT INTO `catalog_info` VALUES ('961', '22', '业务产品', '', '02', '业务卡', '', '01', 'SIM卡', '', '2015-05-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('962', '22', '业务产品', '', '02', '业务卡', '', '02', '移动充值卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('963', '22', '业务产品', '', '02', '业务卡', '', '03', '卡类耗材', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('964', '22', '业务产品', '', '02', '业务卡', '', '03', '卡类耗材', '', '2016-03-17 00:00:00');
--INSERT INTO `catalog_info` VALUES ('965', '22', '业务产品', '', '02', '业务卡', '', '04', 'VIP实体卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('966', '22', '业务产品', '', '02', '业务卡', '', '05', 'SIMPASS卡', '', '2015-09-30 00:00:00');
--INSERT INTO `catalog_info` VALUES ('967', '22', '业务产品', '', '02', '业务卡', '', '06', '手机钱包业务贴片卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('968', '22', '业务产品', '', '02', '业务卡', '', '99', '其他业务卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('969', '22', '业务产品', '', '02', '业务卡', '', '99', '其他业务卡', '', '2015-03-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('970', '22', '业务产品', '', '03', '营业厅专用设施', '', '01', '手机防盗器', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('971', '22', '业务产品', '', '03', '营业厅专用设施', '', '02', '机模托架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('972', '22', '业务产品', '', '03', '营业厅专用设施', '', '03', '无纸化集成终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('973', '22', '业务产品', '', '03', '营业厅专用设施', '', '04', '排队叫号机系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('974', '22', '业务产品', '', '03', '营业厅专用设施', '', '05', '多功能自助终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('975', '22', '业务产品', '', '03', '营业厅专用设施', '', '06', '自助查询打印终端', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('976', '22', '业务产品', '', '03', '营业厅专用设施', '', '07', '刷卡机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('977', '22', '业务产品', '', '03', '营业厅专用设施', '', '08', '密码键盘', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('978', '22', '业务产品', '', '03', '营业厅专用设施', '', '09', 'LED走字屏', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('979', '22', '业务产品', '', '03', '营业厅专用设施', '', '10', '电子海报', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('980', '22', '业务产品', '', '03', '营业厅专用设施', '', '11', '身份识别设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('981', '22', '业务产品', '', '03', '营业厅专用设施', '', '11', '身份识别设备', '', '2015-04-23 00:00:00');
--INSERT INTO `catalog_info` VALUES ('982', '22', '业务产品', '', '03', '营业厅专用设施', '', '12', '电子签名板', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('983', '22', '业务产品', '', '03', '营业厅专用设施', '', '13', '营业厅自助写卡设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('984', '22', '业务产品', '', '03', '营业厅专用设施', '', '14', '手机充电站', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('985', '22', '业务产品', '', '03', '营业厅专用设施', '', '15', '演示大手机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('986', '22', '业务产品', '', '03', '营业厅专用设施', '', '16', '空中充值机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('987', '22', '业务产品', '', '03', '营业厅专用设施', '', '18', 'SIM读卡器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('988', '22', '业务产品', '', '03', '营业厅专用设施', '', '19', '点验钞机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('989', '22', '业务产品', '', '03', '营业厅专用设施', '', '20', '营业厅票据打印机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('990', '22', '业务产品', '', '03', '营业厅专用设施', '', '20', '营业厅票据打印机', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('991', '22', '业务产品', '', '03', '营业厅专用设施', '', '21', '营业厅展示桌', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('992', '22', '业务产品', '', '03', '营业厅专用设施', '', '22', '营业厅受理台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('993', '22', '业务产品', '', '03', '营业厅专用设施', '', '23', '营业厅销售柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('994', '22', '业务产品', '', '03', '营业厅专用设施', '', '24', '营业厅体验营销设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('995', '22', '业务产品', '', '03', '营业厅专用设施', '', '25', '农村信息机', '', '2015-08-05 00:00:00');
--INSERT INTO `catalog_info` VALUES ('996', '22', '业务产品', '', '03', '营业厅专用设施', '', '99', '营业厅专用设施配件', '', '2015-01-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('997', '22', '业务产品', '', '04', '其他营业厅设施', '', '01', '渠道VI标识', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('998', '22', '业务产品', '', '04', '其他营业厅设施', '', '01', '渠道VI标识', '', '2014-12-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('999', '22', '业务产品', '', '04', '其他营业厅设施', '', '02', '手机展架', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1000', '22', '业务产品', '', '04', '其他营业厅设施', '', '02', '手机展架', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1001', '22', '业务产品', '', '04', '其他营业厅设施', '', '03', '灯箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1002', '22', '业务产品', '', '04', '其他营业厅设施', '', '04', '翻页牌', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1003', '22', '业务产品', '', '04', '其他营业厅设施', '', '05', '台卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1004', '22', '业务产品', '', '04', '其他营业厅设施', '', '05', '台卡', '', '2014-12-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1005', '22', '业务产品', '', '04', '其他营业厅设施', '', '06', '桌面立牌', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1006', '22', '业务产品', '', '04', '其他营业厅设施', '', '07', '防撞贴', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1007', '22', '业务产品', '', '04', '其他营业厅设施', '', '08', 'X展架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1008', '22', '业务产品', '', '04', '其他营业厅设施', '', '09', '单页架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1009', '22', '业务产品', '', '04', '其他营业厅设施', '', '10', '推荐牌', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1010', '22', '业务产品', '', '04', '其他营业厅设施', '', '11', '资料架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1011', '22', '业务产品', '', '04', '其他营业厅设施', '', '12', '标识牌', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1012', '22', '业务产品', '', '05', '市场营销印刷品', '', '01', '印制纸袋', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1013', '22', '业务产品', '', '05', '市场营销印刷品', '', '02', '业务受理单', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1014', '22', '业务产品', '', '05', '市场营销印刷品', '', '02', '业务受理单', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1015', '22', '业务产品', '', '05', '市场营销印刷品', '', '03', '宣传印刷品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1016', '22', '业务产品', '', '05', '市场营销印刷品', '', '03', '宣传印刷品', '', '2014-12-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1017', '22', '业务产品', '', '05', '市场营销印刷品', '', '03', '宣传印刷品', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1018', '22', '业务产品', '', '05', '市场营销印刷品', '', '99', '其他市场营销印刷品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1019', '22', '业务产品', '', '05', '市场营销印刷品', '', '99', '其他市场营销印刷品', '', '2014-12-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1020', '22', '业务产品', '', '05', '市场营销印刷品', '', '99', '其他市场营销印刷品', '', '2016-04-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1021', '23', '生活日用品', '', '01', '工业防护用品', '', '01', '头部防护', '', '2015-12-15 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1022', '23', '生活日用品', '', '01', '工业防护用品', '', '02', '身体防护', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1023', '23', '生活日用品', '', '01', '工业防护用品', '', '03', '急救用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1024', '23', '生活日用品', '', '01', '工业防护用品', '', '99', '其他工业防护用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1025', '23', '生活日用品', '', '02', '日常作业工具', '', '01', '梯子', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1026', '23', '生活日用品', '', '02', '日常作业工具', '', '02', '五金工具', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1027', '23', '生活日用品', '', '02', '日常作业工具', '', '03', '电动工具', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1028', '23', '生活日用品', '', '02', '日常作业工具', '', '99', '其他日常作业工具', '', '2015-06-11 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1029', '23', '生活日用品', '', '02', '日常作业工具', '', '99', '其他日常作业工具', '', '2015-09-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1030', '23', '生活日用品', '', '02', '日常作业工具', '', '99', '其他日常作业工具', '', '2015-12-15 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1031', '23', '生活日用品', '', '03', '服装鞋帽', '', '01', '营业厅服装', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1032', '23', '生活日用品', '', '03', '服装鞋帽', '', '02', '员工标志服', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1033', '23', '生活日用品', '', '03', '服装鞋帽', '', '03', '劳动防护服', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1034', '23', '生活日用品', '', '03', '服装鞋帽', '', '03', '劳动防护服', '', '2015-12-15 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1035', '23', '生活日用品', '', '03', '服装鞋帽', '', '04', '手套', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1036', '23', '生活日用品', '', '03', '服装鞋帽', '', '05', '绝缘鞋', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1037', '23', '生活日用品', '', '03', '服装鞋帽', '', '06', '胶皮鞋', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1038', '23', '生活日用品', '', '03', '服装鞋帽', '', '07', 'T恤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1039', '23', '生活日用品', '', '03', '服装鞋帽', '', '08', '帽子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1040', '23', '生活日用品', '', '03', '服装鞋帽', '', '09', '袜子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1041', '23', '生活日用品', '', '03', '服装鞋帽', '', '10', '围巾', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1042', '23', '生活日用品', '', '03', '服装鞋帽', '', '11', '服装配件', '', '2015-07-13 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1043', '23', '生活日用品', '', '03', '服装鞋帽', '', '99', '其他服装鞋帽', '', '2015-02-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1044', '23', '生活日用品', '', '03', '服装鞋帽', '', '99', '其他服装鞋帽', '', '2015-12-15 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1045', '23', '生活日用品', '', '04', '床上用品', '', '01', '被套', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1046', '23', '生活日用品', '', '04', '床上用品', '', '02', '床单', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1047', '23', '生活日用品', '', '04', '床上用品', '', '03', '被子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1048', '23', '生活日用品', '', '04', '床上用品', '', '04', '枕巾', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1049', '23', '生活日用品', '', '04', '床上用品', '', '05', '枕头', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1050', '23', '生活日用品', '', '04', '床上用品', '', '06', '床上套件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1051', '23', '生活日用品', '', '04', '床上用品', '', '07', '毯子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1052', '23', '生活日用品', '', '04', '床上用品', '', '08', '枕头套', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1053', '23', '生活日用品', '', '04', '床上用品', '', '99', '其他床上用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1054', '23', '生活日用品', '', '05', '厨卫用品', '', '01', '餐具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1055', '23', '生活日用品', '', '05', '厨卫用品', '', '02', '刀具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1056', '23', '生活日用品', '', '05', '厨卫用品', '', '03', '锅具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1057', '23', '生活日用品', '', '05', '厨卫用品', '', '04', '酒具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1058', '23', '生活日用品', '', '05', '厨卫用品', '', '05', '茶具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1059', '23', '生活日用品', '', '05', '厨卫用品', '', '07', '围裙', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1060', '23', '生活日用品', '', '05', '厨卫用品', '', '08', '保鲜盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1061', '23', '生活日用品', '', '05', '厨卫用品', '', '09', '佐料用具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1062', '23', '生活日用品', '', '05', '厨卫用品', '', '10', '毛巾', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1063', '23', '生活日用品', '', '05', '厨卫用品', '', '11', '浴巾', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1064', '23', '生活日用品', '', '05', '厨卫用品', '', '99', '其他厨卫用品', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1065', '23', '生活日用品', '', '06', '洗漱用品', '', '01', '香皂', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1066', '23', '生活日用品', '', '06', '洗漱用品', '', '02', '牙膏', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1067', '23', '生活日用品', '', '06', '洗漱用品', '', '03', '牙刷', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1068', '23', '生活日用品', '', '06', '洗漱用品', '', '04', '沐浴露', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1069', '23', '生活日用品', '', '06', '洗漱用品', '', '05', '洗发水', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1070', '23', '生活日用品', '', '06', '洗漱用品', '', '06', '沐浴套装', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1071', '23', '生活日用品', '', '06', '洗漱用品', '', '07', '洗漱包', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1072', '23', '生活日用品', '', '06', '洗漱用品', '', '99', '其他洗漱用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1073', '23', '生活日用品', '', '07', '洗涤用品', '', '01', '洗衣粉', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1074', '23', '生活日用品', '', '07', '洗涤用品', '', '02', '洗衣皂', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1075', '23', '生活日用品', '', '07', '洗涤用品', '', '03', '洗衣液', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1076', '23', '生活日用品', '', '07', '洗涤用品', '', '99', '其他洗涤用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1077', '23', '生活日用品', '', '08', '个人护理', '', '01', '护肤用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1078', '23', '生活日用品', '', '08', '个人护理', '', '99', '其他个人护理用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1079', '23', '生活日用品', '', '09', '家居生活', '', '01', '雨具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1080', '23', '生活日用品', '', '09', '家居生活', '', '02', '钟表', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1081', '23', '生活日用品', '', '09', '家居生活', '', '03', '挂饰', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1082', '23', '生活日用品', '', '09', '家居生活', '', '04', '美甲套装', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1083', '23', '生活日用品', '', '09', '家居生活', '', '05', '工具套件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1084', '23', '生活日用品', '', '09', '家居生活', '', '07', '广告扇', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1085', '23', '生活日用品', '', '09', '家居生活', '', '08', '电筒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1086', '23', '生活日用品', '', '09', '家居生活', '', '09', '帐篷', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1087', '23', '生活日用品', '', '09', '家居生活', '', '10', '野餐包', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1088', '23', '生活日用品', '', '09', '家居生活', '', '11', '吊床', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1089', '23', '生活日用品', '', '09', '家居生活', '', '12', '睡袋', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1090', '23', '生活日用品', '', '09', '家居生活', '', '13', '太阳伞', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1091', '23', '生活日用品', '', '09', '家居生活', '', '14', '挂钩', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1092', '23', '生活日用品', '', '09', '家居生活', '', '15', '钥匙扣', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1093', '23', '生活日用品', '', '09', '家居生活', '', '16', '扑克牌', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1094', '23', '生活日用品', '', '09', '家居生活', '', '99', '其他家居生活用品', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1095', '23', '生活日用品', '', '10', '容器储物', '', '01', '杯子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1096', '23', '生活日用品', '', '10', '容器储物', '', '02', '水壶', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1097', '23', '生活日用品', '', '10', '容器储物', '', '03', '收纳', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1098', '23', '生活日用品', '', '10', '容器储物', '', '99', '其他容器储物', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1099', '23', '生活日用品', '', '11', '保健用品', '', '01', '药盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1100', '23', '生活日用品', '', '11', '保健用品', '', '02', '按摩器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1101', '23', '生活日用品', '', '11', '保健用品', '', '03', '体温计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1102', '23', '生活日用品', '', '11', '保健用品', '', '04', '血压计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1103', '23', '生活日用品', '', '11', '保健用品', '', '06', '人体秤', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1104', '23', '生活日用品', '', '11', '保健用品', '', '07', '足浴器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1105', '23', '生活日用品', '', '11', '保健用品', '', '99', '其他保健用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1106', '23', '生活日用品', '', '12', '图书', '', '01', '工具书', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1107', '23', '生活日用品', '', '12', '图书', '', '02', '文学名著', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1108', '23', '生活日用品', '', '12', '图书', '', '99', '其他图书', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1109', '23', '生活日用品', '', '13', '食品', '', '01', '酒类', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1110', '23', '生活日用品', '', '13', '食品', '', '02', '饮料', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1111', '23', '生活日用品', '', '13', '食品', '', '03', '食用油', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1112', '23', '生活日用品', '', '13', '食品', '', '04', '休闲食品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1113', '23', '生活日用品', '', '13', '食品', '', '05', '杂粮', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1114', '23', '生活日用品', '', '13', '食品', '', '99', '其他食品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1115', '23', '生活日用品', '', '14', '汽车软装', '', '01', '腰靠', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1116', '23', '生活日用品', '', '14', '汽车软装', '', '02', '防滑垫', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1117', '23', '生活日用品', '', '14', '汽车软装', '', '03', '护颈枕', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1118', '23', '生活日用品', '', '14', '汽车软装', '', '04', '抱枕', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1119', '23', '生活日用品', '', '14', '汽车软装', '', '99', '其他汽车软装', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1120', '23', '生活日用品', '', '15', '玩具', '', '01', '学习机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1121', '23', '生活日用品', '', '15', '玩具', '', '02', '玩具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1122', '23', '生活日用品', '', '15', '玩具', '', '09', '童车 ', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1123', '23', '生活日用品', '', '15', '玩具', '', '99', '其他玩具 ', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1124', '23', '生活日用品', '', '16', '母婴用品', '', '01', '妈咪包', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1125', '23', '生活日用品', '', '16', '母婴用品', '', '02', '婴儿指甲钳', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1126', '23', '生活日用品', '', '16', '母婴用品', '', '03', '奶瓶', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1127', '23', '生活日用品', '', '16', '母婴用品', '', '04', '热奶器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1128', '23', '生活日用品', '', '16', '母婴用品', '', '05', '婴儿枕头', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1129', '23', '生活日用品', '', '16', '母婴用品', '', '06', '婴儿水杯', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1130', '23', '生活日用品', '', '16', '母婴用品', '', '99', '其他母婴用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1131', '23', '生活日用品', '', '17', '箱包皮具', '', '01', '皮带', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1132', '23', '生活日用品', '', '17', '箱包皮具', '', '02', '包', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1133', '23', '生活日用品', '', '17', '箱包皮具', '', '03', '箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1134', '23', '生活日用品', '', '17', '箱包皮具', '', '99', '其他箱包皮具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1135', '23', '生活日用品', '', '18', '健身用品', '', '01', '登山杖', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1136', '23', '生活日用品', '', '18', '健身用品', '', '02', '球类', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1137', '23', '生活日用品', '', '18', '健身用品', '', '03', '瑜伽垫', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1138', '23', '生活日用品', '', '18', '健身用品', '', '04', '游泳眼镜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1139', '23', '生活日用品', '', '18', '健身用品', '', '06', '自行车', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1140', '23', '生活日用品', '', '18', '健身用品', '', '99', '其他健身用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1141', '23', '生活日用品', '', '19', '家居布艺', '', '01', '窗帘', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1142', '23', '生活日用品', '', '19', '家居布艺', '', '02', '门帘', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1143', '23', '生活日用品', '', '19', '家居布艺', '', '03', '地毯', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1144', '23', '生活日用品', '', '19', '家居布艺', '', '04', '靠垫', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1145', '23', '生活日用品', '', '19', '家居布艺', '', '99', '其他家居布艺', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1146', '23', '生活日用品', '', '20', '清洁工具', '', '01', '抹布', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1147', '23', '生活日用品', '', '20', '清洁工具', '', '02', '拖把', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1148', '23', '生活日用品', '', '20', '清洁工具', '', '03', '扫帚', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1149', '23', '生活日用品', '', '20', '清洁工具', '', '04', '簸箕', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1150', '23', '生活日用品', '', '20', '清洁工具', '', '05', '海棉', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1151', '23', '生活日用品', '', '20', '清洁工具', '', '06', '刷子', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1152', '23', '生活日用品', '', '20', '清洁工具', '', '99', '其他清洁工具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1153', '23', '生活日用品', '', '22', '工艺制品', '', '01', '陶瓷工艺制品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1154', '23', '生活日用品', '', '22', '工艺制品', '', '02', '锡器工艺制品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1155', '23', '生活日用品', '', '22', '工艺制品', '', '03', '琉璃工艺制品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1156', '23', '生活日用品', '', '22', '工艺制品', '', '04', '古玩', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1157', '23', '生活日用品', '', '22', '工艺制品', '', '05', '银器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1158', '23', '生活日用品', '', '22', '工艺制品', '', '06', '玉器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1159', '23', '生活日用品', '', '22', '工艺制品', '', '07', '水晶', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1160', '23', '生活日用品', '', '22', '工艺制品', '', '08', '木雕', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1161', '23', '生活日用品', '', '22', '工艺制品', '', '09', '布艺', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1162', '23', '生活日用品', '', '22', '工艺制品', '', '10', '树脂', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1163', '23', '生活日用品', '', '22', '工艺制品', '', '99', '其他工艺制品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1164', '23', '生活日用品', '', '23', '贺年品', '', '01', '挂历', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1165', '23', '生活日用品', '', '23', '贺年品', '', '02', '台历', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1166', '23', '生活日用品', '', '23', '贺年品', '', '03', '春联套装', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1167', '23', '生活日用品', '', '23', '贺年品', '', '99', '其他贺年品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1168', '23', '生活日用品', '', '24', '兑换类礼品', '', '01', '餐饮连锁', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1169', '23', '生活日用品', '', '24', '兑换类礼品', '', '02', '实体卡券', '', '2016-02-02 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1170', '23', '生活日用品', '', '24', '兑换类礼品', '', '03', '银行合作', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1171', '23', '生活日用品', '', '24', '兑换类礼品', '', '04', '航空里程', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1172', '23', '生活日用品', '', '24', '兑换类礼品', '', '08', '生活服务', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1173', '23', '生活日用品', '', '24', '兑换类礼品', '', '09', '健康美容', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1174', '23', '生活日用品', '', '24', '兑换类礼品', '', '99', '其他兑换礼品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1175', '23', '生活日用品', '', '50', '电商平台', '', '01', '电商平台', '', '2016-01-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1176', '24', '办公用品', '', '01', '办公设备', '', '01', '传真机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1177', '24', '办公用品', '', '01', '办公设备', '', '02', '打印机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1178', '24', '办公用品', '', '01', '办公设备', '', '02', '打印机', '', '2015-02-27 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1179', '24', '办公用品', '', '01', '办公设备', '', '03', '多功能一体机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1180', '24', '办公用品', '', '01', '办公设备', '', '03', '多功能一体机', '', '2015-02-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1181', '24', '办公用品', '', '01', '办公设备', '', '04', '复印机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1182', '24', '办公用品', '', '01', '办公设备', '', '05', '扫描仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1183', '24', '办公用品', '', '01', '办公设备', '', '07', '投影演示用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1184', '24', '办公用品', '', '01', '办公设备', '', '11', '装订及塑封设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1185', '24', '办公用品', '', '01', '办公设备', '', '15', '标签打印设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1186', '24', '办公用品', '', '01', '办公设备', '', '16', '标签识别设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1187', '24', '办公用品', '', '01', '办公设备', '', '16', '标签识别设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1188', '24', '办公用品', '', '01', '办公设备', '', '17', '考勤设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1189', '24', '办公用品', '', '01', '办公设备', '', '18', '拍摄设备及附件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1190', '24', '办公用品', '', '01', '办公设备', '', '18', '拍摄设备及附件', '', '2015-11-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1191', '24', '办公用品', '', '01', '办公设备', '', '23', '条码设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1192', '24', '办公用品', '', '01', '办公设备', '', '24', '计算器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1193', '24', '办公用品', '', '01', '办公设备', '', '98', '办公设备配件', '', '2015-01-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1194', '24', '办公用品', '', '01', '办公设备', '', '99', '其他设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1195', '24', '办公用品', '', '02', '办公耗材', '', '01', '墨盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1196', '24', '办公用品', '', '02', '办公耗材', '', '02', '硒鼓', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1197', '24', '办公用品', '', '02', '办公耗材', '', '03', '碳粉', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1198', '24', '办公用品', '', '02', '办公耗材', '', '04', '色带', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1199', '24', '办公用品', '', '02', '办公耗材', '', '05', '墨水', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1200', '24', '办公用品', '', '02', '办公耗材', '', '06', '刻录盘', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1201', '24', '办公用品', '', '02', '办公耗材', '', '99', '其他办公耗材', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1202', '24', '办公用品', '', '02', '办公耗材', '', '99', '其他办公耗材', '', '2015-03-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1203', '24', '办公用品', '', '03', '打印用纸', '', '01', '复印纸', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1204', '24', '办公用品', '', '03', '打印用纸', '', '02', '相片纸', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1205', '24', '办公用品', '', '03', '打印用纸', '', '03', '艺术纸', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1206', '24', '办公用品', '', '03', '打印用纸', '', '99', '其他打印用纸', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1207', '24', '办公用品', '', '03', '打印用纸', '', '99', '其他打印用纸', '', '2014-12-29 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1208', '24', '办公用品', '', '04', '办公工具', '', '01', '书写修正工具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1209', '24', '办公用品', '', '04', '办公工具', '', '03', '软木板/白板及附件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1210', '24', '办公用品', '', '04', '办公工具', '', '05', '文具盒', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1211', '24', '办公用品', '', '04', '办公工具', '', '10', '文件夹容器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1212', '24', '办公用品', '', '04', '办公工具', '', '11', '薄本', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1213', '24', '办公用品', '', '04', '办公工具', '', '21', '纸张装订工具及附件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1214', '24', '办公用品', '', '04', '办公工具', '', '36', '财务行政用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1215', '24', '办公用品', '', '04', '办公工具', '', '43', '标签识别', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1216', '24', '办公用品', '', '04', '办公工具', '', '43', '标签识别', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1217', '24', '办公用品', '', '04', '办公工具', '', '44', '标识展示', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1218', '24', '办公用品', '', '04', '办公工具', '', '48', '邮寄运输用品', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1219', '24', '办公用品', '', '04', '办公工具', '', '99', '其他办公文具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1220', '24', '办公用品', '', '04', '办公工具', '', '99', '其他办公文具', '', '2015-01-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1221', '24', '办公用品', '', '08', '家具', '', '01', '桌台', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1222', '24', '办公用品', '', '08', '家具', '', '02', '椅', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1223', '24', '办公用品', '', '08', '家具', '', '03', '沙发', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1224', '24', '办公用品', '', '08', '家具', '', '04', '茶几', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1225', '24', '办公用品', '', '08', '家具', '', '05', '橱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1226', '24', '办公用品', '', '08', '家具', '', '06', '柜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1227', '24', '办公用品', '', '08', '家具', '', '07', '营业厅家具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1228', '24', '办公用品', '', '08', '家具', '', '07', '营业厅家具', '', '2016-04-28 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1229', '24', '办公用品', '', '08', '家具', '', '99', '其他家具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1230', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '01', '普通轿车', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1231', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '02', '多用途汽车MPV', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1232', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '03', '越野汽车', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1233', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '04', '客车', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1234', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '05', '载货汽车', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1235', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '06', '摩托车', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1236', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '07', '特殊陆路交通工具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1237', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '07', '特殊陆路交通工具', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1238', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '08', '特殊水路交通工具', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1239', '25', '交通运输及仓储物流设备', '', '01', '交通工具', '', '99', '其他交通工具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1240', '25', '交通运输及仓储物流设备', '', '02', '仓储设备', '', '01', '仓储盒/仓储笼', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1241', '25', '交通运输及仓储物流设备', '', '02', '仓储设备', '', '02', '托盘', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1242', '25', '交通运输及仓储物流设备', '', '02', '仓储设备', '', '03', '周转箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1243', '25', '交通运输及仓储物流设备', '', '02', '仓储设备', '', '04', '货架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1244', '25', '交通运输及仓储物流设备', '', '03', '搬运装卸设备', '', '01', '叉车', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1245', '25', '交通运输及仓储物流设备', '', '03', '搬运装卸设备', '', '01', '叉车', '', '2015-07-13 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1246', '25', '交通运输及仓储物流设备', '', '03', '搬运装卸设备', '', '02', '登车桥', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1247', '25', '交通运输及仓储物流设备', '', '03', '搬运装卸设备', '', '03', '升降机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1248', '25', '交通运输及仓储物流设备', '', '03', '搬运装卸设备', '', '04', '托盘搬运车/手推车', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1249', '25', '交通运输及仓储物流设备', '', '03', '搬运装卸设备', '', '04', '托盘搬运车/手推车', '', '2015-07-13 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1250', '25', '交通运输及仓储物流设备', '', '03', '搬运装卸设备', '', '04', '托盘搬运车/手推车', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1251', '25', '交通运输及仓储物流设备', '', '04', '成品油', '', '01', '柴油', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1252', '25', '交通运输及仓储物流设备', '', '04', '成品油', '', '02', '汽油', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1253', '25', '交通运输及仓储物流设备', '', '04', '成品油', '', '03', '润滑油', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1254', '26', '土建设备及产品', '', '01', '电梯', '', '01', '扶手电梯', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1255', '26', '土建设备及产品', '', '01', '电梯', '', '02', '厢式电梯', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1256', '26', '土建设备及产品', '', '01', '电梯', '', '02', '厢式电梯', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1257', '26', '土建设备及产品', '', '02', '楼宇智能化及安防产品', '', '01', '楼宇监控设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1258', '26', '土建设备及产品', '', '02', '楼宇智能化及安防产品', '', '02', '门禁及防盗设备', '', '2015-09-01 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1259', '26', '土建设备及产品', '', '02', '楼宇智能化及安防产品', '', '03', '安全与防护设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1260', '26', '土建设备及产品', '', '02', '楼宇智能化及安防产品', '', '09', '大屏幕显示系统', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1261', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '01', '营业用房', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1262', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '02', '综合机房', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1263', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '03', '基站机房', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1264', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '04', '客服用房', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1265', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '05', '仓储物流用房', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1266', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '06', '综合楼', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1267', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '07', '土地购置', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1268', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '08', '土地补偿', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1269', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '09', '土地使用权', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1270', '26', '土建设备及产品', '', '03', '土地及房屋购置', '', '99', '其它用房', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1271', '26', '土建设备及产品', '', '04', '物业设施', '', '01', '铲雪机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1272', '26', '土建设备及产品', '', '04', '物业设施', '', '02', '割草机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1273', '26', '土建设备及产品', '', '04', '物业设施', '', '03', '锅炉', '', '2015-11-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1274', '26', '土建设备及产品', '', '04', '物业设施', '', '04', '机械停车设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1275', '26', '土建设备及产品', '', '04', '物业设施', '', '05', '路灯', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1276', '26', '土建设备及产品', '', '04', '物业设施', '', '06', '地灯', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1277', '26', '土建设备及产品', '', '04', '物业设施', '', '07', '水泵', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1278', '26', '土建设备及产品', '', '04', '物业设施', '', '08', '电动门', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1279', '26', '土建设备及产品', '', '04', '物业设施', '', '09', '防盗网', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1280', '26', '土建设备及产品', '', '05', '消防产品', '', '01', '防火设备及材料', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1281', '26', '土建设备及产品', '', '05', '消防产品', '', '01', '防火设备及材料', '', '2015-01-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1282', '26', '土建设备及产品', '', '05', '消防产品', '', '01', '防火设备及材料', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1283', '26', '土建设备及产品', '', '05', '消防产品', '', '02', '火灾自动探测报警设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1284', '26', '土建设备及产品', '', '05', '消防产品', '', '03', '灭火系统设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1285', '26', '土建设备及产品', '', '05', '消防产品', '', '03', '灭火系统设备', '', '2015-01-28 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1286', '26', '土建设备及产品', '', '05', '消防产品', '', '03', '灭火系统设备', '', '2015-10-15 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1287', '26', '土建设备及产品', '', '05', '消防产品', '', '03', '灭火系统设备', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1288', '26', '土建设备及产品', '', '05', '消防产品', '', '04', '气体灭火产品', '', '2015-01-16 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1289', '26', '土建设备及产品', '', '05', '消防产品', '', '05', '热反射隔热涂料', '', '2015-05-28 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1290', '26', '土建设备及产品', '', '05', '消防产品', '', '06', '吸气式感烟火灾探测报警系统', '', '2015-08-20 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1291', '26', '土建设备及产品', '', '06', '厨房设备', '', '01', '厨房设备', '', '2015-04-21 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1292', '27', '日用电器', '', '01', '厨房电器', '', '01', '煎烤机电饼铛', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1293', '27', '日用电器', '', '01', '厨房电器', '', '02', '电磁炉', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1294', '27', '日用电器', '', '01', '厨房电器', '', '03', '电炖盅', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1295', '27', '日用电器', '', '01', '厨房电器', '', '04', '电饭煲', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1296', '27', '日用电器', '', '01', '厨房电器', '', '05', '电烤箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1297', '27', '日用电器', '', '01', '厨房电器', '', '06', '电水壶', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1298', '27', '日用电器', '', '01', '厨房电器', '', '07', '电压力锅', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1299', '27', '日用电器', '', '01', '厨房电器', '', '08', '电蒸锅', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1300', '27', '日用电器', '', '01', '厨房电器', '', '09', '榨汁机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1301', '27', '日用电器', '', '01', '厨房电器', '', '10', '食物料理机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1302', '27', '日用电器', '', '01', '厨房电器', '', '12', '面包机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1303', '27', '日用电器', '', '01', '厨房电器', '', '13', '煮蛋器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1304', '27', '日用电器', '', '01', '厨房电器', '', '14', '咖啡机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1305', '27', '日用电器', '', '01', '厨房电器', '', '15', '电冰箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1306', '27', '日用电器', '', '01', '厨房电器', '', '16', '饮水机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1307', '27', '日用电器', '', '01', '厨房电器', '', '17', '净水器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1308', '27', '日用电器', '', '01', '厨房电器', '', '18', '微波炉', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1309', '27', '日用电器', '', '01', '厨房电器', '', '20', '豆浆机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1310', '27', '日用电器', '', '01', '厨房电器', '', '21', '酸奶机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1311', '27', '日用电器', '', '01', '厨房电器', '', '22', '消毒柜/洗碗机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1312', '27', '日用电器', '', '01', '厨房电器', '', '24', '电炸锅', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1313', '27', '日用电器', '', '01', '厨房电器', '', '25', '保温器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1314', '27', '日用电器', '', '01', '厨房电器', '', '26', '电火锅', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1315', '27', '日用电器', '', '02', '日常电器', '', '01', '洗衣机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1316', '27', '日用电器', '', '02', '日常电器', '', '02', '脱水机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1317', '27', '日用电器', '', '02', '日常电器', '', '03', '干衣机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1318', '27', '日用电器', '', '02', '日常电器', '', '04', '电热淋浴器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1319', '27', '日用电器', '', '02', '日常电器', '', '05', '吸尘器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1320', '27', '日用电器', '', '02', '日常电器', '', '06', '电烫斗', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1321', '27', '日用电器', '', '02', '日常电器', '', '07', '电熨机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1322', '27', '日用电器', '', '02', '日常电器', '', '08', '空气净化器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1323', '27', '日用电器', '', '02', '日常电器', '', '09', '空气加湿器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1324', '27', '日用电器', '', '02', '日常电器', '', '10', '吸湿机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1325', '27', '日用电器', '', '02', '日常电器', '', '11', '电吹风', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1326', '27', '日用电器', '', '02', '日常电器', '', '12', '电动牙刷', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1327', '27', '日用电器', '', '02', '日常电器', '', '13', '剃须刀', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1328', '27', '日用电器', '', '02', '日常电器', '', '14', '毛发修剪器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1329', '27', '日用电器', '', '02', '日常电器', '', '15', '暖被机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1330', '27', '日用电器', '', '02', '日常电器', '', '16', '杀菌机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1331', '27', '日用电器', '', '02', '日常电器', '', '17', '电风扇/空调扇', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1332', '27', '日用电器', '', '02', '日常电器', '', '19', '日用取暖电炉及附件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1333', '27', '日用电器', '', '02', '日常电器', '', '20', '电热毯', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1334', '27', '日用电器', '', '02', '日常电器', '', '21', '干鞋器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1335', '27', '日用电器', '', '02', '日常电器', '', '22', '擦鞋机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1336', '27', '日用电器', '', '02', '日常电器', '', '23', '电蚊香器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1337', '27', '日用电器', '', '02', '日常电器', '', '99', '其他日常电器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1338', '27', '日用电器', '', '03', '日常电气设备', '', '01', '开关插座', '', '2016-04-07 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1339', '27', '日用电器', '', '03', '日常电气设备', '', '02', '接线板', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1340', '27', '日用电器', '', '03', '日常电气设备', '', '99', '其他日常电器设备', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1341', '27', '日用电器', '', '04', '民用灯具', '', '01', '灯饰照明', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1342', '27', '日用电器', '', '04', '民用灯具', '', '12', '灯具配件', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1343', '27', '日用电器', '', '04', '民用灯具', '', '99', '其他民用灯具', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1344', '27', '日用电器', '', '05', '媒体播放', '', '01', '电视机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1345', '27', '日用电器', '', '05', '媒体播放', '', '01', '电视机', '', '2015-01-14 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1346', '27', '日用电器', '', '05', '媒体播放', '', '01', '电视机', '', '2015-02-12 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1347', '27', '日用电器', '', '05', '媒体播放', '', '02', 'DVD播放机', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1348', '27', '日用电器', '', '05', '媒体播放', '', '03', '数码播放器', '', '2015-11-26 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1349', '27', '日用电器', '', '05', '媒体播放', '', '04', '数码相框', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1350', '27', '日用电器', '', '05', '媒体播放', '', '05', '手机投影仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1351', '27', '日用电器', '', '05', '媒体播放', '', '06', '液晶屏', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1352', '27', '日用电器', '', '05', '媒体播放', '', '07', '数码音响', '', '2015-11-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1353', '27', '日用电器', '', '05', '媒体播放', '', '99', '其他媒体播放', '', '2014-11-24 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1354', '27', '日用电器', '', '06', '车载电器', '', '01', '车载MP3', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1355', '27', '日用电器', '', '06', '车载电器', '', '02', '车载冰箱', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1356', '27', '日用电器', '', '06', '车载电器', '', '03', '车载氧吧', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1357', '27', '日用电器', '', '06', '车载电器', '', '04', '轮胎测压计', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1358', '27', '日用电器', '', '06', '车载电器', '', '05', '车载导航仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1359', '27', '日用电器', '', '06', '车载电器', '', '06', '车载行车记录仪', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1360', '27', '日用电器', '', '06', '车载电器', '', '99', '其他车载电器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1361', '27', '日用电器', '', '07', '电器终端配件', '', '01', '充电器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1362', '27', '日用电器', '', '07', '电器终端配件', '', '02', '手机架托', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1363', '27', '日用电器', '', '07', '电器终端配件', '', '03', '手机挂饰', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1364', '27', '日用电器', '', '07', '电器终端配件', '', '04', '手机贴膜', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1365', '27', '日用电器', '', '07', '电器终端配件', '', '05', '数据线', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1366', '27', '日用电器', '', '07', '电器终端配件', '', '06', '清洁套装', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1367', '27', '日用电器', '', '07', '电器终端配件', '', '07', '移动电源', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1368', '27', '日用电器', '', '07', '电器终端配件', '', '08', '存储卡', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1369', '27', '日用电器', '', '07', '电器终端配件', '', '09', '手机保护套', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1370', '27', '日用电器', '', '07', '电器终端配件', '', '10', '耳机耳麦', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1371', '27', '日用电器', '', '07', '电器终端配件', '', '11', '鼠标垫', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1372', '27', '日用电器', '', '07', '电器终端配件', '', '12', '电脑桌电脑支架', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1373', '27', '日用电器', '', '07', '电器终端配件', '', '13', '键盘贴', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1374', '27', '日用电器', '', '07', '电器终端配件', '', '14', '平板电脑保护套', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1375', '27', '日用电器', '', '07', '电器终端配件', '', '16', '触控笔', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1376', '27', '日用电器', '', '07', '电器终端配件', '', '17', '绕线器', '', '2014-11-08 00:00:00');
--INSERT INTO `catalog_info` VALUES ('1377', '27', '日用电器', '', '07', '电器终端配件', '', '99', '其他配件', '', '2014-11-08 00:00:00');

-- ----------------------------
-- Table structure for `region_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `region_info` (
  `region_id` varchar(50) NOT NULL COMMENT '区域ID',
  `region_name` varchar(200) NOT NULL COMMENT '区域名称',
  `parent_id` varchar(50) NOT NULL COMMENT '父区域ID',
  `region_order` int(11) NOT NULL COMMENT '排序',
  `level` int(11) NOT NULL COMMENT '级别',
  PRIMARY KEY (`region_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_region_info_region_id` ON `region_info`(`region_id`); 
CREATE INDEX `idx_region_info_parent_id` ON `region_info`(`parent_id`);  

DELETE FROM `region_info`;
-- ----------------------------
-- Records of region_info
-- ----------------------------
INSERT INTO `region_info` VALUES ('zgs', '总公司', '0', '1', '1');
INSERT INTO `region_info` VALUES ('sgs', '省公司', '0', '2', '1');
INSERT INTO `region_info` VALUES ('AH', '安徽', 'sgs', '13', '2');
INSERT INTO `region_info` VALUES ('BJ', '北京', 'sgs', '2', '2');
INSERT INTO `region_info` VALUES ('CMDC', '终端公司', 'zgs', '34', '2');
INSERT INTO `region_info` VALUES ('CMFC', '财务公司', 'zgs', '36', '2');
INSERT INTO `region_info` VALUES ('CMHY', '杭州研发中心', 'sgs', '42', '2');
INSERT INTO `region_info` VALUES ('CMIC', '互联网公司', 'zgs', '45', '2');
INSERT INTO `region_info` VALUES ('CMSS', '苏州研发中心', 'sgs', '41', '2');
INSERT INTO `region_info` VALUES ('CMTT', '中移铁通', 'zgs', '49', '2');
INSERT INTO `region_info` VALUES ('CMZX', '在线服务公司', 'zgs', '43', '2');
INSERT INTO `region_info` VALUES ('CQ', '重庆', 'sgs', '23', '2');
INSERT INTO `region_info` VALUES ('DI', '设计院', 'zgs', '33', '2');
INSERT INTO `region_info` VALUES ('FJ', '福建', 'sgs', '14', '2');
INSERT INTO `region_info` VALUES ('GD', '广东', 'sgs', '20', '2');
INSERT INTO `region_info` VALUES ('GS', '甘肃', 'sgs', '29', '2');
INSERT INTO `region_info` VALUES ('GX', '广西', 'sgs', '22', '2');
INSERT INTO `region_info` VALUES ('GZ', '贵州', 'sgs', '25', '2');
INSERT INTO `region_info` VALUES ('HA', '河南', 'sgs', '17', '2');
INSERT INTO `region_info` VALUES ('HB ', '湖北', 'sgs ', '18', '2');
INSERT INTO `region_info` VALUES ('HE', '河北', 'sgs', '4', '2');
INSERT INTO `region_info` VALUES ('HI', '海南', 'sgs', '21', '2');
INSERT INTO `region_info` VALUES ('HL', '黑龙江', 'sgs', '9', '2');
INSERT INTO `region_info` VALUES ('HN', '湖南', 'sgs', '19', '2');
INSERT INTO `region_info` VALUES ('HQ', '集团公司', 'zgs', '1', '2');
INSERT INTO `region_info` VALUES ('IHC', '信息港中心', 'zgs', '47', '2');
INSERT INTO `region_info` VALUES ('IOT', '物联网公司', 'zgs', '37', '2');
INSERT INTO `region_info` VALUES ('ISC', '信安中心', 'zgs', '48', '2');
INSERT INTO `region_info` VALUES ('JL', '吉林', 'sgs', '8', '2');
INSERT INTO `region_info` VALUES ('JS', '江苏', 'sgs', '11', '2');
INSERT INTO `region_info` VALUES ('JX', '江西', 'sgs', '15', '2');
INSERT INTO `region_info` VALUES ('LN', '辽宁', 'sgs', '7', '2');
INSERT INTO `region_info` VALUES ('MG', '咪咕公司', 'zgs', '44', '2');
INSERT INTO `region_info` VALUES ('NM', '内蒙', 'sgs', '6', '2');
INSERT INTO `region_info` VALUES ('NX', '宁夏', 'sgs', '31', '2');
INSERT INTO `region_info` VALUES ('PSC', '采购共享中心', 'zgs', '38', '2');
INSERT INTO `region_info` VALUES ('QH', '青海', 'sgs', '30', '2');
INSERT INTO `region_info` VALUES ('SC', '四川', 'sgs', '24', '2');
INSERT INTO `region_info` VALUES ('SD', '山东', 'sgs', '16', '2');
INSERT INTO `region_info` VALUES ('SH', '上海', 'sgs', '10', '2');
INSERT INTO `region_info` VALUES ('SN', '陕西', 'sgs', '28', '2');
INSERT INTO `region_info` VALUES ('SX', '山西', 'sgs', '5', '2');
INSERT INTO `region_info` VALUES ('SZ', '深圳公司', 'sgs', '40', '2');
INSERT INTO `region_info` VALUES ('TJ', '天津', 'sgs', '3', '2');
INSERT INTO `region_info` VALUES ('XJ', '新疆', 'sgs', '32', '2');
INSERT INTO `region_info` VALUES ('XZ', '西藏', 'sgs', '27', '2');
INSERT INTO `region_info` VALUES ('YDXY', '移动学院', 'zgs', '46', '2');
INSERT INTO `region_info` VALUES ('YJY', '研究院', 'zgs', '39', '2');
INSERT INTO `region_info` VALUES ('YN', '云南', 'sgs', '26', '2');
INSERT INTO `region_info` VALUES ('ZJ', '浙江', 'sgs', '12', '2');
INSERT INTO `region_info` VALUES ('ZQGS', '政企分公司', 'zgs', '35', '2');

-- ----------------------------
-- Table structure for `peroid_type_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `peroid_type_info` (
  `peroid_type_id` varchar(10) NOT NULL,
  `peroid_type_name` varchar(50) NOT NULL,
  `peroid_days` int NOT NULL,
  `type_order` int(11) NOT NULL,
  PRIMARY KEY (`peroid_type_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_peroid_type_info_peroid_type_id` ON `peroid_type_info`(`peroid_type_id`); 

DELETE FROM `peroid_type_info`;
-- ----------------------------
-- Records of peroid_type_info
-- ----------------------------
INSERT INTO `peroid_type_info` VALUES ('1', '一天', 1, 1);
INSERT INTO `peroid_type_info` VALUES ('2', '三天', 3, 2);
INSERT INTO `peroid_type_info` VALUES ('3', '一周', 7, 3);
INSERT INTO `peroid_type_info` VALUES ('4', '一个月', 30, 4);

-- ----------------------------
-- Table structure for cust_info
-- ----------------------------
CREATE TABLE IF NOT EXISTS `cust_info` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `login_name` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `mobile_phone` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `id_type` varchar(2) DEFAULT NULL,
  `id_number` varchar(64) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `birthday` varchar(8) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `nationality` varchar(256) DEFAULT NULL,
  `race` varchar(64) DEFAULT NULL,
  `married_status` varchar(2) DEFAULT NULL,
  `education` varchar(2) DEFAULT NULL,
  `occupation` varchar(2) DEFAULT NULL,
  `salary` varchar(2) DEFAULT NULL,
  `nick_name` varchar(64) DEFAULT NULL,
  `is_pay_user` varchar(2) NOT NULL,
  `valid_time_end` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_cust_info_login_name` ON `cust_info`(`login_name`); 
CREATE INDEX `idx_cust_info_mobile_phone` ON `cust_info`(`mobile_phone`); 
CREATE INDEX `idx_cust_info_password` ON `cust_info`(`password`); 

-- ----------------------------
-- Table structure for `pay_cust_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `pay_cust_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(200) NOT NULL COMMENT '用户id',
  `user_type` char(1) NOT NULL COMMENT '资费用户归属,1:移动自然人，2:供应商',
  `customer_number` varchar(30) NOT NULL COMMENT '客户编码,政企BOSS为客户生成的唯一编码',
  `product_order_number` varchar(19) NOT NULL COMMENT '基础产品订单号',
  `order_id` varchar(20) NOT NULL COMMENT '基础产品订购关系ID',
  `opr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_pay_cust_info_user_id` ON `pay_cust_info`(`user_id`); 
CREATE INDEX `idx_pay_cust_info_customer_number` ON `pay_cust_info`(`customer_number`); 

-- ----------------------------
-- Table structure for veri_code
-- ----------------------------
CREATE TABLE IF NOT EXISTS `veri_code` (
  `_id` int(64) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `mobile_phone` varchar(64) NOT NULL,
  `service_type` varchar(2) NOT NULL COMMENT '1:注册验证,2:密码找回,3.公告相关',
  `login_name` varchar(64) NOT NULL,
  `creat_time` datetime NOT NULL,
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_veri_code_code` ON `veri_code`(`code`); 
CREATE INDEX `idx_veri_login_name` ON `veri_code`(`login_name`); 
CREATE INDEX `idx_veri_mobile_phone` ON `veri_code`(`mobile_phone`); 

-- ----------------------------
-- Table structure for system_notice_info
-- ----------------------------
CREATE TABLE IF NOT EXISTS `system_notice_info` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notice_id` varchar(200) NOT NULL COMMENT '消息ID',
  `notice_title` varchar(500) NOT NULL COMMENT '通知标题',
  `pub_time` datetime NOT NULL COMMENT '发布时间',
  `pub_user` varchar(200) NOT NULL COMMENT '发布人',
  `create_user` varchar(200) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `audit_time` datetime NOT NULL COMMENT '审核时间',
  `content` longtext NOT NULL COMMENT '正文内容',
  `last_update_date` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`_id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX `idx_system_notice_info_notice_id` ON `system_notice_info`(`notice_id`); 
