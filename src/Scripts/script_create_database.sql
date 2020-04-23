-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema orcamento_publico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema orcamento_publico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `orcamento_publico` DEFAULT CHARACTER SET utf8 ;
USE `orcamento_publico` ;

-- -----------------------------------------------------
-- Table `orcamento_publico`.`TD_Programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento_publico`.`TD_Programa` (
  `Id_Dimensao_Programa` INT NOT NULL AUTO_INCREMENT,
  `Cod_Programa_Orcamentario` INT NULL,
  `Nome_Programa_Orcamentario` VARCHAR(250) NULL,
  `Cod_Acao` INT NULL,
  `Nome_Acao` VARCHAR(250) NULL,
  `Data_Criacao` DATETIME NULL,
  PRIMARY KEY (`Id_Dimensao_Programa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orcamento_publico`.`TD_Orgao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento_publico`.`TD_Orgao` (
  `Id_Dimensao_Orgao` INT NOT NULL AUTO_INCREMENT,
  `Cod_Orgao_Superior` INT NULL,
  `Nome_Orgao_Superior` VARCHAR(250) NULL,
  `Cod_Orgao_Subordinado` INT NULL,
  `Nome_Orgao_Subordinado` VARCHAR(250) NULL,
  `Cod_Unidade_Orcamentaria` INT NULL,
  `Nome_Unidade_Orcamentaria` VARCHAR(250) NULL,
  `Data_Criacao` DATETIME NULL,
  `TD_Orgaocol` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Dimensao_Orgao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orcamento_publico`.`TD_Area_Atuacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento_publico`.`TD_Area_Atuacao` (
  `Id_Dimensao_Area_Atuacao` INT NOT NULL AUTO_INCREMENT,
  `Cod_Funcao` INT NULL,
  `Nome_Funcao` VARCHAR(250) NULL,
  `Cod_Sub_Funcao` INT NULL,
  `Nome_Sub_Funcao` VARCHAR(250) NULL,
  `Data_Criacao` DATETIME NULL,
  PRIMARY KEY (`Id_Dimensao_Area_Atuacao`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `orcamento_publico`.`TD_Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento_publico`.`TD_Data` (
  `Id_Dimensao_Data` INT NOT NULL AUTO_INCREMENT,
  `Mes` INT NULL,
  `Ano` INT NULL,
  `Data_Criacao` DATETIME NULL,
  `TD_Datacol` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Dimensao_Data`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orcamento_publico`.`FT_Despesas_Publicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orcamento_publico`.`FT_Despesas_Publicas` (
  `Id_Ft_Despesas_Publicas` INT NOT NULL AUTO_INCREMENT,
  `Vl_Orcado` DOUBLE NOT NULL,
  `Vl_Liquidado` DOUBLE NOT NULL,
  `Id_Dimensao_Programa` INT NOT NULL,
  `Id_Dimensao_Orgao` INT NOT NULL,
  `Id_Dimensao_Area_Atuacao` INT NOT NULL,
  `Id_Dimensao_Data` INT NOT NULL,
  PRIMARY KEY (`Id_Ft_Despesas_Publicas`),
  INDEX `FK_ID_DIMENSAO_PROGRAMA_idx` (`Id_Dimensao_Programa` ASC) VISIBLE,
  INDEX `FK_ID_DIMENSAO_ORGAO_idx` (`Id_Dimensao_Orgao` ASC) VISIBLE,
  INDEX `FK_ID_DIMENSAO_AREA_ATUACAO_idx` (`Id_Dimensao_Area_Atuacao` ASC) VISIBLE,
  INDEX `FK_ID_DIMENSAO_DATA_idx` (`Id_Dimensao_Data` ASC) VISIBLE,
  CONSTRAINT `FK_ID_DIMENSAO_PROGRAMA`
    FOREIGN KEY (`Id_Dimensao_Programa`)
    REFERENCES `orcamento_publico`.`TD_Programa` (`Id_Dimensao_Programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_DIMENSAO_ORGAO`
    FOREIGN KEY (`Id_Dimensao_Orgao`)
    REFERENCES `orcamento_publico`.`TD_Orgao` (`Id_Dimensao_Orgao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_DIMENSAO_AREA_ATUACAO`
    FOREIGN KEY (`Id_Dimensao_Area_Atuacao`)
    REFERENCES `orcamento_publico`.`TD_Area_Atuacao` (`Id_Dimensao_Area_Atuacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_DIMENSAO_DATA`
    FOREIGN KEY (`Id_Dimensao_Data`)
    REFERENCES `orcamento_publico`.`TD_Data` (`Id_Dimensao_Data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;