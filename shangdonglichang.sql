/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : shangdonglichang

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/03/2021 09:15:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sdlc_links
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_links`;
CREATE TABLE `sdlc_links`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `link` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_links
-- ----------------------------
INSERT INTO `sdlc_links` VALUES (1, '合肥自驾租车', 2, 'on', 1, '2021-03-11 15:59:13', '2021-03-11 16:06:27', NULL, 'http://www.hfxbqczl.com');
INSERT INTO `sdlc_links` VALUES (2, '安徽泡沫板', 2, 'on', 2, '2021-03-11 15:59:26', '2021-03-11 15:59:26', NULL, NULL);
INSERT INTO `sdlc_links` VALUES (3, '篮式过滤器', 2, 'on', 3, '2021-03-11 15:59:36', '2021-03-11 15:59:41', NULL, NULL);
INSERT INTO `sdlc_links` VALUES (4, '铝艺护栏厂家', 2, 'on', 4, '2021-03-11 15:59:52', '2021-03-11 15:59:52', NULL, NULL);

-- ----------------------------
-- Table structure for sdlc_menu
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_menu`;
CREATE TABLE `sdlc_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `controller_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制器名称',
  `view_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试图名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级菜单，默认跟菜单',
  `is_menu` int(11) NULL DEFAULT NULL COMMENT '是否显示在菜单上（0：不显示在菜单上，1：显示在菜单上。默认显示在菜单上）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_menu
-- ----------------------------
INSERT INTO `sdlc_menu` VALUES (1, '系统管理', '', '', '', 0, 1, '2021-02-07 17:04:43', '2021-02-07 17:04:43', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (107, '产品分类', 'sdlcadmin', 'classify', 'productclassifylist', 104, 1, '2021-03-10 14:33:55', '2021-03-11 10:42:02', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (105, '新闻管理', '', '', '', 0, 1, '2021-03-10 14:32:13', '2021-03-10 14:36:01', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (4, '用户管理', 'sdlcadmin', 'user', 'ulist', 1, 1, '2021-02-07 17:21:47', '2021-02-07 17:21:49', NULL, 4, 2);
INSERT INTO `sdlc_menu` VALUES (5, '菜单管理', 'sdlcadmin', 'menu', 'mlist', 1, 1, '2021-02-07 17:52:08', '2021-02-07 17:52:08', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (6, '角色管理', 'sdlcadmin', 'role', 'rlist', 1, 1, '2021-02-07 17:52:40', '2021-02-07 17:52:40', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (7, '配置管理', 'sdlcadmin', 'admin', 'website', 1, 1, '2021-02-07 17:53:13', '2021-02-10 11:29:22', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (104, '产品管理', '', '', '', 0, 1, '2021-03-10 14:31:40', '2021-03-10 14:35:48', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (50, '权限分配', 'sdlcadmin', 'permission', 'rolepermissionsetting', 6, 0, '2021-02-08 10:34:43', '2021-02-08 10:34:43', NULL, 4, 2);
INSERT INTO `sdlc_menu` VALUES (49, '用户删除', 'sdlcadmin', 'user', 'deluser', 4, 0, '2021-02-08 10:33:05', '2021-02-08 10:33:05', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (48, '用户修改', 'sdlcadmin', 'user', 'publicsaveuser', 4, 0, '2021-02-08 10:32:38', '2021-02-08 10:32:38', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (47, '用户新增', 'sdlcadmin', 'user', 'publicsaveuser', 4, 0, '2021-02-08 10:32:13', '2021-02-08 10:32:13', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (46, '角色删除', 'sdlcadmin', 'role', 'delrole', 6, 0, '2021-02-08 10:31:42', '2021-02-09 12:37:58', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (45, '角色修改', 'sdlcadmin', 'role', 'publicsaverole', 6, 0, '2021-02-08 10:31:18', '2021-02-09 12:38:13', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (41, '菜单新增', 'sdlcadmin', 'menu', 'publicsavemenu', 5, 0, '2021-02-07 19:41:07', '2021-03-01 10:22:42', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (44, '角色新增', 'sdlcadmin', 'role', 'publicsaverole', 6, 0, '2021-02-08 10:28:45', '2021-02-08 10:28:45', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (43, '菜单删除', 'sdlcadmin', 'menu', 'delmenu', 5, 0, '2021-02-08 10:16:56', '2021-02-08 10:26:36', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (42, '菜单修改', 'sdlcadmin', 'menu', 'publicsavemenu', 5, 0, '2021-02-08 10:15:19', '2021-02-09 12:50:28', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (127, '友情链接删除', 'sdlcadmin', 'links', 'dellinks', 124, 0, '2021-03-11 15:46:12', '2021-03-11 15:46:12', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (126, '友情链接修改', 'sdlcadmin', 'links', 'linkssave', 124, 0, '2021-03-11 15:45:51', '2021-03-11 15:45:51', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (125, '友情链接添加', 'sdlcadmin', 'links', 'linkssave', 124, 0, '2021-03-11 15:45:32', '2021-03-11 15:45:32', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (124, '友情链接', 'sdlcadmin', 'links', 'linkslist', 123, 1, '2021-03-11 15:45:04', '2021-03-11 15:45:04', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (122, '轮播图删除', 'sdlcadmin', 'picture', 'delpicture', 119, 0, '2021-03-11 09:34:40', '2021-03-11 09:34:40', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (121, '轮播图修改', 'sdlcadmin', 'picture', 'picturesave', 119, 0, '2021-03-11 09:34:17', '2021-03-11 09:34:17', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (120, '轮播图新增', 'sdlcadmin', 'picture', 'picturesave', 119, 0, '2021-03-11 09:33:55', '2021-03-11 09:33:55', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (119, '首页banner轮播图', 'sdlcadmin', 'picture', 'picturelist', 118, 1, '2021-03-11 09:33:12', '2021-03-11 09:33:12', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (117, '新闻删除', 'sdlcadmin', 'news', 'delnews', 108, 0, '2021-03-10 14:42:13', '2021-03-10 14:42:13', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (116, '新闻修改', 'sdlcadmin', 'news', 'newssave', 108, 0, '2021-03-10 14:41:54', '2021-03-10 14:41:54', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (115, '新闻添加', 'sdlcadmin', 'news', 'newssave', 108, 0, '2021-03-10 14:41:33', '2021-03-10 14:41:33', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (114, '产品分类删除', 'sdlcadmin', 'classify', 'delproductclassify', 107, 0, '2021-03-10 14:40:20', '2021-03-10 14:40:20', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (123, '友情链接管理', '', '', '', 0, 1, '2021-03-11 15:44:35', '2021-03-11 15:44:35', NULL, 5, 2);
INSERT INTO `sdlc_menu` VALUES (113, '产品分类修改', 'sdlcadmin', 'classify', 'productclassifysave', 107, 0, '2021-03-10 14:39:48', '2021-03-10 14:39:48', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (112, '产品分类添加', 'sdlcadmin', 'classify', 'productclassifysave', 107, 0, '2021-03-10 14:39:26', '2021-03-10 14:39:26', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (111, '产品删除', 'sdlcadmin', 'product', 'delproduct', 106, 0, '2021-03-10 14:38:07', '2021-03-10 14:39:55', NULL, 3, 2);
INSERT INTO `sdlc_menu` VALUES (110, '产品修改', 'sdlcadmin', 'product', 'productsave', 106, 0, '2021-03-10 14:37:45', '2021-03-10 14:38:23', NULL, 2, 2);
INSERT INTO `sdlc_menu` VALUES (118, ' 图片管理', '', '', '', 0, 1, '2021-03-11 09:31:08', '2021-03-11 09:31:08', NULL, 4, 2);
INSERT INTO `sdlc_menu` VALUES (109, '产品添加', 'sdlcadmin', 'product', 'productsave', 106, 0, '2021-03-10 14:37:26', '2021-03-10 14:38:17', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (106, '产品', 'sdlcadmin', 'product', 'productlist', 104, 1, '2021-03-10 14:33:04', '2021-03-10 15:00:18', NULL, 1, 2);
INSERT INTO `sdlc_menu` VALUES (108, '新闻中心', 'sdlcadmin', 'news', 'newslist', 105, 1, '2021-03-10 14:36:32', '2021-03-10 14:59:53', NULL, 1, 2);

-- ----------------------------
-- Table structure for sdlc_news
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_news`;
CREATE TABLE `sdlc_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `click` int(11) NULL DEFAULT 0,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_news
-- ----------------------------
INSERT INTO `sdlc_news` VALUES (1, '交通设施的种类', '交通设施的种类', '<p>交通设施在我们生活中无处不在，他们是我们经常见到乃至于忽略的东西，这些都是为了保障行人的行驶安全，交通正常运营的辅助设施，所以下面交通设施生产厂家就给大家介绍一下交通设施的种类分为哪几种：</p><p>&nbsp; &nbsp; 1.停车场设施有：广角镜，护角，定位器，车位杆，挡轮杆底座，道闸，岗亭，指示牌，轮廓标，道钉，停车场系统，车位标线，导向灯等。</p><p>&nbsp; &nbsp; 2.道路交通设施有：路锥，护栏，防撞隔离栏，施工围挡，水马，铁马，防眩板，警示柱，路桩，警示灯，太阳能红绿灯，交通标志牌，交通标线，热熔划线，反光衣等。</p><p>&nbsp; &nbsp; 防撞、防护、警示产品是最重要的交通设施之一，他的存在可以保障行车安全，所以对于交通设施生产厂家来说，对其的生产更严谨。</p><p>asd</p><p>asd</p><p>as</p><p>d</p><p>asd</p><p><br/></p>', '2021-03-10 16:14:29', '2021-03-11 12:15:54', NULL, 2, 6, '交通设施的种类', 'on', '最新');
INSERT INTO `sdlc_news` VALUES (2, '交通设施的种类', '交通设施的种类', '<p>交通设施在我们生活中无处不在，他们是我们经常见到乃至于忽略的东西，这些都是为了保障行人的行驶安全，交通正常运营的辅助设施，所以下面交通设施生产厂家就给大家介绍一下交通设施的种类分为哪几种：</p><p>&nbsp; &nbsp; 1.停车场设施有：广角镜，护角，定位器，车位杆，挡轮杆底座，道闸，岗亭，指示牌，轮廓标，道钉，停车场系统，车位标线，导向灯等。</p><p>&nbsp; &nbsp; 2.道路交通设施有：路锥，护栏，防撞隔离栏，施工围挡，水马，铁马，防眩板，警示柱，路桩，警示灯，太阳能红绿灯，交通标志牌，交通标线，热熔划线，反光衣等。</p><p>&nbsp; &nbsp; 防撞、防护、警示产品是最重要的交通设施之一，他的存在可以保障行车安全，所以对于交通设施生产厂家来说，对其的生产更严谨。</p><p><br/></p>', '2021-03-10 16:44:00', '2021-03-10 16:44:00', NULL, 2, 3, '交通设施的种类', 'on', '热门');

-- ----------------------------
-- Table structure for sdlc_permission
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_permission`;
CREATE TABLE `sdlc_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of sdlc_permission
-- ----------------------------
INSERT INTO `sdlc_permission` VALUES (2, 1, 1, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (3, 1, 7, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (4, 1, 5, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (5, 1, 41, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (6, 1, 42, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (7, 1, 43, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (8, 1, 6, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (9, 1, 44, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (10, 1, 45, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (11, 1, 46, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (12, 1, 50, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (13, 1, 4, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (14, 1, 47, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (15, 1, 48, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (16, 1, 49, '2021-03-10 12:54:19', '2021-03-10 12:54:19', NULL);
INSERT INTO `sdlc_permission` VALUES (17, 16, 1, '2021-03-10 12:55:05', '2021-03-10 12:55:05', NULL);
INSERT INTO `sdlc_permission` VALUES (18, 16, 4, '2021-03-10 12:55:05', '2021-03-10 12:55:05', NULL);
INSERT INTO `sdlc_permission` VALUES (19, 16, 47, '2021-03-10 12:55:05', '2021-03-10 12:55:05', NULL);
INSERT INTO `sdlc_permission` VALUES (20, 16, 48, '2021-03-10 12:55:05', '2021-03-10 12:55:05', NULL);
INSERT INTO `sdlc_permission` VALUES (21, 16, 49, '2021-03-10 12:55:05', '2021-03-10 12:55:05', NULL);
INSERT INTO `sdlc_permission` VALUES (22, 1, 104, '2021-03-10 14:31:40', '2021-03-10 14:31:40', NULL);
INSERT INTO `sdlc_permission` VALUES (23, 1, 105, '2021-03-10 14:32:13', '2021-03-10 14:32:13', NULL);
INSERT INTO `sdlc_permission` VALUES (24, 1, 106, '2021-03-10 14:33:04', '2021-03-10 14:33:04', NULL);
INSERT INTO `sdlc_permission` VALUES (25, 1, 107, '2021-03-10 14:33:55', '2021-03-10 14:33:55', NULL);
INSERT INTO `sdlc_permission` VALUES (26, 1, 108, '2021-03-10 14:36:32', '2021-03-10 14:36:32', NULL);
INSERT INTO `sdlc_permission` VALUES (27, 1, 109, '2021-03-10 14:37:26', '2021-03-10 14:37:26', NULL);
INSERT INTO `sdlc_permission` VALUES (28, 1, 110, '2021-03-10 14:37:45', '2021-03-10 14:37:45', NULL);
INSERT INTO `sdlc_permission` VALUES (29, 1, 111, '2021-03-10 14:38:07', '2021-03-10 14:38:07', NULL);
INSERT INTO `sdlc_permission` VALUES (30, 1, 112, '2021-03-10 14:39:26', '2021-03-10 14:39:26', NULL);
INSERT INTO `sdlc_permission` VALUES (31, 1, 113, '2021-03-10 14:39:48', '2021-03-10 14:39:48', NULL);
INSERT INTO `sdlc_permission` VALUES (32, 1, 114, '2021-03-10 14:40:20', '2021-03-10 14:40:20', NULL);
INSERT INTO `sdlc_permission` VALUES (33, 1, 115, '2021-03-10 14:41:33', '2021-03-10 14:41:33', NULL);
INSERT INTO `sdlc_permission` VALUES (34, 1, 116, '2021-03-10 14:41:54', '2021-03-10 14:41:54', NULL);
INSERT INTO `sdlc_permission` VALUES (35, 1, 117, '2021-03-10 14:42:13', '2021-03-10 14:42:13', NULL);
INSERT INTO `sdlc_permission` VALUES (36, 1, 118, '2021-03-11 09:31:08', '2021-03-11 09:31:08', NULL);
INSERT INTO `sdlc_permission` VALUES (37, 1, 119, '2021-03-11 09:33:12', '2021-03-11 09:33:12', NULL);
INSERT INTO `sdlc_permission` VALUES (38, 1, 120, '2021-03-11 09:33:55', '2021-03-11 09:33:55', NULL);
INSERT INTO `sdlc_permission` VALUES (39, 1, 121, '2021-03-11 09:34:17', '2021-03-11 09:34:17', NULL);
INSERT INTO `sdlc_permission` VALUES (40, 1, 122, '2021-03-11 09:34:40', '2021-03-11 09:34:40', NULL);
INSERT INTO `sdlc_permission` VALUES (41, 1, 123, '2021-03-11 15:44:35', '2021-03-11 15:44:35', NULL);
INSERT INTO `sdlc_permission` VALUES (42, 1, 124, '2021-03-11 15:45:04', '2021-03-11 15:45:04', NULL);
INSERT INTO `sdlc_permission` VALUES (43, 1, 125, '2021-03-11 15:45:32', '2021-03-11 15:45:32', NULL);
INSERT INTO `sdlc_permission` VALUES (44, 1, 126, '2021-03-11 15:45:51', '2021-03-11 15:45:51', NULL);
INSERT INTO `sdlc_permission` VALUES (45, 1, 127, '2021-03-11 15:46:12', '2021-03-11 15:46:12', NULL);

-- ----------------------------
-- Table structure for sdlc_picture
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_picture`;
CREATE TABLE `sdlc_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0,
  `user_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_picture
-- ----------------------------
INSERT INTO `sdlc_picture` VALUES (1, '1', '1', '20210311/71805e66dfa4fc142320a033feb56455.jpg', 1, 2, '2021-03-11 10:04:22', '2021-03-11 10:11:50', NULL, 'on');
INSERT INTO `sdlc_picture` VALUES (2, '2', '2', '20210311/783c03cb0a9b95aeecf335a8ffe90d11.jpg', 2, 2, '2021-03-11 10:05:21', '2021-03-11 10:13:11', NULL, 'on');
INSERT INTO `sdlc_picture` VALUES (3, '3', '3', '20210311/f2c32c0e044554c342b117497778a45d.jpg', 3, 2, '2021-03-11 10:05:46', '2021-03-11 10:13:17', NULL, 'on');

-- ----------------------------
-- Table structure for sdlc_product
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_product`;
CREATE TABLE `sdlc_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `click` int(11) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_classify_id` int(11) NULL DEFAULT NULL COMMENT '产品分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_product
-- ----------------------------
INSERT INTO `sdlc_product` VALUES (1, '安全带', '20210311/60643a9f7c1d6eb41e6f7054c942e460.jpg', 2, 9, '2021-03-11 11:48:16', '2021-03-11 11:48:16', NULL, 'on', 3);
INSERT INTO `sdlc_product` VALUES (2, '安全带', '20210311/1fd8320511ab54e3a016f0e9602f1c54.jpg', 2, 0, '2021-03-11 11:58:42', '2021-03-11 11:58:42', NULL, 'on', 3);
INSERT INTO `sdlc_product` VALUES (3, '高速公路专用反光标牌', '20210311/fd323baaaff504b3b71eaa1b9af20e28.jpg', 2, 3, '2021-03-11 12:11:10', '2021-03-11 12:11:10', NULL, 'on', 9);
INSERT INTO `sdlc_product` VALUES (4, '水泥墩', '20210311/d3981012ce6f583d4bdf8bd202a7740c.jpg', 2, 7, '2021-03-11 12:11:41', '2021-03-11 12:11:41', NULL, 'on', 5);

-- ----------------------------
-- Table structure for sdlc_product_classify
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_product_classify`;
CREATE TABLE `sdlc_product_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_product_classify
-- ----------------------------
INSERT INTO `sdlc_product_classify` VALUES (1, 0, '启用', 2, '2021-03-11 10:57:49', '2021-03-11 10:57:49', NULL, '道路安全设施');
INSERT INTO `sdlc_product_classify` VALUES (2, 4, '启用', 2, '2021-03-11 10:59:51', '2021-03-11 11:14:21', NULL, '车位锁');
INSERT INTO `sdlc_product_classify` VALUES (3, 4, '启用', 2, '2021-03-11 11:09:45', '2021-03-11 11:14:36', NULL, '安全带/警戒带');
INSERT INTO `sdlc_product_classify` VALUES (4, 0, '启用', 2, '2021-03-11 11:10:22', '2021-03-11 11:10:22', NULL, '停车场公共设施');
INSERT INTO `sdlc_product_classify` VALUES (5, 1, '启用', 2, '2021-03-11 11:15:06', '2021-03-11 11:15:06', NULL, '防撞桶、隔离墩');
INSERT INTO `sdlc_product_classify` VALUES (6, 4, 'off', 2, '2021-03-11 12:08:35', '2021-03-11 12:08:35', NULL, '垃圾桶');
INSERT INTO `sdlc_product_classify` VALUES (7, 4, 'off', 2, '2021-03-11 12:08:47', '2021-03-11 12:08:47', NULL, '护角/广角镜');
INSERT INTO `sdlc_product_classify` VALUES (8, 4, 'off', 2, '2021-03-11 12:09:01', '2021-03-11 12:09:01', NULL, '挡车器/定位器');
INSERT INTO `sdlc_product_classify` VALUES (9, 1, 'off', 2, '2021-03-11 12:09:32', '2021-03-11 12:09:32', NULL, '反光膜/反光标牌');

-- ----------------------------
-- Table structure for sdlc_role
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_role`;
CREATE TABLE `sdlc_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `open` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开启状态：on 开启，off 关闭',
  `sort` int(255) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_role
-- ----------------------------
INSERT INTO `sdlc_role` VALUES (1, '超级管理员', '超级管理员', '2021-02-05 10:17:44', '2021-02-05 13:49:13', NULL, 'on', 1);
INSERT INTO `sdlc_role` VALUES (2, '测试', '', '2021-02-05 10:17:52', '2021-03-05 11:23:00', '2021-03-05 11:23:00', 'on', 3);
INSERT INTO `sdlc_role` VALUES (10, '管理员', '管理员', '2021-02-23 09:23:27', '2021-03-10 12:50:39', '2021-03-10 12:50:39', NULL, 2);
INSERT INTO `sdlc_role` VALUES (6, '12312', '3123123123', '2021-02-05 17:15:42', '2021-02-05 17:15:52', '2021-02-05 17:15:52', 'off', 3);
INSERT INTO `sdlc_role` VALUES (7, '231', '23123123', '2021-02-05 17:21:37', '2021-02-05 17:21:43', '2021-02-05 17:21:43', 'on', 4);
INSERT INTO `sdlc_role` VALUES (8, '123', '123', '2021-02-08 11:02:42', '2021-02-08 11:19:49', '2021-02-08 11:19:49', 'off', 12);
INSERT INTO `sdlc_role` VALUES (9, '123123123', '12312312312', '2021-02-08 11:19:59', '2021-02-08 11:21:25', '2021-02-08 11:21:25', 'off', 123123);
INSERT INTO `sdlc_role` VALUES (11, '人事管理员', '人事管理员', '2021-02-23 12:38:18', '2021-03-10 12:50:44', '2021-03-10 12:50:44', NULL, 3);
INSERT INTO `sdlc_role` VALUES (12, 'kpi考核员', 'kpi考核员', '2021-02-26 09:08:46', '2021-03-10 12:50:49', '2021-03-10 12:50:49', NULL, 5);
INSERT INTO `sdlc_role` VALUES (13, 'ceshi1', '', '2021-03-05 11:24:48', '2021-03-05 11:25:02', '2021-03-05 11:25:02', NULL, 5);
INSERT INTO `sdlc_role` VALUES (14, 'ceshi2', '', '2021-03-05 11:24:57', '2021-03-05 11:25:42', '2021-03-05 11:25:42', NULL, 6);
INSERT INTO `sdlc_role` VALUES (15, 'ceshi3', '', '2021-03-05 11:25:34', '2021-03-05 11:26:34', '2021-03-05 11:26:34', NULL, 7);
INSERT INTO `sdlc_role` VALUES (16, '测试', '测试', '2021-03-10 12:54:57', '2021-03-10 12:54:57', NULL, NULL, 2);
INSERT INTO `sdlc_role` VALUES (17, '测试1', '测试', '2021-03-10 14:07:10', '2021-03-10 14:07:14', '2021-03-10 14:07:14', NULL, 3);

-- ----------------------------
-- Table structure for sdlc_user
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_user`;
CREATE TABLE `sdlc_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `open` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态： on 标识 开启 off 标识 禁用',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `login_num` int(11) NULL DEFAULT 0 COMMENT '登录次数',
  `client_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'apiid',
  `secret` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_user
-- ----------------------------
INSERT INTO `sdlc_user` VALUES (2, 'admin', 'admin', 'admin@admin.com', '男', '1993-01-21', '上海市', 1, 'on', 'c4ca4238a0b923820dcc509a6f75849b', '2021-02-05 16:04:51', '2021-02-09 16:26:35', NULL, '127.0.0.1', '2021-03-10 13:02:30', 19, NULL, NULL);
INSERT INTO `sdlc_user` VALUES (7, 'xiaorun', '肖润', 'xiaorun@uvclinic.cn', '男', '1993-01-21', '上海市徐汇区桂林路406号2号楼', 1, 'on', 'c4ca4238a0b923820dcc509a6f75849b', '2021-02-09 13:03:03', '2021-03-10 12:21:35', NULL, '127.0.0.1', '2021-03-10 12:42:38', 6, '30626831', 'w3DUCeHpNsKMh1oxc0ILZFT9SPWGn8ul');
INSERT INTO `sdlc_user` VALUES (14, 'ceshi1', 'ceshi', 'chi@qq.com', '男', '2021-03-10', '', 16, 'on', 'c4ca4238a0b923820dcc509a6f75849b', '2021-03-10 14:05:29', '2021-03-10 14:05:41', '2021-03-10 14:05:41', '127.0.0.1', NULL, 0, NULL, NULL);
INSERT INTO `sdlc_user` VALUES (13, 'ceshi', 'ceshi', 'ceshi@qq.com', '男', '2021-03-10', '', 16, 'on', 'c4ca4238a0b923820dcc509a6f75849b', '2021-03-10 12:55:24', '2021-03-10 16:57:56', NULL, '127.0.0.1', '2021-03-10 13:01:50', 1, '58240966', 'AUJ1Ivopb4DQt7ecznqlVYNM3i8aGd0H');

-- ----------------------------
-- Table structure for sdlc_website
-- ----------------------------
DROP TABLE IF EXISTS `sdlc_website`;
CREATE TABLE `sdlc_website`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copyright` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_information` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `landline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机',
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `factory_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂址',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `about` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `contact_us` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '联系我们',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sdlc_website
-- ----------------------------
INSERT INTO `sdlc_website` VALUES (1, '山东力畅交通设施有限公司', '域名', '山东力畅交通设施有限公司', '山东力畅交通设施有限公司', '山东力畅交通设施有限公司', 'Copyright@2017 版权所有 山东力畅交通设施有限公司 ', '20210311/2c4fa038997ff234876e6b71bd713f34.jpg', '李经理', '18253901112（微信）  13954920809', '0539-7116626', '18253901112', '705555748', '临沂市河东区凤凰岭工业园', '临沂市兰山区工业大道与聚财路交汇西300米路北', '<p style=\"text-indent: 2em; \">山东力畅交通设施有限公司前身是临沂众欣交通设施，是一家生产、销售、外贸为一体的企业，产品有防撞设施、道路减速设施、道路隔离设施、警示器材、小区车场用品。 公司位于商品批发市场、物流之都一一山东临沂，物流快捷，可实现当日或隔日取货。&nbsp;</p><p style=\"text-indent: 2em;\">公司拥有四大生产基地:塑料制品基地，水泥制品基地，铁器制品基地，橡胶制品基地。 公司均以原材料生产，用高数字设备，拥有多台注塑机和数台大型吹塑机，产品有:告示牌、A字牌、弹力柱、路锥、水马、防撞桶；水泥类:隔离墩、道口桩；铁制品有:减速带、铁马、铁立柱、护栏、标牌、车位锁；橡胶品有:护角、路锥、减速带、车位挡车器； 目前公司国内业务覆盖30多个省、市、自治区，拥有自主品牌“力畅”，公司“以质量为重任，以市场需求为导向，以信誉为生命”的原则，建立市场化销售模式为客户创造价值，为企业创造利润，坚持“客户是企业发展的源泉，员工是企业的财富”的理念，以员工同呼吸与客户共命运。 面对未来，我们真诚希望与业内各界同仁团结协作、取长补短、互利共赢、携手助力天下的道路更通畅！欢迎广大客商朋友来电洽谈——李经理18253901112（山东交通设施厂家，交通设施批发，交通设施路锥生产批发，防撞桶减速带生产批发，）</p>', '<p>联系人：李经理</p><p>联系方式：18253901112（微信）</p><p>13954920809</p><p>座机：0539-7116626</p><p>微信：18253901112</p><p>QQ：705555748</p><p>厂址：临沂市河东区凤凰岭工业园</p><p>地址：临沂市兰山区工业大道与聚财路交汇西300米路北</p>');

SET FOREIGN_KEY_CHECKS = 1;
