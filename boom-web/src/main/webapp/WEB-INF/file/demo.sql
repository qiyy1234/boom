/*
Navicat MySQL Data Transfer

Source Server         : 5.5.22
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2016-09-03 20:31:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` varchar(50) DEFAULT NULL COMMENT 'id',
  `dict_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '值',
  `dict_parent_id` varchar(50) DEFAULT NULL COMMENT '父id',
  `dict_sort` int(255) DEFAULT NULL COMMENT '排序',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `dict_type` varchar(255) DEFAULT NULL COMMENT '类型',
  `create_user` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `dict_level` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', '性别', null, '0', '1', null, 'sex', null, null, null, null, '0');
INSERT INTO `sys_dictionary` VALUES ('2', '女', '0', '1', '1', null, 'sex', null, null, null, null, '1');
INSERT INTO `sys_dictionary` VALUES ('3', '男', '1', '1', '2', null, 'sex', null, null, null, null, '1');
INSERT INTO `sys_dictionary` VALUES ('4', '状态', null, '0', '2', null, 'user_status', null, null, null, null, '0');
INSERT INTO `sys_dictionary` VALUES ('5', '可用', '1', '4', '1', null, 'user_status', null, null, null, null, '1');
INSERT INTO `sys_dictionary` VALUES ('6', '不可用', '0', '4', '2', null, 'user_status', null, null, null, null, '1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', '50', 'http://jeesite.com/donation.html', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', '80', 'http://bbs.jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '500', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '990', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '30', '/cms/category/', null, 'align-justify', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '30', null, null, null, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '40', null, null, null, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '40', '/cms/site/', null, 'certificate', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '30', null, null, null, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '40', null, null, null, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '50', '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '500', null, null, null, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '30', '/cms/', null, 'briefcase', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '40', '/cms/article/', null, 'file', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '30', null, null, null, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '40', null, null, null, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '50', null, null, null, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '60', '/cms/link/', null, 'random', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '30', null, null, null, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '40', null, null, null, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '50', null, null, null, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '40', '/cms/comment/?status=2', null, 'comment', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '30', null, null, null, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '40', null, null, null, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '80', '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '30', null, null, null, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '40', null, null, null, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '90', '/../static/ckfinder/ckfinder.html', null, 'folder-open', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '30', null, null, null, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '40', null, null, null, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '600', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '30', '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '200', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '300', '/oa/leave', null, 'leaf', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '30', null, null, null, '0', 'oa:leave:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '40', null, null, null, '0', 'oa:leave:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('69', '62', '0,1,62,', '流程管理', '300', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,62,69,', '流程管理', '50', '/act/process', null, 'road', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,1,62,69,', '模型管理', '100', '/act/model', null, 'road', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2013-09-20 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '63', '0,1,62,63,', '我的任务', '50', '/act/task/todo/', null, 'tasks', '1', null, '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '63', '0,1,62,63,', '审批测试', '100', '/oa/testAudit', null, null, '1', 'oa:testAudit:view,oa:testAudit:edit', '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('75', '1', '0,1,', '在线演示', '3000', null, null, null, '1', null, '1', '2013-10-08 08:00:00', '1', '2013-10-08 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('86', '75', '0,1,75,', '组件演示', '50', null, null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('87', '86', '0,1,75,86,', '组件演示', '30', '/test/test/form', null, null, '1', 'test:test:view,test:test:edit', '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,1,62,', '通知通告', '20', '', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,1,62,88,', '我的通告', '30', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,1,62,88,', '通告管理', '50', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '资源名字',
  `type` varchar(32) DEFAULT NULL COMMENT '资源类型',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父节点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用，1可用，0不可用',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `creater` bigint(20) DEFAULT NULL COMMENT '创建人',
  `mender` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '管理权限', null, null, null, '0', '0/', '0', '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('2', '用户管理', 'menu', 'rest/boom/user/index', '', '9', '0/1/', '1.', '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('3', '用户添加', 'permission', 'user/doAdd.do', 'user:add', '2', '0/1/2/', null, '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('5', '用户修改', 'permission', 'user/doEdit.do', 'user:edit', '2', '0/1/2/', null, '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('6', '角色管理', 'menu', 'rest/boom/role/index', null, '9', '0/1/', '2.', '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('7', '角色添加', 'permission', 'role/doAdd.do', 'role:add', '6', '0/1/6/', null, '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('8', '角色修改', 'permission', 'role/doEdit.do', 'role:edit', '6', '0/1/6/', null, '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('9', '系统管理', 'menu', null, null, '1', null, null, '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('10', '用户删除', 'permission', 'user/doDelete.do', 'user:delete', '2', '0/1/2/', null, '1', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('11', '角色删除', 'permission', 'role/delete.do', 'role:delete', '6', '0/1/6/', null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `create_user` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `available` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('3', '部门管理员', 'b', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, null);
INSERT INTO `sys_role` VALUES ('4', '本部门管理员', 'c', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, null);
INSERT INTO `sys_role` VALUES ('5', '普通用户', 'd', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, null);
INSERT INTO `sys_role` VALUES ('5d46f01c3b5043a5a17a86f420bdd1d6', '王宝强', 'Mr.wang', 'qiyy', '2016-09-03 20:07:53', 'qiyy', '2016-09-03 20:07:53', '经理	                            	', null);
INSERT INTO `sys_role` VALUES ('66', '济南市管理员', 'e', '1', '2013-05-27 08:00:00', 'qiyy', '2016-07-23 17:04:54', '去', null);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_role_id` bigint(20) DEFAULT NULL,
  `sys_permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('189', '3', '9');
INSERT INTO `sys_role_permission` VALUES ('190', '3', '2');
INSERT INTO `sys_role_permission` VALUES ('191', '3', '3');
INSERT INTO `sys_role_permission` VALUES ('192', '3', '5');
INSERT INTO `sys_role_permission` VALUES ('193', '3', '10');
INSERT INTO `sys_role_permission` VALUES ('194', '3', '6');
INSERT INTO `sys_role_permission` VALUES ('195', '3', '7');
INSERT INTO `sys_role_permission` VALUES ('196', '3', '8');
INSERT INTO `sys_role_permission` VALUES ('197', '3', '11');
INSERT INTO `sys_role_permission` VALUES ('203', '4', '9');
INSERT INTO `sys_role_permission` VALUES ('204', '4', '2');
INSERT INTO `sys_role_permission` VALUES ('205', '4', '3');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL,
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '登录ip',
  `last_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `state` char(1) NOT NULL DEFAULT '0' COMMENT '用户状态默认1可以登录，0为不能登录',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `sex` char(2) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL COMMENT '照片url',
  `photo_name` varchar(255) DEFAULT NULL COMMENT '照片名称',
  `salt` varchar(255) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1bdf83b3a63747a890661772bbc22fd9', null, 'aa', 'aa', 'aa', 'aa', null, null, '1', 'aa', 'qiyy', '2016-07-12 15:07:58', 'qiyy', '2016-07-12 15:07:58', '1', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('20f4f02ab897444183ae2f648ca4a79c', 'ff', 'ff', 'ff', 'ff', '11122222222', null, null, '1', '222', 'qiyy', '2016-07-13 13:59:54', 'qiyy', '2016-07-13 13:59:54', '1', '2016-07-06 00:00:00', 'D:\\Program Files\\apache-tomcat-7.0.64\\webapps\\boom-web\\upload/20160713135950李宇春.jpg', '20160713135950李宇春.jpg', null, null);
INSERT INTO `sys_user` VALUES ('30', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'test@tes.com', '12312', '127.0.0.1', null, '0', 'admin', null, null, '30', '2016-07-06 16:31:01', '1', '1999-01-11 10:58:01', null, null, 'vilkjuye', 'admin');
INSERT INTO `sys_user` VALUES ('3e432cc2085c49d3a2d006e8ceb8c787', null, 'bb', 'bb', 'bb', 'bb', null, null, '1', 'bb', 'qiyy', '2016-07-12 16:59:30', 'qiyy', '2016-07-12 16:59:30', '0', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('6134c5a7faf345caaa13900ea4f20b42', 'ee', 'ee', 'ee', 'ee', '131', null, null, '1', '33', 'qiyy', '2016-07-13 13:57:31', 'qiyy', '2016-07-13 13:57:31', '1', '2002-07-05 00:00:00', null, null, null, null);
INSERT INTO `sys_user` VALUES ('80b2b020116e47cebd378b703492f704', 'aabb', 'aabb', 'aabb', 'aabb', '13100000000', null, null, '1', 'abab', 'qiyy', '2016-07-13 09:30:07', 'qiyy', '2016-07-13 09:30:07', '1', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('acf4bd3f48d64631b507008b353f0091', null, 'aa', 'aa', 'aa', 'aa', null, null, '1', 'aa', 'qiyy', '2016-07-12 15:07:58', 'qiyy', '2016-07-12 15:07:58', '0', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('bcf54d0228c74f17818b110e9a260da4', 'ddd', 'ddd', 'ddd', 'ddd', '13100000000', null, null, '1', 'ddd', 'qiyy', '2016-07-13 13:51:52', 'qiyy', '2016-07-13 13:51:52', '1', '2016-07-15 00:00:00', null, null, null, null);
INSERT INTO `sys_user` VALUES ('be5368d95e49432a841ac191a2b9b81a', '张三', '123456', '张三', 'aa', 'aa', null, null, '1', 'aa', 'qiyy', '2016-07-13 14:46:54', 'qiyy', '2016-07-13 14:46:54', '1', '2016-06-29 00:00:00', 'D:\\Program Files\\apache-tomcat-7.0.64\\webapps\\boom-web\\resources/fileupload/20160713144648aa.jpg', '20160713144648李晨.jpg', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint(20) DEFAULT NULL,
  `sys_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('23', '30', '3');
INSERT INTO `sys_user_role` VALUES ('24', '31', '4');
