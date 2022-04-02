CREATE DATABASE New_Employee;

USE New_Employee;

CREATE TABLE empresa_cliente (
	id_empresa int primary key auto_increment,
    nome_empresa varchar (40),
    CNPJ varchar (18) unique,
	representante varchar (40)
);


CREATE TABLE endereco_empresa (
	id_endereco int primary key auto_increment,
    endereco varchar (40),
    bairro varchar (30),
    complemento varchar (20),
    estado varchar (40),
    cidade varchar (40),
	email varchar (40),
    senha varchar (25),
    fk_empresa int,
    foreign key (fk_empresa) references empresa_cliente (id_empresa)
);

CREATE TABLE sensor (
	id_sensor int primary key auto_increment,
    nome_sensor varchar (20),
    tipo ENUM ('Temperatura','Luminosidade'),
    localidade varchar (50),
    fk_endereco int,
    foreign key (fk_endereco) references endereco_empresa (id_endereco)
);

CREATE TABLE registro_sensor (
	id_registro int primary key auto_increment,
    data_hora datetime default current_timestamp,
    valor_registro varchar (30),
    fk_sensor int,
    foreign key (fk_sensor) references sensor (id_sensor)
);

CREATE TABLE produtividade (
	id_produtividade int primary key auto_increment,
    mes Varchar (30),
    reslt_absenteismo varchar (30),
    fk_endereco int,
    foreign key (fk_endereco) references endereco_empresa (id_endereco)
);

CREATE TABLE telefone_empresa (
	id_telefone int primary key auto_increment,
    telefone Varchar (30),
	fk_endereco int,
	foreign key (fk_endereco) references endereco_empresa (id_endereco)
);

	insert into empresa_cliente 
			values (null,'Empresa1','11111111111111','Maria'),
				   (null,'Empresa2','22222222222222','Roberto'),
				   (null,'Empresa3','33333333333333','João');

	insert into endereco_empresa 
			values (null,'Rua Augusta 1362','Paulista','Shopping Paulista','SP','SP','empresa1@gmail.com','password1','1'),
				   (null,'Rua Haddock Lobo 523','Paulista','Shopping Paulista','SP','SP','empresa2@gmail.com','password2','2'),
                   (null,'Av Paulista 1942','Paulista','Mequi 1000','SP','SP','empresa3@gmail.com','password3','3');
                   
	insert into sensor 
			values (null,'LM35','Temperatura','Andar 2 Sala B','1'),
				   (null,'LM35','Temperatura','Andar 5 Sala A','2'),
                   (null,'LM35','Temperatura','Andar 1 Sala C','3');
                   
			
	insert into registro_sensor (valor_registro,fk_sensor)
			values ('200','1'),
				   ('100','2'),
                   ('400','3');
                   
				
	insert into produtividade 
			values (null,'Setembro','130','1'),
				   (null,'Janeiro','65','2'),
                   (null,'Agosto','37','3');
            
            
	insert into telefone_empresa
			values (null,'43696251','1'),
				   (null,'43509821','2'),
                   (null,'42814527','3');
    
    
   select * from empresa_cliente;
   select * from endereco_empresa;
   select * from sensor;
   select * from registro_sensor;
   select * from produtividade;
   select * from telefone_empresa;
   
   select * from empresa_cliente join endereco_empresa on fk_empresa = id_empresa;
   select * from produtividade join endereco_empresa on fk_endereco = id_endereco; 
