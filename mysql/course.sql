/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : course

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2020-08-24 11:44:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `number` varchar(12) NOT NULL,
  `type` int(50) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `tea_id` (`tea_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`tea_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '1', '数据结构', '123456', '1', 'https://i.ibb.co/bJ6XsCT/a84f52c1f5d3bfbae2a5bbdc06528640.jpg', '...', '2020-04-30 03:38:30');
INSERT INTO `course` VALUES ('2', '1', 'python', '654321', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2462524992,179895772&fm=26&gp=0.jpg', 'f', '2020-05-05 12:13:14');
INSERT INTO `course` VALUES ('3', '1', 'java程序设计', '111111', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2462524992,179895772&fm=26&gp=0.jpg', 'cccccc', '2020-05-05 12:13:38');
INSERT INTO `course` VALUES ('4', '1', 'SSM', '222222', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2462524992,179895772&fm=26&gp=0.jpg', 'cccc', '2020-05-05 12:14:07');
INSERT INTO `course` VALUES ('5', '1', '高等数学', '232323', '2', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2462524992,179895772&fm=26&gp=0.jpg', 'da', '2020-08-22 22:19:28');
INSERT INTO `course` VALUES ('6', '1', '离散型数学', '202020', '2', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2462524992,179895772&fm=26&gp=0.jpg', 'cn', '2020-08-22 22:20:10');
INSERT INTO `course` VALUES ('8', '1', 'WEB前端', '636365', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2462524992,179895772&fm=26&gp=0.jpg', '', '2020-08-24 00:08:50');

-- ----------------------------
-- Table structure for `course_tag`
-- ----------------------------
DROP TABLE IF EXISTS `course_tag`;
CREATE TABLE `course_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_tag_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_tag
-- ----------------------------
INSERT INTO `course_tag` VALUES ('1', 'python', '2');
INSERT INTO `course_tag` VALUES ('2', 'java', '3');
INSERT INTO `course_tag` VALUES ('3', 'Spring', '4');
INSERT INTO `course_tag` VALUES ('4', 'Mybatis', '4');
INSERT INTO `course_tag` VALUES ('5', 'Spring MVC', '4');

-- ----------------------------
-- Table structure for `course_type`
-- ----------------------------
DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_type
-- ----------------------------
INSERT INTO `course_type` VALUES ('1', '编程类');
INSERT INTO `course_type` VALUES ('2', '数学类');

-- ----------------------------
-- Table structure for `essay_question`
-- ----------------------------
DROP TABLE IF EXISTS `essay_question`;
CREATE TABLE `essay_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `grade` int(11) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `essay_question_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of essay_question
-- ----------------------------
INSERT INTO `essay_question` VALUES ('1', '1', '<p>某集团公司拥有多个分公司，为了方便集团公司对分公司各项业务活动进行有效管理，集团公司决定构建一个信息系统以满足公司的业务管理需求。<br>【需求分析】<br>1.分公司关系需要记录的信息包括分公司编号、名称、经理、联系地址和电话。分公司编号唯一标识分公司信息中的每一个元组。每个分公司只有一名经理，负责该分公司的管理工作。每个分公司设立仅为本分公司服务的多个业务部门，如研发部、财务部、采购部、销售部等。<br>2.部门关系需要记录的信息包括部门号、部门名称、主管号、电话和分公司编号。部门号唯一标识部门信息中的每一个元组。每个部门只有一名主管，负责部门的管理工作。每个部门有多名员工，每名员工只能隶属于一个部门。<br>3.员工关系需要记录的信息包括员工号、姓名、隶属部门、岗位、电话和基本工资。其中，员工号唯一标识员工信息中的每一个元组。岗位包括:经理、主管、研发员、业务员等。<br>【概念模型设计】<br>根据需求阶段收集的信息，设计的实体联系图和关系模式(不完整)如图2-1 所示:<br><img alt=\"\" width=\"456\" height=\"224\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/rjsjs2018-x-x-2d-1.png\"><br>【关系模式设计】<br>分公司（分公司编号，名称，（a），联系地址，电话）<br>部门（部门号，部门名称，（b），电话）<br>员工（员工号，姓名（c），电话，基本工资）</p><h3><b>使用说明中的词语，给出图1-1中的实体E1~E3的名称。</b></h3>', '10', '2020-04-30 04:38:12');
INSERT INTO `essay_question` VALUES ('2', '1', '<p>现需要申请一些场地举办一批活动，每个活动有开始时间和结束时间。在同一个场地，如果一个活动结束之前，另一个活动开始，即两个活动冲突。若活动A从1时间开始，5时间结束，活动B从5时间开始，8时间结束，则活动A和B不冲突。现要计算<em>n</em>个活动需要的最少场地数。<br>求解该问题的基本思路如下(假设需要场地数为<em>m，</em>活动数为<em>n，</em>场地集合为<em>P</em><sub>1</sub>，<em>P</em><sub>2</sub>,…,<em>P</em><sub><em>m</em></sub>)，初始条件<em>P</em><sub><em>i</em></sub>均无活动安排：<br>(1)采用快速排序算法对<em>n</em>个活动的开始时间从小到大排序，得到活动<em>a</em><sub>1</sub>，<em>a</em><sub>2</sub>，…，<em>a</em><sub><em>n</em></sub>。对每个活动<em>a</em><sub><em>i</em></sub>，<em>i</em>从1到<em>n，</em>重复步骤(2)、(3)和(4)；<br>(2)从<em>P</em><sub>1</sub>开始，判断<em>ai</em>与<em>P</em><sub>1</sub>的最后一个活动是否冲突，若冲突，考虑下一个场地<em>P</em><sub>2</sub>,…；<br>(3)一旦发现<em>a</em><sub><em>i</em></sub>与某个<em>P</em><sub><em>j</em></sub>的最后一个活动不冲突，则将<em>a</em><sub><em>i</em></sub>安排到<em>P</em><sub><em>j</em></sub>，考虑下一个活动；<br>(4)若<em>a</em><sub><em>i</em></sub>与所有已安排活动的<em>P</em><sub><em>j</em></sub>的最后一个活动均冲突，则将<em>a</em><sub><em>i</em></sub>安排到一个新的场地，考虑下一个活动；<br>(5)将<em>n</em>减去没有安排活动的场地数即可得到所用的最少场地数。<br>算法首先采用了快速排序算法进行排序，其算法设计策略是(&nbsp;60 )；后面步骤采用的算法设计策略是(&nbsp;61 )。整个算法的时间复杂度是(&nbsp;62&nbsp;)。下表给出了<em>n</em>=11的活动集合，根据上述算法，得到最少的场地数为(&nbsp;63&nbsp;)。<br><img alt=\"\" width=\"600\" height=\"104\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/rjsjs-2018sh-60.png\"></p>', '10', '2020-04-30 04:39:19');
INSERT INTO `essay_question` VALUES ('3', '1', '<p><a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BD%F8%B3%CC%2C\" target=\"_blank\">进程</a>P1、P2、P3、P4和P5的前趋图如下所示：<br><img alt=\"\" width=\"237\" height=\"81\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/rjgcs2018-x-s-24-1.png\"><br>若用<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=PV%2C\" target=\"_blank\">PV</a>操作控制这5个<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BD%F8%B3%CC%2C\" target=\"_blank\">进程</a>的同步与互斥的程序如下，那么程序中的空①和空②处应分别为（24）；空③和空④处应分别为（25）；空⑤和空⑥处应分别为（26）。<br><img alt=\"\" width=\"454\" height=\"252\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/rjgcs2018-x-s-24-2.png\"></p>', '10', '2020-04-30 04:40:54');
INSERT INTO `essay_question` VALUES ('4', '1', '<p>某<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B2%D9%D7%F7%CF%B5%CD%B3%2C\" target=\"_blank\">操作系统</a>文件管理采用索引节点法。每个文件的索引节点有8个地址项，每个地址项大小为4字节，其中5个地址项为直接地址索引，2个地址项是一级<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BC%E4%BD%D3%B5%D8%D6%B7%2C\" target=\"_blank\">间接地址</a>索引，1个地址项是二级<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BC%E4%BD%D3%B5%D8%D6%B7%2C\" target=\"_blank\">间接地址</a>索引，<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B4%C5%C5%CC%2C\" target=\"_blank\">磁盘</a>索引块和<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B4%C5%C5%CC%2C\" target=\"_blank\">磁盘</a><a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%CA%FD%BE%DD%2C\" target=\"_blank\">数据</a>块大小均为1KB。若要访问文件的逻辑块号分别为1和518，则系统应分别采用（ ）。</p>', '10', '2020-04-30 04:41:30');
INSERT INTO `essay_question` VALUES ('5', '1', '<p>对以下的程序<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%CE%B1%B4%FA%C2%EB%2C\" target=\"_blank\">伪代码</a>（用缩进表示<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B3%CC%D0%F2%BF%E9%2C\" target=\"_blank\">程序块</a>）进行路径<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B8%B2%B8%C7%B2%E2%CA%D4%2C\" target=\"_blank\">覆盖测试</a>，至少需要（34）个<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B2%E2%CA%D4%D3%C3%C0%FD%2C\" target=\"_blank\">测试用例</a>。采用McCabe度量法计算其环路复杂度为（35）。<br><img alt=\"\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/rjgcs2018-x-s-34-1.png\"></p>', '10', '2020-04-30 04:42:00');

-- ----------------------------
-- Table structure for `exam_model`
-- ----------------------------
DROP TABLE IF EXISTS `exam_model`;
CREATE TABLE `exam_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `course_id` int(11) NOT NULL,
  `is_hide` tinyint(1) DEFAULT '1',
  `grade` float DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `exam_model_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_model
-- ----------------------------
INSERT INTO `exam_model` VALUES ('1', '期末考试', '1', '0', '53', '2020-05-05 12:02:16', '2020-05-01 07:10:00', '2020-05-21 19:00:00');
INSERT INTO `exam_model` VALUES ('2', 'zzz', '1', '0', '62', '2020-05-24 15:12:46', '2020-05-01 07:10:00', '2020-05-31 20:50:00');

-- ----------------------------
-- Table structure for `exam_paper`
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper`;
CREATE TABLE `exam_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `grade` float DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `rule` int(11) NOT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stu_id` (`stu_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `exam_paper_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_paper_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `exam_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_paper
-- ----------------------------
INSERT INTO `exam_paper` VALUES ('2', '2', '1', '0', '0', '1026123265', null);
INSERT INTO `exam_paper` VALUES ('4', '2', '2', '0', '0', '-1808369427', null);

-- ----------------------------
-- Table structure for `gap_filling_question`
-- ----------------------------
DROP TABLE IF EXISTS `gap_filling_question`;
CREATE TABLE `gap_filling_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `answer` varchar(500) NOT NULL,
  `grade` int(11) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `gap_filling_question_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gap_filling_question
-- ----------------------------
INSERT INTO `gap_filling_question` VALUES ('1', '1', '<p>以下关于<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%C8%ED%BC%FE%B2%E2%CA%D4%2C\" target=\"_blank\">软件测试</a>的叙述中，正确的是\n\n</p>', '1', '3', '2020-05-24 09:52:34');
INSERT INTO `gap_filling_question` VALUES ('2', '1', '<p>在<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%C8%ED%BC%FE%B2%E2%CA%D4%2C\" target=\"_blank\">软件测试</a>中，高效的测试是指\n\n</p>', '10', '3', '2020-05-24 09:52:58');
INSERT INTO `gap_filling_question` VALUES ('3', '1', '<p>用<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%B0%D7%BA%D0%B2%E2%CA%D4%2C\" target=\"_blank\">白盒测试</a>技术测试以下<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%C1%F7%B3%CC%CD%BC%2C\" target=\"_blank\">流程图</a>表示的程序，则至少分别需要设计（ ）个测 试<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%D3%C3%C0%FD%2C\" target=\"_blank\">用例</a>就可以满足<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%D3%EF%BE%E4%B8%B2%B8%C7%2C\" target=\"_blank\">语句覆盖</a>和路径覆盖。\n\n</p>', '10', '3', '2020-05-24 09:53:19');
INSERT INTO `gap_filling_question` VALUES ('4', '1', '<p>目前，<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%D4%C6%BC%C6%CB%E3%2C\" target=\"_blank\">云计算</a>（cloud computing）已成为<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%D0%C5%CF%A2%BB%AF%BD%A8%C9%E8%2C\" target=\"_blank\">信息化建设</a>的主要形态。以下关于<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=15&amp;tk_ci_list_ed=%D4%C6%BC%C6%CB%E3%2C\" target=\"_blank\">云计算</a>的叙述中，不正确的是（ ）\n\n</p>', '12', '3', '2020-05-24 09:54:16');

-- ----------------------------
-- Table structure for `homework`
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `course_id` int(11) NOT NULL,
  `content` longtext,
  `grade` float DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', '作业1', '1', '<p>ffffffffffffffffffffffffffffffffffffffffffffffffff</p>', '10', '2020-05-05 12:10:43', '2020-02-12 09:05:00', '2020-05-13 09:05:00');
INSERT INTO `homework` VALUES ('2', '作业2', '1', '<p>fffffffffffffffffffffffffffffffffffffffffffffffffffffff</p>', '10', '2020-05-05 12:11:01', '2020-02-05 05:15:00', '2020-05-20 14:25:00');
INSERT INTO `homework` VALUES ('3', '作业三', '1', '<p>fffffffffffffffffffffffffffffffffff</p>', '10', '2020-05-05 12:11:21', '2020-02-19 01:00:00', '2020-05-01 03:00:00');
INSERT INTO `homework` VALUES ('4', '测试1', '1', '<p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>', '10', '2020-05-24 09:36:46', '2020-05-01 02:25:00', '2020-05-31 20:45:00');
INSERT INTO `homework` VALUES ('5', '测试2', '1', '<p>dfsdfffffffffffffffffffffffffffffff</p>', '10', '2020-05-24 09:37:06', '2020-05-02 03:00:00', '2020-05-02 03:10:00');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `overdue_time` timestamp NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '1', '期末考试', '<p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>', null, '2020-05-23 21:53:53');

-- ----------------------------
-- Table structure for `paper_essay_map`
-- ----------------------------
DROP TABLE IF EXISTS `paper_essay_map`;
CREATE TABLE `paper_essay_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) NOT NULL,
  `essay_id` int(11) NOT NULL,
  `user_answer` longtext,
  `user_grade` float DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paper_id` (`paper_id`),
  KEY `essay_id` (`essay_id`),
  CONSTRAINT `paper_essay_map_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paper_essay_map_ibfk_2` FOREIGN KEY (`essay_id`) REFERENCES `essay_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_essay_map
-- ----------------------------
INSERT INTO `paper_essay_map` VALUES ('4', '2', '3', null, '0', '2020-05-05 12:02:16');
INSERT INTO `paper_essay_map` VALUES ('5', '2', '4', null, '0', '2020-05-05 12:02:16');
INSERT INTO `paper_essay_map` VALUES ('6', '2', '5', null, '0', '2020-05-05 12:02:16');
INSERT INTO `paper_essay_map` VALUES ('10', '4', '1', null, '0', '2020-05-24 15:12:46');
INSERT INTO `paper_essay_map` VALUES ('11', '4', '3', null, '0', '2020-05-24 15:12:46');
INSERT INTO `paper_essay_map` VALUES ('12', '4', '5', null, '0', '2020-05-24 15:12:46');

-- ----------------------------
-- Table structure for `paper_gap_map`
-- ----------------------------
DROP TABLE IF EXISTS `paper_gap_map`;
CREATE TABLE `paper_gap_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) NOT NULL,
  `gap_id` int(11) NOT NULL,
  `user_answer` varchar(500) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paper_id` (`paper_id`),
  KEY `gap_id` (`gap_id`),
  CONSTRAINT `paper_gap_map_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paper_gap_map_ibfk_2` FOREIGN KEY (`gap_id`) REFERENCES `gap_filling_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_gap_map
-- ----------------------------
INSERT INTO `paper_gap_map` VALUES ('4', '4', '1', null, '2020-05-24 15:12:46');
INSERT INTO `paper_gap_map` VALUES ('5', '4', '2', null, '2020-05-24 15:12:46');
INSERT INTO `paper_gap_map` VALUES ('6', '4', '4', null, '2020-05-24 15:12:46');

-- ----------------------------
-- Table structure for `paper_single_map`
-- ----------------------------
DROP TABLE IF EXISTS `paper_single_map`;
CREATE TABLE `paper_single_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) NOT NULL,
  `single_id` int(11) NOT NULL,
  `user_answer` varchar(500) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paper_id` (`paper_id`),
  KEY `single_id` (`single_id`),
  CONSTRAINT `paper_single_map_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paper_single_map_ibfk_2` FOREIGN KEY (`single_id`) REFERENCES `single_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_single_map
-- ----------------------------
INSERT INTO `paper_single_map` VALUES ('6', '2', '1', null, '2020-05-05 12:02:16');
INSERT INTO `paper_single_map` VALUES ('7', '2', '2', null, '2020-05-05 12:02:16');
INSERT INTO `paper_single_map` VALUES ('8', '2', '3', null, '2020-05-05 12:02:16');
INSERT INTO `paper_single_map` VALUES ('9', '2', '12', null, '2020-05-05 12:02:16');
INSERT INTO `paper_single_map` VALUES ('10', '2', '13', null, '2020-05-05 12:02:16');
INSERT INTO `paper_single_map` VALUES ('16', '4', '1', null, '2020-05-24 15:12:46');
INSERT INTO `paper_single_map` VALUES ('17', '4', '4', null, '2020-05-24 15:12:46');
INSERT INTO `paper_single_map` VALUES ('18', '4', '6', null, '2020-05-24 15:12:46');
INSERT INTO `paper_single_map` VALUES ('19', '4', '8', null, '2020-05-24 15:12:46');
INSERT INTO `paper_single_map` VALUES ('20', '4', '11', null, '2020-05-24 15:12:46');

-- ----------------------------
-- Table structure for `paper_torf_map`
-- ----------------------------
DROP TABLE IF EXISTS `paper_torf_map`;
CREATE TABLE `paper_torf_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) NOT NULL,
  `torf_id` int(11) NOT NULL,
  `user_answer` tinyint(1) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paper_id` (`paper_id`),
  KEY `torf_id` (`torf_id`),
  CONSTRAINT `paper_torf_map_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paper_torf_map_ibfk_2` FOREIGN KEY (`torf_id`) REFERENCES `true_or_false_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_torf_map
-- ----------------------------
INSERT INTO `paper_torf_map` VALUES ('5', '2', '1', null, '2020-05-05 12:02:16');
INSERT INTO `paper_torf_map` VALUES ('6', '2', '2', null, '2020-05-05 12:02:16');
INSERT INTO `paper_torf_map` VALUES ('7', '2', '5', null, '2020-05-05 12:02:16');
INSERT INTO `paper_torf_map` VALUES ('8', '2', '6', null, '2020-05-05 12:02:16');
INSERT INTO `paper_torf_map` VALUES ('13', '4', '4', null, '2020-05-24 15:12:46');
INSERT INTO `paper_torf_map` VALUES ('14', '4', '6', null, '2020-05-24 15:12:46');
INSERT INTO `paper_torf_map` VALUES ('15', '4', '7', null, '2020-05-24 15:12:46');
INSERT INTO `paper_torf_map` VALUES ('16', '4', '8', null, '2020-05-24 15:12:46');

-- ----------------------------
-- Table structure for `single_question`
-- ----------------------------
DROP TABLE IF EXISTS `single_question`;
CREATE TABLE `single_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `choose1` varchar(500) NOT NULL,
  `choose2` varchar(500) NOT NULL,
  `choose3` varchar(500) NOT NULL,
  `choose4` varchar(500) NOT NULL,
  `grade` int(11) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `single_question_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of single_question
-- ----------------------------
INSERT INTO `single_question` VALUES ('1', '1', '<p>在cpu内外常需设置<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B6%E0%BC%B6%B8%DF%CB%D9%BB%BA%B4%E6%2C\" target=\"_blank\">多级高速缓存</a>cache，主要目的是（ ）。</p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:45:52');
INSERT INTO `single_question` VALUES ('2', '1', '<p>某系统的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BF%C9%BF%BF%D0%D4%2C\" target=\"_blank\">可靠性</a>结构框图如下图所示，假设部件1、2、3的可靠度分别为0.90；0.80；0.80（部件2、3为冗余系统）若要求该系统的可靠度不小于0.85，则进行<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%CF%B5%CD%B3%C9%E8%BC%C6%2C\" target=\"_blank\">系统设计</a>时，部件4的可靠度至少应为（ ）。<br><img alt=\"\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/547457567457467.png\" style=\"max-width:30%;\"></p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:46:33');
INSERT INTO `single_question` VALUES ('3', '1', '<p>计算机运行过程中，进行<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D6%D0%B6%CF%2C\" target=\"_blank\">中断</a>处理时需保存现场，其目的是（ ）。</p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:47:22');
INSERT INTO `single_question` VALUES ('4', '1', '<p><a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C4%DA%B4%E6%2C\" target=\"_blank\">内存</a>按<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D7%D6%BD%DA%B1%E0%D6%B7%2C\" target=\"_blank\">字节编址</a>，地址从A0000H到CFFFFH的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C4%DA%B4%E6%2C\" target=\"_blank\">内存</a>，共存（4）字节，若用<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B4%E6%B4%A2%C8%DD%C1%BF%2C\" target=\"_blank\">存储容量</a>为64k*8bit的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B4%E6%B4%A2%C6%F7%2C\" target=\"_blank\">存储器</a>芯片构成该<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C4%DA%B4%E6%2C\" target=\"_blank\">内存</a>空间，至少需要（5）片。</p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:48:56');
INSERT INTO `single_question` VALUES ('5', '1', '<p>执行<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D6%B8%C1%EE%2C\" target=\"_blank\">指令</a>时，将每一节<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D6%B8%C1%EE%2C\" target=\"_blank\">指令</a>都分解为取指、分析和执行三步，已知取指时间t取指=5△t，分析时间t分析= 2△t.<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D6%B4%D0%D0%CA%B1%BC%E4%2C\" target=\"_blank\">执行时间</a>t执行= 3△t如果按照[执行]<sub>K</sub>、[分析]<sub>K+1</sub>、[取指]<sub>K+2</sub>重叠的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C1%F7%CB%AE%CF%DF%2C\" target=\"_blank\">流水线</a>方式执行<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D6%B8%C1%EE%2C\" target=\"_blank\">指令</a>，从头到尾执行完500条<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D6%B8%C1%EE%2C\" target=\"_blank\">指令</a>需（ ）△t.</p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:49:34');
INSERT INTO `single_question` VALUES ('6', '1', '<p>下列<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D0%AD%D2%E9%2C\" target=\"_blank\">协议</a>中，与电子邮箱服务的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B0%B2%C8%AB%2C\" target=\"_blank\">安全</a>性无关的是（ ）。</p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:50:19');
INSERT INTO `single_question` VALUES ('7', '1', '<p>下列算法中，不属于公开<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C3%DC%D4%BF%2C\" target=\"_blank\">密钥</a><a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BC%D3%C3%DC%CB%E3%B7%A8%2C\" target=\"_blank\">加密算法</a>的是（ ）。</p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:51:33');
INSERT INTO `single_question` VALUES ('8', '1', '<p>下图是一个<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C8%ED%BC%FE%CF%EE%C4%BF%2C\" target=\"_blank\">软件项目</a>的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BB%EE%B6%AF%CD%BC%2C\" target=\"_blank\">活动图</a>，其中顶点表示项目<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C0%EF%B3%CC%B1%AE%2C\" target=\"_blank\">里程碑</a>，连接顶点的边表示包含的活动。边上的权重表示活动的持续时间（天），则<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C0%EF%B3%CC%B1%AE%2C\" target=\"_blank\">里程碑</a>（17）不在<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B9%D8%BC%FC%C2%B7%BE%B6%2C\" target=\"_blank\">关键路径</a>上。在其他活动都按时完成的情况下，活动BE最多可以晚（18）天开始而不影响工期。<br><img alt=\"\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/567548659.png\" style=\"max-width:50%;\"></p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:53:12');
INSERT INTO `single_question` VALUES ('10', '1', '<p>假设<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B4%C5%C5%CC%2C\" target=\"_blank\">磁盘</a>臂位于15号<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D6%F9%C3%E6%2C\" target=\"_blank\">柱面</a>上，<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BD%F8%B3%CC%2C\" target=\"_blank\">进程</a>的请求序列如下表表示，如果采用最短<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D2%C6%B1%DB%B5%F7%B6%C8%CB%E3%B7%A8%2C\" target=\"_blank\">移臂调度算法</a>，那么系统的响应序列应为（ ）<br><img alt=\"\" width=\"596\" height=\"235\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/457675677.png\"></p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:54:37');
INSERT INTO `single_question` VALUES ('11', '1', '<p>下图用<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B0%D7%BA%D0%B2%E2%CA%D4%2C\" target=\"_blank\">白盒测试</a>方法进行测试，图中有（30）条路径采用McCabe度量计算该程序图的环路复杂性为（31）。<br><img alt=\"\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/5467587698679.png\" style=\"max-width:30%;\"></p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:55:47');
INSERT INTO `single_question` VALUES ('12', '1', '<p>下图所示<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=UML%2C\" target=\"_blank\">UML</a>图为（38），有关该图的叙述中，不正确的是（39）。<br><img alt=\"\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/657568678679.png\" style=\"max-width:30%;\"></p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:57:02');
INSERT INTO `single_question` VALUES ('13', '1', '<p>欲<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BF%AA%B7%A2%2C\" target=\"_blank\">开发</a>一个<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BB%E6%CD%BC%2C\" target=\"_blank\">绘图</a>软件，要求使用不同的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BB%E6%CD%BC%2C\" target=\"_blank\">绘图</a>程序绘制不同的图形，该<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BB%E6%CD%BC%2C\" target=\"_blank\">绘图</a>软件的扩展性要求将不断扩充新的图形和新的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BB%E6%CD%BC%2C\" target=\"_blank\">绘图</a>程序，以绘制直线和图形为例，得到如下图所示的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C0%E0%CD%BC%2C\" target=\"_blank\">类图</a>，该设计采用（40）模式将抽象部分与其实现部分分离，使它们都可以独立的变化。其中（41）定义了实现类<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%BD%D3%BF%DA%2C\" target=\"_blank\">接口</a>，该模式适用于（42）的情况，该模式属于（43）模式。<br><img alt=\"\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/8678678679.png\" style=\"max-width:50%;\"></p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:57:55');
INSERT INTO `single_question` VALUES ('14', '1', '<p>给定关系R（U，Fr）其中属性属U={A，B，C，D}，函数依赖集Fr={A→BC，B→D}关系S（U，Fs），其中属性集U={ACE}，函数依赖集Fs={A→C，C→E}R和S的主键分别为（44），关于Fr和Fs的叙述，正确的是（45）。</p>', '正确答案', '错误答案1', '错误答案2', '错误答案3', '3', '2020-04-30 03:58:45');

-- ----------------------------
-- Table structure for `stu_comment`
-- ----------------------------
DROP TABLE IF EXISTS `stu_comment`;
CREATE TABLE `stu_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `user_name` varchar(30) NOT NULL,
  `head_img` varchar(500) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `invitation_id` (`invitation_id`),
  CONSTRAINT `stu_comment_ibfk_1` FOREIGN KEY (`invitation_id`) REFERENCES `stu_invitation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `stu_course_map`
-- ----------------------------
DROP TABLE IF EXISTS `stu_course_map`;
CREATE TABLE `stu_course_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `regular_grade` int(11) DEFAULT '0',
  `grade` int(11) DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stu_id` (`stu_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `stu_course_map_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_course_map_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_course_map
-- ----------------------------
INSERT INTO `stu_course_map` VALUES ('2', '2', '1', '100', '0', '2020-05-05 11:59:54');
INSERT INTO `stu_course_map` VALUES ('10', '5', '1', '0', '0', '2020-08-22 09:23:26');

-- ----------------------------
-- Table structure for `stu_homework_answer`
-- ----------------------------
DROP TABLE IF EXISTS `stu_homework_answer`;
CREATE TABLE `stu_homework_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `answer` longtext,
  `grade` float DEFAULT '0',
  `update_time` timestamp NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `homework_id` (`homework_id`),
  KEY `stu_id` (`stu_id`),
  CONSTRAINT `stu_homework_answer_ibfk_1` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_homework_answer_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_homework_answer
-- ----------------------------
INSERT INTO `stu_homework_answer` VALUES ('2', '1', '2', null, '5', null, '2020-05-05 12:10:43');
INSERT INTO `stu_homework_answer` VALUES ('4', '2', '2', null, '2', null, '2020-05-05 12:11:01');
INSERT INTO `stu_homework_answer` VALUES ('6', '3', '2', null, '4', null, '2020-05-05 12:11:21');
INSERT INTO `stu_homework_answer` VALUES ('8', '4', '2', null, '0', null, '2020-05-24 09:36:46');
INSERT INTO `stu_homework_answer` VALUES ('10', '5', '2', null, '0', null, '2020-05-24 09:37:06');

-- ----------------------------
-- Table structure for `stu_invitation`
-- ----------------------------
DROP TABLE IF EXISTS `stu_invitation`;
CREATE TABLE `stu_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stu_id` (`stu_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `stu_invitation_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_invitation_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_invitation
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '111111', '张三', '$2a$10$NZGWu1wLaj1VVs21li6QA.skjpUXIcoItqHuEEkevba2cynnXulVq', 'https://i.ibb.co/GMt4wH4/7892.jpg', null, null, '2020-04-30 03:32:51');
INSERT INTO `student` VALUES ('2', '222222', '李四', '$2a$10$duhOje1IpGZtfrep1BMN1eKaTJ9Sd1ZLNQqHYPvqcPwIFzTfesrNm', 'https://i.ibb.co/mbgF55W/20151121171107-z-MZcy.jpg', null, null, '2020-05-05 11:59:18');
INSERT INTO `student` VALUES ('3', '333333', '王五', '$2a$10$ejCnB9.okGPz88Jq8rZ6BO0i7hL7nKW5SS9orzPg7WEZjvo9mI/bG', 'https://i.ibb.co/mbgF55W/20151121171107-z-MZcy.jpg', null, null, '2020-05-05 11:59:24');
INSERT INTO `student` VALUES ('4', 'test123', 'test123', '$2a$10$39zEgs2lNqdYLXkecsXkueSm1gSe1w6o0KnuuqNqjDwn0fcIFDn1q', 'https://i.ibb.co/mbgF55W/20151121171107-z-MZcy.jpg', null, null, '2020-08-21 22:40:59');
INSERT INTO `student` VALUES ('5', 'lhtfyu', 'lhtfyu', '$2a$10$BR5ZBMYKqBMNq/3wgCQsEeGOsvjZ7XMyAglFOPfWo3vhGuxew3RFy', 'https://i.ibb.co/mbgF55W/20151121171107-z-MZcy.jpg', null, null, '2020-08-22 08:58:16');

-- ----------------------------
-- Table structure for `student_resources`
-- ----------------------------
DROP TABLE IF EXISTS `student_resources`;
CREATE TABLE `student_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `path` varchar(1000) NOT NULL,
  `size` mediumtext NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stu_id` (`stu_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `student_resources_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_resources_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `tea_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tea_comment`;
CREATE TABLE `tea_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `user_name` varchar(30) NOT NULL,
  `head_img` varchar(500) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `invitation_id` (`invitation_id`),
  CONSTRAINT `tea_comment_ibfk_1` FOREIGN KEY (`invitation_id`) REFERENCES `tea_invitation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tea_comment
-- ----------------------------
INSERT INTO `tea_comment` VALUES ('16', '0', '王老师', 'https://i.ibb.co/W52w3tB/898ea9014c086e064d459e1a09087bf40bd1cb8d.jpg', '1', '1231231', '2020-05-24 15:05:54');
INSERT INTO `tea_comment` VALUES ('17', '0', '张三', 'https://i.ibb.co/GMt4wH4/7892.jpg', '1', '1231', '2020-05-24 15:21:27');
INSERT INTO `tea_comment` VALUES ('18', '0', '张三', 'https://i.ibb.co/GMt4wH4/7892.jpg', '2', '231', '2020-06-16 16:19:34');
INSERT INTO `tea_comment` VALUES ('19', '0', '张三', 'https://i.ibb.co/GMt4wH4/7892.jpg', '2', '3434', '2020-06-16 16:19:41');
INSERT INTO `tea_comment` VALUES ('20', '0', '王老师', 'https://i.ibb.co/W52w3tB/898ea9014c086e064d459e1a09087bf40bd1cb8d.jpg', '4', '666', '2020-06-16 17:18:07');

-- ----------------------------
-- Table structure for `tea_invitation`
-- ----------------------------
DROP TABLE IF EXISTS `tea_invitation`;
CREATE TABLE `tea_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `tea_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tea_id` (`tea_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tea_invitation_ibfk_1` FOREIGN KEY (`tea_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tea_invitation_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tea_invitation
-- ----------------------------
INSERT INTO `tea_invitation` VALUES ('1', '1', '1', 'test', '<p>&nbsp;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>', '2020-05-24 09:32:10');
INSERT INTO `tea_invitation` VALUES ('2', '1', '1', 'test2', '<p>许多人因为给自己定的目标太高太功利，因为难以<a href=\"http://www.duwenzhang.com/huati/chenggong/index1.html\">成功</a>而变得灰头土脸，最终灰心失望。究其原因，往往就是因为太关注拥有，而忽略做一个努力的人。对于今天的孩子们，如果只关注他们将来该做个什么样的人物，不把意志品质作为一个<a href=\"http://www.duwenzhang.com/huati/zuoren/index1.html\">做人</a>的目标提出来，最终我们只能培养出狭隘、自私、<a href=\"http://www.duwenzhang.com/huati/cuiruo/index1.html\">脆弱</a>和境界不高的人。<a href=\"http://www.duwenzhang.com/huati/yihan/index1.html\">遗憾</a>的是，我们在这方面做得并不尽如人意。&nbsp;&nbsp;<br></p>', '2020-05-24 09:34:11');
INSERT INTO `tea_invitation` VALUES ('3', '1', '1', '12312312', '<p>dfffffffffffffffffffffffffffff</p>', '2020-06-16 17:15:58');
INSERT INTO `tea_invitation` VALUES ('4', '1', '1', '十大经典排序算法', '<header><h1 itemprop=\"name headline\" style=\"text-align: center;\">十大经典排序算法</h1><div><div style=\"text-align: center;\">&nbsp;发表于&nbsp;<time title=\"创建时间：2020-06-14 10:42:59\" itemprop=\"dateCreated datePublished\" datetime=\"2020-06-14T10:42:59+08:00\">2020-06-14</time>&nbsp;&nbsp;<i></i>&nbsp;更新于&nbsp;<time title=\"修改时间：2020-06-15 00:00:00\" itemprop=\"dateModified\" datetime=\"2020-06-15T00:00:00+08:00\">2020-06-15</time></div><i><div style=\"text-align: center;\">&nbsp;本文字数：&nbsp;2.6k</div></i></div></header><div itemprop=\"articleBody\"><div><table style=\"text-align: center;\"><thead><tr><th>算法</th><th>时间复杂度(平均)</th><th>时间复杂度(最坏)</th><th>时间复杂度(最优)</th><th>空间复杂度</th><th>稳定性</th></tr></thead><tbody><tr><td>冒泡排序</td><td>O(n<sup>2</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(n)</td><td>O(1)</td><td>稳定</td></tr><tr><td>选择排序</td><td>O(n<sup>2</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(1)</td><td>不稳定</td></tr><tr><td>插入排序</td><td>O(n<sup>2</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(n)</td><td>O(1)</td><td>稳定</td></tr><tr><td>希尔排序</td><td>O(n<sup>1.3</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(n)</td><td>O(1)</td><td>不稳定</td></tr><tr><td>快速排序</td><td>O(nlog<sub>2</sub>n)</td><td>O(n<sup>2</sup>)</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>不稳定</td></tr><tr><td>归并排序</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>O(n)</td><td>稳定</td></tr><tr><td>计数排序</td><td>O(n+k)</td><td>O(n+k)</td><td>O(n+k)</td><td>O(n+k)</td><td>稳定</td></tr><tr><td>基数排序</td><td>O(n*k)</td><td>O(n*k)</td><td>O(n*k)</td><td>O(n+k)</td><td>稳定</td></tr><tr><td>桶排序</td><td>O(n<sup>2</sup>)</td><td>O(n*k)</td><td>O(n)</td><td>O(n+k)</td><td>稳定</td></tr><tr><td>堆排序</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>O(1)</td><td>稳定</td></tr></tbody></table></div><a id=\"more\"></a><h2 id=\"冒泡排序\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F\"></a>冒泡排序</h2><p style=\"text-align: center;\">冒泡排序（Bubble Sort）又称为泡式排序，是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。</p><h3 id=\"步骤\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E6%AD%A5%E9%AA%A4\"></a>步骤</h3><ol><li style=\"text-align: center;\">比较相邻的元素。如果第一个比第二个大，就交换他们两个。</li><li style=\"text-align: center;\">对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。</li><li style=\"text-align: center;\">针对所有的元素重复以上的步骤，除了最后一个。</li></ol><h3 id=\"动图\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E5%8A%A8%E5%9B%BE\"></a>动图</h3><p style=\"text-align: center;\"><img data-src=\"https://i.loli.net/2020/06/14/S7Y48LIp2s1wWXl.gif\" alt=\"1592110929.gif\" src=\"https://i.loli.net/2020/06/14/S7Y48LIp2s1wWXl.gif\" data-loaded=\"true\"></p><h3 id=\"java实现\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0\"></a>Java实现</h3><figure><div><table style=\"text-align: center;\"><tbody><tr><td><pre>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>10<br>11<br>12<br>13<br>14<br>15<br>16<br>17<br>18<br>19<br>20<br>21<br>22<br>23<br>24<br>25<br>26<br>27<br>28<br>29<br>30<br></pre></td><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.bubbleSort(nums);<br>    }      <br>            <br>    public static void bubbleSort(int[] nums) {<br>        boolean isSwap;<br>        // 外层循环控制比较的轮数<br>        for (int i = 0; i &lt; nums.length - 1; i++) {<br>            isSwap = false;<br>            // 内层循环进行相邻元素比较<br>            for (int j = 0; j &lt; nums.length - 1 - i; j++) {<br>                if (nums[j] &gt; nums[j + 1]) { // 后面的数比前面的数小则交换<br>                    swap(nums, j, j + 1);<br>                    isSwap = true;<br>                }<br>            }<br>            if (!isSwap) {<br>                return; // 代码优化，如果一轮循环中没有进行交换元素则说明数组已经是有序的了<br>            }<br>        }<br>    }<br>    <br>    public static void swap(int[] nums, int i, int j) {<br>        int temp = nums[i];<br>        nums[i] = nums[j];<br>        nums[j] = temp;<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr style=\"text-align: center;\"><h2 id=\"选择排序\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E9%80%89%E6%8B%A9%E6%8E%92%E5%BA%8F\"></a>选择排序</h2><p style=\"text-align: center;\">首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。</p><h3 id=\"步骤-2\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-2\"></a>步骤</h3><ol><li style=\"text-align: center;\">寻找出数组中最小（大）的一个数</li><li style=\"text-align: center;\">将最小的数与当前遍历数组的首个元素交换</li><li style=\"text-align: center;\">缩小遍历数组范围重复前两步</li></ol><h3 id=\"动图-2\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-2\"></a>动图</h3><p style=\"text-align: center;\"><img data-src=\"https://i.loli.net/2020/06/14/H4JXQarFPDE9AR3.gif\" alt=\"1592114887.gif\" src=\"https://i.loli.net/2020/06/14/H4JXQarFPDE9AR3.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-2\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-2\"></a>Java实现</h3><figure><div><table style=\"text-align: center;\"><tbody><tr><td><pre>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>10<br>11<br>12<br>13<br>14<br>15<br>16<br>17<br>18<br>19<br>20<br>21<br>22<br>23<br>24<br>25<br>26<br>27<br>28<br></pre></td><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.selectionSort(nums);<br>    }      <br>        <br>    public static void selectionSort(int[] nums) {<br>        int min;<br>        for (int i = 0; i &lt; nums.length - 1; i++) {<br>            min = i; // 默认当前排序数组的第一个元素为最小值<br>            for (int j = i + 1; j &lt; nums.length; j++) {<br>                if (nums[min] &gt; nums[j]) { // 发现一个更小的，更小最小值索引<br>                    min = j;<br>                }<br>            }<br><br>            if (i != min) {<br>                swap(nums, i, min);<br>            }<br>        }<br>    }<br><br>    public static void swap(int[] nums, int i, int j) {<br>        int temp = nums[i];<br>        nums[i] = nums[j];<br>        nums[j] = temp;<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr style=\"text-align: center;\"><h2 id=\"插入排序\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E6%8F%92%E5%85%A5%E6%8E%92%E5%BA%8F\"></a>插入排序</h2><p style=\"text-align: center;\">它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。插入排序在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。</p><h3 id=\"步骤-3\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-3\"></a>步骤</h3><ol><li style=\"text-align: center;\">从第一个元素开始，该元素可以认为已经被排序</li><li style=\"text-align: center;\">取出下一个元素，在已经排序的元素序列中从后向前扫描</li><li style=\"text-align: center;\">如果该元素（已排序）大于新元素，将该元素移到下一位置</li><li style=\"text-align: center;\">重复步骤3，直到找到已排序的元素小于或者等于新元素的位置</li><li style=\"text-align: center;\">将新元素插入到该位置后</li><li style=\"text-align: center;\">重复步骤2~5</li></ol><h3 id=\"动图-3\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-3\"></a>动图</h3><p style=\"text-align: center;\"><img data-src=\"https://i.loli.net/2020/06/14/Ag59nrFTfE8YaMB.gif\" alt=\"1592116078.gif\" src=\"https://i.loli.net/2020/06/14/Ag59nrFTfE8YaMB.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-3\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-3\"></a>Java实现</h3><figure><div><table style=\"text-align: center;\"><tbody><tr><td><pre>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>10<br>11<br>12<br>13<br>14<br>15<br>16<br>17<br>18<br>19<br>20<br>21<br>22<br>23<br></pre></td><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.insertionSort(nums);<br>    }      <br>    <br>    public static void insertionSort(int[] nums) {<br>        for (int i = 1; i &lt; nums.length; i++) {<br>            // 比前面的数小<br>            if (nums[i] &lt; nums[i - 1]) {<br>                int temp = nums[i]; // 将这个值保存起来<br>                int j = i;<br>                // 往前找 直到找到一个小于这个数的值<br>                do {<br>                    nums[j] = nums[j - 1];<br>                    j--;<br>                } while (j &gt;= 0 &amp;&amp; nums[j] &gt; temp);<br><br>                nums[j + 1] = temp; // 把这个数放在寻找到的数的后面<br>            }<br>        }<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr style=\"text-align: center;\"><h2 id=\"希尔排序\" style=\"text-align: center;\"><a href=\"https://zfhelo.gitee.io/2020/06/14/1/#%E5%B8%8C%E5%B0%94%E6%8E%92%E5%BA%8F\"></a>希尔排序</h2><p style=\"text-align: center;\">希尔排序是对<strong>插入排序的改良</strong>。插入排序对已经基本有序的数组排序效率高，但在移动元素时只能是相邻的两个元素交换希尔排序加了一个间隔使交换元素不限于相邻。间隔逐</p></div>', '2020-06-16 17:17:08');
INSERT INTO `tea_invitation` VALUES ('5', '1', '1', '十大经典排序算法', '<header><h1 itemprop=\"name headline\"><table style=\"font-size: large;\"><thead><tr><th>算法</th><th>时间复杂度(平均)</th><th>时间复杂度(最坏)</th><th>时间复杂度(最优)</th><th>空间复杂度</th><th>稳定性</th></tr></thead><tbody><tr><td>冒泡排序</td><td>O(n<sup>2</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(n)</td><td>O(1)</td><td>稳定</td></tr><tr><td>选择排序</td><td>O(n<sup>2</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(1)</td><td>不稳定</td></tr><tr><td>插入排序</td><td>O(n<sup>2</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(n)</td><td>O(1)</td><td>稳定</td></tr><tr><td>希尔排序</td><td>O(n<sup>1.3</sup>)</td><td>O(n<sup>2</sup>)</td><td>O(n)</td><td>O(1)</td><td>不稳定</td></tr><tr><td>快速排序</td><td>O(nlog<sub>2</sub>n)</td><td>O(n<sup>2</sup>)</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>不稳定</td></tr><tr><td>归并排序</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>O(n)</td><td>稳定</td></tr><tr><td>计数排序</td><td>O(n+k)</td><td>O(n+k)</td><td>O(n+k)</td><td>O(n+k)</td><td>稳定</td></tr><tr><td>基数排序</td><td>O(n*k)</td><td>O(n*k)</td><td>O(n*k)</td><td>O(n+k)</td><td>稳定</td></tr><tr><td>桶排序</td><td>O(n<sup>2</sup>)</td><td>O(n*k)</td><td>O(n)</td><td>O(n+k)</td><td>稳定</td></tr><tr><td>堆排序</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>O(nlog<sub>2</sub>n)</td><td>O(1)</td><td>稳定</td></tr></tbody></table></h1></header><div itemprop=\"articleBody\"><a id=\"more\"></a><h2 id=\"冒泡排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F\"></a>冒泡排序</h2><p>冒泡排序（Bubble Sort）又称为泡式排序，是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。</p><h3 id=\"步骤\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%AD%A5%E9%AA%A4\"></a>步骤</h3><ol><li>比较相邻的元素。如果第一个比第二个大，就交换他们两个。</li><li>对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。</li><li>针对所有的元素重复以上的步骤，除了最后一个。</li></ol><h3 id=\"动图\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%8A%A8%E5%9B%BE\"></a>动图</h3><p><img data-src=\"http://zfhelo.gitee.io/images/1592110929.gif\" alt=\"1592110929.gif\" src=\"http://zfhelo.gitee.io/images/1592110929.gif\" data-loaded=\"true\"></p><h3 id=\"java实现\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.bubbleSort(nums);<br>    }      <br>            <br>    public static void bubbleSort(int[] nums) {<br>        boolean isSwap;<br>        // 外层循环控制比较的轮数<br>        for (int i = 0; i &lt; nums.length - 1; i++) {<br>            isSwap = false;<br>            // 内层循环进行相邻元素比较<br>            for (int j = 0; j &lt; nums.length - 1 - i; j++) {<br>                if (nums[j] &gt; nums[j + 1]) { // 后面的数比前面的数小则交换<br>                    swap(nums, j, j + 1);<br>                    isSwap = true;<br>                }<br>            }<br>            if (!isSwap) {<br>                return; // 代码优化，如果一轮循环中没有进行交换元素则说明数组已经是有序的了<br>            }<br>        }<br>    }<br>    <br>    public static void swap(int[] nums, int i, int j) {<br>        int temp = nums[i];<br>        nums[i] = nums[j];<br>        nums[j] = temp;<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"选择排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E9%80%89%E6%8B%A9%E6%8E%92%E5%BA%8F\"></a>选择排序</h2><p>首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。</p><h3 id=\"步骤-2\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-2\"></a>步骤</h3><ol><li>寻找出数组中最小（大）的一个数</li><li>将最小的数与当前遍历数组的首个元素交换</li><li>缩小遍历数组范围重复前两步</li></ol><h3 id=\"动图-2\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-2\"></a>动图</h3><p><img data-src=\"http://zfhelo.gitee.io/images/1592114887.gif\" alt=\"1592114887.gif\" src=\"http://zfhelo.gitee.io/images/1592114887.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-2\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-2\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.selectionSort(nums);<br>    }      <br>        <br>    public static void selectionSort(int[] nums) {<br>        int min;<br>        for (int i = 0; i &lt; nums.length - 1; i++) {<br>            min = i; // 默认当前排序数组的第一个元素为最小值<br>            for (int j = i + 1; j &lt; nums.length; j++) {<br>                if (nums[min] &gt; nums[j]) { // 发现一个更小的，更小最小值索引<br>                    min = j;<br>                }<br>            }<br><br>            if (i != min) {<br>                swap(nums, i, min);<br>            }<br>        }<br>    }<br><br>    public static void swap(int[] nums, int i, int j) {<br>        int temp = nums[i];<br>        nums[i] = nums[j];<br>        nums[j] = temp;<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"插入排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%8F%92%E5%85%A5%E6%8E%92%E5%BA%8F\"></a>插入排序</h2><p>它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。插入排序在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。</p><h3 id=\"步骤-3\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-3\"></a>步骤</h3><ol><li>从第一个元素开始，该元素可以认为已经被排序</li><li>取出下一个元素，在已经排序的元素序列中从后向前扫描</li><li>如果该元素（已排序）大于新元素，将该元素移到下一位置</li><li>重复步骤3，直到找到已排序的元素小于或者等于新元素的位置</li><li>将新元素插入到该位置后</li><li>重复步骤2~5</li></ol><h3 id=\"动图-3\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-3\"></a>动图</h3><p><img data-src=\"http://zfhelo.gitee.io/images/1592116078.gif\" alt=\"1592116078.gif\" src=\"http://zfhelo.gitee.io/images/1592116078.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-3\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-3\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.insertionSort(nums);<br>    }      <br>    <br>    public static void insertionSort(int[] nums) {<br>        for (int i = 1; i &lt; nums.length; i++) {<br>            // 比前面的数小<br>            if (nums[i] &lt; nums[i - 1]) {<br>                int temp = nums[i]; // 将这个值保存起来<br>                int j = i;<br>                // 往前找 直到找到一个小于这个数的值<br>                do {<br>                    nums[j] = nums[j - 1];<br>                    j--;<br>                } while (j &gt;= 0 &amp;&amp; nums[j] &gt; temp);<br><br>                nums[j + 1] = temp; // 把这个数放在寻找到的数的后面<br>            }<br>        }<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"希尔排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%B8%8C%E5%B0%94%E6%8E%92%E5%BA%8F\"></a>希尔排序</h2><p>希尔排序是对<strong>插入排序的改良</strong>。插入排序对已经基本有序的数组排序效率高，但在移动元素时只能是相邻的两个元素交换希尔排序加了一个间隔使交换元素不限于相邻。间隔逐渐缩小当缩小到1时数组已经基本有序</p><p><strong>当间隔缩小时不会破坏大间隔的排序</strong></p><h3 id=\"动图-4\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-4\"></a>动图</h3><p><img data-src=\"http://zfhelo.gitee.io/images/1592124465.gif\" alt=\"1592124465.gif\" src=\"http://zfhelo.gitee.io/images/1592124465.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-4\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-4\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.shellSort(nums);<br>    }    <br>    <br>    public static void shellSort(int[] nums) {<br>        int interval = nums.length / 2; // 默认间隔<br>        <br>        while (interval &gt;= 1) {<br>            for (int i = interval; i &lt; nums.length - 1; i++) {<br>                int preIndex = i - interval;<br>                int temp = nums[i];<br>                <br>                if (temp &lt; nums[preIndex]) {<br>                    while (preIndex &gt;= 0 &amp;&amp; temp &lt; nums[preIndex]) {<br>                        nums[preIndex + interval] = nums[preIndex];<br>                        preIndex -= interval;<br>                    }<br>                    nums[preIndex + interval] = temp;<br>                }<br>            }<br>            <br>            interval = interval / 2; // 缩小间隔<br>        }<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"快速排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F\"></a>快速排序</h2><p>通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。</p><h3 id=\"步骤-4\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-4\"></a>步骤</h3><ol><li>将左边第一个数做为基准值</li><li>从右边向左遍历寻找出一个小于基准数的值，将其赋值给左边的位置</li><li>从左边向右遍历寻找出一个小于基准数的值，将其赋值给右边的位置</li><li>重复2，3 直到左右索引相遇</li><li>将基准值放在相遇的这个坐标上</li><li>递归基准值左右两边的子数组</li></ol><h3 id=\"java实现-5\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-5\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.quickSort(nums);<br>    }    <br>    public static void quickSort(int[] nums) {<br>        quickSort(nums, 0, nums.length - 1);<br>    }<br>    <br>	/**<br>    * @param left 数组起始索引<br>    * @param right 数组结束索引<br>    */<br>    public static void quickSort(int[] nums, int left, int right) {<br>        if (left &lt; right) {<br>            int l = left;<br>            int r = right;<br>            int pivot = nums[left]; // 将左边第一个数当做基准值<br><br>            while (left &lt; right) {<br>                // 应为上面以左边第一个数为基准值，所以我们先从右边开始找<br>                // 找到一个小于这个基准值得数<br>                while (left &lt; right &amp;&amp; nums[right] &gt;= pivot) {<br>                    right--;<br>                }<br>                nums[left] = nums[right]; // 把这个数放在数组左边<br><br>                // 在从左边开始找一个大于基准数的值放在右边<br>                while (left &lt; right &amp;&amp; nums[left] &lt; pivot) {<br>                    left++;<br>                }<br>                nums[right] = nums[left];<br>            }<br>            // 此时left == right 我们把基准值放在相遇的这个索引上<br>            nums[left] = pivot;<br>            // 此时基准值左边的数都小于或等于它，右边的数都大于它<br>            quickSort(nums, l, left - 1); // 递归左边的数组<br>            quickSort(nums, right + 1, r); // 递归右边的数组<br>        }<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"归并排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F\"></a>归并排序</h2><p>归并排序（MERGE-SORT）是建立在归并操作上的一种有效的排序算法,该算法是采用<strong>分治法</strong>（Divide and Conquer）的一个非常典型的应用。将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为二路归并。归并排序是一种稳定的排序方法。</p><h3 id=\"步骤-5\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-5\"></a>步骤</h3><ol><li>申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列</li><li>设定两个指针，最初位置分别为两个已经排序序列的起始位置</li><li>比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置</li><li>重复步骤3直到某一指针到达序列尾</li><li>将另一序列剩下的所有元素直接复制到合并序列尾</li></ol><h3 id=\"动图-5\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-5\"></a>动图</h3><p><img data-src=\"http://zfhelo.gitee.io/images/1592128354.gif\" alt=\"1592128354.gif\" src=\"http://zfhelo.gitee.io/images/1592128354.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-6\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-6\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.mergeSort(nums);<br>    }<br>	<br>    public static void mergeSort(int[] nums) {<br>        mergeSort(nums, new int[nums.length], 0, nums.length - 1);<br>    }<br><br>    /**<br>     * @param temp  临时数组，与排序数组长度一样<br>     * @param start 数组起始索引<br>     * @param end   数组结束索引<br>     */<br>    private static void mergeSort(int[] nums, int[] temp, int start, int end) {<br>        if (start == end) {<br>            return;<br>        }<br>        int splitIndex = (end + start) / 2;<br>        mergeSort(nums, temp, start, splitIndex);<br>        mergeSort(nums, temp, splitIndex + 1, end);<br>        merge(nums, temp, start, splitIndex + 1, end);<br>    }<br><br>    /**<br>     * 合并两个有序数组<br>     *<br>     * @param nums   目标数组，前半部分和后半部分有序<br>     * @param temp   临时数组<br>     * @param first  前半部分有序数组起始索引<br>     * @param second 后半部分有序数组缩影<br>     * @param end    数组结束索引<br>     */<br>    private static void merge(int[] nums, int[] temp, int first, int second, int end) {<br>        // 先将前半部分拷贝出来<br>        for (int i = first; i &lt; second; i++) {<br>            temp[i] = nums[i];<br>        }<br>        // 合并连个有序数组<br>        int numsIndex = first; // 目标数组索引<br>        int subStart = second; // 第二个数组的起始索引<br>        while (first &lt; subStart &amp;&amp; second &lt;= end) {<br>            if (temp[first] &lt; nums[second]) {<br>                nums[numsIndex++] = temp[first++];<br>            } else {<br>                nums[numsIndex++] = nums[second++];<br>            }<br>        }<br>        h// 如果临时数组中还有数，则全部移到目标数组中<br>        while (first &lt; subStart) {<br>            nums[numsIndex++] = temp[first++];<br>        }<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"计数排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F\"></a>计数排序</h2><p>计数排序是桶排序的一种。是一个非基于比较的排序算法，。它的优势在于在对一定范围内的整数排序时，它的复杂度为Ο(n+k)（其中k是整数的范围），快于任何比较排序算法。 当然这是一种牺牲空间换取时间的做法，而且当O(k)&gt;O(n*log(n))的时候其效率反而不如基于比较的排序</p><h3 id=\"步骤-6\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-6\"></a>步骤</h3><ol><li>找出数组中最大最小值</li><li>创建对应长度的数组（max - min +1）</li><li>统计每个数出现的次数 array[val - min]++</li><li>填充目标数组</li></ol><h3 id=\"动图-6\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-6\"></a>动图</h3><p><img data-src=\"http://zfhelo.gitee.io/images/1592130787.gif\" alt=\"1592130787.gif\" src=\"http://zfhelo.gitee.io/images/1592130787.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-7\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-7\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.countSort(nums);<br>    }<br>	<br>    public static void countSort(int[] nums) {<br>        int minNum = nums[0];<br>        int maxNum = nums[0];<br>        for (int i = 0; i &lt; nums.length; i++) {<br>            if (nums[i] &lt; minNum) {<br>                minNum = nums[i];<br>            } else if (nums[i] &gt; maxNum) {<br>                maxNum = nums[i];<br>            }<br>        }<br>        countSort(nums, minNum, maxNum);<br>    }<br><br>    /**<br>     * @param nums   待排序数组<br>     * @param minNum 数组中最大值<br>     * @param maxNum 数组中最小值<br>     */<br>    private static void countSort(int[] nums, int minNum, int maxNum) {<br>        int[] temp = new int[maxNum - minNum + 1];<br>        for (int i = 0; i &lt; nums.length; i++) {<br>            temp[nums[i] - minNum]++;<br>        }<br>        int targetIndex = 0;<br>        for (int i = 0; i &lt; temp.length; i++) {<br>            for (int j = 0; j &lt; temp[i]; j++) {<br>                nums[targetIndex++] = i + minNum;<br>            }<br>        }<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"基数排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F\"></a>基数排序</h2><p>基数排序是桶排序的一种。原理是将整数按位数切割成不同的数字，然后按每个位数分别比较。每位比较完成后将数组重新排序。当最高位完成比较时，数组也就变成了一个有序序列。</p><h3 id=\"动图-7\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-7\"></a>动图</h3><p><img data-src=\"http://zfhelo.gitee.io/images/1592184441.gif\" alt=\"1592184441.gif\" src=\"http://zfhelo.gitee.io/images/1592184441.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-8\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-8\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>// 只支持正整数<br>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.radixSort(nums);<br>    }<br><br>    public static void radixSort(int[] nums) {<br>        int maxDigital = getMaxDigital(nums); // 获取最大值<br>        int maxLength = (maxDigital + \"\").length(); // 获取最大值位数<br>        int[] count = new int[10]; // 用于分别统计原数组 个 十 百...位上出现的次数<br>        int[] temp = new int[nums.length]; // 临时数组，用于保存正在排序的数组<br><br>        for (int i = 0; i &lt; maxLength; i++) {<br>            int divisor = (int) Math.pow(10, i);<br>            // 统计每个位置上的数出现的次数<br>            for (int j = 0; j &lt; nums.length; j++) {<br>                int remainder = (nums[j] / divisor) % 10;<br>                count[remainder]++;<br>            }<br>            // 累加数组 记录着对应值在源数组最后应该出现的位置<br>            for (int j = 1; j &lt; count.length; j++) {<br>                count[j] += count[j - 1];<br>            }<br><br>            // 通过累加数组算出该数在原数组中最后出现的位置<br>            for (int j = nums.length - 1; j &gt;= 0; j--) {<br>                int remainder = (nums[j] / divisor) % 10;<br>                barrel[--count[remainder]] = nums[j]; // <br>            }<br>			// 将经过排序的数组复制到原数组中<br>            System.arraycopy(temp, 0, nums, 0, barrel.length);<br>            Arrays.fill(count, 0);<br>        }<br>    }<br><br>    // 获取最大值<br>    public static int getMaxDigital(int[] nums) {<br>        int max = nums[0];<br>        for (int i = 1; i &lt; nums.length; i++) {<br>            if (max &lt; nums[i]) {<br>                max = nums[i];<br>            }<br>        }<br>        return max;<br>    }<br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"桶排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%A1%B6%E6%8E%92%E5%BA%8F\"></a>桶排序</h2><p>桶排序（Bucket sort）或所谓的箱排序，是一个排序算法，工作的原理是将数组分到有限数量的桶里。每个桶再个别排序。</p><h3 id=\"步骤-7\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-7\"></a>步骤</h3><ol><li>设置一个定量的数组当作空桶子。</li><li>寻访序列，并且把项目一个一个放到对应的桶子去。</li><li>对每个不是空的桶子进行排序。</li><li>从不是空的桶子里把项目再放回原来的序列中。</li></ol><h3 id=\"动图-8\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%8A%A8%E5%9B%BE-8\"></a>动图</h3><p><img data-src=\"http://zfhelo.gitee.io/images/1592216501.gif\" alt=\"1592216501.gif\" src=\"http://zfhelo.gitee.io/images/1592216501.gif\" data-loaded=\"true\"></p><h3 id=\"java实现-9\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-9\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.bucketSort(nums);<br>    }<br><br>    public static void bucketSort(int[] nums) {<br>        int max = nums[0];<br>        int min = nums[0];<br>        for (int i = 1; i &lt; nums.length; i++) {<br>            if (max &lt; nums[i]) {<br>                max = nums[i];<br>            }<br>            if (min &gt; nums[i]) {<br>                min = nums[i];<br>            }<br>        }<br>        int bucketNum = (max - min) / 10 + 1; // 桶的数量<br>        List[] buckets = new ArrayList[bucketNum];<br>        for (int i = 0; i &lt; buckets.length; i++) {<br>            buckets[i] = new ArrayList&lt;Integer&gt;();<br>        }<br><br>        // 把元素装入桶中<br>        for (int i = 0; i &lt; nums.length; i++) {<br>            int a = (nums[i] - min) / 10;<br>            buckets[a].add(nums[i]);<br>        }<br><br>        int index = 0;<br>        for (List&lt;Integer&gt; b : buckets) {<br>            insertionSort(b); // 排序桶内元素<br>            for (Integer num : b) {<br>                nums[index++] = num; // 取出排序好的元素<br>            }<br>        }<br>    }<br>	// 插入排序<br>    public static void insertionSort(List&lt;Integer&gt; nums) {<br>        for (int i = 1; i &lt; nums.size(); i++) {<br>            // 从第二个开始查看是否比前一个小<br>            if (nums.get(i) &lt; nums.get(i - 1)) {<br>                // 逐个往前找如果大于此数则将其往后移动一位<br>                int temp = nums.get(i);<br>                int j = i - 1;<br>                while (j &gt;= 0 &amp;&amp; temp &lt; nums.get(j)) {<br>                    nums.set(j + 1, nums.get(j));<br>                    j--;<br>                }<br>                // 找到一个比它小的数----将其赋值给此数后面的元素<br>                nums.set(j + 1, temp);<br>            }<br>        }<br>    }<br><br>}<br></pre></td></tr></tbody></table></div><div><i></i></div></figure><hr><h2 id=\"堆排序\"><a href=\"http://localhost:4000/2020/06/14/1/#%E5%A0%86%E6%8E%92%E5%BA%8F\"></a>堆排序</h2><p>堆排序是指利用堆这种数据结构所设计的一种排序算法。堆是一个近似完全二叉树的结构，并同时满足堆积的性质：即子结点的键值或索引总是小于（或者大于）它的父节点。</p><blockquote><p>堆</p></blockquote><p>堆是一个<strong>完全二叉树</strong>，完全二叉树就是节点从上往下从左往右中间不会有缺失的。简单点说就是一个节点如果存在右子树那么左子树也一定存在</p><p><img data-src=\"http://zfhelo.gitee.io/images/1592201293.png\" alt=\"1592201293.png\" src=\"http://zfhelo.gitee.io/images/1592201293.png\" data-loaded=\"true\"></p><p>上图中在3这个节点有右子树却没有左子树，所以这不是一个完全二叉树。</p><blockquote><p>堆还分为大顶堆和小顶堆</p></blockquote><ul><li>大顶堆 父节点值大于或等于子节点</li><li>小顶堆 父节点值小于或等于子节点</li></ul><p><img data-src=\"http://zfhelo.gitee.io/images/1592202641.png\" alt=\"1592202641.png\" src=\"http://zfhelo.gitee.io/images/1592202641.png\" data-loaded=\"true\"></p><p>如果我们把一个数组上的元素都映射到一个堆上可以发现他们的index有着如下的关系左节点index = 父节点 * 2 + 1 右节点index = 父节点 * 2 + 2</p><p><img data-src=\"http://zfhelo.gitee.io/images/1592203680.png\" alt=\"1592203680.png\" src=\"http://zfhelo.gitee.io/images/1592203680.png\" data-loaded=\"true\"></p><p>对于一个大顶堆，根节点就是它的最大值。我们只需要根据上面的关系进行交换父子节点的元素，就可以将一个随机的数组转化为堆。然后将根节点和最后的节点交换位置。然后把缩小数组长度。在对这个数组进行堆的转化，同时又可以获取到该数组最大的数，在移动到数组最后面。在进行堆的转化…</p><h3 id=\"步骤-8\"><a href=\"http://localhost:4000/2020/06/14/1/#%E6%AD%A5%E9%AA%A4-8\"></a>步骤</h3><ol><li>将整个数组构建成堆</li><li>交换根节点和最后一个节点</li><li>从根节点开始heapify</li><li>重复2，3直到遍历所有元素</li></ol><p><img data-src=\"http://zfhelo.gitee.io/images/1592209139.png\" alt=\"1592209139.png\" src=\"http://zfhelo.gitee.io/images/1592209139.png\" data-loaded=\"true\"></p><h3 id=\"java实现-10\"><a href=\"http://localhost:4000/2020/06/14/1/#java%E5%AE%9E%E7%8E%B0-10\"></a>Java实现</h3><figure><div><table><tbody><tr><td><pre>public class Sort {<br>    public static void main(String[] args) {<br>        int[] nums = {3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48};<br>        Sort.heapSort(nums);<br>    }<br><br>    public static void heapSort(int[] nums) {<br>        build(nums); // 将数组构建成堆<br>        for (int i = nums.length - 1; i &gt;= 0; i--) {<br>            // 根节点为此时是最大值，将其放在最后一个位置<br>            swap(nums, 0, i);<br>            // 缩小数组 将数组再次构建成堆<br>            heapify(nums, i, 0);<br>        }<br>    }<br><br>    // 调整堆<br>    private static void heapify(int[] tree, int n, int p) {<br>        int l = p * 2 + 1; // 左孩子<br>        int r = p * 2 + 2; // 有孩子<br>        int max = p;<br>        if (l &lt; n &amp;&amp; tree[max] &lt; tree[l]) {<br>            max = l;<br>        }<br>        if (r &lt; n &amp;&amp; tree[max] &lt; tree[r]) {<br>            max = r;<br>        }<br>        if (max != p) {<br>            swap(tree, p, max);<br>            heapify(tree, n, max); // 被交换的节点可能会影响到子节点<br>        }<br>    }<br><br>    // 将数组构建堆<br>    private static void build(int[] tree) {<br>        // 从最后一个 parent 开始构建堆<br>        for (int p = (tree.length - 2) / 2; p &gt;= 0; p--) {<br>            heapify(tree, tree.length, p);<br>        }<br>    }<br><br>    // 交换<br>    private static void swap(int[] nums, int i, int j) {<br>        int temp = nums[i];<br>        nums[i] = nums[j];<br>        nums[j] = temp;<br>    }<br>}</pre></td></tr></tbody></table></div></figure></div>', '2020-06-30 14:07:39');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'tttttt', '王老师', '$2a$10$QW.GQYnslY3aRabwUqD/z.BWu7Mi06av95rqGPUcTnt/.N2mYtNmK', 'https://i.ibb.co/W52w3tB/898ea9014c086e064d459e1a09087bf40bd1cb8d.jpg', null, null, '2020-04-30 03:25:55');

-- ----------------------------
-- Table structure for `teacher_resources`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_resources`;
CREATE TABLE `teacher_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `tea_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `path` varchar(1000) NOT NULL,
  `size` mediumtext NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tea_id` (`tea_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `teacher_resources_ibfk_1` FOREIGN KEY (`tea_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_resources_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_resources
-- ----------------------------
INSERT INTO `teacher_resources` VALUES ('1', '1', '1', 'xxxxxx', '/root/course/fileupload/c91a064c0df3_xu3mgr45nagvmxe2r03u6vem60', '134130', '2020-05-24 09:34:53');
INSERT INTO `teacher_resources` VALUES ('2', '1', '1', '123456', '/root/course/fileupload/c616acc78c78_7z1900-x64.exe.v8k9s99.partial', '556500', '2020-05-24 09:35:39');
INSERT INTO `teacher_resources` VALUES ('3', '1', '1', 'ffff', '/root/course/fileupload/14f5bd1b0983_Captura-Setup_4.exe', '2572408', '2020-05-24 14:47:48');
INSERT INTO `teacher_resources` VALUES ('4', '1', '1', '2342', '/root/course/fileupload/9e3a65a45083_8c57857f177717f04d1255c32dbbec4e.gif', '905131', '2020-06-16 17:12:14');

-- ----------------------------
-- Table structure for `true_or_false_question`
-- ----------------------------
DROP TABLE IF EXISTS `true_or_false_question`;
CREATE TABLE `true_or_false_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `answer` tinyint(1) NOT NULL,
  `grade` tinyint(1) NOT NULL,
  `reference` int(11) DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `true_or_false_question_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of true_or_false_question
-- ----------------------------
INSERT INTO `true_or_false_question` VALUES ('1', '1', '<p>对下图所示的程序流程图进行判定覆盖测试,则至少需要（35）个测试用例。采用McCabe度量法计算其环路复杂度为（36）。</p>', '0', '2', '0', '2020-04-30 04:52:51');
INSERT INTO `true_or_false_question` VALUES ('2', '1', '<p>若系统在将（26）文件修改的结果写回<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B4%C5%C5%CC%2C\" target=\"_blank\">磁盘</a>时发生崩溃,则对系统的影响相对较大。</p>', '1', '2', '0', '2020-04-30 04:53:22');
INSERT INTO `true_or_false_question` VALUES ('3', '1', '<p>I/O设备管理软件一般分为4个层次,如下图所示。图中①②③分别对应（27）。<br><img alt=\"\" width=\"500\" height=\"172\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/rjsjs-2018sh-27.png\"></p>', '1', '2', '0', '2020-04-30 04:53:43');
INSERT INTO `true_or_false_question` VALUES ('4', '1', '<p>若某<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%CE%C4%BC%FE%CF%B5%CD%B3%2C\" target=\"_blank\">文件系统</a>的目录结构如下图所示，假设用户要访问文件rw.dll，且当前工作目录为swtools，则该文件的全文件名为（28），相对路径和绝对路径分别为（29）。<br><img alt=\"\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/4534.jpg\"></p>', '1', '2', '0', '2020-04-30 04:53:57');
INSERT INTO `true_or_false_question` VALUES ('5', '1', '<p><a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C4%DC%C1%A6%B3%C9%CA%EC%B6%C8%C4%A3%D0%CD%2C\" target=\"_blank\">能力成熟度模型</a>集成(<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=CMMI%2C\" target=\"_blank\">CMMI</a>)是若干过程模型的综合和改进。连续式模型和阶段式模型是<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=CMMI%2C\" target=\"_blank\">CMMI</a>提供的两种表示方法。连续式模型包括6个过程域能力等级( Capability Level,CL)，其中（31）的共性目标是过程将可标识的输入工作产品转换成可标识的输出工作产品,以实现<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%D6%A7%B3%D6%B9%FD%B3%CC%2C\" target=\"_blank\">支持过程</a>域的特定目标。</p>', '1', '2', '0', '2020-04-30 04:54:21');
INSERT INTO `true_or_false_question` VALUES ('6', '1', '<p>对下面的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B6%FE%B2%E6%CA%F7%2C\" target=\"_blank\">二叉树</a>进行<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%CB%B3%D0%F2%B4%E6%B4%A2%2C\" target=\"_blank\">顺序存储</a>(用<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%CA%FD%D7%E9%2C\" target=\"_blank\">数组</a>MEM表示)，已知结点A、B、C在MEM中对应元素的下标分别为1、2、3，那么结点D、E、F对应的<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%CA%FD%D7%E9%2C\" target=\"_blank\">数组</a>元素下标为(&nbsp; )。<br><img alt=\"\" width=\"511\" height=\"197\" src=\"http://www.rkpass.cn/ruankao_work_version_0103/userfile/image/rjsjs-2018sh-55.png\"></p>', '0', '2', '0', '2020-04-30 04:55:00');
INSERT INTO `true_or_false_question` VALUES ('7', '1', '<p><a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%F1%EE%BA%CF%2C\" target=\"_blank\">耦合</a>是<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C4%A3%BF%E9%2C\" target=\"_blank\">模块</a>之间的相对独立性(互相连接的紧密程度)的度量。<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%F1%EE%BA%CF%2C\" target=\"_blank\">耦合</a>程度不取决（34）。</p>', '1', '2', '0', '2020-04-30 04:55:32');
INSERT INTO `true_or_false_question` VALUES ('8', '1', '<p>用<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B9%FE%CF%A3%B1%ED%2C\" target=\"_blank\">哈希表</a>存储元素时，需要进行<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B3%E5%CD%BB%2C\" target=\"_blank\">冲突</a>(<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%C5%F6%D7%B2%2C\" target=\"_blank\">碰撞</a>)处理，<a href=\"http://www.rkpass.cn/tk_knowledge_service_list.jsp?kemu_id=6&amp;tk_ci_list_ed=%B3%E5%CD%BB%2C\" target=\"_blank\">冲突</a>是指(&nbsp; &nbsp;)。</p>', '1', '2', '0', '2020-04-30 04:55:58');
