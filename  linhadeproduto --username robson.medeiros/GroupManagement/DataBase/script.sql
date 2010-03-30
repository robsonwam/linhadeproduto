/*
Created		13/3/2010
Modified		30/3/2010
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
Drop table "grupo_pesquisa" Restrict;
Drop table "tipo" Restrict;
Drop table "autor" Restrict;
Drop table "publicacao" Restrict;
Drop table "membro" Restrict;



/* Create Domains */



/* Create Tables */


Create table "membro"
(
	"id_membro" Serial NOT NULL,
	"codigo" Char(10) NOT NULL UNIQUE,
	"passwd" Char(20),
	"nome" Varchar NOT NULL,
	"tipo" Integer,
	"tipo_estudante" Varchar,
	"departamento" Varchar,
	"email" Varchar,
	"telefone" Varchar,
	"website" Varchar,
	"cidade" Varchar,
	"foto" Varchar,
	"foto_byte" Bytea,
	"ativo" Varchar,
	"orientador" Varchar,
	"co_orientador" Varchar,
	"id_grupo_pesquisa" Integer,
 primary key ("id_membro")
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
	"autor_externo" Text,
	"id_grupo_pesquisa" Integer,
 primary key ("id")
) Without Oids;


Create table "autor"
(
	"id" Integer NOT NULL,
	"id_membro" Integer NOT NULL,
 primary key ("id","id_membro")
) Without Oids;


Create table "tipo"
(
	"id" Serial NOT NULL,
	"nome" Varchar,
 primary key ("id")
) Without Oids;


Create table "grupo_pesquisa"
(
	"id" Serial NOT NULL,
	"descricao" Varchar,
 primary key ("id")
) Without Oids;



/* Create Tab 'Others' for Selected Tables */


/* Create Alternate Keys */



/* Create Indexes */



/* Create Foreign Keys */

Alter table "autor" add  foreign key ("id_membro") references "membro" ("id_membro") on update restrict on delete restrict;

Alter table "autor" add  foreign key ("id") references "publicacao" ("id") on update restrict on delete restrict;

Alter table "membro" add  foreign key ("tipo") references "tipo" ("id") on update restrict on delete restrict;

Alter table "membro" add  foreign key ("id_grupo_pesquisa") references "grupo_pesquisa" ("id") on update restrict on delete restrict;

Alter table "publicacao" add  foreign key ("id_grupo_pesquisa") references "grupo_pesquisa" ("id") on update restrict on delete restrict;



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






