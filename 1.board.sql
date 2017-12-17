CREATE TABLE IF NOT EXISTS `ssbdb`.`board` (
  `boardid` INT NOT NULL,
  `boardname` CHAR(45) NOT NULL,
  PRIMARY KEY (`boardid`),
  UNIQUE INDEX `id_UNIQUE` (`boardid` ASC))
ENGINE = InnoDB;