create database soldado
use soldado

--tabla servicio
create table servicio(
cod_ser int ,
acti_ser varchar (100) ,
constraint pk_cser primary key (cod_ser)
)
--tabla cuerpoE
create table cuerpoE (
cod_ce int ,
denom_ce varchar (100) ,
constraint pk_cce primary key (cod_ce)
)
--tabla cuartel
create table cuartel(
cod_c int ,
nom_c varchar (150) ,
ubic_c varchar (150)
constraint pk_cc primary key (cod_c)
)
--tabla compañia
create table compañia(
num_com int ,
actiP_com varchar (150) ,
constraint pk_ccom primary key (num_com)
)
--tabla cuartel-compañia
create table c_com(
cod_c1 int ,
num_com1 int ,
constraint fk_cc1 foreign key (cod_c1) references cuartel (cod_c) ,
constraint fk_ccom1 foreign key (num_com1) references compañia (num_com)
)

/*tabla soldado
(con una clave foranea)*/
create table soldado(
cod_s int ,
nom_s varchar (50) ,
apell_s varchar(50) ,
grado_s varchar (10) ,
cod_ce1 int ,
num_com2 int ,
cod_c2 int ,
constraint pk_cs primary key (cod_s) ,
constraint fk_ce1 foreign key (cod_ce1) references cuerpoE (cod_ce) ,
constraint fk_ccom2 foreign key (num_com2) references compañia (num_com) ,
constraint fk_cc2 foreign key (cod_C2) references cuartel (cod_c)
)
--tabla servicio-soldado
create table ser_sol(
cod_ser1 int ,
cod_s1 int ,
fecha_ser_sol datetime ,
constraint fk_cser1 foreign key (cod_ser1) references servicio (cod_ser) ,
constraint fk_cs1 foreign key (cod_s1) references soldado (cod_s)
)