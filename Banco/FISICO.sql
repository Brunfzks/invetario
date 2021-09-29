Use master;

Drop DataBase if exists Inventario;
Go

Create Database Inventario;
Go

use Inventario

Drop Table if exists Tb_Usuario

CREATE TABLE Tb_Usuario (
Id_usuario Int Identity(1,1) PRIMARY KEY,
Nm_usuario Varchar(80),
Sn_usuario Varchar(15),
Pt_Usuario Varchar(10),
Cp_origem Varchar(20),
Ds_setor Varchar(20)
)

Drop Table if exists Tb_Local

CREATE TABLE Tb_Local (
Id_local Int Identity(1,1) PRIMARY KEY,
Ds_local Varchar(50),
Id_usuario Int,
FOREIGN KEY(Id_usuario) REFERENCES Tb_Usuario (Id_usuario)
)

Drop Table if exists Tb_Patrimonio
 
CREATE TABLE Tb_Patrimonio (
Id_bem Int Identity(1,1) PRIMARY KEY,
Ds_rotulo Varchar(20),
Ds_ed Int,
Ds_campus Varchar(20),
Vl_patrimonio Float,
Nm_patrimonio Int Unique,
Ds_patrimonio Varchar(200),
Nm_nota_fiscal Varchar(20),
Dt_entrada DateTime,
St_conservacao Varchar(20),
Nm_serie Varchar(30),
Nm_Fornecedor Varchar(200),
Dt_carga DateTime,
Ds_Marca Varchar(30),
Empenho Int,
Tp_ingresso Varchar(30),
Id_local Int,
FOREIGN KEY(Id_local) REFERENCES Tb_Local (Id_local)
)

Drop Table if exists Tb_users_levantamentos
Drop Table if exists Tb_levantamentos
Drop Table if exists Tb_cab_levantamentos

CREATE TABLE Tb_cab_levantamentos(
Id_levantamento Int Identity(1,1) PRIMARY KEY,
Dt_levantamento DateTime,
Encerrado bit,
)

CREATE TABLE Tb_users_levantamentos(
Id_levantamento Int,
Id_usuario int,
FOREIGN KEY(Id_levantamento) REFERENCES Tb_cab_levantamentos (Id_levantamento),
FOREIGN KEY(Id_usuario) REFERENCES Tb_Usuario (Id_usuario)
)

CREATE TABLE Tb_levantamentos (
Id_levantamento Int,
Dt_verificado DateTime,
Id_Bem Int,
FOREIGN KEY(Id_Bem) REFERENCES Tb_Patrimonio (Id_Bem),
FOREIGN KEY(Id_levantamento) REFERENCES Tb_cab_levantamentos (Id_levantamento),
)

Drop Table if exists Tb_notificacao

CREATE TABLE Tb_notificacao (
Id_notificacao Int Identity(1,1) PRIMARY KEY,
Dt_notificacao DateTime,
Id_Local int,
Id_bem Int,
Id_usuario Int,
FOREIGN KEY(Id_Local) REFERENCES Tb_Local (Id_Local),
FOREIGN KEY(Id_Bem) REFERENCES Tb_Patrimonio (Id_Bem),
FOREIGN KEY(Id_usuario) REFERENCES Tb_Usuario (Id_usuario)
)

Drop Table if exists Tb_encontrados

CREATE TABLE Tb_encontrados(
Id_item Int Identity(1,1) PRIMARY KEY,
Dt_encontrado DateTime,
Nm_patrimonio int,
Id_usuario int,
FOREIGN KEY(Id_usuario) REFERENCES Tb_Usuario (Id_usuario)
)
