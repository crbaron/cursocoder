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






