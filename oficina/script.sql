SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8 ;
USE `oficina` ;


DROP TABLE IF EXISTS `oficina`.`Responsavel` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Responsavel` (
  `idResponsavel` INT NOT NULL,
  `Nivelhelpdesk` INT NULL,
  `Nome` VARCHAR(45) NULL,
  `Departamento` VARCHAR(45) NULL,
  PRIMARY KEY (`idResponsavel`)
)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `oficina`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `Contato` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`)
)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `oficina`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Pedido` (
  `idPedido` INT NOT NULL,
  `Servico` VARCHAR(45) NULL,
  `Descricao` VARCHAR(45) NULL,
  `Data_da_solicitacao` DATE NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Liberado` TINYINT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`),
  INDEX `fk_Pedido_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `oficina`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `oficina`.`Ordem_de_Servico` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Ordem_de_Servico` (
  `id_Ordem_de_Servico` INT NOT NULL,
  `Status_da_OS` VARCHAR(45) NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`id_Ordem_de_Servico`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`),
  INDEX `fk_Ordem_de_Servico_Pedido1_idx` (`Pedido_idPedido` ASC, `Pedido_Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem_de_Servico_Pedido1`
    FOREIGN KEY (`Pedido_idPedido` , `Pedido_Cliente_idCliente`)
    REFERENCES `oficina`.`Pedido` (`idPedido` , `Cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `oficina`.`Responsavel_has_Pedido` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Responsavel_has_Pedido` (
  `Responsavel_idResponsavel` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`Responsavel_idResponsavel`, `Pedido_idPedido`),
  INDEX `fk_Responsavel_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Responsavel_has_Pedido_Responsavel1_idx` (`Responsavel_idResponsavel` ASC) VISIBLE,
  CONSTRAINT `fk_Responsavel_has_Pedido_Responsavel1`
    FOREIGN KEY (`Responsavel_idResponsavel`)
    REFERENCES `oficina`.`Responsavel` (`idResponsavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Responsavel_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `oficina`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
