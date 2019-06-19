/*Store Procedures para DML*/

use Universidad
go

alter function comprobar_CursoDivision (@cursoId int, @divisionId int)
	returns int 
	as
	begin
		if @cursoId in (4, 5)--El curso cuya division a modificar es 4to o 5to?
		begin
			return 1 --Referiencia a Division A porque 4to y 5to no tiene Division B
		end
		if @cursoId in (1, 2, 3) and @divisionId in (1, 2)
		begin
			return @divisionId
		end
		return 1
	end
go

alter procedure modificar_alumno
	@matriculaVieja int,
	@matriculaNueva int,
	@apellido varchar(15),
	@nombre varchar(15),
	@direccion varchar(40),
	@telefono numeric(14,0),
	@cursoId int,
	@divisionId int
	as
	begin 
		--if( (exists (select matricula from Alumno where matricula = @matriculaVieja)) and (@matriculaNueva != @matriculaVieja) and (not exists (select matricula from Alumno where matricula = @matriculaNueva)))
		if exists (select matricula from Alumno where matricula = @matriculaVieja)--el alumno a modificar existe?
		begin
			print 'el alumno existe'
			if (@matriculaNueva != @matriculaVieja) and (not exists (select matricula from Alumno where matricula = @matriculaNueva))--matricula nueva es distinta a la vieja (se modificará) y la matricula nueva no existe para otro registro...
			begin
				print 'se puede modificar'
				update Alumno
				set matricula = @matriculaNueva, apellido = @apellido, nombre = @nombre, direccion = @direccion, telefono = @telefono, cursoId4 = @cursoId, divisionId3 = dbo.comprobar_CursoDivision(@cursoId, @divisionId)
				where matricula = @matriculaVieja 
				print 'Alumno modificado'
			end
			else
			begin 
				print 'la matricula no se pretende modificar o ya existe registrada'
				update Alumno
				set apellido = @apellido, nombre = @nombre, direccion = @direccion, telefono = @telefono, cursoId4 = @cursoId, divisionId3 = dbo.comprobar_CursoDivision(@cursoId, @divisionId)
				where matricula = @matriculaVieja 
				print 'Alumno modificado'
			end
		end
		else print 'el alumno a modificar no existe'
	end
go