--Creacion de la base de datos
create database Universidad;
use Universidad; --Seleccion  de al base de datos a usar

--Creacion de tablas independientes 
create table Curso
(
	cursoId integer
	constraint pk_cursoId primary key(cursoId)
)

create table Division
(
	divisionId integer,
	nombre varchar(5),
	constraint pk_divisionId primary key(divisionId)
)

create table Profesor
(
	dni integer,
	apellido varchar(15),
	nombre varchar(15),
	direccion varchar(40),
	telefono numeric(14),
	constraint pk_dni primary key(dni)
)

/*Creacion de tablas dependientes
(con claves foráneas)*/
create table Aula
(
	aulaId integer,
	capacidadMax tinyint,
	tieneProyeccion char(5) constraint chk_tieneProyeccion check(tieneProyeccion in('true', 'false')), --Restringe a la variable almacenar true o false como informacion
	tieneConexion char(5) constraint chk_tieneConexion check(tieneConexion in('true', 'false')),
	cursoId1 int,
	constraint pk_aulaId primary key(aulaId),
	constraint fk_cursoId1 foreign key(cursoId1) references Curso(cursoId)
)

create table Asignatura
(
	asignaturaId integer,
	nombre varchar(25),
	dni1 integer,
	constraint pk_asignaturaId primary key(asignaturaId),
	constraint fk_dni1 foreign key(dni1) references Profesor(dni)
)

create table Alumno
(
	matricula integer,
	apellido varchar(15),
	nombre varchar(15),
	direccion varchar(40),
	telefono numeric(14),
	cursoId4 int,
	divisionId3 int,
	constraint pk_matricula primary key(matricula),
	constraint fk_cursoId4 foreign key(cursoId4) references Curso(cursoId),
	constraint fk_divisionId3 foreign key(divisionId3) references Division(divisionId)
)

create table Calificaciones
(
	idCalif int,
	parcial1 float(2),
	parcial2 float(2), 
	parcial3 float(2),
	recuperatorio1 float(2),
	recuperatorio2 float(2),
	matricula1 int,
	asignaturaId2 int,
	constraint pk_idCalif primary key(idCalif),
	constraint fk_matricula1 foreign key(matricula1) references Alumno(matricula),
	constraint fk_asignaturaId2 foreign key(asignaturaId2) references Asignatura(asignaturaId)
)

--Creación de tablas intermedias

--Asignatura-Asignatura(correlativa)
create table Correlativas
(
	asignaturaId3 int,
	asignaturaCorrelatId4 int,
	constraint fk_asignaturaId3 foreign key(asignaturaId3) references Asignatura(asignaturaId),
	constraint fk_asignaturaCorrelatId4 foreign key(asignaturaCorrelatId4) references Asignatura(asignaturaId)
)

--Curso-Asignatura
create table Curso_Asignatura
(
	cursoId2 int,
	asignaturaId1 int,
	constraint fk_cursoId2 foreign key(cursoId2) references Curso(cursoId),
	constraint fk_asignaturaId1 foreign key(asignaturaId1) references Asignatura(asignaturaId)
)

--Curso-Division
create table Curso_Division
(
	cursoId3 int,
	divisionId1 int,
	constraint fk_cursoId3 foreign key(cursoId3) references Curso(cursoId),
	constraint fk_divisionId1 foreign key(divisionId1) references Division(divisionId)
)

--Division-Profesor
create table Division_Profesor
(
	divisionId2 int,
	dni2 int,
	constraint fk_divisionId2 foreign key(divisionId2) references Division(divisionId),
	constraint fk_dni2 foreign key(dni2) references Profesor(dni)
)
go

/*Modificacion de tablas*/

--Modifica tabla Asignatura
alter table Asignatura
alter column dni1 int not null
go

--Modifica tabla Curso_Division
alter table Curso_Division
alter column cursoId3 int not null

alter table Curso_Division
alter column divisionId1 int not null

alter table Curso_Division
add constraint chk_curso check(cursoId3 in (1, 2, 3, 4, 5))

alter table Curso_Division
add constraint chk_division check(divisionId1 in (1, 2))
go

--Modifica tabla Aula
alter table Aula
alter column capacidadMax tinyint not null

alter table Aula
alter column tieneProyeccion char(5) not null

alter table Aula
alter column tieneConexion char(5) not null

alter table Aula
alter column cursoId1 int not null

alter table Aula
add constraint chk_cursoId1 check(cursoId1 in (1, 2, 3, 4, 5))
go

--Modifica tabal Calificaciones
alter table Calificaciones
alter column parcial1 float(2) not null;

alter table Calificaciones
alter column parcial2 float(2) not null;

alter table Calificaciones
alter column parcial3 float(2) not null;

alter table Calificaciones
alter column recuperatorio1 float(2) not null;

alter table Calificaciones
alter column recuperatorio2 float(2) not null;

alter table Calificaciones
alter column matricula1 int not null;

alter table Calificaciones
alter column asignaturaId2 int not null
go

--Modifica tabla Correlativas
alter table Correlativas
alter column asignaturaId3 int not null;

alter table Correlativas --Agrega un constraint default
add constraint df_asignCorrelatId4 default(null) for asignaturaCorrelatId4;

alter table Correlativas --Elimina el constraint default
drop constraint df_asignCorrelatId4;

go

--Modificia tabla Curso_Asignatura
alter table Curso_Asignatura
alter column cursoId2 int not null;

alter table Curso_Asignatura
alter column asignaturaId1 int not null
go

/*Modifica tabla Calificaciones*/
--Agrega propiedad de identity a  columna idCalif
alter table Calificaciones--Elimina constraint pk primero
drop constraint pk_idCalif

alter table Calificaciones --Elimina columna a modificar
drop column idCalif

alter table Calificaciones --Crea otra vez la columna eliminada 
add idCalif int not null 

alter table Calificaciones --Aplica de nuevo el constraint pk
add constraint pk_idCalif primary key(idCalif)

--Agrega constraint default a columna
alter table Calificaciones
add constraint df_parcial1 default(0) for parcial1 

alter table Calificaciones
add constraint df_parcial2 default(0) for parcial2

alter table Calificaciones
add constraint df_parcial3 default(0) for parcial3

alter table Calificaciones
add constraint df_recuperatorio1 default(0) for recuperatorio1

alter table Calificaciones
add constraint df_recuperatorio2 default(0) for recuperatorio2

go

/*Modifica Tabla Curso*/
--Agrega constraint check
alter table Curso
add constraint ch_cursoId check(cursoId in (1, 2, 3, 4, 5))
go

/*Modifica Tabla Division*/
--Agrega constraint check
alter table Division
add constraint ch_divisionId check(divisionId in (1, 2))
go