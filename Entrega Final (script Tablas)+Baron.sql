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
   sexo ENUM('M', 'F') NOT NULL,
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


-- Vista para ver el listado de Turnos

CREATE VIEW v_turnos AS
SELECT 
    t.id_turno,
    t.fecha_turno,
    t.estado,
    es.direccion AS direccion_establecimiento,
    CONCAT(p.nombre, ' ', p.apellido) AS nombre_paciente,
    p.dni,
    CONCAT(doc.nombre, ' ', doc.apellido) AS nombre_doctor,
    e.especialidad,
    os.obra_social,
    t.fecha_creada, t.fecha_modif
FROM turnos t
JOIN pacientes p ON t.id_paciente = p.id_paciente
JOIN doctores doc ON t.id_doctor = doc.id_doctor
JOIN especialidades e ON doc.id_especialidad = e.id_especialidad
JOIN obras_sociales os ON p.id_obra_social = os.id_obra_social
JOIN establecimientos es ON es.id_establecimiento=doc.id_establecimiento
ORDER BY t.fecha_turno DESC;

-- Vista ver las Obras Sociales que atiende cada Doctor

CREATE VIEW vista_doctores_convenios AS
SELECT 
    CONCAT(doc.nombre, ' ', doc.apellido) AS nombre_doctor,
    GROUP_CONCAT(os.obra_social) AS obras_sociales
FROM doctores_obras_sociales dos
JOIN doctores doc ON dos.id_doctor = doc.id_doctor
JOIN obras_sociales os ON dos.id_obra_social = os.id_obra_social
GROUP BY doc.id_doctor;

-- Vista para ver toda la informacion de los Pacientes
CREATE VIEW v_info_pacientes AS
SELECT 
    p.id_paciente,
    p.dni,
    CONCAT(p.apellido,', ',p.nombre) AS nombre_completo,
    p.fecha_de_nacimiento,
    p.sexo,
    p.telefono,
    p.email,
    p.direccion,
    os.obra_social
FROM pacientes p
JOIN obras_sociales os ON p.id_obra_social = os.id_obra_social
ORDER BY p.apellido ASC;

-- Vista para ver toda la informacion de los Doctores
CREATE VIEW v_doctores AS
SELECT 
    doc.id_doctor,
    doc.dni,
    CONCAT(doc.apellido,', ', doc.nombre) AS nombre_completo,
    doc.fecha_de_nacimiento,
    doc.telefono,
    doc.email,
    doc.direccion,
    es.direccion AS direccion_establecimiento,
    e.especialidad
FROM doctores doc
JOIN establecimientos es ON es.id_establecimiento=doc.id_establecimiento
JOIN especialidades e ON doc.id_especialidad = e.id_especialidad
ORDER BY doc.apellido ASC;

-- Vista para ver todas las Especialidades y que doctores las cubren

CREATE VIEW vista_especialidades_doctores AS
SELECT e.especialidad, GROUP_CONCAT(CONCAT(doc.nombre, ' ', doc.apellido)) AS doctores
FROM especialidades e
LEFT JOIN doctores doc ON e.id_especialidad=doc.id_especialidad
GROUP BY e.especialidad;

-- vista para ver cantidad de turnos confirmados por doctor
CREATE VIEW vista_turnos_confirmados_por_doctor AS
SELECT 
  doc.apellido, 
  doc.nombre, 
  COUNT(*) AS cantidad_turnos_confirmados
FROM turnos t
JOIN doctores doc ON t.id_doctor = doc.id_doctor
WHERE t.estado = 'confirmado'
GROUP BY doc.apellido, doc.nombre
ORDER BY doc.apellido DESC;

-- Funcion para ver la proxima fecha de turno de un paciente por DNI

DELIMITER //

CREATE FUNCTION proxima_fecha_turno (p_dni INT)
RETURNS DATETIME
DETERMINISTIC
BEGIN
    DECLARE prox_fecha DATETIME;

    SELECT MIN(t.fecha_turno) INTO prox_fecha
    FROM turnos t
    JOIN pacientes p ON t.id_paciente = p.id_paciente
    WHERE p.dni = p_dni
      AND t.estado = 'confirmado'
      AND t.fecha_turno >= NOW();

    RETURN prox_fecha;
END;

//
DELIMITER ;


-- funcion para ver edad promedio de doctores

DELIMITER //

CREATE FUNCTION edad_promedio_doctores()
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  DECLARE resultado DECIMAL(5,2);
  SELECT AVG(TIMESTAMPDIFF(YEAR, fecha_de_nacimiento, CURDATE())) INTO resultado
  FROM doctores;
  RETURN resultado;
END;
//

DELIMITER ;

-- funcion para edad pacientes promedio

DELIMITER //

CREATE FUNCTION edad_promedio_pacientes()
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE resultado DECIMAL(5,2);
    
    SELECT AVG(TIMESTAMPDIFF(YEAR, p.fecha_de_nacimiento, CURDATE()))
    INTO resultado
    FROM pacientes p;
    
    RETURN resultado;
END;
//

DELIMITER ;


-- Procedimiento para crear Turnos

DELIMITER //


CREATE PROCEDURE crear_turno (
    IN p_id_paciente INT,
    IN p_id_doctor INT,
    IN p_fecha DATETIME
)
BEGIN
    INSERT INTO turnos (id_paciente, id_doctor, fecha_turno)
    VALUES (p_id_paciente, p_id_doctor, p_fecha);
END//

DELIMITER ;

-- Procedure para actualizar el estado del Turno
-- Es decir, una vez que paso la fecha, se debe actualizar a si el paciente fue atendido
-- o si se ausento (el estado es confirmado por default)

DELIMITER //


CREATE PROCEDURE actualizar_estado_turno (
    IN p_id_turno INT,
    IN p_nuevo_estado ENUM('confirmado','ausente','atendido')
)
BEGIN
    UPDATE turnos
    SET estado = p_nuevo_estado
    WHERE id_turno = p_id_turno;
END//

DELIMITER ;

-- Procedure para ver los Turnos asignados por Doctor entre dos fechas

DELIMITER //


CREATE PROCEDURE turnos_confirmados_doctor (
    IN p_id_doctor INT,
    IN p_fecha_inicio DATETIME,
    IN p_fecha_fin DATETIME
)
BEGIN
    SELECT t.id_turno, t.id_doctor, CONCAT(doc.nombre," ",doc.apellido) AS nombre_doctor,t.estado, t.fecha_turno  
    FROM turnos t
    JOIN doctores doc ON doc.id_doctor=t.id_doctor
    WHERE t.id_doctor = p_id_doctor
      AND t.fecha_turno BETWEEN p_fecha_inicio AND p_fecha_fin
    ORDER BY t.fecha_turno;
END//

DELIMITER ;

-- Procedure para registrar un nuevo Diagnostico

DELIMITER //


CREATE PROCEDURE registrar_diagnostico (
    IN p_id_turno INT,
    IN p_diagnostico TEXT,
    IN p_tratamiento TEXT,
    IN p_receta TEXT
)
BEGIN
    INSERT INTO diagnosticos (id_turno, diagnostico, tratamiento, receta)
    VALUES (p_id_turno, p_diagnostico, p_tratamiento, p_receta);
END//

DELIMITER ;

--  Procedure para ver el historial clinico de un paciente por DNI
DELIMITER //


CREATE PROCEDURE p_historia_clinica_paciente (
    IN p_dni INT
    )
BEGIN
 SELECT  t.id_paciente, p.nombre, p.apellido, p.fecha_de_nacimiento, 
CONCAT(doc.nombre,' ',doc.apellido) AS doctor,d.diagnostico,
d.tratamiento,d.receta,d.fecha_creada AS fecha_de_diagnostico
FROM turnos t
INNER JOIN pacientes p ON t.id_paciente=p.id_paciente
INNER JOIN diagnosticos d ON t.id_turno=d.id_turno
INNER JOIN doctores doc ON t.id_doctor=doc.id_doctor
WHERE p.dni=p_dni
ORDER BY fecha_de_diagnostico DESC;
END//

DELIMITER ;

-- Se crea la tabla auditoria_turnos para llevar el registro de auditoria de Turnos
CREATE TABLE auditoria_turnos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_turno INT NOT NULL,
    accion VARCHAR(20) NOT NULL,
    fecha_accion DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Trigger para registar inserciones en la tabla Turnos

DELIMITER //


CREATE TRIGGER after_insert_turno
AFTER INSERT ON turnos
FOR EACH ROW
BEGIN
INSERT INTO auditoria_turnos (id_turno, accion, fecha_accion)
    VALUES (NEW.id_turno, 'INSERT', NOW());
END //

DELIMITER ;

-- Trigger para registrar eliminaciones en la tabla Turnos

DELIMITER //


CREATE TRIGGER before_delete_turno
BEFORE DELETE ON turnos
FOR EACH ROW
BEGIN
  IF OLD.fecha_turno < NOW() THEN
  SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se pueden eliminar turnos anteriores a la fecha actual.';
  ELSE
  INSERT INTO auditoria_turnos (id_turno, accion, fecha_accion)
  VALUES (OLD.id_turno, 'DELETE', NOW());
  END IF;
END //

DELIMITER ;


-- Trigger para registrar updates en la tabla Turnos

DELIMITER //

CREATE TRIGGER after_update_turno
AFTER UPDATE ON turnos
FOR EACH ROW
BEGIN
INSERT INTO auditoria_turnos (id_turno, accion, fecha_accion)
    VALUES (NEW.id_turno, 'UPDATE', NOW());
END //


DELIMITER ;

-- Trigger para enviar mensaje de error al querer asignar un turno ya ocupado

DELIMITER //

CREATE TRIGGER before_insert_turno
BEFORE INSERT ON turnos
FOR EACH ROW
BEGIN
   DECLARE existe INT;
   SELECT COUNT(*) INTO existe
   FROM turnos
   WHERE NEW.id_doctor=id_doctor AND NEW.fecha_turno=fecha_turno;
   
   IF existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El doctor ya tiene asignado un turno a esa misma hora';
    END IF;
END //

DELIMITER ;

-- trigger para contar turnos atendidos por doctor

CREATE TABLE contador_turnos (
    id_doctor INT PRIMARY KEY,
    cantidad_turnos_atendidos INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_doctor) REFERENCES doctores(id_doctor)
);


DELIMITER //

CREATE TRIGGER sumar_turno_atendido
AFTER UPDATE ON turnos
FOR EACH ROW
BEGIN
     DECLARE turnos_count INT;
     SELECT cantidad_turnos_atendidos INTO turnos_count
     FROM contador_turnos
     WHERE id_doctor = NEW.id_doctor;
     
     IF turnos_count IS NULL AND OLD.estado <> 'atendido' AND NEW.estado = 'atendido' THEN
       INSERT INTO contador_turnos (id_doctor,cantidad_turnos_atendidos)
       VALUES (NEW.id_doctor,1);
     ELSE  
       UPDATE contador_turnos
        SET cantidad_turnos_atendidos = cantidad_turnos_atendidos + 1
        WHERE id_doctor = NEW.id_doctor;
    END IF;
END //

DELIMITER ;

CREATE VIEW v_trigger_contador_turnos AS
SELECT d.nombre, d.apellido, c.cantidad_turnos_atendidos
FROM contador_turnos c
JOIN doctores d ON c.id_doctor = d.id_doctor
ORDER BY c.cantidad_turnos_atendidos DESC;