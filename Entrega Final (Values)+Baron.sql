-- Values para Obras Sociales 
INSERT INTO obras_sociales (obra_social,telefono) VALUES 
('No tiene',NULL),
('SWISS Medical','49990042'),
('OSDE','48001111'),
('IOMA','45321234');

-- Values para info de Pacientes
INSERT INTO pacientes 
(dni,nombre,apellido,fecha_de_nacimiento,sexo,telefono,email,direccion,id_obra_social) 
VALUES 
('21456789','Laura','Perez','1980-05-12','F','1123456789','laurip@hotmail.com','Peña 3211, Chivilicoy',2),
('31908775','Martin','Esquivel','1988-02-19','M','1134567890','martinga@gmail.com','Uriburu 831, Mar del Plata',2),
('13789989','Jose Luis','Zielinski','1976-11-09','M','1145678901',NULL,'Independencia 4311, Mar del Plata',1),
('33665720','Esteban','Martinez Iraola','1986-10-22','M','1156789012','estebanmi@gmail.com','Irala 891, Miramar',3),
('09453789','Maria Esther','Perez','1949-01-01','F','1167890123',NULL,'Arenales 6891, Batan',2),
('43567990','Mariano','Godofredo','2010-07-30','M','1178901234','marianito@gmail.com','Cordoba 3456, Mar del Plata',4),
(40222333, 'Lucía', 'Gómez', '1990-04-15', 'F', '1165478231', 'lucia.gomez@gmail.com', 'Av. Colón 1234', 1),
(39511222, 'Matías', 'Fernández', '1985-11-03', 'M', '1165984320', 'matias.fernandez@hotmail.com', 'Calle Rivadavia 554', 2),
(42888321, 'Sofía', 'Pérez', '1998-06-21', 'F', '1165987211', 'sofia.perez@yahoo.com', 'España 888', 3),
(41422555, 'Diego', 'Ramírez', '1992-08-30', 'M', '1154352178', 'diego.ramirez@gmail.com', 'Belgrano 455', 1),
(41990123, 'Camila', 'Torres', '2000-02-14', 'F', '1167894322', 'camila.torres@hotmail.com', 'La Rioja 2201', 2),
(40771444, 'Julián', 'Molina', '1987-07-12', 'M', '1177774444', 'julian.molina@gmail.com', 'San Martín 301', 3),
(43001234, 'Valentina', 'Acosta', '1996-12-05', 'F', '1166009990', 'valentina.acosta@outlook.com', 'Mitre 1020', 1),
(41778899, 'Tomás', 'Sosa', '1991-05-27', 'M', '1188881122', 'tomas.sosa@gmail.com', 'Dorrego 1550', 2),
(42334567, 'Martina', 'López', '1994-10-19', 'F', '1161234567', 'martina.lopez@hotmail.com', 'Independencia 789', 3),
(40993333, 'Ignacio', 'Herrera', '1989-03-10', 'M', '1167002211', 'ignacio.herrera@gmail.com', 'Salta 431', 1);

-- Values para datos de Especialidades
INSERT INTO especialidades (especialidad) VALUES 
('Otorrinolaringología'),
('Traumatología'),
('Odontología'),
('Cardiología'),
('Dermatología'),
('Pediatría');

-- Values para info de los distintos Establecimientos
INSERT INTO establecimientos (direccion,telefono) VALUES 
('La Rioja 4231, Mar del Plata',223527391),
('25 de Mayo 3291, Mar del Plata',223527390);

-- Values para info de doctores
INSERT INTO doctores 
(dni,nombre,apellido,fecha_de_nacimiento,telefono,email,direccion,id_establecimiento,id_especialidad) 
VALUES 
('25466234','Carlos','Palermo','1982-02-22','1189034520','titan@hotmail.com','Alvear 3224, Mar del Plata',2,1),
('30665791','Melina','Delgado','1985-12-09','1147899211','melu23@gmail.com','Matheu 892, Mar del Plata',2,2),
('28444100','Flavia','Schelotto','1984-11-01','22389112','chapita@yahoo.com','San Lorenzo 1147, Mar del Plata',1,3),
('33649027','Marcelo','Riquelme','1988-11-04','227909809','roman10@gmail.com','Cisneros 8911, Mar del Plata',1,1),
(29800123, 'Sandra', 'Corvalán', '1980-07-14', '1150002233', 'sandra.corvalan@gmail.com', 'Paso 1441, Mar del Plata', 1, 4),
(31234567, 'Ricardo', 'Perdomo', '1975-03-29', '1144005566', 'ricardo.perdomo@gmail.com', 'San Juan 2031, Mar del Plata', 2, 5), 
(28765432, 'Julieta', 'Miranda', '1990-09-17', '1166443322', 'julieta.miranda@hotmail.com', 'Gascon 910, Mar del Plata', 1, 6), 
(32567890, 'Fernando', 'Sánchez', '1982-01-05', '1133887766', 'fernando.sanchez@med.com', 'Guemes 1200, Mar del Plata', 2, 2);

-- Values que muestra las Obras Sociales por las que atienden los Doctores
INSERT INTO doctores_obras_sociales (id_doctor,id_obra_social) VALUES 
(1,2),
(1,4),
(2,3),
(3,4),
(4,2),
(4,4),
(5, 2),
(5, 3),
(6, 3),
(6, 4),
(7, 2),
(7, 4),
(8, 3),
(8, 4);

-- Values para insertar en la tabla Turnos
INSERT INTO turnos (id_paciente,id_doctor,fecha_turno) 
VALUES 
(1,1,'2025-05-23 14:30:00'),
(2,2,'2025-05-24 14:00:00'),
(3,2,'2025-05-24 14:30:00'),
(4,3,'2025-05-25 16:30:00'),
(5,4,'2025-06-26 15:30:00'),
(7, 5, '2025-05-22 09:00:00'),
(8, 6, '2025-05-11 10:30:00'),
(9, 7, '2025-05-12 14:00:00'),
(10, 8, '2025-06-13 11:45:00'),
(11, 1, '2025-06-14 15:15:00'),
(12, 2, '2025-06-15 13:00:00'),
(13, 3, '2025-06-16 09:45:00'),
(14, 4, '2025-06-17 16:00:00'),
(15, 5, '2025-06-18 10:15:00'),
(6, 6, '2025-06-19 08:30:00'),
(3, 7, '2025-06-20 12:30:00'),
(2, 8, '2025-06-21 14:30:00'),
(1, 2, '2025-06-22 11:00:00'),
(16, 4, '2025-06-22 13:00:00');

-- Insertar Values usando el Stored Procedure
CALL crear_turno (6,1,'2025-05-26 15:30:00');
CALL crear_turno (1,3,'2023-05-23 14:30:00');
CALL crear_turno (3,1,'2023-05-23 15:30:00');

-- Procedure para cambiar estado Turno
CALL actualizar_estado_turno (1,"ausente");
CALL actualizar_estado_turno (2,"atendido");
CALL actualizar_estado_turno (3,"atendido");
CALL actualizar_estado_turno (4,"atendido");
CALL actualizar_estado_turno (6,"atendido");
CALL actualizar_estado_turno (7,"atendido");
CALL actualizar_estado_turno (8,"ausente");
CALL actualizar_estado_turno (19,"atendido");
CALL actualizar_estado_turno (20,"atendido");
CALL actualizar_estado_turno (21,"atendido");


-- Insertar un turno ya asignado da error
-- INSERT INTO turnos (id_doctor,id_paciente,fecha_turno) 
-- VALUES 
-- (2,22,'2025-06-22 11:00:00');

-- Eliminar un turno futuro
DELETE FROM turnos
WHERE id_turno = 5;

-- Eliminar un turno que ya paso da error (para proteger info de pacientes que se atendieron)
-- DELETE FROM turnos
-- WHERE id_turno = 7;

-- Values para tabla Diagnosticos
INSERT INTO diagnosticos (id_turno,diagnostico,tratamiento,receta) 
VALUES 
(2,'El paciente presenta severos colicos renales debido a la ingesta de bebidas alcoholicas',
'Se le dice al peciente que deje el alcohol, haga deporte y coma sano. Se le receta un remedio',
'Tetraxona 200mg');

CALL registrar_diagnostico (3,'El paciente presenta migrañas',
'Se le dice al peciente que use antimigral cuando comiencen los dolores',
'Antimigralon 100mg');

CALL registrar_diagnostico (4,'El paciente presenta vomitos severos',
'Se le dice al peciente que repose e ingiera mucha agua',
NULL);

CALL registrar_diagnostico(
    6,
    'Control general pediátrico. Niño sano.',
    'Se indica continuar con controles anuales y alimentación saludable.',
    NULL
);

CALL registrar_diagnostico(
    7,
    'Consulta por molestias leves en el pecho. Examen clínico sin hallazgos patológicos.',
    'Se recomienda realizar un ECG de control y seguimiento con cardiólogo.',
    'ECG reposo, Betaloc 25mg si persisten síntomas'
);

CALL registrar_diagnostico(
    19,
    'Consulta dermatológica por acné leve en rostro.',
    'Se indica higiene facial con jabón neutro y evitar tocarse la cara.',
    'Crema tópica con peróxido de benzoilo'
);

CALL registrar_diagnostico(
    20,
    'Dolor muscular en espalda baja, probablemente por mala postura.',
    'Recomendada actividad física moderada y ejercicios de estiramiento.',
    'Ibuprofeno 400mg cada 8hs si hay dolor'
);

CALL registrar_diagnostico(
    21,
    'Control odontológico de rutina sin presencia de caries.',
    'Higiene bucal adecuada. Se sugiere continuar con controles semestrales.',
    NULL
);

-- Procedimiento para ver los Turnos dados de un Doctor, para un determinado periodo
CALL turnos_confirmados_doctor (1,'2025-05-22 14:30:00','2025-06-27 15:30:00');

-- Ver historia clinica de un Paciente por DNI
CALL p_historia_clinica_paciente(13789989);

-- Ver listado total de Turnos
SELECT * FROM v_turnos;

-- Vista para info de Doctores
SELECT * FROM v_doctores;

-- Vista de los Doctores y las Obras Sociales que atienden
SELECT * FROM vista_doctores_convenios;

-- Vista para ver info de los Pacientes
SELECT * FROM v_info_pacientes;

-- Vista para ver info de los especialidades
SELECT * FROM vista_especialidades_doctores;

-- Funcion para ver fecha del proximo Turno de un Paciente por DNI
SELECT proxima_fecha_turno (41778899);

-- Ver tabla de auditoria con los cambios de registros
SELECT * FROM codersql.auditoria_turnos;

-- Informes
-- funcion para edad promedio de pacientes
SELECT edad_promedio_pacientes();

-- vista de cantidad de turnos confirmados por doctor
SELECT * FROM vista_turnos_confirmados_por_doctor;

-- edad promedio doctores
SELECT edad_promedio_doctores();

-- vista para ver contador turnos atendidos por doctor
SELECT*FROM v_trigger_contador_turnos;

-- Importacion y exportacion (backup .sql) por CMD
-- Exportar: mysqldump -u root -p codersql > backup.sql
-- importar: mysqldump -u root -p codersql < backup.sql

-- Garantizar acceso a la bbdd:
-- CREATE USER 'profesor'@'localhost' IDENTIFIED BY 'password1';
-- GRANT ALL PRIVILEGES ON codersql.* TO 'profesor'@'localhost';


