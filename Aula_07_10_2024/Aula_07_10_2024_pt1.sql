-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Jogo` (
  `idJogo` INT NOT NULL AUTO_INCREMENT,
  `nomeJogo` VARCHAR(45) NULL,
  PRIMARY KEY (`idJogo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plataforma` (
  `idPlataforma` INT NOT NULL AUTO_INCREMENT,
  `nomePlataforma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPlataforma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jogo_Plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Jogo_Plataforma` (
  `Jogo_idJogo` INT NOT NULL,
  `Plataforma_idPlataforma` INT NOT NULL,
  `precoPlataforma` DECIMAL(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`Jogo_idJogo`, `Plataforma_idPlataforma`),
  INDEX `fk_Jogo_has_Plataforma_Plataforma1_idx` (`Plataforma_idPlataforma` ASC) VISIBLE,
  INDEX `fk_Jogo_has_Plataforma_Jogo_idx` (`Jogo_idJogo` ASC) VISIBLE,
  CONSTRAINT `fk_Jogo_has_Plataforma_Jogo`
    FOREIGN KEY (`Jogo_idJogo`)
    REFERENCES `mydb`.`Jogo` (`idJogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogo_has_Plataforma_Plataforma1`
    FOREIGN KEY (`Plataforma_idPlataforma`)
    REFERENCES `mydb`.`Plataforma` (`idPlataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
