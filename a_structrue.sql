SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`a_section`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_section` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL COMMENT '栏目名称' ,
  `parent` INT NOT NULL COMMENT '父id' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '栏目表';


-- -----------------------------------------------------
-- Table `mydb`.`a_keyword`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_keyword` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `section` INT NOT NULL COMMENT '栏目编号' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = 'section是栏目，栏目下会有很多细小的“分类“，称这些”分类“为关键词即keyword';


-- -----------------------------------------------------
-- Table `mydb`.`a_timeline`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_timeline` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键' ,
  `time_bucket` VARCHAR(100) NOT NULL COMMENT '时间段' ,
  `running_days` INT NULL COMMENT '时间轴从0开始往后推算的连续天数' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = '时间轴表，字段中不分周、月或者年，只是按照统一的时间段来表示，就是说，所有的时间节点都是一个时间段，可以是一周，一个月甚 /* comment truncated */ /*至一年*/';


-- -----------------------------------------------------
-- Table `mydb`.`a_article`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_article` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键' ,
  `title` VARCHAR(255) NOT NULL COMMENT '文章标题' ,
  `subtitle` VARCHAR(255) NULL COMMENT '文章副标题' ,
  `source` VARCHAR(45) NOT NULL COMMENT '文章采集来源' ,
  `description` VARCHAR(200) NULL COMMENT '页面description' ,
  `page_keywords` VARCHAR(200) NULL COMMENT '页面SEO关键词' ,
  `add_time` DATETIME NOT NULL COMMENT '添加时间' ,
  `content` TEXT NOT NULL COMMENT '正文' ,
  `section` INT NULL COMMENT '所属栏目' ,
  `keyword` INT NULL COMMENT '所属栏目下的关键字' ,
  `timeline` INT NULL COMMENT '所属时间轴主键' ,
  `source_link` VARCHAR(45) NULL COMMENT '文章采集链接地址' ,
  `recommend` TINYINT(5) NULL DEFAULT 0 COMMENT '是否为推荐' ,
  `attention` INT NULL COMMENT '关注度、访问量' ,
  `native_sort` VARCHAR(100) NULL COMMENT '原生分类，采集网站原有的分类' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_a_article_a_section_idx` (`section` ASC) ,
  INDEX `fk_a_article_a_keyword1_idx` (`keyword` ASC) ,
  INDEX `fk_a_article_a_timeline1_idx` (`timeline` ASC) ,
  CONSTRAINT `fk_a_article_a_section`
    FOREIGN KEY (`section` )
    REFERENCES `mydb`.`a_section` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_a_article_a_keyword1`
    FOREIGN KEY (`keyword` )
    REFERENCES `mydb`.`a_keyword` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_a_article_a_timeline1`
    FOREIGN KEY (`timeline` )
    REFERENCES `mydb`.`a_timeline` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '文章表';


-- -----------------------------------------------------
-- Table `mydb`.`a_tag`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_tag` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL COMMENT '标签名称' ,
  `weight` INT NULL DEFAULT 0 COMMENT '标签权重' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`a_specpage`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_specpage` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL COMMENT '专栏文章标题' ,
  `cover` VARCHAR(100) NOT NULL COMMENT '专栏文章封面图片' ,
  `content` TEXT NOT NULL COMMENT '专栏文章内容' ,
  `author` VARCHAR(45) NOT NULL COMMENT '专栏作者' ,
  `add_time` DATETIME NOT NULL COMMENT '添加时间' ,
  `section` INT NULL COMMENT '栏目' ,
  `keyword` INT NULL COMMENT '栏目所属关键词' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_a_specpage_a_section1_idx` (`section` ASC) ,
  INDEX `fk_a_specpage_a_keyword1_idx` (`keyword` ASC) ,
  CONSTRAINT `fk_a_specpage_a_section1`
    FOREIGN KEY (`section` )
    REFERENCES `mydb`.`a_section` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_a_specpage_a_keyword1`
    FOREIGN KEY (`keyword` )
    REFERENCES `mydb`.`a_keyword` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '专栏表';


-- -----------------------------------------------------
-- Table `mydb`.`a_relation_tag`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_relation_tag` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `target_type` TINYINT NOT NULL COMMENT '其他数据的类型：\n1=>文章 2=>专栏' ,
  `target_id` INT NOT NULL COMMENT '其他类型数据的主键' ,
  `tag_id` INT NOT NULL COMMENT '标签主键' ,
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态：0=>正常 1=>暂停' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_a_relation_tag_a_tag1_idx` (`tag_id` ASC) ,
  INDEX `fk_a_relation_tag_a_article1_idx` (`target_id` ASC) ,
  CONSTRAINT `fk_a_relation_tag_a_tag1`
    FOREIGN KEY (`tag_id` )
    REFERENCES `mydb`.`a_tag` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_a_relation_tag_a_article1`
    FOREIGN KEY (`target_id` )
    REFERENCES `mydb`.`a_article` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_a_relation_tag_a_specpage1`
    FOREIGN KEY (`target_id` )
    REFERENCES `mydb`.`a_specpage` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '标签和其他数据（文章、图片）的关系表';


-- -----------------------------------------------------
-- Table `mydb`.`a_wiki`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_wiki` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `wiki_key` VARCHAR(100) NOT NULL COMMENT '百科关键词' ,
  `wiki_content` TEXT NOT NULL COMMENT '百科内容' ,
  `wiki_img` VARCHAR(255) NOT NULL COMMENT '百科图片' ,
  `tag_id` INT NULL COMMENT '关联标签主键' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_a_wiki_a_tag1_idx` (`tag_id` ASC) ,
  CONSTRAINT `fk_a_wiki_a_tag1`
    FOREIGN KEY (`tag_id` )
    REFERENCES `mydb`.`a_tag` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '百科是一种特殊的标签----带内容的标签';


-- -----------------------------------------------------
-- Table `mydb`.`a_article_image`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`a_article_image` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键\n' ,
  `path` VARCHAR(45) NULL COMMENT '物理地址' ,
  `url` VARCHAR(200) NULL COMMENT 'url地址' ,
  `a_article_id` INT NULL COMMENT '关联文章表主键' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_a_article_image_a_article1_idx` (`a_article_id` ASC) ,
  CONSTRAINT `fk_a_article_image_a_article1`
    FOREIGN KEY (`a_article_id` )
    REFERENCES `mydb`.`a_article` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '文章配图表';

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
