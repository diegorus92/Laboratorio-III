/*
Lugar: En Taller 
Fecha: 12-06-19
Asunto: ...
*/

use Universidad;
go


----------------------Modificaciones-------------------------

--Modificacion de procedimiento inscribir_alumno

alter procedure inscribir_alumno
	@matricula int, @idAsignatura int
	as
	begin

	declare @correlatividades int = (select count(asignaturaCorrelatId4) from obtener_correlatividades(@idAsignatura));
	declare @inscripcionesACorrelativas int = (select count(corr.asignaturaId3) from Calificaciones calif, obtener_correlatividades(@idAsignatura) corr where calif.matricula1 = @matricula and calif.asignaturaId2 = corr.asignaturaCorrelatId4);
		
		if @idAsignatura in (select asignaturaId2 from Calificaciones where matricula1 = @matricula)
		begin
			select 'El alumno ya se encontraba inscrito a esta asignatura'
			return
		end
		if (select top 1 corr.asignaturaCorrelatId4 from obtener_correlatividades(@idAsignatura) corr) is null
		begin
			print 'puede inscribirse, la asignatura no tiene correlativas'
			insert into Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), @matricula, @idAsignatura);
		end
		else if(@correlatividades = @inscripcionesACorrelativas)
		begin
			print 'está inscrito a todas las correlativas necesarias'
			--comprobar que las tenga aprobadas
			declare @aprobadas int = (select count(calif.aprobado) from 
				Calificaciones calif, obtener_correlatividades(@idAsignatura) corr where
				matricula1 = @matricula and corr.asignaturaCorrelatId4 = calif.asignaturaId2 and calif.aprobado = 'true')
			print concat('aprobadas = ', @aprobadas)
			print concat('Correlatividades = ', @correlatividades)
			print concat('inscripcion a correlatividades = ', @inscripcionesACorrelativas)
			
			if(@inscripcionesACorrelativas = @aprobadas) --Tiene aporbadas las correlativas???
			begin
				print 'tiene las correlativas aprobadas, se puede inscribir'
				insert into Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), @matricula, @idAsignatura);
			end
			else
			begin
				select 'no tiene todas las correlativas necesarias aprobadas aun'
			end
		end
		else
		begin 
			select 'no está inscrito a las correlativas necesarias, no se puede inscribir'
		end
	end 
go

--Modificacion de procedimiento establecer_aprobacion_asignatura
alter procedure establecer_aprobacion_asignatura
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
		begin
			update Calificaciones set aprobado = 'true' where matricula1 = @matricula and asignaturaId2 = @asignatura;
			print 'aprobado'
		end
		else if ( (@p1 >= 6 or @p2 >= 6 or @p3 >= 6) and (@r1 >= 6 and @r2 >= 6) )
		begin
			update Calificaciones set aprobado = 'true' where matricula1 = @matricula and asignaturaId2 = @asignatura;
			print 'aprobado'
		end
		else if ( ((@p1 >= 6 and @p2 >= 6) or (@p2 >= 6 and @p3 >= 6) or (@p1 >= 6 and @p3 >= 6)) and (@r1 >= 6 or @r2 >= 6))
		begin
			update Calificaciones set aprobado = 'true' where matricula1 = @matricula and asignaturaId2 = @asignatura;
			print 'aprobado'
		end
		else
		begin
			update Calificaciones set aprobado = 'false' where matricula1 = @matricula and asignaturaId2 = @asignatura;
			print 'desaprobado'
		end
	end
go

--Modificación de procedimiento ver_correlatividades
alter procedure ver_correlatividades 
	@asignaturaId int
	as
	begin
			--select top 1, limita el retorno a un solo registro 
		if( (select top 1 asignaturaCorrelatId4 from Correlativas where  asignaturaId3 = @asignaturaId) is null)
		begin
			print 'null'
			select 
				asignaturaId3, nombre 
			from 
				Correlativas, Asignatura 
			where 
				asignaturaId3 = @asignaturaId and asignaturaId3 = asignaturaId
			return
		end

		else
		begin
			select 
				correlat.asignaturaId3, 
				nombreAsign.nombre, 
				correlat.asignaturaCorrelatId4, 
				nombreAsignCorrelat.nombre 
			from 
				Correlativas correlat, 
				Asignatura nombreAsign, 
				Asignatura nombreAsignCorrelat
			where 
				correlat.asignaturaId3 = @asignaturaId and 
				nombreAsign.asignaturaId = correlat.asignaturaId3 and 
				nombreAsignCorrelat.asignaturaId = correlat.asignaturaCorrelatId4 
		end

	end
go


--Modificación de procedimiento ver_registro
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
	select * from Correlativas order by asignaturaId3
	end

	if @tabla = 'Curso_Asignatura'
	begin
	select * from Curso_Asignatura order by cursoId2
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
		select prof.dni [DNI], prof.apellido [Apellido], prof.nombre [Nombre], prof.direccion [Dirección], prof.telefono [TEL/CEL] from Profesor prof
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

--Modificación de procedimiento ver_calificaciones
alter procedure ver_calificaciones
	@matricula int
	as
	select profesor.apellido [Apellido Prof.], profesor.nombre[Nombre Prof.], asignatura.nombre [Asignatura], calif.parcial1 [1er Parcial], calif.parcial2 [2do Parcial], calif.parcial3 [3er Parcial], calif.recuperatorio1[1er Recuperatorio], calif.recuperatorio2 [2do Recuperatorio], calif.aprobado [Aprobado?]
	from Asignatura asignatura 
	inner join Calificaciones calif on asignatura.asignaturaId = calif.asignaturaId2
	inner join Alumno alu on alu.matricula = calif.matricula1 and alu.matricula = @matricula
	inner join Profesor profesor on asignatura.dni1 = profesor.dni;
go

--Modificación de procedimiento modificar_calificaciones
alter procedure modificar_calificaciones 
	@matricula int, @asignatura int,
	@parcial1 float(3), @parcial2 float(3), @parcial3 float(3),
	@recup1 float(3), @recup2 float(3)
	as
	begin
		if ( (@parcial1 >= 0 and @parcial1 <= 10) and
			(@parcial2 >= 0 and @parcial2 <= 10) and
			(@parcial3 >= 0 and @parcial3 <= 10) and
			(@recup1 >= 0 and @recup1 <= 10) and
			(@recup2 >= 0 and @recup2 <= 10) )
		begin
			update Calificaciones set parcial1 = @parcial1, parcial2 = @parcial2, parcial3 = @parcial3, recuperatorio1 = @recup1, recuperatorio2 = @recup2
			where matricula1 = @matricula and asignaturaId2 = @asignatura;
		end
		else
		begin
			select 'calificacion/es ingresada/s fuera de rango [0-10]'
		end
	end
go

----------------------PRUEBAS-------------------------

--Prueba procedimiento inscribir_alumno
exec ver_calificaciones 2;
exec modificar_calificaciones 2, 1, 7, 8, 4, 8, 0;
exec establecer_aprobacion_asignatura  2, 1;
exec inscribir_alumno 2, 9;

exec ver_calificaciones 2;
exec modificar_calificaciones 2, 2, 7, 8, 4, 8, 0;
exec establecer_aprobacion_asignatura  2, 2;
exec inscribir_alumno 2, 10;
delete from Calificaciones where matricula1 = 2 and asignaturaId2 = 11;


exec ver_calificaciones 4;
exec inscribir_alumno 4, 13;
delete from Calificaciones where matricula1 = 4 and asignaturaId2 = 11;
insert into Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), 4, 2);

update Calificaciones 
set aprobado = 'false'
where asignaturaId2 = 2 and matricula1 = 4

exec inscribir_alumno 4, 10;

insert into Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), 4, 5);
insert into Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), 4, 12);
insert into Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), 4, 11);

update Calificaciones 
set aprobado = 'true'
where asignaturaId2 = 12 and matricula1 = 4

exec ver_calificaciones 4;
exec inscribir_alumno 4, 13;

delete from Calificaciones where matricula1 = 4 and idCalif = 6;
select * from Calificaciones where  matricula1 = 4;

--------------posible solucion inscripcion de alumno segun correaltividad
declare @correlativas int = (select count(asignaturaCorrelatId4) from obtener_correlatividades(10) where asignaturaCorrelatId4 is not null);
print concat ('correlativas = ',@correlativas);

declare @inscripcionesACorrelativas int = (select count(asignaturaId3) from obtener_correlatividades(10) , Calificaciones where matricula1 = 2 and asignaturaid2 = asignaturaCorrelatId4);
print concat('inscripciones a correlativas = ', @inscripcionesACorrelativas);



if  @correlativas = @inscripcionesACorrelativas
	print 'bieeeen'
else
	print 'mal'


exec ver_registro 'Asignatura';
exec ver_registro 'Correlativas';
go


--Prueba procedimiento ver_correlatividades
exec ver_correlatividades 2;

insert into Asignatura(asignaturaId, nombre, dni1) values(12, 'Programacion III', 36755212);
insert into Asignatura(asignaturaId, nombre, dni1) values(13, 'Programacion IV', 36755212);

insert into Correlativas(asignaturaId3, asignaturaCorrelatId4) values(12, 11);

insert into Correlativas(asignaturaId3, asignaturaCorrelatId4) values(13, 5);
insert into Correlativas(asignaturaId3, asignaturaCorrelatId4) values(13, 11);
insert into Correlativas(asignaturaId3, asignaturaCorrelatId4) values(13, 12);

insert into Curso_Asignatura(cursoId2, asignaturaId1) values(4, 12);
insert into Curso_Asignatura(cursoId2, asignaturaId1) values(5, 13);

exec ver_registro 'Curso_Asignatura';
exec ver_registro 'Asignatura';
exec ver_registro 'Correlativas';
exec ver_correlatividades 2;
exec ver_correlatividades 13;
delete from Correlativas where asignaturaId3 = 12
delete from Curso_Asignatura where asignaturaId1 = 12
go