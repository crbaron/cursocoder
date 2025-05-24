CREATE DATABASE IF NOT EXISTS codersql;
USE codersql;

CREATE TABLE turnos (
   id_turno INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   id_doctor INT NOT NULL,
   id_paciente INT NOT NULL,
   estado ENUM('confirmado', 'ausente', 'atendido') DEFAULT "confirmado",
   fecha_turno DATETIME NOT NULL,
   fecha_creada DATETIME DEFAULT CURRENT_TIMESTAMP,
   fecha_modif DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   CONSTRAINT unq_turno_unico UNIQUE (id_doctor, fecha_turno)
   );
   
   CREATE TABLE doctores (
   id_doctor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   dni INT (8) UNIQUE NOT NULL,
   nombre VARCHAR (30) NOT NULL,
   apellido VARCHAR (30) NOT NULL,
   fecha_de_nacimiento DATE,
   telefono VARCHAR (20) UNIQUE NOT NULL,
   email VARCHAR (50) UNIQUE DEFAULT NULL,
   direccion VARCHAR (100),
   id_establecimiento INT NOT NULL,
   id_especialidad INT NOT NULL,
   fecha_creada DATETIME DEFAULT CURRENT_TIMESTAMP,
   fecha_modif DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );
   
  CREATE TABLE especialidades (
   id_especialidad INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   especialidad VARCHAR (40) UNIQUE NOT NULL,
   fecha_modif DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   
   ); 
   
   CREATE TABLE pacientes (
   id_paciente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   dni INT (8) UNIQUE NOT NULL,
   nombre VARCHAR (30) NOT NULL,
   apellido VARCHAR (30) NOT NULL,
   fecha_de_nacimiento DATE,
   telefono VARCHAR (20) UNIQUE NOT NULL,
   email VARCHAR (50) UNIQUE DEFAULT NULL,
   direccion VARCHAR (100),
   id_obra_social INT NOT NULL,
   fecha_creada DATETIME DEFAULT CURRENT_TIMESTAMP,
   fecha_modif DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   
   ); 
   
   CREATE TABLE establecimientos (
   id_establecimiento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   direccion VARCHAR (100) NOT NULL,
   telefono VARCHAR (20) UNIQUE NOT NULL,
   fecha_modif DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );
   
   CREATE TABLE obras_sociales (
   id_obra_social INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   obra_social VARCHAR (100) NOT NULL,
   telefono VARCHAR (20) UNIQUE,
   fecha_modif DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );
   
    CREATE TABLE diagnosticos (
   id_diagnostico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   diagnostico TEXT NOT NULL,
   id_turno INT NOT NULL,
   tratamiento TEXT NOT NULL,
   receta VARCHAR (100),
   fecha_creada DATETIME DEFAULT CURRENT_TIMESTAMP,
   fecha_modif DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );
   
   CREATE TABLE doctores_obras_sociales (
   id_doctor INT NOT NULL,
   id_obra_social INT NOT NULL,
   fecha_modif DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (id_doctor, id_obra_social),
   FOREIGN KEY (id_doctor) REFERENCES doctores(id_doctor) ON DELETE CASCADE ON UPDATE CASCADE, 
   FOREIGN KEY (id_obra_social) REFERENCES obras_sociales(id_obra_social) ON DELETE CASCADE ON UPDATE CASCADE
   );
   
ALTER TABLE turnos  
ADD CONSTRAINT fk_turnos_doctor
FOREIGN KEY (id_doctor) REFERENCES doctores(id_doctor) ON DELETE CASCADE ON UPDATE CASCADE, 
ADD CONSTRAINT fk_turnos_paciente
FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE doctores  
ADD CONSTRAINT fk_doctores_especialidad
FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_doctores_establecimiento
FOREIGN KEY (id_establecimiento) REFERENCES establecimientos(id_establecimiento) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE pacientes  
ADD FOREIGN KEY (id_obra_social) REFERENCES obras_sociales(id_obra_social) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE diagnosticos  
ADD FOREIGN KEY (id_turno) REFERENCES turnos(id_turno) ON DELETE CASCADE ON UPDATE CASCADE;
