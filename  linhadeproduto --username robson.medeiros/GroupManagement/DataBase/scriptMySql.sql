/*
Created		13/03/2010
Modified		01/06/2010
Project		
Model		
Company		
Author		
Version		
Database		mySQL 5 
*/





Create table `membro` (
	`id_membro` Int NOT NULL AUTO_INCREMENT,
	`codigo` Char(10) NOT NULL,
	`passwd` Char(20),
	`nome` Varchar(20) NOT NULL,
	`tipo` Int,
	`tipo_estudante` Varchar(20),
	`departamento` Varchar(20),
	`email` Varchar(20),
	`telefone` Varchar(20),
	`website` Varchar(20),
	`cidade` Varchar(20),
	`foto` Varchar(20),
	`foto_byte` Varbinary(20),
	`ativo` Varchar(20),
	`orientador` Varchar(20),
	`co_orientador` Varchar(20),
	`id_grupo_pesquisa` Int,
	UNIQUE (`codigo`),
 Primary Key (`id_membro`)) ENGINE = MyISAM;

Create table `publicacao` (
	`id` Int NOT NULL AUTO_INCREMENT,
	`tipo` Char(50),
	`arquivo` Varbinary(20),
	`title` Varchar(20),
	`jornal` Varchar(20),
	`ano` Int,
	`volume` Char(10),
	`numero` Int,
	`pages` Int,
	`conference` Varchar(20),
	`mes` Int,
	`school` Varchar(20),
	`autor_externo` Varbinary(20),
	`id_grupo_pesquisa` Int,
 Primary Key (`id`)) ENGINE = MyISAM;

Create table `autor` (
	`id` Int NOT NULL,
	`id_membro` Int NOT NULL,
 Primary Key (`id`,`id_membro`)) ENGINE = MyISAM;

Create table `tipo` (
	`id` Int NOT NULL AUTO_INCREMENT,
	`nome` Varchar(20),
 Primary Key (`id`)) ENGINE = MyISAM;

Create table `grupo_pesquisa` (
	`id` Int NOT NULL AUTO_INCREMENT,
	`descricao` Varchar(20),
 Primary Key (`id`)) ENGINE = MyISAM;

Create table `visitante` (
	`id` Int NOT NULL AUTO_INCREMENT,
	`nome` Char(50),
	`dia` Date,
	`hora` Varchar(10),
 Primary Key (`id`)) ENGINE = MyISAM;

Create table `cronograma` (
	`id` Int NOT NULL AUTO_INCREMENT,
	`id_visitante` Int NOT NULL,
	`dia` Varchar(20),
	`hora` Varchar(10) NOT NULL,
	`descricao` Varbinary(20),
 Primary Key (`id`)) ENGINE = MyISAM;












Alter table `autor` add Foreign Key (`id_membro`) references `membro` (`id_membro`) on delete  restrict on update  restrict;
Alter table `autor` add Foreign Key (`id`) references `publicacao` (`id`) on delete  restrict on update  restrict;
Alter table `membro` add Foreign Key (`tipo`) references `tipo` (`id`) on delete  restrict on update  restrict;
Alter table `membro` add Foreign Key (`id_grupo_pesquisa`) references `grupo_pesquisa` (`id`) on delete  restrict on update  restrict;
Alter table `publicacao` add Foreign Key (`id_grupo_pesquisa`) references `grupo_pesquisa` (`id`) on delete  restrict on update  restrict;
Alter table `cronograma` add Foreign Key (`id_visitante`) references `visitante` (`id`) on delete  restrict on update  restrict;















/* Users permissions */






