

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mascotas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Ecommerce_Veterinaria` ;

-- -----------------------------------------------------
-- Schema Mascotas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ecommerce_Veterinaria` DEFAULT CHARACTER SET utf8 ;
USE `Ecommerce_Veterinaria` ;

-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`comunidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`COMUNIDAD` (
  `Id_Comunidad` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id_Comunidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`peluquerias_caninas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (
  `Id_Peluqueria` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Peluqueria` VARCHAR(45) NOT NULL,
  `Nombre_Usuario` VARCHAR(45) NOT NULL,
  `Clave` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `Localidad` VARCHAR(45) NULL,
  `Calle` VARCHAR(45) NULL,
  `Numero` INT NULL,
  `Productos` VARCHAR(45) NULL,
  `Servicios` VARCHAR(45) NULL,
  `Mail` VARCHAR(45) NOT NULL,
  `Id_Comunidad` INT NULL,
  PRIMARY KEY (`Id_Peluqueria`),
  CONSTRAINT `Id_ComunidadFK`
    FOREIGN KEY (`Id_Comunidad`)
    REFERENCES `Ecommerce_Veterinaria`.`COMUNIDAD` (`Id_Comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/* CREATE INDEX `Id_ComunidadFK_idxx` ON `Ecommerce_veterinaria`.`PELUQUERIAS_CANINA` (`Id_ComunidadFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`dueno_mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (
  `Id_Dueno` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Nombre` VARCHAR(45) NOT NULL,
  `Nombre_Usuario` VARCHAR(45) NOT NULL,
  `Clave` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `Localidad` VARCHAR(45) NULL,
  `Calle` VARCHAR(45) NULL,
  `Numero` INT NULL,
  `Tel` INT NOT NULL,
  `Mail` VARCHAR(45) NOT NULL,
  `Id_ComunidadFK` INT NULL,
    PRIMARY KEY (`Id_Dueno`),
  CONSTRAINT `Id_ComunidadFK`
    FOREIGN KEY (`Id_ComunidadFK`)
    REFERENCES `Ecommerce_veterinaria`.`COMUNIDAD` (`Id_Comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_ComunidadFK_idx_` ON `Ecommerce_veterinaria`.`DUENO_MASCOTAS` (`Id_ComunidadFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`veterinarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`VETERINARIAS` (
  `Id_Veterinaria` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Veterinaria` VARCHAR(45) NOT NULL,
  `Nombre_Usuario` VARCHAR(45) NOT NULL,
  `Clave` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `Localidad` VARCHAR(45) NULL,
  `Calle` VARCHAR(45) NULL,
  `Numero` INT NULL,
  `Productos` VARCHAR(45) NULL,
  `Servicios` VARCHAR(45) NULL,
  `Mail` VARCHAR(45) NOT NULL,
  `Id_ComunidadFK` INT NULL,
  PRIMARY KEY (`Id_Veterinaria`),
  CONSTRAINT `Id_ComunidadFK`
    FOREIGN KEY (`Id_ComunidadFK`)
    REFERENCES `Ecommerce_veterinaria`.`COMUNIDAD` (`Id_Comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_ComunidadFK_idxx` ON `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_ComunidadFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`paseadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`PASEADORES` (
  `Id_Paseador` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Nombre_Usuario` VARCHAR(45) NOT NULL,
  `Clave` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `Localidad` VARCHAR(45) NULL,
  `Calle` VARCHAR(45) NULL,
  `Numero` INT NULL,
  `Servicios` VARCHAR(45) NULL,
  `Mail` VARCHAR(45) NOT NULL,
  `Id_ComunidadFK` INT NULL,
  PRIMARY KEY (`Id_Paseador`),
  CONSTRAINT `Id_ComunidadFK`
    FOREIGN KEY (`Id_ComunidadFK`)
    REFERENCES `Ecommerce_Veterinaria`.`COMUNIDAD` (`Id_Comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_ComunidadFK_idx` ON `Ecommerce_Veterinaria`.`PASEADORES` (`Id_ComunidadFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`RESERVA` (
  `Id_Reserva` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NULL,
  `Titulo` VARCHAR(45) NULL,
  `Id_DuenoFK` INT NULL,
  `Id_PeluqueriaFK` INT NULL,
  `Id_VeterinariaFK` INT NULL,
  `Id_PaseadorFK` INT NULL,
  PRIMARY KEY (`Id_Reserva`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_Dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PeluqueriaFK`
    FOREIGN KEY (`Id_PeluqueriaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (`id_peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_VeterinariaFK`
    FOREIGN KEY (`Id_VeterinariaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_Veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PaseadorFK`
    FOREIGN KEY (`Id_PaseadorFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PASEADORES` (`Id_Paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_DuenoFK_idx` ON `Ecommerce_Veterinaria`.`RESERVAS` (`Id_DuenoFK` ASC) VISIBLE;

CREATE INDEX `Id_PeluqueriaFK_idx` ON `Ecommerce_Veterinaria`.`RESERVAS` (`Id_PeluqueriaFK` ASC) VISIBLE;

CREATE INDEX `Id_VeterinariaFK_idx` ON `Ecommerce_Veterinaria`.`RESERVAS` (`Id_VeterinariaFK` ASC) VISIBLE;

CREATE INDEX `Id_PaseadorFK_idx` ON `Ecommerce_Veterinaria`.`RESERVAS` (`Id_PaseadorFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`info_mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`INFO_MASCOTAS` (
  `Id_Mascota` INT NOT NULL AUTO_INCREMENT,
  `Especie_Animal` VARCHAR(45) NULL,
  `Raza` VARCHAR(45) NULL,
  `Peso_Recomendado` FLOAT NULL,
  `Caracter` VARCHAR(400) NULL,
  `Actividad_Fisica` VARCHAR(45) NULL,
  `Clima_Recomendado` VARCHAR(45) NULL,
  `Alimentacion` VARCHAR(200) NULL,
  `Cuidados` VARCHAR(400) NULL,
  `Esperanza_Vida` VARCHAR(45) NULL,
  `Patologia` VARCHAR(200) NULL,
  `Vacunas` VARCHAR(200) NULL,
  PRIMARY KEY (`Id_Mascota`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`registro_mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`REGISTRO_MASCOTAS` (
  `Id_Registro_Mascota` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Nacimiento` DATE NULL,
  `Especie_Animal` VARCHAR(45) NOT NULL,
  `Raza` VARCHAR(45) NULL,
  `Peso` FLOAT NULL,
  `Altura` FLOAT NULL,
  `Patologia` VARCHAR(200) NULL,
  `Id_DuenoFK` INT NULL,
  `Id_PaseadorFK` INT NULL,
  `Id_VeterinariaFK` INT NULL,
  `Id_PeluqueriaFK` INT NULL,
  `Id_MascotaFK` INT NULL,
  PRIMARY KEY (`Id_Registro_Mascota`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`id_dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_VeterinariaFK`
    FOREIGN KEY (`Id_VeterinariaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_Veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PeluqueriaFK`
    FOREIGN KEY (`Id_PeluqueriaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (`Id_Peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PaseadorFK`
    FOREIGN KEY (`Id_PaseadorFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PASEADORES` (`Id_Paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_MascotaFK`
    FOREIGN KEY (`Id_MascotaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`INFO_MASCOTAS` (`Id_Mascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_Dueno_idx` ON `Ecommerce_Veterinaria`.`REGISTRO_MASCOTAS` (`Id_DuenoFK` ASC) VISIBLE;

CREATE INDEX `Id_VeterinariaFK_idx` ON `Ecommerce_Veterinaria`.`REGISTRO_MASCOTAS` (`Id_VeterinariaFK` ASC) VISIBLE;

CREATE INDEX `Id_PeluqueriaFK_idx` ON `Ecommerce_Veterinaria`.`REGISTRO_MASCOTAS` (`Id_PeluqueriaFK` ASC) VISIBLE;

CREATE INDEX `id_paseadorFK_idx` ON `Mascotas`.`registro_mascota` (`id_paseadorFK` ASC) VISIBLE;

CREATE INDEX `Id_MascotaFK_idx` ON `Ecommerce_Veterinaria`.`REGISTRO_MASCOTAS` (`Id_MascotaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`SERVICIOS` (
  `Id_Servicio` INT NOT NULL AUTO_INCREMENT,
  `Servicio` VARCHAR(45) NULL,
  `ADomicilio` VARCHAR(45) NULL,
  `Cercanas` VARCHAR(45) NULL,
  `DeGuardia` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Servicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`posteos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`POSTEOS` (
  `Id_Posteo` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NOT NULL,
  `Contenido` VARCHAR(45) NOT NULL,
  `Imagen` TINYINT(1) NULL,
  `Comentarios` TEXT NULL,
  `Fecha` DATETIME NULL,
  `Id_DuenoFK` INT NULL,
  `Id_VeterinariaFK` INT NULL,
  `Id_PaseadorFK` INT NULL,
  `Id_PeluqueriaFK` INT NULL,
  PRIMARY KEY (`Id_Posteo`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_Dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_VeterinariaFK`
    FOREIGN KEY (`Id_VeterinariaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_Veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PaseadorFK`
    FOREIGN KEY (`Id_PaseadorFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PASEADORES` (`Id_paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PeluqueriaFK`
    FOREIGN KEY (`Id_PeluqueriaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (`Id_Peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_DuenoFK_idx` ON `Ecommerce_Veterinaria`.`POSTEOS` (`Id_DuenoFK` ASC) VISIBLE;

CREATE INDEX `Id_VeterinariaFK_idx` ON `Ecommerce_Veterinaria`.`POSTEOS` (`Id_VeterinariaFK` ASC) VISIBLE;

CREATE INDEX `Id_PaseadorFK_idx` ON `Ecommerce_Veterinaria`.`POSTEOS` (`Id_PaseadorFK` ASC) VISIBLE;

CREATE INDEX `Id_peluqueriaFK_idx` ON `Ecommerce_Veterinaria`.`POSTEOS` (`id_peluqueriaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`GRUPOS` (
  `Id_Grupo` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Grupo` VARCHAR(45) NOT NULL,
  `Titulo` VARCHAR(45) NULL,
  `Contenido` VARCHAR(45) NULL,
  `Imagen` TINYINT(1) NULL,
  `Imagen_URL` VARCHAR(800) NULL,
  `Comentarios` TEXT NULL,
  `Fecha` DATETIME NULL,
  `Id_ComunidadFK` INT NULL,
  PRIMARY KEY (`Id_Grupo`),
  CONSTRAINT `Id_ComunidadFK`
    FOREIGN KEY (`Id_ComunidadFK`)
    REFERENCES `Ecommerce_Veterinaria`.`COMUNIDAD` (`Id_Comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_ComunidadFK_idx` ON `Ecommerce_Veterinaria`.`GRUPOS` (`Id_ComunidadFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`AVATAR` (
  `Id_Avatar` INT NOT NULL AUTO_INCREMENT,
  `URL` VARCHAR(800) NOT NULL,
  `Id_DuenoFK` INT NULL,
  `Id_PeluqueriaFK` INT NULL,
  `Id_VeterinariaFK` INT NULL,
  `Id_PaseadorFK` INT NULL,
  PRIMARY KEY (`Id_Avatar`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_Dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PeluqueriaFK`
    FOREIGN KEY (`Id_PeluqueriaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (`Id_Peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_VeterinariaFK`
    FOREIGN KEY (`Id_VeterinariaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_Veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PaseadorFK`
    FOREIGN KEY (`Id_PaseadorFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PASEADORES` (`Id_Paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_duenoFK_idx` ON `Ecommerce_Veterinaria`.`AVATAR` (`Id_DuenoFK` ASC) VISIBLE;

CREATE INDEX `Id_peluqueriaFK_idx` ON `Ecommerce_Veterinaria`.`AVATAR` (`Id_PeluqueriaFK` ASC) VISIBLE;

CREATE INDEX `Id_VeterinariaFK_idx` ON `Ecommerce_Veterinaria`.`AVATAR` (`Id_VeterinariaFK` ASC) VISIBLE;

CREATE INDEX `Id_PaseadorFK_idx` ON `Ecommerce_Veterinaria`.`AVATAR` (`Id_PaseadorFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`peluquerias_dueno_mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`PELUQUERIAS_DUENO_MASCOTA` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_DuenoFK` INT NULL,
  `Id_PeluqueriaFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_Dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PeluqueriaFK`
    FOREIGN KEY (`Id_PeluqueriaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (`Id_Peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `FK_peluquerias_dueno_mascota_dueno_idx` ON `Ecommerce_Veterinaria`.`PELUQUERIAS_DUENO_MASCOTA` (`Id_duenoFK` ASC) VISIBLE;

CREATE INDEX `Id_peluqueriaFK_idx` ON `Ecommerce_Veterinaria`.`PELUQUERIAS_DUENO_MASCOTA` (`Id_PeluqueriaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`veterinarias_dueno_mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`VETERINARIAS_DUENO_MASCOTA` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_DuenoFK` INT NULL,
  `Id_VeterinariaFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_Dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_VeterinariaFK`
    FOREIGN KEY (`Id_VeterinariaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_Veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_duenoFK_idx` ON `Ecommerce_Veterinaria`.`VETERINARIAS_DUENO_MASCOTAS` (`Id_DuenoFK` ASC) VISIBLE;

CREATE INDEX `Id_veterinariaFK_idx` ON `Ecommerce_Veterinaria`.`VETERINARIAS_DUENO_MASCOTAS` (`Id_VeterinariaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`paseadores_dueno_mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`PASEADORES_DUENO_MASCOTAS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_DuenoFK` INT NULL,
  `Id_PaseadorFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PaseadorFK`
    FOREIGN KEY (`Id_PaseadorFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PASEADORES` (`Id_Paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_duenoFK_idx` ON `Ecommerce_Veterinaria`.`PASEADORES_DUENO_MASCOTAS` (`Id_DuenoFK` ASC) VISIBLE;

CREATE INDEX `Id_paseadorFK_idx` ON `Ecommerce_Veterinaria`.`PASEADORES_DUENO_MASCOTAS` (`Id_PaseadorFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`info_mascotas_dueno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`INFO_MASCOTAS_DUENO` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_DuenoFK` INT NULL,
  `Id_MascotaFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_Dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_MascotasFK`
    FOREIGN KEY (`Id_MascotaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`INFO_MASCOTAS` (`Id_Mascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_duenoFK_idx` ON `Ecommerce_Veterinaria`.`INFO_MASCOTAS_DUENO` (`Id_duenoFK` ASC) VISIBLE;

CREATE INDEX `Id_mascotasFK_idx` ON `Ecommerce_Veterinaria`.`INFO_MASCOTAS_DUENO` (`Id_mascotaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`info_mascotas_veterinarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`INFO_MASCOTAS_VETERINARIAS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_VeterinariaFK` INT NULL,
  `Id_MascotaFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_VeterinariaFK`
    FOREIGN KEY (`Id_VeterinariaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_Veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_MascotaFK`
    FOREIGN KEY (`Id_MascotaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`INFO_MASCOTAS` (`Id_Mascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_veterinariaFK_idx` ON `Ecommerce_Veterinaria`.`INFO_MASCOTAS_VETERINARIAS` (`Id_veterinariaFK` ASC) VISIBLE;

CREATE INDEX `Id_mascotaFK_idx` ON `Ecommerce_Veterinaria`.`INFO_MASCOTAS_VETERINARIAS` (`Id_mascotaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`info_mascotas_paseadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MasEcommerce_Veterinariaotas`.`INFO_MASCOTAS_PASEADORES` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_MascotaFK` INT NULL,
  `Id_PaseadorFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_MascotaFK`
    FOREIGN KEY (`Id_MascotaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`INFO_MASCOTAS` (`Id_Mascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PaseadorFK`
    FOREIGN KEY (`Id_PaseadorFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PASEADORES` (`Id_Paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_mascotaFK_idx` ON `Ecommerce_Veterinaria`.`INFO_MASCOTAS_PASEADORES` (`Id_mascotaFK` ASC) VISIBLE;

CREATE INDEX `Id_paseadorFK_idx` ON `Ecommerce_Veterinaria`.`INFO_MASCOTAS_PASEADORES` (`Id_paseadorFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`info_mascotas_peluquerias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`INFO_MASCOTAS_PELUQUERIAS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_PeluqueriaFK` INT NULL,
  `Id_MascotaFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_PeluqueriaFK`
    FOREIGN KEY (`Id_PeluqueriaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (`Id_Peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_MascotaFK`
    FOREIGN KEY (`Id_MascotaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`INFO_MASCOTAS` (`Id_Mascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_peluqueriaFK_idx` ON `Ecommerce_Veterinaria`.`INFO_MASCOTAS_PELUQUERIAS` (`Id_PeluqueriaFK` ASC) VISIBLE;

CREATE INDEX `Id_mascotaFK_idx` ON `Ecommerce_Veterinaria`.`INFO_MASCOTAS_PELUQUERIAS` (`Id_MascotaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`servicios_dueno_mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`SERVICIOS_DUENO_MASCOTAS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_DuenoFK` INT NULL,
  `Id_ServicioFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_ServicioFK`
    FOREIGN KEY (`Id_ServicioFK`)
    REFERENCES `Ecommerce_Veterinaria`.`SERVICIOS` (`Id_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_Dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_servicioFK_idx` ON `Ecommerce_Veterinaria`.`SERVICIOS_DUENO_MASCOTAS` (`Id_ServicioFK` ASC) VISIBLE;

CREATE INDEX `Id_DuenoFK_idx` ON `Ecommerce_Veterinaria`.`SERVICIOS_DUENO_MASCOTAS` (`Id_DuenoFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`servicios_veterinarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`SERVICIOS_VETERINARIAS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_ServicioFK` INT NULL,
  `Id_VeterinariaFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_ServicioFK`
    FOREIGN KEY (`Id_ServicioFK`)
    REFERENCES `Ecommerce_Veterinaria`.`SERVICIOS` (`Id_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_VeterinariaFK`
    FOREIGN KEY (`Id_VeterinariaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_Veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_servicioFK_idx` ON `Ecommerce_Veterinaria`.`SERVICIOS_VETERINARIAS` (`Id_ServicioFK` ASC) VISIBLE;

CREATE INDEX `Id_veterinariaFK_idx` ON `Ecommerce_Veterinaria`.`SERVICIOS_VETERINARIAS` (`Id_VeterinariaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`servicios_paseadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`SERVICIOS_PASEADORES` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_ServicioFK` INT NULL,
  `Id_PaseadorFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_ServicioFK`
    FOREIGN KEY (`Id_ServicioFK`)
    REFERENCES `Ecommerce_Veterinaria`.`SERVICIOS` (`Id_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PaseadorFK`
    FOREIGN KEY (`Id_PaseadorFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PASEADORES` (`Id_Paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_ServicioFK_idx` ON `Ecommerce_Veterinaria`.`SERVICIOS_PASEADORES` (`Id_ServicioFK` ASC) VISIBLE;

CREATE INDEX `Id_PaseadorFK_idx` ON `Ecommerce_Veterinaria`.`servicios_paseadores` (`Id_PaseadorFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`servicios_peluquerias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`SERVICIOS_PELUQUERIAS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_ServicioFK` INT NULL,
  `Id_PeluqueriaFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_ServicioFK`
    FOREIGN KEY (`Id_ServicioFK`)
    REFERENCES `Ecommerce_Veterinaria`.`SERVICIOS` (`Id_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_PeluqueriaFK`
    FOREIGN KEY (`Id_PeluqueriaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (`Id_Peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_ServicioFK_idx` ON `Ecommerce_Veterinaria`.`SERVICIOS_PELUQUERIAS` (`Id_ServicioFK` ASC) VISIBLE;

CREATE INDEX `Id_PeluqueriaFK_idx` ON `Ecommerce_Veterinaria`.`SERVICIOS_PELUQUERIAS` (`Id_PeluqueriaFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`dueno_mascotas_grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`DUENO_MASCOTAS_GRUPOS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_DuenoFK` INT NULL,
  `Id_GrupoFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_DuenoFK`
    FOREIGN KEY (`Id_DuenoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`DUENO_MASCOTAS` (`Id_Dueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_GrupoFK`
    FOREIGN KEY (`Id_GrupoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`GRUPOS` (`Id_Grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/* INDEX `Id_DuenoFK_idx` ON `Ecommerce_Veterinaria`.`DUENO_MASCOTAS_GRUPOS` (`Id_DuenoFK` ASC) VISIBLE;

CREATE INDEX `Id_GrupoFK_idx` ON `Ecommerce_Veterinaria`.`DUENO_MASCOTAS_GRUPOS` (`Id_GrupoFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`veterinarias_grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`VETERINARIAS_GRUPOS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_VeterinariaFK` INT NULL,
  `Id_GrupoFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_VeterinariaFK`
    FOREIGN KEY (`Id_VeterinariaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`VETERINARIAS` (`Id_Veterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_GrupoFK`
    FOREIGN KEY (`Id_GrupoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`GRUPOS` (`Id_Grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_VeterinariaFK_idx` ON `Mascotas`.`VETERINARIAS_GRUPOS` (`Id_VeterinariaFK` ASC) VISIBLE;

CREATE INDEX `Id_GrupoFK_idx` ON `Ecommerce_Veterinaria`.`VETERINARIAS_GRUPOS` (`Id_GrupoFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`paseadores_grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`PASEADORES_GRUPOS` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_GrupoFK` INT NULL,
  `Id_PaseadorFK` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Id_PaseadorFK`
    FOREIGN KEY (`Id_PaseadorFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PASEADORES` (`Id_Paseador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_GrupoFK`
    FOREIGN KEY (`Id_GrupoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`GRUPOS` (`Id_Grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_paseadorFK_idx` ON `Ecommerce_Veterinaria`.`PASEADORES_GRUPOS` (`Id_PaseadorFK` ASC) VISIBLE;

CREATE INDEX `Id_GrupoFK_idx` ON `Ecommerce_Veterinaria`.`PASEADORES_GRUPOS` (`Id_GrupoFK` ASC) VISIBLE;*/


-- -----------------------------------------------------
-- Table `Ecommerce_Veterinaria`.`peluquerias_grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce_Veterinaria`.`PELUQUERIAS_GRUPOS` (
  `Id` INT NOT NULL,
  `Id_PeluqueriaFK` INT NULL,
  `Id_GrupoFK` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `Id_PeluqueriaFK`
    FOREIGN KEY (`Id_PeluqueriaFK`)
    REFERENCES `Ecommerce_Veterinaria`.`PELUQUERIAS_CANINAS` (`Id_Peluqueria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_GrupoFK`
    FOREIGN KEY (`Id_GrupoFK`)
    REFERENCES `Ecommerce_Veterinaria`.`GRUPOS` (`Id_Grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*CREATE INDEX `Id_PeluqueriaFK_idx` ON `Ecommerce_Veterinaria`.`PELUQUERIAS_GRUPOS` (`Id_PeluqueriaFK` ASC) VISIBLE;

CREATE INDEX `Id_GrupoFK_idx` ON `Ecommerce_Veterinaria`.`PELUQUERIAS_GRUPOS` (`Id_GrupoFK` ASC) VISIBLE;*/


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
