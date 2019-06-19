/*Pruebas y comandos varios*/
use Universidad

go

--Creacion de  stored procedure para ver registros de una tabla
create procedure ver_registro 
@tabla varchar(25) 
as
begin
	if @tabla = 'Alumno'
	begin
	select * from Alumno
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

--Ejecución del procedure
exec ver_registro @tabla = 'Division'
exec ver_registro 'Profesor'
exec ver_registro 'Curso'

go

--Eliminacion del procedure
drop procedure ver_registro;

go

--creacion de stored procedure para insertar alumno
alter procedure insertar_alumno
	@matricula int,
	@apellido varchar(15),
	@nombre varchar(15),
	@direccion varchar(40),
	@telefono numeric(14,0),
	@cursoId int,
	@divisionId int
	as
	begin
		if @divisionId >= 1 and @divisionId <= 2 and @cursoId >= 1 and @cursoId <= 5 
		begin
			if (@cursoId = 4 or @cursoId = 5) set @divisionId = 1; --Evita colocar Division B al curso 4to y 5to
			insert into Alumno(matricula, apellido, nombre, direccion, telefono, cursoId4, divisionId3) values(@matricula, @apellido, @nombre, @direccion, @telefono, @cursoId, @divisionId)
			print 'Alumno registrado correctamente'
			return
		end
			print 'Codigo de division o curso inexistente'
	end
go

--creacion de stored procedure para insertar Curso_Division
create procedure insertar_curso_division
	@curso int, 
	@division int
	as
	begin
		if( ((@curso >= 1 and @curso <= 3) and (@division = 1 or @division = 2)) or ((@curso = 4 or @curso = 5) and (@division != 2)) )
		begin
			insert into Curso_Division(cursoId3, divisionId1) values(@curso, @division)
			print 'Curso_Division Registrado!'
			return
		end
		print 'ERROR: Division incompatible con el curso'
	end
go

--creacion de stored procedure para insertar aula
create procedure insertar_aula
	@aulaId int,
	@capacidadmaxima tinyint,
	@tieneProyeccion char(5),
	@tieneConexion char(5),
	@cursoId int 
	as
	begin
		insert into Aula(aulaId, capacidadmax, tieneProyeccion, tieneConexion, cursoId1) values(@aulaId, @capacidadmaxima, @tieneProyeccion, @tieneConexion, @cursoId)
	end
go

--Creacion de  stored procedure para ver registro de correlatividades
alter procedure ver_correlatividades 
	@asignaturaId int
	as
	begin
		if((select asignaturaCorrelatId4 from Correlativas where asignaturaId3 = @asignaturaId) is null)
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

--Creacion de función para obtener todas las asignaturas de un curso
create function obtener_asignaturas_Curso(@curso int)
	returns table
	as
		return (select cur.cursoId2, cur.asignaturaId1, asig.nombre 
				from Curso_Asignatura cur, Asignatura asig 
				where cur.cursoId2 = @curso and asig.asignaturaId = cur.asignaturaId1)
go

--Creacion de funcion para obtener una asignaturas en particular de un curso
create function obtener_asignaturaDeCurso(@curso int, @asignaturaId int)
	returns table

	as 
		return (select curso.cursoId2, curso.asignaturaId1, asignatura.nombre 
				from Curso_Asignatura curso, Asignatura asignatura 
				where curso.cursoId2 = @curso and 
				 @asignaturaId = curso.asignaturaId1 and 
				 curso.asignaturaId1 = asignatura.asignaturaId)
go

--Creacion de función para obtener correlatividades de una asignatura
--create para crear/alter para modificar
alter function obtener_correlatividades (@asignaturaId int)
	returns table
	as
		return (select * from Correlativas where asignaturaId3 = @asignaturaId)
go

--creacion de stored procedure para inscribir alumno a materia
alter procedure inscribir_alumno
	@matricula int, @idAsignatura int
	as
	begin
		if @idAsignatura in (select asignaturaId2 from Calificaciones where matricula1 = @matricula)
		begin
			print 'El alumno ya se encontraba inscrito a esta asignatura'
			return
		end
		if  @idAsignatura in ((select asignaturaId1 from obtener_asignaturaDeCurso((select cursoId4 from Alumno where matricula = @matricula), @idAsignatura)))
		begin
			print 'Existe la asignatura para este curso'
			if (((select asignaturaCorrelatId4 from obtener_correlatividades(@idAsignatura)) in 
				(select asignaturaId2 from Calificaciones califs where matricula1 = @matricula)) or
				(select asignaturaCorrelatId4 from obtener_correlatividades(@idAsignatura) correlat where correlat.asignaturaId3 = @idAsignatura) is null)
			begin
				insert Calificaciones(idCalif, matricula1, asignaturaId2) values((dbo.autogenerar_pkCalificaciones()), @matricula, @idAsignatura);
				print concat('Alumno con matricula: ', @matricula,' inscrito a asignatura: ', @idAsignatura);
			end
			else
			begin
				print 'No puede inscribirse por no tener la correlatividad' 
			end
		end
		else
		begin 
			print 'No existe esta asignatura para este curso'
		end
	end 
go

--Modificacion de stored procedure insertar_alumno
alter procedure insertar_alumno
	@matricula int,
	@apellido varchar(15),
	@nombre varchar(15),
	@direccion varchar(40),
	@telefono numeric(14,0),
	@cursoId int,
	@divisionId int
	as
	begin
		if @divisionId >= 1 and @divisionId <= 2 and @cursoId >= 1 and @cursoId <= 5 
		begin
			if ((@cursoId = 4 and @divisionId != 2) or (@cursoId = 5 and @divisionId != 2)) or ((@cursoId >= 1 and @cursoId <= 3) and (@divisionId = 1 or @divisionId = 2))
			begin
				insert into Alumno(matricula, apellido, nombre, direccion, telefono, cursoId4, divisionId3) values(@matricula, @apellido, @nombre, @direccion, @telefono, @cursoId, @divisionId)
				print 'Alumno registrado correctamente'
				return
			end
			print 'Division incorrecta para el curso'
			print @divisionId
			return
		end
			print 'Codigo de division o curso inexistente'
	end
go

/*Funcion que autogenera la primary key de Calificaciones
(Segun el ultimo registro de idCalif suma uno para agregar al nuevo registro)*/
create function autogenerar_pkCalificaciones ()
	returns int
	as
	begin 
		declare @proximoId int
		--max(nombre_columna) retorna el ultimo valor registrado en nombre_columna
		set @proximoId = (select max(idCalif) from Calificaciones) + 1
		if(@proximoId is null) 
		begin
			return 1
		end
		return @proximoId
	end
go

