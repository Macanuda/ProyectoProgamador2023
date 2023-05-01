-- MySQL Script generated by MySQL Workbench
-- Mon Oct 17 23:33:09 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mascotas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Mascotas` ;

-- -----------------------------------------------------
-- Schema Mascotas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mascotas` DEFAULT CHARACTER SET utf8 ;
USE `Mascotas` ;

-- -----------------------------------------------------
-- Table `Mascotas`.`Comunidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Comunidad` (
  `id_comunidad` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_comunidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotas`.`Paseadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Paseadores` (
  `id_paseador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `servicios` VARCHAR(45) NOT NULL,
  `Comunidad_id_comunidad` INT NOT NULL,
  PRIMARY KEY (`id_paseador`, `Comunidad_id_comunidad`),
  CONSTRAINT `fk_Paseadores_Comunidad1`
    FOREIGN KEY (`Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Comunidad` (`id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Paseadores_Comunidad1_idx` ON `Mascotas`.`Paseadores` (`Comunidad_id_comunidad` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Veterinarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Veterinarias` (
  `id_veterinaria` INT NOT NULL AUTO_INCREMENT,
  `nombre_veterinaria` VARCHAR(45) NOT NULL,
  `mail_veterinaria` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `productos` VARCHAR(45) NOT NULL,
  `servicios` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_veterinaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotas`.`Avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Avatar` (
  `id_avatar` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(45) NOT NULL,
  `Paseadores_id_paseador` INT NOT NULL,
  `Veterinarias_id_veterinaria` INT NOT NULL,
  PRIMARY KEY (`id_avatar`),
  CONSTRAINT `fk_Avatar_Paseadores1`
    FOREIGN KEY (`Paseadores_id_paseador`)
    REFERENCES `Mascotas`.`Paseadores` (`id_paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avatar_Veterinarias1`
    FOREIGN KEY (`Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Veterinarias` (`id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Avatar_Paseadores1_idx` ON `Mascotas`.`Avatar` (`Paseadores_id_paseador` ASC) VISIBLE;

CREATE INDEX `fk_Avatar_Veterinarias1_idx` ON `Mascotas`.`Avatar` (`Veterinarias_id_veterinaria` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Peluquerias_caninas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Peluquerias_caninas` (
  `id_peluqueria` INT NOT NULL AUTO_INCREMENT,
  `nombre_peluqueria` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `tel` INT NOT NULL,
  `productos` VARCHAR(45) NOT NULL,
  `servicios` VARCHAR(45) NOT NULL,
  `Comunidad_id_comunidad` INT NOT NULL,
  `Avatar_id_avatar` INT NOT NULL,
  PRIMARY KEY (`id_peluqueria`, `Comunidad_id_comunidad`),
  CONSTRAINT `fk_Peluquerias_caninas_Comunidad1`
    FOREIGN KEY (`Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Comunidad` (`id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peluquerias_caninas_Avatar1`
    FOREIGN KEY (`Avatar_id_avatar`)
    REFERENCES `Mascotas`.`Avatar` (`id_avatar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Peluquerias_caninas_Comunidad1_idx` ON `Mascotas`.`Peluquerias_caninas` (`Comunidad_id_comunidad` ASC) VISIBLE;

CREATE INDEX `fk_Peluquerias_caninas_Avatar1_idx` ON `Mascotas`.`Peluquerias_caninas` (`Avatar_id_avatar` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Dueno_mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Dueno_mascotas` (
  `id_dueno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `tel` INT NOT NULL,
  `Veterinarias_id_veterinaria` INT NOT NULL,
  `Paseadores_id_paseador` INT NOT NULL,
  `Peluquerias_caninas_id_peluqueria` INT NOT NULL,
  `Comunidad_id_comunidad` INT NOT NULL,
  `Avatar_id_avatar` INT NOT NULL,
  PRIMARY KEY (`id_dueno`, `Comunidad_id_comunidad`),
  CONSTRAINT `fk_Dueno_mascotas_Veterinarias0`
    FOREIGN KEY (`Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Veterinarias` (`id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dueno_mascotas_Paseadores10`
    FOREIGN KEY (`Paseadores_id_paseador`)
    REFERENCES `Mascotas`.`Paseadores` (`id_paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dueno_mascotas_copy1_Peluquerias_caninas1`
    FOREIGN KEY (`Peluquerias_caninas_id_peluqueria`)
    REFERENCES `Mascotas`.`Peluquerias_caninas` (`id_peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dueno_mascotas_Comunidad1`
    FOREIGN KEY (`Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Comunidad` (`id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dueno_mascotas_Avatar1`
    FOREIGN KEY (`Avatar_id_avatar`)
    REFERENCES `Mascotas`.`Avatar` (`id_avatar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Dueno_mascotas_Veterinarias_idx` ON `Mascotas`.`Dueno_mascotas` (`Veterinarias_id_veterinaria` ASC) VISIBLE;

CREATE INDEX `fk_Dueno_mascotas_Paseadores1_idx` ON `Mascotas`.`Dueno_mascotas` (`Paseadores_id_paseador` ASC) VISIBLE;

CREATE INDEX `fk_Dueno_mascotas_copy1_Peluquerias_caninas1_idx` ON `Mascotas`.`Dueno_mascotas` (`Peluquerias_caninas_id_peluqueria` ASC) VISIBLE;

CREATE INDEX `fk_Dueno_mascotas_Comunidad1_idx` ON `Mascotas`.`Dueno_mascotas` (`Comunidad_id_comunidad` ASC) VISIBLE;

CREATE INDEX `fk_Dueno_mascotas_Avatar1_idx` ON `Mascotas`.`Dueno_mascotas` (`Avatar_id_avatar` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Reservas` (
  `id_reservas` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `Peluquerias_caninas_id_peluqueria` INT NOT NULL,
  `Veterinarias_id_veterinaria` INT NOT NULL,
  `Dueno_mascotas_id_dueno` INT NOT NULL,
  `Dueno_mascotas_Comunidad_id_comunidad` INT NOT NULL,
  PRIMARY KEY (`id_reservas`, `Veterinarias_id_veterinaria`, `Dueno_mascotas_id_dueno`, `Dueno_mascotas_Comunidad_id_comunidad`),
  CONSTRAINT `fk_Reservas_Peluquerias_caninas1`
    FOREIGN KEY (`Peluquerias_caninas_id_peluqueria`)
    REFERENCES `Mascotas`.`Peluquerias_caninas` (`id_peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservas_Veterinarias1`
    FOREIGN KEY (`Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Veterinarias` (`id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservas_Dueno_mascotas1`
    FOREIGN KEY (`Dueno_mascotas_id_dueno` , `Dueno_mascotas_Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Dueno_mascotas` (`id_dueno` , `Comunidad_id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Reservas_Peluquerias_caninas1_idx` ON `Mascotas`.`Reservas` (`Peluquerias_caninas_id_peluqueria` ASC) VISIBLE;

CREATE INDEX `fk_Reservas_Veterinarias1_idx` ON `Mascotas`.`Reservas` (`Veterinarias_id_veterinaria` ASC) VISIBLE;

CREATE INDEX `fk_Reservas_Dueno_mascotas1_idx` ON `Mascotas`.`Reservas` (`Dueno_mascotas_id_dueno` ASC, `Dueno_mascotas_Comunidad_id_comunidad` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Mascotas` (
  `id_mascota` INT NOT NULL AUTO_INCREMENT,
  `especie_animal` VARCHAR(45) NOT NULL,
  `raza` VARCHAR(45) NOT NULL,
  `caracter` VARCHAR(45) NOT NULL,
  `actividad_fisica` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `alimentacion` VARCHAR(45) NOT NULL,
  `cuidados` VARCHAR(45) NOT NULL,
  `esperanza_vida` VARCHAR(45) NOT NULL,
  `peso_recomendado` FLOAT NOT NULL,
  `patologia` VARCHAR(45) NOT NULL,
  `vacunas` VARCHAR(45) NOT NULL,
  `Dueno_mascotas_id_dueno` INT NOT NULL,
  `Paseadores_id_paseador` INT NOT NULL,
  `Peluquerias_caninas_id_peluqueria` INT NOT NULL,
  `Veterinarias_id_veterinaria` INT NOT NULL,
  PRIMARY KEY (`id_mascota`, `Peluquerias_caninas_id_peluqueria`, `Veterinarias_id_veterinaria`),
  CONSTRAINT `fk_Mascotas_Dueno_mascotas1`
    FOREIGN KEY (`Dueno_mascotas_id_dueno`)
    REFERENCES `Mascotas`.`Dueno_mascotas` (`id_dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascotas_Paseadores1`
    FOREIGN KEY (`Paseadores_id_paseador`)
    REFERENCES `Mascotas`.`Paseadores` (`id_paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascotas_Peluquerias_caninas1`
    FOREIGN KEY (`Peluquerias_caninas_id_peluqueria`)
    REFERENCES `Mascotas`.`Peluquerias_caninas` (`id_peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascotas_Veterinarias1`
    FOREIGN KEY (`Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Veterinarias` (`id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Mascotas_Dueno_mascotas1_idx` ON `Mascotas`.`Mascotas` (`Dueno_mascotas_id_dueno` ASC) VISIBLE;

CREATE INDEX `fk_Mascotas_Paseadores1_idx` ON `Mascotas`.`Mascotas` (`Paseadores_id_paseador` ASC) VISIBLE;

CREATE INDEX `fk_Mascotas_Peluquerias_caninas1_idx` ON `Mascotas`.`Mascotas` (`Peluquerias_caninas_id_peluqueria` ASC) VISIBLE;

CREATE INDEX `fk_Mascotas_Veterinarias1_idx` ON `Mascotas`.`Mascotas` (`Veterinarias_id_veterinaria` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Registro_mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Registro_mascotas` (
  `id_registro_mascotas` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `nacimiento` DATETIME NOT NULL,
  `especie_animal` VARCHAR(45) NOT NULL,
  `raza` VARCHAR(45) NOT NULL,
  `peso` FLOAT NOT NULL,
  `altura` FLOAT NOT NULL,
  `patologia` VARCHAR(45) NOT NULL,
  `Veterinarias_id_veterinaria` INT NOT NULL,
  `Mascotas_id_mascota` INT NOT NULL,
  `Mascotas_Peluquerias_caninas_id_peluqueria` INT NOT NULL,
  `Mascotas_Veterinarias_id_veterinaria` INT NOT NULL,
  `Dueno_mascotas_id_dueno` INT NOT NULL,
  PRIMARY KEY (`id_registro_mascotas`),
  CONSTRAINT `fk_Registro_mascotas_Veterinarias1`
    FOREIGN KEY (`Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Veterinarias` (`id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_mascotas_Mascotas1`
    FOREIGN KEY (`Mascotas_id_mascota` , `Mascotas_Peluquerias_caninas_id_peluqueria` , `Mascotas_Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Mascotas` (`id_mascota` , `Peluquerias_caninas_id_peluqueria` , `Veterinarias_id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_mascotas_Dueno_mascotas1`
    FOREIGN KEY (`Dueno_mascotas_id_dueno`)
    REFERENCES `Mascotas`.`Dueno_mascotas` (`id_dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Registro_mascotas_Veterinarias1_idx` ON `Mascotas`.`Registro_mascotas` (`Veterinarias_id_veterinaria` ASC) VISIBLE;

CREATE INDEX `fk_Registro_mascotas_Mascotas1_idx` ON `Mascotas`.`Registro_mascotas` (`Mascotas_id_mascota` ASC, `Mascotas_Peluquerias_caninas_id_peluqueria` ASC, `Mascotas_Veterinarias_id_veterinaria` ASC) VISIBLE;

CREATE INDEX `fk_Registro_mascotas_Dueno_mascotas1_idx` ON `Mascotas`.`Registro_mascotas` (`Dueno_mascotas_id_dueno` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Servicios` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `servicio` VARCHAR(45) NOT NULL,
  `a_domicilio` VARCHAR(45) NOT NULL,
  `cercanas` VARCHAR(45) NOT NULL,
  `de_guardia` VARCHAR(45) NOT NULL,
  `Paseadores_id_paseador` INT NOT NULL,
  `Dueno_mascotas_id_dueno` INT NOT NULL,
  `Peluquerias_caninas_id_peluqueria` INT NOT NULL,
  PRIMARY KEY (`id_servicio`, `Paseadores_id_paseador`, `Peluquerias_caninas_id_peluqueria`),
  CONSTRAINT `fk_Servicios_Paseadores1`
    FOREIGN KEY (`Paseadores_id_paseador`)
    REFERENCES `Mascotas`.`Paseadores` (`id_paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicios_Dueno_mascotas1`
    FOREIGN KEY (`Dueno_mascotas_id_dueno`)
    REFERENCES `Mascotas`.`Dueno_mascotas` (`id_dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicios_Peluquerias_caninas1`
    FOREIGN KEY (`Peluquerias_caninas_id_peluqueria`)
    REFERENCES `Mascotas`.`Peluquerias_caninas` (`id_peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Servicios_Paseadores1_idx` ON `Mascotas`.`Servicios` (`Paseadores_id_paseador` ASC) VISIBLE;

CREATE INDEX `fk_Servicios_Dueno_mascotas1_idx` ON `Mascotas`.`Servicios` (`Dueno_mascotas_id_dueno` ASC) VISIBLE;

CREATE INDEX `fk_Servicios_Peluquerias_caninas1_idx` ON `Mascotas`.`Servicios` (`Peluquerias_caninas_id_peluqueria` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Servicios_has_Veterinarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Servicios_has_Veterinarias` (
  `Servicios_id_servicio` INT NOT NULL,
  `Servicios_Paseadores_id_paseador` INT NOT NULL,
  `Veterinarias_id_veterinaria` INT NOT NULL,
  PRIMARY KEY (`Servicios_id_servicio`, `Servicios_Paseadores_id_paseador`, `Veterinarias_id_veterinaria`),
  CONSTRAINT `fk_Servicios_has_Veterinarias_Servicios1`
    FOREIGN KEY (`Servicios_id_servicio` , `Servicios_Paseadores_id_paseador`)
    REFERENCES `Mascotas`.`Servicios` (`id_servicio` , `Paseadores_id_paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicios_has_Veterinarias_Veterinarias1`
    FOREIGN KEY (`Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Veterinarias` (`id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Servicios_has_Veterinarias_Veterinarias1_idx` ON `Mascotas`.`Servicios_has_Veterinarias` (`Veterinarias_id_veterinaria` ASC) VISIBLE;

CREATE INDEX `fk_Servicios_has_Veterinarias_Servicios1_idx` ON `Mascotas`.`Servicios_has_Veterinarias` (`Servicios_id_servicio` ASC, `Servicios_Paseadores_id_paseador` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Posteos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Posteos` (
  `id_posteo` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `contenido` TEXT NOT NULL,
  `imagen` TINYINT NOT NULL,
  `imagen_url` VARCHAR(45) NOT NULL,
  `comentarios` TEXT NULL,
  `fecha` DATETIME NULL,
  `Veterinarias_id_veterinaria` INT NOT NULL,
  `Paseadores_id_paseador` INT NOT NULL,
  `Dueno_mascotas_id_dueno` INT NOT NULL,
  `Peluquerias_caninas_id_peluqueria` INT NOT NULL,
  `Comunidad_id_comunidad` INT NOT NULL,
  PRIMARY KEY (`id_posteo`, `Veterinarias_id_veterinaria`, `Paseadores_id_paseador`, `Dueno_mascotas_id_dueno`, `Peluquerias_caninas_id_peluqueria`, `Comunidad_id_comunidad`),
  CONSTRAINT `fk_Posteos_Veterinarias1`
    FOREIGN KEY (`Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Veterinarias` (`id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posteos_Paseadores1`
    FOREIGN KEY (`Paseadores_id_paseador`)
    REFERENCES `Mascotas`.`Paseadores` (`id_paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posteos_Dueno_mascotas1`
    FOREIGN KEY (`Dueno_mascotas_id_dueno`)
    REFERENCES `Mascotas`.`Dueno_mascotas` (`id_dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posteos_Peluquerias_caninas1`
    FOREIGN KEY (`Peluquerias_caninas_id_peluqueria`)
    REFERENCES `Mascotas`.`Peluquerias_caninas` (`id_peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posteos_Comunidad1`
    FOREIGN KEY (`Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Comunidad` (`id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Posteos_Veterinarias1_idx` ON `Mascotas`.`Posteos` (`Veterinarias_id_veterinaria` ASC) VISIBLE;

CREATE INDEX `fk_Posteos_Paseadores1_idx` ON `Mascotas`.`Posteos` (`Paseadores_id_paseador` ASC) VISIBLE;

CREATE INDEX `fk_Posteos_Dueno_mascotas1_idx` ON `Mascotas`.`Posteos` (`Dueno_mascotas_id_dueno` ASC) VISIBLE;

CREATE INDEX `fk_Posteos_Peluquerias_caninas1_idx` ON `Mascotas`.`Posteos` (`Peluquerias_caninas_id_peluqueria` ASC) VISIBLE;

CREATE INDEX `fk_Posteos_Comunidad1_idx` ON `Mascotas`.`Posteos` (`Comunidad_id_comunidad` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Grupos` (
  `id_grupo` INT NOT NULL AUTO_INCREMENT,
  `nombre_grupo` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `contenido` TEXT NOT NULL,
  `imagen` TINYINT NOT NULL,
  `imagen_url` VARCHAR(45) NOT NULL,
  `comentarios` TEXT NULL,
  `fecha` DATETIME NULL,
  `Comunidad_id_comunidad` INT NOT NULL,
  PRIMARY KEY (`id_grupo`, `Comunidad_id_comunidad`),
  CONSTRAINT `fk_Grupos_Comunidad1`
    FOREIGN KEY (`Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Comunidad` (`id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Grupos_Comunidad1_idx` ON `Mascotas`.`Grupos` (`Comunidad_id_comunidad` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Veterinarias_has_Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Veterinarias_has_Grupos` (
  `Veterinarias_id_veterinaria` INT NOT NULL,
  `Grupos_id_grupo` INT NOT NULL,
  PRIMARY KEY (`Veterinarias_id_veterinaria`, `Grupos_id_grupo`),
  CONSTRAINT `fk_Veterinarias_has_Grupos_Veterinarias1`
    FOREIGN KEY (`Veterinarias_id_veterinaria`)
    REFERENCES `Mascotas`.`Veterinarias` (`id_veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veterinarias_has_Grupos_Grupos1`
    FOREIGN KEY (`Grupos_id_grupo`)
    REFERENCES `Mascotas`.`Grupos` (`id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Veterinarias_has_Grupos_Grupos1_idx` ON `Mascotas`.`Veterinarias_has_Grupos` (`Grupos_id_grupo` ASC) VISIBLE;

CREATE INDEX `fk_Veterinarias_has_Grupos_Veterinarias1_idx` ON `Mascotas`.`Veterinarias_has_Grupos` (`Veterinarias_id_veterinaria` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Paseadores_has_Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Paseadores_has_Grupos` (
  `Paseadores_id_paseador` INT NOT NULL,
  `Paseadores_Comunidad_id_comunidad` INT NOT NULL,
  `Grupos_id_grupo` INT NOT NULL,
  `Grupos_Comunidad_id_comunidad` INT NOT NULL,
  PRIMARY KEY (`Paseadores_id_paseador`, `Paseadores_Comunidad_id_comunidad`, `Grupos_id_grupo`, `Grupos_Comunidad_id_comunidad`),
  CONSTRAINT `fk_Paseadores_has_Grupos_Paseadores1`
    FOREIGN KEY (`Paseadores_id_paseador` , `Paseadores_Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Paseadores` (`id_paseador` , `Comunidad_id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paseadores_has_Grupos_Grupos1`
    FOREIGN KEY (`Grupos_id_grupo` , `Grupos_Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Grupos` (`id_grupo` , `Comunidad_id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Paseadores_has_Grupos_Grupos1_idx` ON `Mascotas`.`Paseadores_has_Grupos` (`Grupos_id_grupo` ASC, `Grupos_Comunidad_id_comunidad` ASC) VISIBLE;

CREATE INDEX `fk_Paseadores_has_Grupos_Paseadores1_idx` ON `Mascotas`.`Paseadores_has_Grupos` (`Paseadores_id_paseador` ASC, `Paseadores_Comunidad_id_comunidad` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Grupos_has_Peluquerias_caninas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Grupos_has_Peluquerias_caninas` (
  `Grupos_id_grupo` INT NOT NULL,
  `Grupos_Comunidad_id_comunidad` INT NOT NULL,
  `Peluquerias_caninas_id_peluqueria` INT NOT NULL,
  `Peluquerias_caninas_Comunidad_id_comunidad` INT NOT NULL,
  PRIMARY KEY (`Grupos_id_grupo`, `Grupos_Comunidad_id_comunidad`, `Peluquerias_caninas_id_peluqueria`, `Peluquerias_caninas_Comunidad_id_comunidad`),
  CONSTRAINT `fk_Grupos_has_Peluquerias_caninas_Grupos1`
    FOREIGN KEY (`Grupos_id_grupo` , `Grupos_Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Grupos` (`id_grupo` , `Comunidad_id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grupos_has_Peluquerias_caninas_Peluquerias_caninas1`
    FOREIGN KEY (`Peluquerias_caninas_id_peluqueria` , `Peluquerias_caninas_Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Peluquerias_caninas` (`id_peluqueria` , `Comunidad_id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Grupos_has_Peluquerias_caninas_Peluquerias_caninas1_idx` ON `Mascotas`.`Grupos_has_Peluquerias_caninas` (`Peluquerias_caninas_id_peluqueria` ASC, `Peluquerias_caninas_Comunidad_id_comunidad` ASC) VISIBLE;

CREATE INDEX `fk_Grupos_has_Peluquerias_caninas_Grupos1_idx` ON `Mascotas`.`Grupos_has_Peluquerias_caninas` (`Grupos_id_grupo` ASC, `Grupos_Comunidad_id_comunidad` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Mascotas`.`Dueno_mascotas_has_Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotas`.`Dueno_mascotas_has_Grupos` (
  `Dueno_mascotas_id_dueno` INT NOT NULL,
  `Dueno_mascotas_Comunidad_id_comunidad` INT NOT NULL,
  `Grupos_id_grupo` INT NOT NULL,
  `Grupos_Comunidad_id_comunidad` INT NOT NULL,
  PRIMARY KEY (`Dueno_mascotas_id_dueno`, `Dueno_mascotas_Comunidad_id_comunidad`, `Grupos_id_grupo`, `Grupos_Comunidad_id_comunidad`),
  CONSTRAINT `fk_Dueno_mascotas_has_Grupos_Dueno_mascotas1`
    FOREIGN KEY (`Dueno_mascotas_id_dueno` , `Dueno_mascotas_Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Dueno_mascotas` (`id_dueno` , `Comunidad_id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dueno_mascotas_has_Grupos_Grupos1`
    FOREIGN KEY (`Grupos_id_grupo` , `Grupos_Comunidad_id_comunidad`)
    REFERENCES `Mascotas`.`Grupos` (`id_grupo` , `Comunidad_id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Dueno_mascotas_has_Grupos_Grupos1_idx` ON `Mascotas`.`Dueno_mascotas_has_Grupos` (`Grupos_id_grupo` ASC, `Grupos_Comunidad_id_comunidad` ASC) VISIBLE;

CREATE INDEX `fk_Dueno_mascotas_has_Grupos_Dueno_mascotas1_idx` ON `Mascotas`.`Dueno_mascotas_has_Grupos` (`Dueno_mascotas_id_dueno` ASC, `Dueno_mascotas_Comunidad_id_comunidad` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
