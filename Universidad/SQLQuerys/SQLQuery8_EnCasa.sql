/*
Lugar: En Casa 
Fecha: 16-06-19
Asunto: Pruebas y creacion de stored procedures 
*/

use Universidad;
go

---------------------Creaciones---------------------
--Creacion procedimienot ver_asignaturas_profesor
create procedure ver_asignaturas_profesor
	@dni int
	as
	begin
		select asign.nombre [Asignatura] from Asignatura asign 
		where asign.dni1 = @dni;
	end
go

--Creación procedimiento modificar_aula
create procedure modificar_aula 
	@aulaIdVieja int, @aulaIdNueva int,
	@capacidadMaxima tinyint,
	@tieneProyeccion varchar(5), @tieneConexion varchar(5)
	as
	begin
		update Aula 
		set aulaId = @aulaIdNueva, capacidadMax = @capacidadMaxima, tieneProyeccion = @tieneProyeccion, tieneConexion = @tieneConexion
		where aulaId = @aulaIdVieja
	end
go

--Creacion funcion ver_alumnos_en_aula
create function ver_alumnos_en_aula(@aulaId int)
	returns table
	as
		return (select alu.matricula [Matricula], alu.apellido [Apellido], alu.nombre [Nombre], alu.cursoId4 [Curso/Año], div.nombre [Division] 
				from Alumno alu inner join Division div on 
				cursoId4 = @aulaId and alu.divisionId3 = div.divisionId)
go

--Creacion funcion obtener_aula
create function obtener_aula(@aulaId int)
	returns table
	as
	return(select * from Aula where aulaId = @aulaId)
go


---------------------Modificaciones---------------------
--Modificacion de asignacion de asignaturas a profesor
update Asignatura set dni1 = 36897896 where asignaturaId in (3, 4, 6); 
go
---------------------Pruebas---------------------
exec ver_registro 'Profesor';
exec ver_registro 'Asignatura';
exec ver_registro 'Division_Profesor';
exec ver_registro 'Aula';
exec ver_registro 'Alumno';
go

exec ver_asignaturas_profesor 36897896;
go

--Muestra las asignaturas que imparte cada profesor
select prof.dni, prof.apellido, prof.nombre, asign.nombre Asignatura from Profesor prof inner join 
Asignatura asign on prof.dni = asign.dni1 order by prof.apellido;
go

--Cuenta alumnos en un curso/año determinado
select count(*) [1er Año] from Alumno alu where alu.cursoId4 = 1;
select count(*) [2do Año] from Alumno alu where alu.cursoId4 = 2;
select count(*) [3er Año] from Alumno alu where alu.cursoId4 = 3;
select count(*) [4to Año] from Alumno alu where alu.cursoId4 = 4;
select count(*) [5to Año] from Alumno alu where alu.cursoId4 = 5;
go


select * from Aula;
select * from ver_alumnos_en_aula(2);
select count(*) from ver_alumnos_en_aula(2);
select * from obtener_aula(2);
go

--prueba modificacion de aula
exec modificar_aula 2, 2, 100, 'true', 'false';
exec ver_registro 'Aula';
go