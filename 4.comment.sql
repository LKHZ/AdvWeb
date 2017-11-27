CREATE TABLE IF NOT EXISTS `ssbdb`.`comment` (
  `commentid` INT NOT NULL auto_increment,
  `commentcontent` TINYTEXT NOT NULL,
  `commentvalid` TINYINT NOT NULL,
  `bulletinid` INT NOT NULL,
  `boardid` INT NOT NULL,
  `memberid` INT NOT NULL,
  `commentcreatedate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`commentid`, `bulletinid`, `boardid`),
  UNIQUE INDEX `commentid_UNIQUE` (`commentid` ASC),
  INDEX `fk_comment_bulletin1_idx` (`bulletinid` ASC, `boardid` ASC),
  INDEX `fk_comment_member1_idx` (`memberid` ASC),
  CONSTRAINT `fk_comment_bulletin1`
    FOREIGN KEY (`bulletinid` , `boardid`)
    REFERENCES `ssbdb`.`bulletin` (`bulletinid` , `boardid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_member1`
    FOREIGN KEY (`memberid`)
    REFERENCES `ssbdb`.`member` (`memberid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB