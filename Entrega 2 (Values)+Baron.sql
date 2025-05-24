-- Values para Obras Sociales 
INSERT INTO obras_sociales (obra_social,telefono) VALUES 
('No tiene',NULL),
('SWISS Medical','49990042'),
('OSDE','48001111'),
('IOMA','45321234');

-- Values para info de Pacientes
INSERT INTO pacientes 
(dni,nombre,apellido,fecha_de_nacimiento,telefono,email,direccion,id_obra_social) 
VALUES 
('21456789','Laura','Perez','1980-05-12','1123456789','laurip@hotmail.com','Peña 3211, Chivilicoy',2),
('31908775','Martin','Esquivel','1988-02-19','1134567890','martinga@gmail.com','Uriburu 831, Mar del Plata',2),
('13789989','Jose Luis','Zielinski','1976-11-09','1145678901',NULL,'Independencia 4311, Mar del Plata',1),
('33665720','Esteban','Martinez Iraola','1986-10-22','1156789012','estebanmi@gmail.com','Irala 891, Miramar',3),
('09453789','Maria Esther','Perez','1949-01-01','1167890123',NULL,'Arenales 6891, Batan',2),
('43567990','Mariano','Godofredo','2010-07-30','1178901234','marianito@gmail.com','Cordoba 3456, Mar del Plata',4);

-- Values para datos de Especialidades
INSERT INTO especialidades (especialidad) VALUES 
('Otorinolaringología'),
('Traumatología'),
('Odontología');

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
('33649027','Marcelo','Riquelme','1988-11-04','227909809','roman10@gmail.com','Cisneros 8911, Mar del Plata',1,1);

-- Values que muestra las Obras Sociales por las que atienden los Doctores
INSERT INTO doctores_obras_sociales (id_doctor,id_obra_social) VALUES 
(1,2),
(1,4),
(2,3),
(3,4),
(4,2),
(4,4);

-- Values para insertar en la tabla Turnos ---> cambiar orden doctor paciente
INSERT INTO turnos (id_paciente,id_doctor,fecha_turno) 
VALUES 
(1,1,'2025-05-23 14:30:00'),
(2,2,'2025-05-24 14:00:00'),
(3,2,'2025-05-24 14:30:00'),
(4,3,'2025-05-25 16:30:00'),
(5,4,'2025-05-26 15:30:00');

-- Insertar Values usando el Stored Procedure
CALL crear_turno (6,1,'2025-05-26 15:30:00');
CALL crear_turno (1,3,'2023-05-23 14:30:00');
CALL crear_turno (3,1,'2023-05-23 15:30:00');

-- Procedure para cambiar estado Turno
CALL actualizar_estado_turno (1,"ausente");

-- Insertar un turno ya asignado da error
INSERT INTO turnos (id_doctor,id_paciente,fecha_turno) 
VALUES 
(2,2,'2025-05-24 14:00:00');

-- Eliminar un turno futuro
DELETE FROM turnos
WHERE id_turno = 5;

-- Eliminar un turno que ya paso da error (para proteger info de pacientes que se atendieron)
DELETE FROM turnos
WHERE id_turno = 7;

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

-- Procedimiento para ver los Turnos dados de un Doctor, para un determinado periodo
CALL turnos_confirmados_doctor (1,'2025-05-22 14:30:00','2025-05-27 15:30:00');

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

-- Funcion para ver fecha del proximo Turno de un Paciente por DNI
SELECT proxima_fecha_turno (31908775);

-- Ver tabla de auditoria con los cambios de registros
SELECT * FROM codersql.auditoria_turnos;
