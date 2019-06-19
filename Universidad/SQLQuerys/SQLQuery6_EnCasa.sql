/*
Lugar: En casa 
Fecha: 08-06-19
Asunto: modificaciones y creaciones de procedimientos
		modificacion de tablas
*/

use Universidad;
go

--Modificación de tabla Calificaciones
alter table Calificaciones
add aprobado varchar(5) constraint ch_aprobado check(aprobado in ('true', 'false')), constraint df_aprobado default('false') for aprobado

alter table Calificaciones
alter column aprobado varchar(5) not null;

go


--Modificacion de sp ver_registro
alter procedure ver_registro 
@tabla varchar(25) 
as
begin
	if @tabla = 'Alumno'
	begin
		select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
		on a.divisionId3 = d.divisionId and a.existe = 'true';
	end

	if @tabla = 'Asignatura'
	begin
	select * from Asignatura
	end

	if @tabla = 'Aula'
	begin
	select * from Aula
	end

	if @tabla = 'Calificaciones'
	begin
	select * from Calificaciones
	end

	if @tabla = 'Correlativas'
	begin
	select * from Correlativas
	end

	if @tabla = 'Curso_Asignatura'
	begin
	select * from Curso_Asignatura
	end

	if @tabla = 'Curso_Division'
	begin
	select * from Curso_Division
	end

	if @tabla = 'Division_Profesor'
	begin
	select * from Division_Profesor
	end

	if @tabla = 'Profesor'
	begin 
		select * from Profesor
	end

	if @tabla = 'Curso'
	begin
		select * from Curso
	end
	
	if @tabla = 'Division'
	begin
		select * from Division
	end
end

go

--Modificación de sp inscribir_alumno
alter procedure inscribir_alumno
	@matricula int, @idAsignatura int
	as
	begin
		if @idAsignatura in (select asignaturaId2 from Calificaciones where matricula1 = @matricula)
		begin
			select 'El alumno ya se encontraba inscrito a esta asignatura'
			return
		end
		if (((select asignaturaCorrelatId4 from obtener_correlatividades(@idAsignatura)) in 
			(select asignaturaId2 from Calificaciones califs where matricula1 = @matricula)) or
			(select asignaturaCorrelatId4 from obtener_correlatividades(@idAsignatura) correlat where correlat.asignaturaId3 = @idAsignatura) is null)
		begin
			insert Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), @matricula, @idAsignatura);
			print concat('Alumno con matricula: ', @matricula,' inscrito a asignatura: ', @idAsignatura);
		end
		else
		begin
			select 'No puede inscribirse por no tener la correlatividad' 
		end
	end 
go

--Creacion de procedimiento busqueda de alumno por...
create procedure buscar_alumno
	@buscaPor varchar(15),
	@dato varchar(15)
	as
	begin
		if(@buscaPor = 'Matricula')
		begin
			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.matricula = TRY_PARSE(@dato as int);
		end
		if(@buscaPor = 'Apellido')
		begin
			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.apellido = @dato;
		end
		if(@buscaPor = 'Nombre')
		begin
			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.nombre = @dato;
		end
		if(@buscaPor = 'Curso')
		begin
			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.cursoId4 = TRY_PARSE(@dato as int);
		end
		if(@buscaPor = 'Division')
		begin
			if(@dato = 'A') set @dato = '1'
			else if(@dato = 'B') set @dato = '2'

			select a.matricula, a.apellido, a.nombre, a.direccion, a.telefono, a.cursoId4, d.nombre from Alumno a inner join Division d
			on a.divisionId3 = d.divisionId and a.divisionId3 = TRY_PARSE(@dato as int);
		end
	end

go

--Creacion de procedimiento eliminar alumno (y sus calificaciones si las tiene)
create procedure eliminar_alumno
	@matricula int
	as
	delete from Calificaciones where matricula1 = @matricula;
	delete from Alumno where matricula = @matricula
go

--Creación de procedimiento para ver calificaciones de un alumno particular
create procedure ver_calificaciones
	@matricula int
	as
	select alu.nombre [Alumno], profesor.nombre [Profesor], asignatura.nombre [Asignatura], calif.parcial1 [1er Parcial], calif.parcial2 [2do Parcial], calif.parcial3 [3er Parcial], calif.recuperatorio1[1er Recuperatorio], calif.recuperatorio2 [2do Recuperatorio], calif.aprobado [Aprobado?]
	from Asignatura asignatura 
	inner join Calificaciones calif on asignatura.asignaturaId = calif.asignaturaId2
	inner join Alumno alu on alu.matricula = calif.matricula1 and alu.matricula = @matricula
	inner join Profesor profesor on asignatura.dni1 = profesor.dni;
go

--Creación de procedimiento para modificar calificaciones de un alumno particular
create procedure modificar_calificaciones 
	@matricula int, @asignatura int,
	@parcial1 float(2), @parcial2 float(2), @parcial3 float(2),
	@recup1 float(2), @recup2 float(2)
	as
	begin
		update Calificaciones set parcial1 = @parcial1, parcial2 = @parcial2, parcial3 = @parcial3, recuperatorio1 = @recup1, recuperatorio2 = @recup2
		where matricula1 = @matricula and asignaturaId2 = @asignatura;
	end
go

--Creación de procedimiento para cambiar establecer asignatura aprobada 
create procedure establecer_aprobacion_asignatura
	@matricula int, @asignatura int
	as
	begin
		declare @p1 float, @p2 float , @p3 float, @r1 float, @r2 float
		set @p1 = (select parcial1 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);
		set @p2 = (select parcial2 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);
		set @p3 = (select parcial3 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);
		set @r1 = (select recuperatorio1 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);
		set @r2 = (select recuperatorio2 from Calificaciones where matricula1 = @matricula and asignaturaId2 = @asignatura);

		if (@p1 >= 6 and @p2 >= 6 and @p3 >= 6) 
			update Calificaciones set aprobado = 'true' where matricula1 = @matricula and asignaturaId2 = @asignatura;
		else if ( (@p1 >= 6 or @p2 >= 6 or @p3 >= 6) and (@r1 >= 6 and @r2 >= 6) )
			update Calificaciones set aprobado = 'true' where matricula1 = @matricula and asignaturaId2 = @asignatura;
		else
			print 'desaprobado'
	end
go



--Prueba procedimiento buscar_alumno
exec ver_registro 'Alumno'
exec buscar_alumno 'Division', 'b'
go

--Prueba procedimiento eliminar_alumno
exec insertar_alumno 22, 'Cortazar', 'Manuel', 'jdsljfd' , 379154895522, 1, 1; 
exec inscribir_alumno 22, 2;

exec eliminar_alumno 22;

select * from Curso_Asignatura
exec ver_registro 'Calificaciones'
exec ver_registro 'Correlativas'
exec ver_registro 'Asignatura'
exec ver_registro 'Alumno'
go

--Prueba procedimiento ver_calificaciones
exec ver_calificaciones 2
go

--Prueba procedimiento modificar_calificaciones
exec modificar_calificaciones 2, 1, 8.50, 7, 7.60, 0, 0; 
exec modificar_calificaciones 2, 2, 5, 6.25, 4.50, 7, 9.20; 
exec ver_calificaciones 2;
go

--Prueba procedimiento establecer_aprobacion_asignatura
exec ver_calificaciones 2;
exec establecer_aprobacion_asignatura 2, 1;
exec establecer_aprobacion_asignatura 2, 2;

go

--Inscripcion de alumnos 
exec ver_registro 'Curso_Asignatura';
exec ver_registro 'Correlativas';
select * from obtener_asignaturas_Curso(2);
exec ver_calificaciones 4;
exec ver_calificaciones 5;

delete from Calificaciones where matricula1 = 4;
delete from Calificaciones where matricula1 = 5;

exec inscribir_alumno 1, 3;
exec inscribir_alumno 1, 4;
exec inscribir_alumno 1, 5;

exec inscribir_alumno 4, 7;
exec inscribir_alumno 4, 8;
go