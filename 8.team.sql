CREATE TABLE IF NOT EXISTS `ssbdb`.`team` (
  `teamid` INT NOT NULL,
  `teamname` VARCHAR(45) NOT NULL,
  `teamlogopath` TINYTEXT NULL,
  `sportsid` INT NOT NULL,
  PRIMARY KEY (`teamid`, `sportsid`),
  UNIQUE INDEX `teamid_UNIQUE` (`teamid` ASC),
  INDEX `fk_team_sports1_idx` (`sportsid` ASC),
  CONSTRAINT `fk_team_sports1`
    FOREIGN KEY (`sportsid`)
    REFERENCES `ssbdb`.`sports` (`sportsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB