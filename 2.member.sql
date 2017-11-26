CREATE TABLE IF NOT EXISTS `ssbdb`.`member` (
  `memberid` INT NOT NULL,
  `memberident` VARCHAR(45) NOT NULL,
  `memberpasswd` VARCHAR(45) NOT NULL,
  `membernickname` VARCHAR(45) NOT NULL,
  `memberjoindate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`memberid`),
  UNIQUE INDEX `id_UNIQUE` (`memberid` ASC),
  UNIQUE INDEX `memberid_UNIQUE` (`memberident` ASC),
  UNIQUE INDEX `membernickname_UNIQUE` (`membernickname` ASC))
ENGINE = InnoDB