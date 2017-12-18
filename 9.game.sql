CREATE TABLE IF NOT EXISTS `ssbdb`.`game` (
  `gameid` INT NOT NULL,
  `gamedate` TIMESTAMP NOT NULL,
  `gamestatus` VARCHAR(45) NULL,
  `leagueid` INT NOT NULL,
  `gamestatusdetail` TEXT NULL,
  PRIMARY KEY (`gameid`, `leagueid`),
  UNIQUE INDEX `gameid_UNIQUE` (`gameid` ASC),
  INDEX `fk_game_league1_idx` (`leagueid` ASC),
  CONSTRAINT `fk_game_league1`
    FOREIGN KEY (`leagueid`)
    REFERENCES `ssbdb`.`league` (`leagueid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;