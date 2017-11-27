CREATE TABLE IF NOT EXISTS `ssbdb`.`league` (
  `leagueid` INT NOT NULL,
  `leaguename` VARCHAR(45) NOT NULL,
  `sportsid` INT NOT NULL,
  PRIMARY KEY (`leagueid`, `sportsid`),
  UNIQUE INDEX `leagueid_UNIQUE` (`leagueid` ASC),
  INDEX `fk_league_sports1_idx` (`sportsid` ASC),
  CONSTRAINT `fk_league_sports1`
    FOREIGN KEY (`sportsid`)
    REFERENCES `ssbdb`.`sports` (`sportsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB