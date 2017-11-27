CREATE TABLE IF NOT EXISTS `ssbdb`.`participated team` (
  `hometeamid` INT NOT NULL,
  `awayteamid` INT NOT NULL,
  `gameid` INT NOT NULL,
  INDEX `fk_participated team_team1_idx` (`hometeamid` ASC),
  INDEX `fk_participated team_team2_idx` (`awayteamid` ASC),
  INDEX `fk_participated team_game1_idx` (`gameid` ASC),
  PRIMARY KEY (`gameid`),
  CONSTRAINT `fk_participated team_team1`
    FOREIGN KEY (`hometeamid`)
    REFERENCES `ssbdb`.`team` (`teamid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participated team_team2`
    FOREIGN KEY (`awayteamid`)
    REFERENCES `ssbdb`.`team` (`teamid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participated team_game1`
    FOREIGN KEY (`gameid`)
    REFERENCES `ssbdb`.`game` (`gameid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
