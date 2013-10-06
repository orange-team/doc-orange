CREATE TABLE admin_user (
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NULL,
  user_passwd VARCHAR(50) NULL,
  user_add_time VARCHAR(50) NULL,
  user_right INT NULL,
  user_realname VARCHAR(100) NULL,
  PRIMARY KEY(user_id)
)
TYPE=InnoDB;

CREATE TABLE a_article (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NULL,
  subtitle VARCHAR(255) NULL,
  source VARCHAR(45) NULL,
  description VARCHAR(200) NULL,
  page_keywords VARCHAR(200) NULL,
  add_time DATETIME NULL,
  content TEXT NULL,
  source_link VARCHAR(45) NULL,
  recommend TINYINT(5) UNSIGNED NULL,
  attention INT NULL,
  native_sort VARCHAR(100) NULL,
  section INT(11) NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_article_crawl (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NULL,
  source VARCHAR(45) NULL,
  add_time DATETIME NULL,
  content TEXT NULL,
  source_link VARCHAR(45) NULL,
  native_sort VARCHAR(100) NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_article_crawl_attr (
  article_id INT UNSIGNED NOT NULL,
  tag VARCHAR(255) NULL,
  freq INT(3) NULL,
  source_link VARCHAR(200) NULL
)
TYPE=InnoDB;

CREATE TABLE a_article_tag (
  id INT NOT NULL AUTO_INCREMENT,
  target_id INT NULL,
  tag_id INT NULL,
  status_tag TINYINT(4) UNSIGNED NULL DEFAULT '0',
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_ask_article (
  id INT NOT NULL AUTO_INCREMENT,
  add_time DATETIME NULL,
  author INT NULL,
  section INT NULL,
  content TEXT NULL,
  abstract TEXT NULL,
  pv INT NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_ask_tag (
  id INT NOT NULL AUTO_INCREMENT,
  target_id INT NULL,
  tag_id INT NULL,
  status_tag TINYINT(4) UNSIGNED NULL,
  PRIMARY KEY(id)
);

CREATE TABLE a_comment (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NULL,
  add_time DATETIME NULL,
  c_status TINYINT(2) UNSIGNED NULL,
  target_id INT NULL,
  content TEXT NULL,
  reply_num INT NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_comment_reply (
  id INT NOT NULL AUTO_INCREMENT,
  add_time DATETIME NULL,
  user_id INT NULL,
  comment_id INT NULL,
  recommand TINYINT UNSIGNED NULL,
  audit_status TINYINT(4) UNSIGNED NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_img_lib (
  id INT NOT NULL AUTO_INCREMENT,
  title_en VARCHAR(100) NULL,
  title_cn VARCHAR(200) NULL,
  path VARCHAR(255) NULL,
  source VARCHAR(45) NULL,
  source_link VARCHAR(255) NULL,
  add_time DATETIME NULL,
  data_process TINYINT(2) UNSIGNED NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_img_tag_relation (
  id INT NOT NULL AUTO_INCREMENT,
  lib_id INT NULL,
  tag_id INT NULL,
  tag_name VARCHAR(100) NULL,
  tag_status TINYINT(2) UNSIGNED NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_pregnant_diary (
  id INT NOT NULL AUTO_INCREMENT,
  ask_content_id INT NULL,
  author_id INT NULL,
  mood_level TINYINT UNSIGNED NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_section (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_specpage (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NULL,
  cover VARCHAR(100) NULL,
  content TEXT NULL,
  author VARCHAR(45) NULL,
  add_time DATETIME NULL,
  section INT NULL,
  keyword INT NULL,
  edit_time DATETIME NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_specpage_tag (
  id INT NOT NULL AUTO_INCREMENT,
  target_id INT NULL,
  tag_id INT NULL,
  status_tag TINYINT(4) UNSIGNED NULL,
  PRIMARY KEY(id)
);

CREATE TABLE a_tag (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL,
  weight INT NULL,
  section INT NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_timeline (
  id INT NOT NULL AUTO_INCREMENT,
  time_bucket VARCHAR(100) NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;

CREATE TABLE a_user (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_nickname VARCHAR(200) NULL,
  user_passwd VARCHAR(50) NULL,
  user_reg_time DATETIME NULL,
  user_email VARCHAR(255) NULL,
  user_info TEXT NULL,
  user_login_time DATETIME NULL,
  user_timeline INT NULL,
  section INT NULL,
  PRIMARY KEY(user_id)
)
TYPE=InnoDB;

CREATE TABLE a_wiki (
  id INT NOT NULL AUTO_INCREMENT,
  wiki_spell CHAR(2) NOT NULL,
  wiki_key VARCHAR(100) NULL,
  wiki_content TEXT NULL,
  wiki_img VARCHAR(255) NULL,
  href VARCHAR(255) NULL,
  PRIMARY KEY(id, wiki_spell)
)
TYPE=InnoDB;

CREATE TABLE a_wiki_tag (
  id INT NOT NULL AUTO_INCREMENT,
  target_id INT NULL,
  tag_id INT NULL,
  status_tag TINYINT(4) UNSIGNED NULL,
  PRIMARY KEY(id)
);

CREATE TABLE crawl_history (
  id INT NOT NULL AUTO_INCREMENT,
  url VARCHAR(200) NULL,
  url_md5 VARCHAR(100) NULL,
  site_name VARCHAR(45) NULL,
  PRIMARY KEY(id)
)
TYPE=InnoDB;


