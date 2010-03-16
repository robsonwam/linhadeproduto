/*
Created		13/03/2010
Modified		14/03/2010
Project		
Model			
Company		
Author		
Version		
Database		PostgreSQL 8.1 
*/



/* Drop Referential Integrity Triggers */





/* Drop User-Defined Triggers */



/* Drop Domains */



/* Drop Procedures */



/* Drop Views */



/* Drop Indexes */



/* Drop Tables */
Drop table "autor" Restrict;
Drop table "publicacao" Restrict;
Drop table "membro" Restrict;



/* Create Domains */



/* Create Tables */


Create table "membro"
(
	"codigo" Char(10) NOT NULL,
	"passwd" Char(20),
	"nome" Varchar NOT NULL,
	"tipo" Varchar NOT NULL,
	"orientador" Char(10),
	"co_orientador" Char(10),
	"departamento" Varchar,
	"email" Varchar,
	"telefone" Varchar,
	"website" Varchar,
	"cidade" Varchar,
	"foto" Bytea,
	"ativo" Char(1),
 primary key ("codigo")
) Without Oids;


Create table "publicacao"
(
	"id" Serial NOT NULL,
	"tipo" Char(50),
	"arquivo" Bytea,
	"title" Varchar,
	"jornal" Varchar,
	"ano" Integer,
	"volume" Char(10),
	"numero" Integer,
	"pages" Integer,
	"conference" Varchar,
	"mes" Integer,
	"school" Varchar,
 primary key ("id")
) Without Oids;


Create table "autor"
(
	"id" Integer NOT NULL,
	"codigo" Char(10) NOT NULL,
 primary key ("id","codigo")
) Without Oids;



/* Create Tab 'Others' for Selected Tables */


/* Create Alternate Keys */



/* Create Indexes */



/* Create Foreign Keys */

Alter table "membro" add  foreign key ("orientador") references "membro" ("codigo") on update restrict on delete restrict;

Alter table "membro" add  foreign key ("co_orientador") references "membro" ("codigo") on update restrict on delete restrict;

Alter table "autor" add  foreign key ("codigo") references "membro" ("codigo") on update restrict on delete restrict;

Alter table "autor" add  foreign key ("id") references "publicacao" ("id") on update restrict on delete restrict;



/* Create Procedures */



/* Create Views */



/* Create Referential Integrity Triggers */





/* Create User-Defined Triggers */



/* Create Roles */



/* Add Roles To Roles */



/* Create Role Permissions */
/* Role permissions on tables */

/* Role permissions on views */

/* Role permissions on procedures */






