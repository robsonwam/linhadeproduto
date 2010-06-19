/*
Created		13/03/2010
Modified		01/06/2010
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/























Create table [membro]
(
	[id_membro] Integer Identity NOT NULL,
	[codigo] Char(10) NOT NULL, UNIQUE ([codigo]),
	[passwd] Char(20) NULL,
	[nome] Varchar(50) NOT NULL,
	[tipo] Integer NULL,
	[tipo_estudante] Varchar(50) NULL,
	[departamento] Varchar(50) NULL,
	[email] Varchar(50) NULL,
	[telefone] Varchar(50) NULL,
	[website] Varchar(50) NULL,
	[cidade] Varchar(50) NULL,
	[foto] Varchar(50) NULL,
	[foto_byte] Varbinary(8000) NULL,
	[ativo] Varchar(20) NULL,
	[orientador] Varchar(50) NULL,
	[co_orientador] Varchar(50) NULL,
	#if($linhaPesquisa)
	[id_grupo_pesquisa] Integer NULL,
	#end
Primary Key ([id_membro])
) 
go

#if($publicacoes)
Create table [publicacao]
(
	[id] Integer Identity NOT NULL,
	[tipo] Char(50) NULL,
	[arquivo] Varbinary(8000) NULL,
	[title] Varchar(50) NULL,
	[jornal] Varchar(50) NULL,
	[ano] Integer NULL,
	[volume] Char(10) NULL,
	[numero] Integer NULL,
	[pages] Integer NULL,
	[conference] Varchar(50) NULL,
	[mes] Integer NULL,
	[school] Varchar(50) NULL, 
	[autor_externo] Text NULL,
	#if($linhaPesquisa)
	[id_grupo_pesquisa] Integer NULL,
	#end
Primary Key ([id])
) 
go

#if($publicacoes)
Create table [autor]
(
	[id] Integer NOT NULL,
	[id_membro] Integer NOT NULL,
Primary Key ([id],[id_membro])
) 
go
#end

Create table [tipo]
(
	[id] Integer Identity NOT NULL,
	[nome] Varchar(50) NULL,
Primary Key ([id])
) 
go

#if($linhaPesquisa)
Create table [grupo_pesquisa]
(
	[id] Integer Identity NOT NULL,
	[descricao] Varchar(50) NULL,
Primary Key ([id])
) 
go
#end

#if($visitantesExternos)
Create table [visitante]
(
	[id] Integer Identity NOT NULL,
	[nome] Char(50) NULL,
	[dia] Datetime NULL,
	[hora] Varchar(10) NULL,
Primary Key ([id])
) 
go
#end

#if($visitantesExternos)
Create table [cronograma]
(
	[id] Integer Identity NOT NULL,
	[id_visitante] Integer NOT NULL,
	[dia] Varchar(20) NULL,
	[hora] Varchar(10) NOT NULL,
	[descricao] Text NULL,
Primary Key ([id])
) 
go
#end
























#if($publicacoes)
Alter table [autor] add  foreign key([id_membro]) references [membro] ([id_membro])  on update no action on delete no action 
go
Alter table [autor] add  foreign key([id]) references [publicacao] ([id])  on update no action on delete no action 
go
#end
Alter table [membro] add  foreign key([tipo]) references [tipo] ([id])  on update no action on delete no action 
go
#if($linhaPesquisa)
Alter table [membro] add  foreign key([id_grupo_pesquisa]) references [grupo_pesquisa] ([id])  on update no action on delete no action
go  
#if($publicacoes)
Alter table [publicacao] add  foreign key([id_grupo_pesquisa]) references [grupo_pesquisa] ([id])  on update no action on delete no action
go
#end
#end

#if($visitantesExternos)
Alter table [cronograma] add  foreign key([id_visitante]) references [visitante] ([id])  on update no action on delete no action
go
#end

Set quoted_identifier on
go






















Set quoted_identifier off
go











/* Roles permissions */





/* Users permissions */






