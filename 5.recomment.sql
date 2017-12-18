CREATE TABLE IF NOT EXISTS `ssbdb`.`recomment` (
  `recommentid` INT NOT NULL auto_increment,
  `recommentcontent` TINYTEXT NOT NULL,
  `recommentvalid` TINYINT NOT NULL,
  `commentid` INT NOT NULL,
  `bulletinid` INT NOT NULL,
  `boardid` INT NOT NULL,
  `memberid` INT NOT NULL,
  `recommentcreatedate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`recommentid`, `commentid`, `bulletinid`, `boardid`),
  UNIQUE INDEX `recommentid_UNIQUE` (`recommentid` ASC),
  INDEX `fk_recomment_comment1_idx` (`commentid` ASC, `bulletinid` ASC, `boardid` ASC),
  INDEX `fk_recomment_member1_idx` (`memberid` ASC),
  CONSTRAINT `fk_recomment_comment1`
    FOREIGN KEY (`commentid` , `bulletinid` , `boardid`)
    REFERENCES `ssbdb`.`comment` (`commentid` , `bulletinid` , `boardid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recomment_member1`
    FOREIGN KEY (`memberid`)
    REFERENCES `ssbdb`.`member` (`memberid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;