CREATE TABLE IF NOT EXISTS `ssbdb`.`bulletin` (
  `bulletinid` INT NOT NULL auto_increment,
  `bulletincreatedate` TIMESTAMP NOT NULL,
  `bulletintitle` VARCHAR(45) NOT NULL,
  `bulletincontent` TEXT NULL,
  `bulletinvalid` TINYINT NOT NULL,
  `memberid` INT NOT NULL,
  `boardid` INT NOT NULL,
  PRIMARY KEY (`bulletinid`, `boardid`),
  UNIQUE INDEX `bulletinid_UNIQUE` (`bulletinid` ASC),
  INDEX `fk_bulletin_member_idx` (`memberid` ASC),
  INDEX `fk_bulletin_board1_idx` (`boardid` ASC),
  CONSTRAINT `fk_bulletin_member`
    FOREIGN KEY (`memberid`)
    REFERENCES `ssbdb`.`member` (`memberid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bulletin_board1`
    FOREIGN KEY (`boardid`)
    REFERENCES `ssbdb`.`board` (`boardid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB