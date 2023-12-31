-- 테이블 greengram2.t_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_user` (
    `iuser` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `uid` varchar(25) NOT NULL,
    `upw` varchar(300) NOT NULL,
    `nm` varchar(25) NOT NULL,
    `pic` varchar(2100) DEFAULT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`iuser`),
    UNIQUE KEY `uid` (`uid`)
    );

-- 테이블 greengram2.t_feed 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_feed` (
    `ifeed` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `iuser` int(10) unsigned NOT NULL,
    `contents` varchar(1000) DEFAULT NULL,
    `location` varchar(30) DEFAULT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`ifeed`),
    KEY `iuser` (`iuser`),
    CONSTRAINT `t_feed_ibfk_1` FOREIGN KEY (`iuser`) REFERENCES `t_user` (`iuser`)
    );

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 greengram2.t_feed_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_feed_comment` (
    `ifeed_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `iuser` int(10) unsigned NOT NULL,
    `ifeed` int(10) unsigned NOT NULL,
    `COMMENT` varchar(500) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    PRIMARY KEY (`ifeed_comment`),
    KEY `iuser` (`iuser`),
    KEY `ifeed` (`ifeed`),
    CONSTRAINT `t_feed_comment_ibfk_1` FOREIGN KEY (`iuser`) REFERENCES `t_user` (`iuser`),
    CONSTRAINT `t_feed_comment_ibfk_2` FOREIGN KEY (`ifeed`) REFERENCES `t_feed` (`ifeed`)
    );

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 greengram2.t_feed_fav 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_feed_fav` (
    `ifeed` int(10) unsigned NOT NULL,
    `iuser` int(10) unsigned NOT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`ifeed`,`iuser`),
    KEY `iuser` (`iuser`),
    CONSTRAINT `t_feed_fav_ibfk_1` FOREIGN KEY (`ifeed`) REFERENCES `t_feed` (`ifeed`),
    CONSTRAINT `t_feed_fav_ibfk_2` FOREIGN KEY (`iuser`) REFERENCES `t_user` (`iuser`)
    );

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 greengram2.t_feed_pics 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_feed_pics` (
    `ifeed_pics` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `ifeed` int(10) unsigned NOT NULL,
    `pic` varchar(2500) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`ifeed_pics`),
    KEY `ifeed` (`ifeed`),
    CONSTRAINT `t_feed_pics_ibfk_1` FOREIGN KEY (`ifeed`) REFERENCES `t_feed` (`ifeed`)
);

CREATE TABLE IF NOT EXISTS `t_user_follow`(
  from_iuser INT UNSIGNED NOT NULL,
  to_iuser INT UNSIGNED NOT NULL CHECK(to_iuser != from_iuser),
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(from_iuser, to_iuser),
  FOREIGN KEY(from_iuser) REFERENCES t_user(iuser),
  FOREIGN KEY(to_iuser) REFERENCES t_user(iuser)
);

CREATE TABLE t_dm (
    idm INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
    , last_msg VARCHAR(2000)
    , last_msg_at DATETIME ON UPDATE CURRENT_TIMESTAMP
    , created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE t_dm_user(
    idm INT UNSIGNED
    , iuser INT UNSIGNED
    , PRIMARY KEY(idm, iuser)
    , FOREIGN KEY (idm) REFERENCES t_dm(idm)
    , FOREIGN KEY (iuser) REFERENCES t_user(iuser)
);

CREATE TABLE t_dm_msg(
    idm INT UNSIGNED
    , seq INT UNSIGNED
    , iuser INT UNSIGNED NOT NULL
    , msg VARCHAR(2000) NOT NULL
    , created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , PRIMARY KEY (idm, seq)
    , FOREIGN KEY (idm, iuser) REFERENCES t_dm_user(idm, iuser)
);
