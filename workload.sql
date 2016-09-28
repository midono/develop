-- phpMyAdmin SQL Dump
-- version 4.0.10.8
-- http://www.phpmyadmin.net
--
-- ホスト: localhost
-- 生成日時: 2016 年 8 月 10 日 19:47
-- サーバのバージョン: 5.6.31-log
-- PHP のバージョン: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `workload`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `child_issues`
--

CREATE TABLE IF NOT EXISTS `child_issues` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_issue_id` int(10) unsigned DEFAULT NULL,
  `child_issue_name` varchar(255) DEFAULT NULL,
  `work_user_id` int(11) DEFAULT NULL,
  `backlog_url` varchar(255) DEFAULT NULL COMMENT 'backlog url',
  `plan_start_date` date DEFAULT NULL,
  `plan_end_date` date DEFAULT NULL,
  `plan_work_hour` double DEFAULT NULL,
  `perform_work_hour` double DEFAULT NULL,
  `child_issue_status` int(10) unsigned DEFAULT NULL,
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_child_issues_parent_issues1_idx` (`parent_issue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='子課題' AUTO_INCREMENT=2 ;

--
-- テーブルのデータのダンプ `child_issues`
--

INSERT INTO `child_issues` (`id`, `parent_issue_id`, `child_issue_name`, `work_user_id`, `backlog_url`, `plan_start_date`, `plan_end_date`, `plan_work_hour`, `perform_work_hour`, `child_issue_status`, `note`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 1, '子課題1', 2, NULL, '2016-08-01', '2016-08-05', NULL, NULL, 1, NULL, '2016-08-04 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `job_name` varchar(255) NOT NULL COMMENT '役職名',
  `created_at` datetime DEFAULT NULL COMMENT '登録日時',
  `updated_at` datetime DEFAULT NULL COMMENT '更新日時',
  `deleted` int(10) unsigned DEFAULT '0' COMMENT '削除フラグ 0=非削除 1=削除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='職種マスタ' AUTO_INCREMENT=6 ;

--
-- テーブルのデータのダンプ `jobs`
--

INSERT INTO `jobs` (`id`, `job_name`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'マネージャー', '2016-07-27 21:11:03', '2016-07-27 21:11:03', 0),
(2, 'ディレクター', '2016-07-27 21:20:12', '2016-07-27 21:20:12', 0),
(3, 'デザイナー', '2016-07-27 21:20:22', '2016-07-27 21:20:22', 0),
(4, 'コーダー', '2016-07-27 21:20:28', '2016-07-27 21:20:28', 0),
(5, 'エンジニア', '2016-07-27 21:20:35', '2016-07-27 21:20:35', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `staff_id` int(10) unsigned NOT NULL COMMENT '出力者ID	 操作したstaff_id',
  `staff_name` varchar(64) NOT NULL COMMENT '出力者名	 出力当時の出力者名',
  `summary` varchar(1024) NOT NULL COMMENT '概要\n例）\nExcel  "ファイル名"\nDB更新   ID+table/機能名 を更新しました\n\n★プログラム側に任せる',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `created_id` int(10) unsigned NOT NULL COMMENT '登録者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  `updated_id` int(10) unsigned NOT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `logs_IX1` (`staff_name`,`created_at`,`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ログ' AUTO_INCREMENT=27 ;

--
-- テーブルのデータのダンプ `logs`
--

INSERT INTO `logs` (`id`, `staff_id`, `staff_name`, `summary`, `created_at`, `created_id`, `updated_at`, `updated_id`) VALUES
(1, 1, '管理者アカウント', '[App] ログアウトしました.[id:1;スタッフ名称:管理者アカウント]', '2016-07-27 21:33:46', 1, '2016-07-27 21:33:46', 1),
(2, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-07-27 21:33:53', 2, '2016-07-27 21:33:53', 2),
(3, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-07-28 11:03:11', 0, '2016-07-28 11:03:11', 0),
(4, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-07-28 11:03:20', 2, '2016-07-28 11:03:20', 2),
(5, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-03 18:58:24', 0, '2016-08-03 18:58:24', 0),
(6, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-08-03 18:58:43', 2, '2016-08-03 18:58:43', 2),
(7, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-04 10:47:12', 0, '2016-08-04 10:47:12', 0),
(8, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-08-04 10:47:22', 2, '2016-08-04 10:47:22', 2),
(9, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-04 16:01:54', 0, '2016-08-04 16:01:54', 0),
(10, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-04 16:02:32', 0, '2016-08-04 16:02:32', 0),
(11, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-04 16:02:36', 0, '2016-08-04 16:02:36', 0),
(12, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-08-04 16:02:47', 2, '2016-08-04 16:02:47', 2),
(13, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-05 11:35:39', 0, '2016-08-05 11:35:39', 0),
(14, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-08-05 11:35:52', 2, '2016-08-05 11:35:52', 2),
(15, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-05 15:41:31', 0, '2016-08-05 15:41:31', 0),
(16, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-08-05 16:26:11', 2, '2016-08-05 16:26:11', 2),
(17, 2, '平林', '[App] ログアウトしました.[id:2;スタッフ名称:平林]', '2016-08-05 20:32:54', 2, '2016-08-05 20:32:54', 2),
(18, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-08 09:18:32', 0, '2016-08-08 09:18:32', 0),
(19, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-08 09:18:34', 0, '2016-08-08 09:18:34', 0),
(20, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-08-08 10:18:30', 2, '2016-08-08 10:18:30', 2),
(21, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-09 19:44:08', 0, '2016-08-09 19:44:08', 0),
(22, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-09 19:44:09', 0, '2016-08-09 19:44:09', 0),
(23, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-08-09 19:44:21', 2, '2016-08-09 19:44:21', 2),
(24, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-10 16:33:54', 0, '2016-08-10 16:33:54', 0),
(25, 0, '不明', '[App] セッションが切断されたため、強制的にログアウトしました.', '2016-08-10 16:33:55', 0, '2016-08-10 16:33:55', 0),
(26, 2, '平林', '[App] ログインしました.[id:2;スタッフ名称:]', '2016-08-10 16:34:13', 2, '2016-08-10 16:34:13', 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `parent_issues`
--

CREATE TABLE IF NOT EXISTS `parent_issues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned DEFAULT NULL,
  `parent_issue_name` varchar(255) DEFAULT NULL,
  `issue_owner_id` int(10) unsigned DEFAULT NULL,
  `backlog_url` varchar(255) DEFAULT NULL COMMENT 'backlog url',
  `plan_start_date` date DEFAULT NULL,
  `plan_end_date` date DEFAULT NULL,
  `plan_work_hour` double DEFAULT NULL,
  `perform_work_hour` double DEFAULT NULL,
  `parent_issue_status` int(10) unsigned DEFAULT NULL,
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parent_issues_projects1_idx` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='親課題' AUTO_INCREMENT=2 ;

--
-- テーブルのデータのダンプ `parent_issues`
--

INSERT INTO `parent_issues` (`id`, `project_id`, `parent_issue_name`, `issue_owner_id`, `backlog_url`, `plan_start_date`, `plan_end_date`, `plan_work_hour`, `perform_work_hour`, `parent_issue_status`, `note`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 1, '親課題1', 2, NULL, '2016-08-01', '2016-08-31', NULL, NULL, 1, '登録テスト', '2016-08-04 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_name` varchar(255) DEFAULT NULL COMMENT '案件名',
  `section_id` int(10) unsigned DEFAULT NULL COMMENT '所属ID',
  `section_group_id` int(10) unsigned DEFAULT NULL COMMENT '所属グループID',
  `project_owner_id` int(10) unsigned DEFAULT NULL COMMENT 'プロジェクト管理者ID',
  `project_url` varchar(255) DEFAULT NULL COMMENT 'backlog url',
  `project_status` int(10) unsigned DEFAULT NULL COMMENT 'プロジェクト進捗状況',
  `note` text COMMENT '備考',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_projects_section_groups1_idx` (`section_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='案件' AUTO_INCREMENT=3 ;

--
-- テーブルのデータのダンプ `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `section_id`, `section_group_id`, `project_owner_id`, `project_url`, `project_status`, `note`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'スタイル・エッジ/採用サイト (STYLEEDGE_SAIYOU)', 1, 1, 1, 'https://styleedge.backlog.jp/projects/STYLEEDGE_SAIYOU', NULL, 'テスト登録', '2016-07-28 15:14:44', '2016-07-28 15:14:44', 0),
(2, 'テストプロジェクト', 1, 2, 2, NULL, NULL, NULL, '2016-08-05 20:32:23', '2016-08-05 20:32:23', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL,
  `parent_issue_id` int(10) unsigned DEFAULT NULL,
  `child_issue_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `perform_date` date DEFAULT NULL,
  `perform_start_time` time DEFAULT NULL,
  `perform_end_time` time DEFAULT NULL,
  `note` text,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_schedule_parent_issues1_idx` (`parent_issue_id`),
  KEY `fk_schedule_users1_idx` (`user_id`),
  KEY `fk_schedule_child_issues1_idx` (`child_issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='スケジュール';

-- --------------------------------------------------------

--
-- テーブルの構造 `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `section_name` varchar(255) NOT NULL COMMENT '所属名',
  `created_at` datetime DEFAULT NULL COMMENT '登録日時',
  `updated_at` datetime DEFAULT NULL COMMENT '変更日時',
  `deleted` int(10) unsigned DEFAULT '0' COMMENT '削除フラグ 0=削除なし 1=削除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='所属マスタ' AUTO_INCREMENT=2 ;

--
-- テーブルのデータのダンプ `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'マーケティング事業部', '0000-00-00 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `section_groups`
--

CREATE TABLE IF NOT EXISTS `section_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `section_id` int(10) unsigned NOT NULL COMMENT '所属id',
  `group_name` varchar(255) NOT NULL COMMENT 'グループ名',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  `updated_at` datetime DEFAULT NULL COMMENT '更新日時',
  `deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '削除フラグ 0=削除なし 1=削除',
  PRIMARY KEY (`id`),
  KEY `fk_section_groups_sections1_idx` (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='所属グループマスタ' AUTO_INCREMENT=3 ;

--
-- テーブルのデータのダンプ `section_groups`
--

INSERT INTO `section_groups` (`id`, `section_id`, `group_name`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 1, '第1グループ', '2016-07-27 20:57:42', '2016-07-27 20:57:42', 0),
(2, 1, '第2グループ', '2016-07-27 21:05:18', '2016-07-27 21:05:18', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) CHARACTER SET utf8 NOT NULL,
  `previous_id` varchar(40) CHARACTER SET utf8 NOT NULL,
  `user_agent` text CHARACTER SET utf8 NOT NULL,
  `ip_hash` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` int(10) unsigned NOT NULL DEFAULT '0',
  `payload` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `PREVIOUS` (`previous_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `sessions`
--

INSERT INTO `sessions` (`session_id`, `previous_id`, `user_agent`, `ip_hash`, `created`, `updated`, `payload`) VALUES
('0d93bff60e23626ea91cc9877c2a7bab', 'bb8d5212e653de32e0d541c3a39403f4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2e5144877630164db11247f9bf6b7c96', 1470825335, 1470825335, 'a:3:{i:0;a:7:{s:10:"session_id";s:32:"0d93bff60e23626ea91cc9877c2a7bab";s:11:"previous_id";s:32:"bb8d5212e653de32e0d541c3a39403f4";s:7:"ip_hash";s:32:"2e5144877630164db11247f9bf6b7c96";s:10:"user_agent";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36";s:7:"created";i:1470825335;s:7:"updated";i:1470825335;s:7:"payload";s:0:"";}i:1;a:4:{s:32:"wRiF2OiKTEJJ0wpxmK04DVIVfxNExING";O:9:"Authorize":8:{s:32:"\0Authorize\0_sanitization_enabled";b:1;s:18:"\0Authorize\0staffId";s:1:"2";s:20:"\0Authorize\0staffName";s:6:"平林";s:20:"\0Authorize\0staffMail";s:12:"thirabayashi";s:20:"\0Authorize\0sectionId";s:1:"1";s:22:"\0Authorize\0sectionName";s:30:"マーケティング事業部";s:16:"\0Authorize\0admin";s:1:"2";s:26:"\0Authorize\0userSectionList";a:1:{s:3:"2_1";a:4:{s:9:"sectionId";s:1:"1";s:11:"sectionName";s:30:"マーケティング事業部";s:6:"userId";s:1:"2";s:11:"accessLevel";s:1:"2";}}}s:32:"jSyaWVuSzEYLac6RjA3L7p2Kek2Q7xRP";s:6:"20_1/2";s:12:"sourceMenuId";i:40;s:40:"6b5213c8d25cc31978a4442678589c382b294d89";a:2:{s:4:"sort";s:10:"created_at";s:8:"sort_dir";s:4:"desc";}}i:2;a:1:{s:29:"flash::__session_identifier__";a:2:{s:5:"state";s:6:"expire";s:5:"value";s:40:"981ad054cde00c40d77fcec4440693283bcd2fc6";}}}');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(100) DEFAULT NULL COMMENT 'ユーザ名',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'ユーザID',
  `password` varchar(255) DEFAULT NULL COMMENT 'パスワード sha1でハッシュ化',
  `section_id` int(10) unsigned DEFAULT NULL COMMENT '所属ID',
  `section_group_id` int(10) unsigned DEFAULT NULL COMMENT '所属グループID',
  `job_id` int(10) unsigned DEFAULT NULL COMMENT '職種ID',
  `role_admin` int(10) unsigned DEFAULT NULL COMMENT '管理者権限フラグ 0=非管理者 1=管理者',
  `created_at` datetime DEFAULT NULL COMMENT '登録日時',
  `updated_at` datetime DEFAULT NULL COMMENT '更新日時',
  `deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '削除フラグ 0=非削除 1=削除',
  PRIMARY KEY (`id`),
  KEY `idx_section_id` (`section_id`,`section_group_id`,`job_id`),
  KEY `fk_users_jobs1_idx` (`job_id`),
  KEY `fk_users_section_groups1_idx` (`section_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='ユーザマスタ' AUTO_INCREMENT=3 ;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_id`, `password`, `section_id`, `section_group_id`, `job_id`, `role_admin`, `created_at`, `updated_at`, `deleted`) VALUES
(1, '管理者アカウント', 'administrator', '4eb8ac797b4f385946c1126eaa219e81347e403b', 0, 0, 0, 2, NULL, NULL, 0),
(2, '平林', 'thirabayashi', 'dbe7dc4a15b4c0e856f60b11a37342ec36d8a222', 1, 1, 5, 2, '2016-07-27 21:32:56', '2016-07-27 21:32:56', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
