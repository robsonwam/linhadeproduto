/*
Created		13/03/2010
Modified		01/06/2010
Project		
Model			
Company		
Author		
Version		
Database		PostgreSQL 8.1 
*/



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
#if($linhaPesquisa)
	"id_grupo_pesquisa" Integer,
#end
 primary key ("id_membro")
) Without Oids;

#if($publicacoes)
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
#if($linhaPesquisa)
	"id_grupo_pesquisa" Integer,
#end
 primary key ("id")
) Without Oids;
#end

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

#if($linhaPesquisa)
Create table "grupo_pesquisa"
(
	"id" Serial NOT NULL,
	"descricao" Varchar,
 primary key ("id")
) Without Oids;
#end

#if($visitantesExternos)
Create table "visitante"
(
	"id" Serial NOT NULL,
	"nome" Char(50),
	"dia" Date,
	"hora" Varchar(10),
 primary key ("id")
) Without Oids;


Create table "cronograma"
(
	"id" Serial NOT NULL,
	"id_visitante" Integer NOT NULL,
	"dia" Varchar(20),
	"hora" Varchar(10) NOT NULL,
	"descricao" Text,
 primary key ("id")
) Without Oids;
#end


/* Create Tab 'Others' for Selected Tables */


/* Create Alternate Keys */



/* Create Indexes */



/* Create Foreign Keys */

Alter table "autor" add  foreign key ("id_membro") references "membro" ("id_membro") on update restrict on delete restrict;

#if($publicacoes)
Alter table "autor" add  foreign key ("id") references "publicacao" ("id") on update restrict on delete restrict;
#end
Alter table "membro" add  foreign key ("tipo") references "tipo" ("id") on update restrict on delete restrict;

#if($linhaPesquisa)
Alter table "membro" add  foreign key ("id_grupo_pesquisa") references "grupo_pesquisa" ("id") on update restrict on delete restrict;
#if($publicacoes)
Alter table "publicacao" add  foreign key ("id_grupo_pesquisa") references "grupo_pesquisa" ("id") on update restrict on delete restrict;
#end
#end

#if($visitantesExternos)
Alter table "cronograma" add  foreign key ("id_visitante") references "visitante" ("id") on update restrict on delete restrict;
#end


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






