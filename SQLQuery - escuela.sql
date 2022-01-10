create database escuela
use escuela

--Tabla carrera
create table carrera (
clave_c int, 
nom_c varchar (50) , 
durac_c float ,
constraint pk_cc primary key (clave_c)
)
insert into carrera values (1, 'Derecho' , 3)
insert into carrera values (2, 'Ingenieria en Sistemas' , 4)
insert into carrera values (3, 'Diseño', 3)

select * from carrera


 
-- Tabla materia
create table materia (
clave_m int ,
nom_m varchar (50) ,
cred_m float ,
constraint pk_cm primary key (clave_m)
)
insert into materia values (1,'matematicas' ,25)
insert into materia values (2,'español' ,15)
insert into materia values (3, 'dibujo', 15)
insert into materia values (4, 'programacion' , 20)

select clave_m , nom_m from materia

--Tabla profesor
create table profesor (
clave_p int ,
nom_p varchar (150) ,
dir_p varchar (200) ,
tel_p bigint ,
hor_p datetime ,
constraint pk_cp primary key (clave_p) 
)
insert into profesor values (1, 'Laura Rosas' , 'calle XX', 123456 , '7:00')
insert into profesor values (2, 'Roberto Diaz' , 'calle XXI' ,654321 , '8:00')

select * from profesor

select nom_p, dir_p, tel_p from profesor

/*Tabla alumno
(Con una clave foranea)*/
create table alumno (
mat_alu int ,
nom_alu varchar (150) ,
edad_alu int ,
sem_alu int ,
gen_alu varchar (10) ,
clave_c1 int ,
constraint pk_calu primary key (mat_alu) ,
constraint fk_fc1 foreign key (clave_c1) references carrera (clave_c)
)

insert into alumno values (1, 'Ana' , 18 , 6 , 'mujer', 1) 
insert into alumno values (2, 'Sergio' , 19, 7, 'hombre', 2)
insert into alumno values (3, 'Julieta' , 20, 6, 'mujer', 3)

--Alumno-Profesor
create table alu_pro(
mat_alu1 int ,
clave_p1 int ,
constraint fk_falu1 foreign key (mat_alu1) references alumno (mat_alu),
constraint fk_fp1 foreign key (clave_p1) references profesor (clave_p)
)
insert into alu_pro values (1, 2)
insert into alu_pro values (2,2)
insert into alu_pro values (3,2)

--Materia-Alumno
create table mat_alu(
clave_m1 int ,
mat_alu2 int ,
constraint fk_fm1 foreign key (clave_m1) references materia (clave_m),
constraint fk_falu2 foreign key (mat_alu2) references alumno (mat_alu)
)
insert into mat_alu values (1 , 1)
insert into mat_alu values (4,2)
insert into mat_alu values (3,3)
insert into mat_alu values (4,1)

select * from alumno

--Materia-Profesor
create table mat_pro(
clave_m2 int ,
clave_p2 int ,
constraint fk_fm2 foreign key (clave_m2) references materia (clave_m) ,
constraint fk_fp2 foreign key (clave_p2) references profesor (clave_p)
)
insert into mat_pro values (2, 2)
 

 --para saber la materia de cada alumno se sigue todo el recorrido hasta que se 
 --conecten las tablas que necesitamos

 select nom_alu, edad_alu,sem_alu,nom_c, nom_p,nom_m
 from alumno inner join carrera on alumno.clave_c1=carrera.clave_c
 inner join alu_pro on alu_pro.mat_alu1=alumno.mat_alu
 inner join profesor on profesor.clave_p=alu_pro.clave_p1
 inner join mat_alu on mat_alu.mat_alu2=alumno.mat_alu
 inner join materia on materia.clave_m=mat_alu.clave_m1

 --si indico una condicion o restriccion para que muestren los datos
 where gen_alu='mujer'

 select*from alumno
 select*from profesor
 select*from materia
 select*from carrera
 select*from alu_pro
 select*from mat_alu