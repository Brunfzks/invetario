
Drop DataBase if exists Inventario;
Go

Create Database Inventario;
Go

use Inventario

Drop Table if exists Tb_Local

CREATE TABLE Tb_Local (
Id_local INT PRIMARY KEY Identity(1,1),
Ds_local Varchar(20)
)

Drop Table if exists Tb_Usuario

CREATE TABLE Tb_Usuario (
Id_usuario INT PRIMARY KEY,
Nm_Usuario Varchar(30),
Cp_origem Varchar(20),
Sn_usuario Varchar(20),
Ds_setor Varchar(20)
)

Drop Table if exists Tb_Patrimonio

CREATE TABLE Tb_Patrimonio (
Id_Bem INT PRIMARY KEY,
Nm_patrimonio INT,
Ds_ed INT,
Ds_patrimonio Varchar(200),
Ds_rotulo Varchar(20),
Ds_campus Varchar(20),
Vl_patrimonio Float,
Nm_nota_fiscal INT,
Dt_entrada DateTime,
Dt_carga DateTime,
Nm_Fornecedor Varchar(200),
St_conservacao Varchar(20),
Nm_serie Varchar(30),
Ds_Marca Varchar(30),
Empenho INT,
Tp_ingresso Varchar(30),
Id_local INT,
Id_usuario INT,
FOREIGN KEY(Id_usuario) REFERENCES Tb_Usuario (Id_usuario),
FOREIGN KEY(Id_local) REFERENCES Tb_Local (Id_local)
)
