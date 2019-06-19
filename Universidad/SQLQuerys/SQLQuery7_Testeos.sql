/*
Lugar: En Taller 
Fecha: 14-06-19
Asunto: Pruebas varias
*/

use Universidad;

exec ver_registro 'Alumno';
exec ver_registro 'Asignatura';
exec ver_registro 'Curso_Asignatura'
select * from obtener_asignaturas_Curso(4)
exec inscribir_alumno 8, 1;
exec ver_calificaciones 8;

select * from Asignatura where nombre = 'Matemática' ;

exec modificar_calificaciones 8, 9, 1.55, 4.75, 10, 8.65, 0;
exec establecer_aprobacion_asignatura 8, 9;

delete from Calificaciones where matricula1 = 8 and asignaturaId2 = 9;

--Obtener idAsignatura conociendo matricula del alumno y nombre de la asignatura
select top 1 asign.asignaturaId from Asignatura asign inner join Calificaciones calif on calif.matricula1 = 8 and asign.nombre = 'Matemática';

--asignaturas de primer año
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(1, 1);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(1, 2);

--asignaturas de segundo año
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(2, 9);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(2, 10);

--asignaturas de tercer año
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(3, 3);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(3, 4);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(3, 6);

--asignaturas de cuarto año
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(4, 5);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(4, 7);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(4, 8);

--asignaturas de quinto año
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(5, 11);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(5, 12);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(5, 13);