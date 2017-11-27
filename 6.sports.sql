CREATE TABLE IF NOT EXISTS `ssbdb`.`sports` (
  `sportsid` INT NOT NULL,
  `sportsname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sportsid`),
  UNIQUE INDEX `sportsid_UNIQUE` (`sportsid` ASC),
  UNIQUE INDEX `sportsname_UNIQUE` (`sportsname` ASC))
ENGINE = InnoDB