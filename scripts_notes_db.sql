-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema notas_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `notas_db` DEFAULT CHARACTER SET utf8 ;
USE `notas_db` ;

-- -----------------------------------------------------
-- Table `notas_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `notas_db`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_db`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `creationDate` DATE NOT NULL,
  `modifiedDate` DATE NOT NULL,
  `description` TEXT NOT NULL,
  `delete` TINYINT NOT NULL DEFAULT 0,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `notas_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas_db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_db`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas_db`.`notesXcategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_db`.`notesXcategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NULL,
  `notes_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notesXcategories_categories_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_notesXcategories_notes_idx` (`notes_id` ASC) VISIBLE,
  CONSTRAINT `fk_notesXcategories_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `notas_db`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notesXcategories_notes`
    FOREIGN KEY (`notes_id`)
    REFERENCES `notas_db`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- >>>>> CARGA DE 10 REGISTROS EN CADA TABLA <<<<<<<<<<--

-- insertar 10 categorias 
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('musica');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('politica');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('deporte');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('tecnologia');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('literatura');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('espectaculo');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('cine');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('series');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('naturaleza');
INSERT INTO `notas_db`.`categories` (`name`) VALUES ('economia');

-- insertar 10 usuarios
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Ezequiel', 'eze_123@gmail.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Giselda', 'gisel_arevalo@gmail.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Gaston', 'camu_valka@gmail.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Leandro', 'leo_casa@hotmail.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Maria', 'ladel_barrio@gmail.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Marimar', 'ella_es@gmail.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Betty', 'la_fea@gmail.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Bruse', 'el_batman@hotmail.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('henry', 'es_superman@yahoo.com');
INSERT INTO `notas_db`.`users` (`name`, `email`) VALUES ('Peter', 'el_spiderman@gmail.com');

-- insertar 10 notas
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Ciudad Gotica', '2023-03-1', '2023-05-11', 'Una noticia sobre ciudad gotica', '0', '8');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Concierto en Vivo de BandX', '2023-02-12', '2023-05-15', 'Asistí al increíble concierto en vivo de BandX anoche. ¡La energía en el lugar era impresionante!', '0', '1');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Discurso Presidencial', '2022-01-12', '2023-01-23', 'El presidente dio un discurso importante sobre el estado actual de la economía y las medidas políticas que se tomarán.', '0', '4');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Partido de Fútbol emocionante', '2022-06-5', '2022-07-31', 'El partido de fútbol de anoche fue emocionante, con un empate 2-2. El equipo local mostró un gran rendimiento.', '0', '3');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Lanzamiento del Nuevo Smartphone', '2022-08-15', '2022-09-25', 'El nuevo smartphone de XYZ fue lanzado hoy con características sorprendentes y una pantalla impresionante.', '0', '2');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Libro Recomendado: Las Sombras Perdidas', '2023-02-1', '2023-04-11', 'La actuación en el teatro anoche fue espectacular. Los actores entregaron un rendimiento excepcional', '0', '10');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Película del Mes: Aventuras en la Jungla', '2023-02-4', '2023-03-15', 'Vimos \Aventuras en la Jungla  en el cine. Una película emocionante con efectos visuales impresionantes.', '0', '7');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Nueva Serie: Misterio en la Ciudad', '2023-03-16', '2023-05-29', 'Comencé a ver la nueva serie \Misterio en la Ciudad\. Los primeros episodios son intrigantes.', '0', '9');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Excursión al Parque Nacional', '2023-03-1', '2023-05-22', 'Hicimos una excursión al Parque Nacional y disfrutamos de la belleza natural y la vida silvestre.', '0', '5');
INSERT INTO `notas_db`.`notes` (`title`, `creationDate`, `modifiedDate`, `description`, `delete`, `user_id`) VALUES ('Gran Actuación en el Teatro', '2022-01-12', '2022-09-25', 'La actuación en el teatro anoche fue espectacular. Los actores entregaron un rendimiento excepcional', '0', '6');

-- insertar 10 notasxcategorias


INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('7', '1');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('8', '1');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('1', '2');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('6', '2');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('2', '3');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('3', '4');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('4', '5');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('5', '6');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('6', '7');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('8', '8');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('6', '8');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('9', '9');
INSERT INTO `notas_db`.`notesxcategories` (`category_id`, `notes_id`) VALUES ('6', '10');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
