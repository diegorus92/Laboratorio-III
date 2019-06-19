use Universidad
go

--Modifica Tabla alumno
alter table Alumno
add existe varchar(5) not null constraint ch_existe check(existe in ('true', 'false')), constraint df_existe default('true') for existe


exec ver_registro 'Alumno'
delete from Alumno where matricula = 535
go

select * from Curso
go

--modificaciones de datos
exec insertar_alumno 25, 'jldsjaf', 'agag', 'esaf', 546664, 1, 2
exec ver_registro 'Alumno'

exec modificar_alumno 25, 2, 'apellido', 'nombre', 'direccion', 362154256985, 5, 2
delete from Alumno where matricula in (222, 235, 333, 334, 335)
go