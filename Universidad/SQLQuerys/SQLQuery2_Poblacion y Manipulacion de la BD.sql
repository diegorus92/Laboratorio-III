/*Población y manipulación 
de la base de datos Universidad*/
use Universidad
go

--Carga de cursos
insert into Curso(cursoId) values(1);
insert into Curso(cursoId) values(2);
insert into Curso(cursoId) values(3);
insert into Curso(cursoId) values(4);
insert into Curso(cursoId) values(5);
go

--Carga de Divisones
insert into Division(divisionId, nombre) values(1, 'A');
insert into Division(divisionId, nombre) values(2, 'B');
go

--Carga de Profesores
insert into Profesor(dni, apellido, nombre, direccion, telefono) values(35898547, 'Castillo', 'Martin', 'Julio A. Roca 123(Rcia.)', 362154897854);
insert into Profesor(dni, apellido, nombre, direccion, telefono) values(36897896, 'Martinez', 'Mariela', '9 de Julio 1345(Ctes.)', 379154879652);
insert into Profesor(dni, apellido, nombre, direccion, telefono) values(36755212, 'Brizuela', 'Jorge', 'Av. Sarmiento 1570(Rcia.)', 3624485214);
insert into Profesor(dni, apellido, nombre, direccion, telefono) values(36223658, 'Paredes', 'Graciela', 'Brazil 234(Ctes.)', 379154158965);
go

--Carga de Asignaturas
insert into Asignatura(asignaturaId, nombre, dni1) values(1, 'Matemática', 35898547);
insert into Asignatura(asignaturaId, nombre, dni1) values(2, 'Fisica', 35898547);
insert into Asignatura(asignaturaId, nombre, dni1) values(3, 'Redes', 36755212);
insert into Asignatura(asignaturaId, nombre, dni1) values(4, 'Algoritmos', 36755212);
insert into Asignatura(asignaturaId, nombre, dni1) values(5, 'Programacion', 36755212);
insert into Asignatura(asignaturaId, nombre, dni1) values(6, 'Paradigmas', 36755212);
insert into Asignatura(asignaturaId, nombre, dni1) values(7, 'Laboratorio I', 36223658);
insert into Asignatura(asignaturaId, nombre, dni1) values(8, 'Laboratorio II', 36223658);
insert into Asignatura(asignaturaId, nombre, dni1) values(9, 'Matemática II', 35898547);
insert into Asignatura(asignaturaId, nombre, dni1) values(10, 'Fisica II', 35898547);
insert into Asignatura(asignaturaId, nombre, dni1) values(11, 'Programacion II', 36755212);
go

--Carga de Curso_Asignatura
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(1, 1);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(1, 2);

insert into Curso_Asignatura(cursoId2, asignaturaId1) values(2, 9);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(2, 10);

insert into Curso_Asignatura(cursoId2, asignaturaId1) values(3, 3);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(3, 4);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(3, 5);

insert into Curso_Asignatura(cursoId2, asignaturaId1) values(4, 6);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(4, 7);

insert into Curso_Asignatura(cursoId2, asignaturaId1) values(5, 8);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(5, 11);

go

--Carga de Alumnos mediante stored procedure creado
exec insertar_alumno 1, 'Gonzalez', 'Maira', 'Los Alamos 323(Rcia.)', 362154878542, 3, 1
exec insertar_alumno 2, 'Navarro', 'Juan', 'Tulipanes 1223(Ctes.)', 379154898555, 1, 2
exec insertar_alumno 3, 'Lucero', 'Antonio', 'Madariaga 989(R.S.Peña)', 362154878542, 3, 1
exec insertar_alumno 4, 'Navarro', 'Mariano', 'Altiplano 1423(Ctes.)', 379154789652, 5, 1
exec insertar_alumno 5, 'Ramirez', 'Lautaro', 'Concepcion 1125(Rcia.)', 362154452233, 1, 2
exec insertar_alumno 6, 'Navarro', 'Juan', 'Tulipanes 1223(Ctes.)', 379154898555, 1, 2
exec insertar_alumno 7, 'Castillo', 'Celeste', 'Av. Libertad 123(Ctes.)', 3794456985, 1, 2
exec insertar_alumno 8, 'Acevedo', 'Juan', 'Los Pepinos(Ctes.)', 37944894575, 2, 1
exec insertar_alumno 9, 'Lorenzetti', 'Agustina', 'Fray Rossi 145(Rcia.)', 362154452145, 5, 1
exec insertar_alumno 10, 'Gutierrez', 'Natalia', 'San Martin 221(Ctes.)', 37944858965, 4, 1
exec insertar_alumno 11, 'Acevedo', 'Manuel', 'Tulipanes 323(Ctes.)', 379154895452, 3, 1
exec insertar_alumno 12, 'Blanco', 'Silvia', 'Av 9 de Julio 1555(Fontana)', 362154892211, 4, 1
exec insertar_alumno 13, 'Estevanez', 'Diego', 'Misionero Klein 1400(Rcia.)', 36244568952, 1, 2
exec insertar_alumno 14, 'Navarro', 'Lorenzo', 'Av Libertad 13550(Ctes.)', 379154458822, 1, 2
exec insertar_alumno 15, 'Lopez', 'Ramiro', 'San Martin 350(Ctes.)', 379154878821, 2, 2
exec insertar_alumno 16, 'Paredes', 'Agustina', 'Jujuy 1223(Ctes.)', 379154112299, 2, 2
exec insertar_alumno 17, 'Gonzalez', 'Nahuel', 'Los Alamos 1050(Rcia.)', 36244545211, 3, 1
exec insertar_alumno 18, 'Romano', 'Ivan', 'Barranco 125(Ctes.)', 379154158791, 1, 2
go


--Carga de tabla Curso_Division mediante stored procedure creado
exec insertar_curso_division 1, 1;
exec insertar_curso_division 1, 2;
exec insertar_curso_division 2, 1;
exec insertar_curso_division 2, 2;
exec insertar_curso_division 3, 1;
exec insertar_curso_division 3, 2;
exec insertar_curso_division 4, 1;
exec insertar_curso_division 5, 1;
go

--Carga de Aulas
exec insertar_aula 1, 150, 'true', 'false', 1;
exec insertar_aula 2, 100, 'true', 'false', 2;
exec insertar_aula 3, 200, 'true', 'true', 3;
exec insertar_aula 4, 150, 'true', 'true', 4;
exec insertar_aula 5, 150, 'false', 'false', 5; 
go

--Carga de tabla Correlativas
insert into Correlativas(asignaturaId3) values(1);
insert into Correlativas(asignaturaId3) values(2);
insert into Correlativas(asignaturaId3) values(3);
insert into Correlativas(asignaturaId3) values(4);
insert into Correlativas(asignaturaId3) values(5);
insert into Correlativas(asignaturaId3) values(6);
insert into Correlativas(asignaturaId3) values(7);
insert into Correlativas(asignaturaId3, asignaturaCorrelatId4) values(8, 7);
insert into Correlativas(asignaturaId3, asignaturaCorrelatId4) values(9, 1);
insert into Correlativas(asignaturaId3, asignaturaCorrelatId4) values(10, 2);
insert into Correlativas(asignaturaId3, asignaturaCorrelatId4) values(11, 5);

select * from Correlativas;
delete Correlativas;

select * from Correlativas where asignaturaId3 between 1 and 7;
select * from Correlativas where asignaturaCorrelatId4 is null;

select * from Correlativas where asignaturaId3 = 8;
go

--Carga de Calificaciones/inscripcion de alumno
exec inscribir_alumno 2, 1;
exec inscribir_alumno 2, 2;
exec inscribir_alumno 2, 3; --materia 3 no corresponde al año 1 donde esta alumno 2

delete from Calificaciones where asignaturaId2 = 3;
update Calificaciones set idCalif = 3 where idCalif = 4;
exec ver_registro 'Calificaciones';

go

select * from Calificaciones;--Muestra registros
delete Calificaciones; --Elimina todos los registros
go


--Visualización de registros
select * from Curso;
select * from Division;
select * from Profesor;
go

--Visualización de registro mediante stored procedure creado
exec ver_registro 'Curso';
exec ver_registro 'Division';
exec ver_registro 'Correlativas';
exec ver_registro 'Alumno';
exec ver_registro 'Asignatura';
exec ver_registro 'Profesor';
exec ver_registro 'Aula';
exec ver_registro 'Curso_Division'
exec ver_registro 'Calificaciones'
go

--Visualización de correlatividades mediante stored procedure creado
exec ver_correlatividades 8;

go

--Visualizacion de correlatividades de las materias de un alumno
select asignaturaCorrelatId4 from Correlativas 
where  asignaturaId3 in (select asignaturaId2 from Calificaciones
where matricula1 = 1)

exec ver_registro 'Asignatura';

select Alumno.nombre, asignaturaId2, asign.nombre, asignaturaId3, asign2.nombre from Alumno, Calificaciones, (select asignaturaId, nombre from Asignatura)asign, (select asignaturaId, nombre from Asignatura)asign2, (select asignaturaCorrelatId4, asignaturaId3 from Correlativas)corre
where matricula = 2 and matricula = matricula1 and asignaturaId2 = corre.asignaturaCorrelatId4  and asign.asignaturaId = asignaturaId2 and asign2.asignaturaId = corre.asignaturaId3 

select Asignatura.nombre, corre.asignaturaId3, corre.asignaturaCorrelatId4 from Asignatura, (select * from Correlativas)corre
where asignaturaId = corre.asignaturaId3 and corre.asignaturaCorrelatId4 is null
go