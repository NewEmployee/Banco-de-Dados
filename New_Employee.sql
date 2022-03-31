CREATE DATABASE New_Employee;

USE New_Employee;

CREATE TABLE empresas_clientes (
	id_empresa int primary key auto_increment,
    nome_empresa varchar (40),
    CNPJ varchar (18),
	representante varchar (40)
);


CREATE TABLE enderecosEmpresa (
	id_endereco int primary key auto_increment,
    endereco varchar (40),
    bairro varchar (30),
    complemento varchar (20),
    estado varchar (40),
    cidade varchar (40),
	email varchar (40),
    senha varchar (25),
    fk_empresa int
);

CREATE TABLE sensor (
	id_sensor int primary key auto_increment,
    nomeSensor varchar (20),
    tipo ENUM ('Temperatura','Luminosidade'),
    localidade varchar (50),
    fk_endereco int
);

CREATE TABLE registroSensor (
	id_registro int primary key auto_increment,
    fk_sensor int,
    dataHora datetime,
    valor_registro varchar (30)
);

CREATE TABLE produtividade (
	id_produtividade int primary key auto_increment,
    mes Varchar (30),
    resltAbsenteismo varchar (30),
    fk_endereco int
);

CREATE TABLE telefonesEmpresas (
	id_telefone int primary key auto_increment,
    fk_endereco int,
    telefone Varchar (30)
);

