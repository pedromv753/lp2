USE Master
GO

IF DB_ID('Neptuno2023') IS NOT NULL
BEGIN
	ALTER DATABASE Neptuno2023 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE Neptuno2023
END
GO

CREATE DATABASE Neptuno2023
GO

USE Neptuno2023
GO

SET LANGUAGE SPANISH
GO
SET NOCOUNT ON
GO

CREATE TABLE Categorias (
  IdCategoria int NOT NULL,
  NombreCategoria varchar(30)  NOT NULL,
  Descripcion varchar(200) 
)
GO

CREATE TABLE Clientes (
  IdCliente varchar(5)  NOT NULL,
  NombreCliente varchar(50)  NOT NULL,
  NombreContacto varchar(30) ,
  CargoContacto varchar(30) ,
  Direccion varchar(60) ,
  Ciudad varchar(15) ,
  Region varchar(15) ,
  CodPostal varchar(10) ,
  Pais varchar(15) ,
  Telefono varchar(24) ,
  Fax varchar(24) 
)
GO

CREATE TABLE Detalles_Pedidos (
  IdPedido int NOT NULL,
  IdProducto int NOT NULL,
  PrecioUnidad decimal(8,2) NOT NULL,
  Cantidad int NOT NULL,
  Descuento decimal(7,2) NOT NULL
)
GO

CREATE TABLE Empleados (
  IdEmpleado int NOT NULL,
  Apellidos varchar(30)  NOT NULL,
  Nombres varchar(20)  NOT NULL,
  Cargo varchar(30) ,
  Tratamiento varchar(25) ,
  FechaNacimiento datetime,
  FechaContratacion datetime,
  Direccion varchar(60) ,
  Ciudad varchar(15) ,
  Region varchar(15) ,
  CodPostal varchar(10) ,
  Pais varchar(15) ,
  TelDomicilio varchar(24) ,
  Jefe int
)
GO

CREATE TABLE Pedidos (
  IdPedido int NOT NULL,
  IdCliente varchar(5)  NOT NULL,
  IdEmpleado int,
  FechaPedido datetime,
  FechaEntrega datetime,
  FechaEnvio datetime,
  FormaEnvio int,
  Cargo money,
  Destinatario varchar(40) ,
  DireccionDestinatario varchar(60) ,
  CiudadDestinatario varchar(15) ,
  RegionDestinatario varchar(15) ,
  CodPostalDestinatario varchar(10) ,
  PaisDestinatario varchar(15) 
)
GO

CREATE TABLE Productos (
  IdProducto int NOT NULL,
  NombreProducto varchar(40)  NOT NULL,
  IdProveedor int,
  IdCategoria int,
  CantidadPorUnidad varchar(20) ,
  PrecioUnidad money,
  UnidadesEnExistencia smallint,
  UnidadesEnPedido smallint,
  NivelNuevoPedido smallint,
  Suspendido bit NOT NULL
)
GO

CREATE TABLE Proveedores (
  IdProveedor int NOT NULL,
  NombreProveedor varchar(40)  NOT NULL,
  NombreContacto varchar(30) ,
  CargoContacto varchar(30) ,
  Direccion varchar(60) ,
  Ciudad varchar(15) ,
  Region varchar(15) ,
  CodPostal varchar(10) ,
  Pais varchar(15) ,
  Telefono varchar(24) ,
  PaginaPrincipal varchar(max) 
)
GO


--
-- Data for table Categorias  (LIMIT 0,500)
--

INSERT INTO Categorias VALUES 
   (1, 'Bebidas', 'Gaseosas, café, té, cervezas y maltas'),
   (2, 'Condimentos', 'Salsas dulces y picantes, delicias, comida para untar y aderezos'),
   (3, 'Repostería', 'Postres, dulces y pan dulce'),
   (4, 'Lácteos', 'Quesos'),
   (5, 'Granos/Cereales', 'Pan, galletas, pasta y cereales'),
   (6, 'Carnes', 'Carnes preparadas'),
   (7, 'Frutas/Verduras', 'Frutas secas y queso de soja'),
   (8, 'Pescado/Marisco', 'Pescados, mariscos y algas')
GO


--
-- Data for table Clientes  (LIMIT 0,500)
--

INSERT INTO Clientes VALUES 
  ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Representante de ventas', 'Obere Str. 57', 'Berlín', NULL, '12209', 'Alemania', '030-0074321', '030-0076545'),
  ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Propietario', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'México', '(5) 555-4729', '(5) 555-3745'),
('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Propietario', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México', '(5) 555-3932', NULL),
  ('AROUT', 'Around the Horn', 'Thomas Hardy', 'Representante de ventas', '120 Hanover Sq.', 'Londres', NULL, 'WA1 1DP', 'Reino Unido', '(71) 555-7788', '(71) 555-6750'),
  ('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Administrador de pedidos', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia', '0921-12 34 65', '0921-12 34 67'),
  ('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Representante de ventas', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania', '0621-08460', '0621-08924'),
  ('BLONP', 'Blondel père et fils', 'Frédérique Citeaux', 'Gerente de marketing', '24, place Kléber', 'Estrasburgo', NULL, '67000', 'Francia', '88.60.15.31', '88.60.15.32'),
  ('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Propietario', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'España', '(91) 555 22 82', '(91) 555 91 99'),
  ('BONAP', 'Bon app''', 'Laurence Lebihan', 'Propietario', '12, rue des Bouchers', 'Marsella', NULL, '13008', 'Francia', '91.24.45.40', '91.24.45.41'),
  ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Gerente de contabilidad', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá', '(604) 555-4729', '(604) 555-3745'),
  ('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Representante de ventas', 'Fauntleroy Circus', 'Londres', NULL, 'EC2 5NT', 'Reino Unido', '(71) 555-1212', NULL),
  ('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Agente de ventas', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892'),
  ('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Gerente de marketing', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'México', '(5) 555-3392', '(5) 555-7293'),
  ('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Propietario', 'Hauptstr. 29', 'Berna', NULL, '3012', 'Suiza', '0452-076545', NULL),
  ('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Asistente de ventas', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil', '(11) 555-7647', NULL),
  ('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Representante de ventas', 'Berkeley Gardens 12  Brewery', 'Londres', NULL, 'WX1 6LT', 'Reino Unido', '(71) 555-2282', '(71) 555-9199'),
  ('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Administrador de pedidos', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemania', '0241-039123', '0241-059428'),
  ('DUMON', 'Du monde entier', 'Janine Labrune', 'Propietario', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'Francia', '40.67.88.88', '40.67.89.89'),
  ('EASTC', 'Eastern Connection', 'Ann Devon', 'Agente de ventas', '35 King George', 'Londres', NULL, 'WX3 6FW', 'Reino Unido', '(71) 555-0297', '(71) 555-3373'),
  ('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Gerente de ventas', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426'),
  ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Asistente de marketing', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brasil', '(11) 555-9857', NULL),
  ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Gerente de contabilidad', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'España', '(91) 555 94 44', '(91) 555 55 93'),
  ('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Asistente de agente de ventas', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'Francia', '20.16.10.16', '20.16.10.17'),
  ('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Propietario', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia', '0695-34 67 21', NULL),
  ('FRANK', 'Frankenversand', 'Peter Franken', 'Gerente de marketing', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania', '089-0877310', '089-0877451'),
  ('FRANR', 'France restauration', 'Carine Schmitt', 'Gerente de marketing', '54, rue Royale', 'Nantes', NULL, '44000', 'Francia', '40.32.21.21', '40.32.21.20'),
  ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Representante de ventas', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia', '011-4988260', '011-4988261'),
  ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Gerente de ventas', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535'),
  ('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Gerente de marketing', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'España', '(93) 203 4560', '(93) 203 4561'),
  ('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Gerente de ventas', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España', '(95) 555 82 82', NULL),
  ('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Asistente de ventas', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil', '(11) 555-9482', NULL),
  ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Gerente de marketing', '2732 Baker Blvd.', 'Eugenia', 'OR', '97403', 'Estados Unidos', '(503) 555-7555', NULL),
  ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Propietario', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397')
GO

INSERT INTO Clientes
VALUES 
  ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Gerente de contabilidad', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brasil', '(21) 555-0091', '(21) 555-8765'),
  ('HILAA', 'HILARIÓN-Abastos', 'Carlos Hernández', 'Representante de ventas', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948'),
  ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Representante de ventas', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'Estados Unidos', '(503) 555-6874', '(503) 555-2376'),
  ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Asistente de ventas', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda', '2967 542', '2967 3333'),
  ('ISLAT', 'Island Trading', 'Helen Bennett', 'Gerente de marketing', 'Garden House Crowther Way', 'Cowes', 'Isla de Wight', 'PO31 7PJ', 'Reino Unido', '(198) 555-8888', NULL),
  ('KOENE', 'Königlich Essen', 'Philip Cramer', 'Asistente de ventas', 'Maubelstr. 90', 'Brandenburgo', NULL, '14776', 'Alemania', '0555-09876', NULL)
GO

INSERT INTO Clientes
VALUES 
  ('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Representante de ventas', '67, avenue de l''Europe', 'Versalles', NULL, '78000', 'Francia', '30.59.84.10', '30.59.85.11'),
  ('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Gerente de ventas', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia', '61.77.61.10', '61.77.61.11'),
  ('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Asistente de marketing', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá', '(604) 555-3392', '(604) 555-7293'),
  ('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Gerente de marketing', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'Estados Unidos', '(509) 555-7969', '(509) 555-6221'),
  ('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Representante de ventas', 'Magazinweg 7', 'Francfurt', NULL, '60528', 'Alemania', '069-0245984', '069-0245874'),
  ('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Propietario', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'Estados Unidos', '(415) 555-5938', NULL),
  ('LILAS', 'LILA-Supermercado', 'Carlos González', 'Gerente de contabilidad', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256'),
  ('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Propietario', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93'),
  ('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Gerente de ventas', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos', '(503) 555-9573', '(503) 555-9646'),
  ('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Gerente de marketing', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia', '035-640230', '035-640231'),
  ('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Agente de ventas', 'Rue Joseph-Bens 532', 'Bruselas', NULL, 'B-1180', 'Bélgica', '(02) 201 24 67', '(02) 201 24 68'),
  ('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Asistente de marketing', '43 rue St. Laurent', 'Montreal', 'Québec', 'H1J 1C3', 'Canadá', '(514) 555-8054', '(514) 555-8055'),
  ('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Asistente de marketing', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania', '0342-023176', NULL),
  ('NORTS', 'North/South', 'Simon Crowther', 'Asistente de ventas', 'South House 300 Queensbridge', 'Londres', NULL, 'SW7 1RZ', 'Reino Unido', '(71) 555-7733', '(71) 555-2530'),
  ('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Agente de ventas', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535'),
  ('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Representante de ventas', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos', '(907) 555-7584', '(907) 555-2880'),
  ('OTTIK', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Propietario', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania', '0221-0644327', '0221-0765721'),
  ('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Propietario', '265, boulevard Charonne', 'París', NULL, '75012', 'Francia', '(1) 42.34.22.66', '(1) 42.34.22.77'),
  ('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Representante de ventas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México', '(5) 552-3745', '(5) 545-3745'),
  ('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Gerente de ventas', 'Geislweg 14', 'Salzburgo', NULL, '5020', 'Austria', '6562-9722', '6562-9723'),
  ('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Representante de ventas', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL),
  ('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Gerente de contabilidad', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brasil', '(21) 555-4252', '(21) 555-4545'),
  ('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Asistente de marketing', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brasil', '(11) 555-1189', NULL),
  ('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Gerente de contabilidad', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania', '0372-035188', NULL),
  ('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Representante de ventas', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556'),
  ('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Representante agente ventas', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos', '(505) 555-5939', '(505) 555-3620'),
  ('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Asistente de ventas', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia', '0522-556721', '0522-556722'),
  ('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Asistente de agente de ventas', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brasil', '(21) 555-3412', NULL),
  ('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Gerente de ventas', 'Grenzacherweg 237', 'Génova', NULL, '1203', 'Suiza', '0897-034214', NULL),
  ('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Gerente de contabilidad', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'España', '(91) 745 6200', '(91) 745 6210')
GO

INSERT INTO Clientes
VALUES 
  ('SANTG', 'Santé Gourmet', 'Jonas Bergulfsen', 'Propietario', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega', '07-98 92 35', '07-98 92 47'),
  ('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Representante de ventas', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos', '(208) 555-8097', NULL),
  ('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Gerente de ventas', '90 Wadhurst Rd.', 'Londres', NULL, 'OX15 4NB', 'Reino Unido', '(71) 555-1717', '(71) 555-5646'),
  ('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Propietario', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca', '31 12 34 56', '31 13 35 57'),
  ('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Gerente de marketing', '25, rue Lauriston', 'París', NULL, '75016', 'Francia', '(1) 47.55.60.10', '(1) 47.55.60.20'),
  ('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Gerente de ventas', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos', '(307) 555-4680', '(307) 555-6525'),
  ('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Gerente de contabilidad', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica', '(071) 23 67 22 20', '(071) 23 67 22 21'),
  ('THEBI', 'The Big Cheese', 'Liz Nixon', 'Gerente de marketing', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'Estados Unidos', '(503) 555-3612', NULL),
  ('THECR', 'The Cracker Box', 'Liu Wong', 'Asistente de marketing', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'Estados Unidos', '(406) 555-5834', '(406) 555-8083'),
  ('TOMSP', 'Toms Spezialitäten', 'Karin Josephs', 'Gerente de marketing', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania', '0251-031259', '0251-035695'),
  ('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Propietario', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México', '(5) 555-2933', NULL),
  ('TRADH', 'Tradição Hipermercados', 'Anabela Domingues', 'Representante de ventas', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brasil', '(11) 555-2167', '(11) 555-2168'),
  ('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Asistente de ventas', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'Estados Unidos', '(206) 555-8257', '(206) 555-2174'),
  ('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Gerente de ventas', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca', '86 21 32 43', '86 22 33 44'),
  ('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Agente de ventas', '2, rue du Commerce', 'Lion', NULL, '69004', 'Francia', '78.32.54.86', '78.32.54.87'),
  ('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Gerente de contabilidad', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'Francia', '26.47.15.10', '26.47.15.11'),
  ('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Representante de ventas', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania', '0711-020361', '0711-035428'),
  ('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Gerente de contabilidad', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia', '981-443655', '981-443655'),
  ('WELLI', 'Wellington Importadora', 'Paula Parente', 'Gerente de ventas', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil', '(14) 555-8122', NULL),
  ('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Propietario', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'Estados Unidos', '(206) 555-4112', '(206) 555-4115'),
  ('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Prop./Asistente marketing', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia', '90-224 8858', '90-224 8858'),
  ('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Propietario', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polonia', '(26) 642-7012', '(26) 642-7012')
GO


--
-- Data for table Detalles_Pedidos  (LIMIT 0,500)
--

INSERT INTO Detalles_Pedidos VALUES (10248, 11, 14, 12, 0)
INSERT INTO Detalles_Pedidos VALUES (10248, 42, 9.8, 10, 0)
INSERT INTO Detalles_Pedidos VALUES (10248, 72, 34.8, 5, 0)
INSERT INTO Detalles_Pedidos VALUES (10249, 14, 18.6, 9, 0)
INSERT INTO Detalles_Pedidos VALUES (10249, 51, 42.4, 40, 0)
INSERT INTO Detalles_Pedidos VALUES (10250, 41, 7.7, 10, 0)
INSERT INTO Detalles_Pedidos VALUES (10250, 51, 42.4, 35, 0.15)
INSERT INTO Detalles_Pedidos VALUES (10250, 65, 16.8, 15, 0.15)
INSERT INTO Detalles_Pedidos VALUES (10251, 22, 16.8, 6, 0.05)
INSERT INTO Detalles_Pedidos VALUES (10251, 57, 15.6, 15, 0.05)
INSERT INTO Detalles_Pedidos VALUES (10251, 65, 16.8, 20, 0)
INSERT INTO Detalles_Pedidos VALUES (10252, 20, 64.8, 40, 0.05)
INSERT INTO Detalles_Pedidos VALUES (10252, 33, 2, 25, 0.05)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10252, 60, 27.2, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10253, 31, 10, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10253, 39, 14.4, 42, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10253, 49, 16, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10254, 24, 3.6, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10254, 55, 19.2, 21, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10254, 74, 8, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10255, 2, 15.2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10255, 16, 13.9, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10255, 36, 15.2, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10255, 59, 44, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10256, 53, 26.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10256, 77, 10.4, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10257, 27, 35.1, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10257, 39, 14.4, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10257, 77, 10.4, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10258, 2, 15.2, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10258, 5, 17, 65, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10258, 32, 25.6, 6, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10259, 21, 8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10259, 37, 20.8, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10260, 41, 7.7, 16, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10260, 57, 15.6, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10260, 62, 39.4, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10260, 70, 12, 21, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10261, 21, 8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10261, 35, 14.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10262, 5, 17, 12, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10262, 7, 24, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10262, 56, 30.4, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10263, 16, 13.9, 60, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10263, 24, 3.6, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10263, 30, 20.7, 60, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10263, 74, 8, 36, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10264, 2, 15.2, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10264, 41, 7.7, 25, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10265, 17, 31.2, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10265, 70, 12, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10266, 12, 30.4, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10267, 40, 14.7, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10267, 59, 44, 70, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10267, 76, 14.4, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10268, 29, 99, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10268, 72, 27.8, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10269, 33, 2, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10269, 72, 27.8, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10270, 36, 15.2, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10270, 43, 36.8, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10271, 33, 2, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10272, 20, 64.8, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10272, 31, 10, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10272, 72, 27.8, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10273, 10, 24.8, 24, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10273, 31, 10, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10273, 33, 2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10273, 40, 14.7, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10273, 76, 14.4, 33, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10274, 71, 17.2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10274, 72, 27.8, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10275, 24, 3.6, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10275, 59, 44, 6, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10276, 10, 24.8, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10276, 13, 4.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10277, 28, 36.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10277, 62, 39.4, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10278, 44, 15.5, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10278, 59, 44, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10278, 63, 35.1, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10278, 73, 12, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10279, 17, 31.2, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10280, 24, 3.6, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10280, 55, 19.2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10280, 75, 6.2, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10281, 19, 7.3, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10281, 24, 3.6, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10281, 35, 14.4, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10282, 30, 20.7, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10282, 57, 15.6, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10283, 15, 12.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10283, 19, 7.3, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10283, 60, 27.2, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10283, 72, 27.8, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10284, 27, 35.1, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10284, 44, 15.5, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10284, 60, 27.2, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10284, 67, 11.2, 5, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10285, 1, 14.4, 45, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10285, 40, 14.7, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10285, 53, 26.2, 36, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10286, 35, 14.4, 100, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10286, 62, 39.4, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10287, 16, 13.9, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10287, 34, 11.2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10287, 46, 9.6, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10288, 54, 5.9, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10288, 68, 10, 3, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10289, 3, 8, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10289, 64, 26.6, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10290, 5, 17, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10290, 29, 99, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10290, 49, 16, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10290, 77, 10.4, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10291, 13, 4.8, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10291, 44, 15.5, 24, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10291, 51, 42.4, 2, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10292, 20, 64.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10293, 18, 50, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10293, 24, 3.6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10293, 63, 35.1, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10293, 75, 6.2, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10294, 1, 14.4, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10294, 17, 31.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10294, 43, 36.8, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10294, 60, 27.2, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10294, 75, 6.2, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10295, 56, 30.4, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10296, 11, 16.8, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10296, 16, 13.9, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10296, 69, 28.8, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10297, 39, 14.4, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10297, 72, 27.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10298, 2, 15.2, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10298, 36, 15.2, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10298, 59, 44, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10298, 62, 39.4, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10299, 19, 7.3, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10299, 70, 12, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10300, 66, 13.6, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10300, 68, 10, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10301, 40, 14.7, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10301, 56, 30.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10302, 17, 31.2, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10302, 28, 36.4, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10302, 43, 36.8, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10303, 40, 14.7, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10303, 65, 16.8, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10303, 68, 10, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10304, 49, 16, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10304, 59, 44, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10304, 71, 17.2, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10305, 18, 50, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10305, 29, 99, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10305, 39, 14.4, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10306, 30, 20.7, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10306, 53, 26.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10306, 54, 5.9, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10307, 62, 39.4, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10307, 68, 10, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10308, 69, 28.8, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10308, 70, 12, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10309, 4, 17.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10309, 6, 20, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10309, 42, 11.2, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10309, 43, 36.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10309, 71, 17.2, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10310, 16, 13.9, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10310, 62, 39.4, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10311, 42, 11.2, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10311, 69, 28.8, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10312, 28, 36.4, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10312, 43, 36.8, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10312, 53, 26.2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10312, 75, 6.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10313, 36, 15.2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10314, 32, 25.6, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10314, 58, 10.6, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10314, 62, 39.4, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10315, 34, 11.2, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10315, 70, 12, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10316, 41, 7.7, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10316, 62, 39.4, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10317, 1, 14.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10318, 41, 7.7, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10318, 76, 14.4, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10319, 17, 31.2, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10319, 28, 36.4, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10319, 76, 14.4, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10320, 71, 17.2, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10321, 35, 14.4, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10322, 52, 5.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10323, 15, 12.4, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10323, 25, 11.2, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10323, 39, 14.4, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10324, 16, 13.9, 21, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10324, 35, 14.4, 70, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10324, 46, 9.6, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10324, 59, 44, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10324, 63, 35.1, 80, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10325, 6, 20, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10325, 13, 4.8, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10325, 14, 18.6, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10325, 31, 10, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10325, 72, 27.8, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10326, 4, 17.6, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10326, 57, 15.6, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10326, 75, 6.2, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10327, 2, 15.2, 25, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10327, 11, 16.8, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10327, 30, 20.7, 35, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10327, 58, 10.6, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10328, 59, 44, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10328, 65, 16.8, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10328, 68, 10, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10329, 19, 7.3, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10329, 30, 20.7, 8, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10329, 38, 210.8, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10329, 56, 30.4, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10330, 26, 24.9, 50, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10330, 72, 27.8, 25, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10331, 54, 5.9, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10332, 18, 50, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10332, 42, 11.2, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10332, 47, 7.6, 16, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10333, 14, 18.6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10333, 21, 8, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10333, 71, 17.2, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10334, 52, 5.6, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10334, 68, 10, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10335, 2, 15.2, 7, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10335, 31, 10, 25, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10335, 32, 25.6, 6, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10335, 51, 42.4, 48, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10336, 4, 17.6, 18, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10337, 23, 7.2, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10337, 26, 24.9, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10337, 36, 15.2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10337, 37, 20.8, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10337, 72, 27.8, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10338, 17, 31.2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10338, 30, 20.7, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10339, 4, 17.6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10339, 17, 31.2, 70, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10339, 62, 39.4, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10340, 18, 50, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10340, 41, 7.7, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10340, 43, 36.8, 40, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10341, 33, 2, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10341, 59, 44, 9, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10342, 2, 15.2, 24, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10342, 31, 10, 56, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10342, 36, 15.2, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10342, 55, 19.2, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10343, 64, 26.6, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10343, 68, 10, 4, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10343, 76, 14.4, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10344, 4, 17.6, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10344, 8, 32, 70, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10345, 8, 32, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10345, 19, 7.3, 80, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10345, 42, 11.2, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10346, 17, 31.2, 36, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10346, 56, 30.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10347, 25, 11.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10347, 39, 14.4, 50, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10347, 40, 14.7, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10347, 75, 6.2, 6, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10348, 1, 14.4, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10348, 23, 7.2, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10349, 54, 5.9, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10350, 50, 13, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10350, 69, 28.8, 18, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10351, 38, 210.8, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10351, 41, 7.7, 13, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10351, 44, 15.5, 77, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10351, 65, 16.8, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10352, 24, 3.6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10352, 54, 5.9, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10353, 11, 16.8, 12, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10353, 38, 210.8, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10354, 1, 14.4, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10354, 29, 99, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10355, 24, 3.6, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10355, 57, 15.6, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10356, 31, 10, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10356, 55, 19.2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10356, 69, 28.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10357, 10, 24.8, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10357, 26, 24.9, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10357, 60, 27.2, 8, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10358, 24, 3.6, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10358, 34, 11.2, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10358, 36, 15.2, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10359, 16, 13.9, 56, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10359, 31, 10, 70, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10359, 60, 27.2, 80, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10360, 28, 36.4, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10360, 29, 99, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10360, 38, 210.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10360, 49, 16, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10360, 54, 5.9, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10361, 39, 14.4, 54, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10361, 60, 27.2, 55, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10362, 25, 11.2, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10362, 51, 42.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10362, 54, 5.9, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10363, 31, 10, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10363, 75, 6.2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10363, 76, 14.4, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10364, 69, 28.8, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10364, 71, 17.2, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10365, 11, 16.8, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10366, 65, 16.8, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10366, 77, 10.4, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10367, 34, 11.2, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10367, 54, 5.9, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10367, 65, 16.8, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10367, 77, 10.4, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10368, 21, 8, 5, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10368, 28, 36.4, 13, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10368, 57, 15.6, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10368, 64, 26.6, 35, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10369, 29, 99, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10369, 56, 30.4, 18, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10370, 1, 14.4, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10370, 64, 26.6, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10370, 74, 8, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10371, 36, 15.2, 6, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10372, 20, 64.8, 12, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10372, 38, 210.8, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10372, 60, 27.2, 70, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10372, 72, 27.8, 42, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10373, 58, 10.6, 80, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10373, 71, 17.2, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10374, 31, 10, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10374, 58, 10.6, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10375, 14, 18.6, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10375, 54, 5.9, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10376, 31, 10, 42, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10377, 28, 36.4, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10377, 39, 14.4, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10378, 71, 17.2, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10379, 41, 7.7, 8, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10379, 63, 35.1, 16, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10379, 65, 16.8, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10380, 30, 20.7, 18, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10380, 53, 26.2, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10380, 60, 27.2, 6, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10380, 70, 12, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10381, 74, 8, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10382, 5, 17, 32, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10382, 18, 50, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10382, 29, 99, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10382, 33, 2, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10382, 74, 8, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10383, 13, 4.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10383, 50, 13, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10383, 56, 30.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10384, 20, 64.8, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10384, 60, 27.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10385, 7, 24, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10385, 60, 27.2, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10385, 68, 10, 8, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10386, 24, 3.6, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10386, 34, 11.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10387, 24, 3.6, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10387, 28, 36.4, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10387, 59, 44, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10387, 71, 17.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10388, 45, 7.6, 15, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10388, 52, 5.6, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10388, 53, 26.2, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10389, 10, 24.8, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10389, 55, 19.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10389, 62, 39.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10389, 70, 12, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10390, 31, 10, 60, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10390, 35, 14.4, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10390, 46, 9.6, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10390, 72, 27.8, 24, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10391, 13, 4.8, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10392, 69, 28.8, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10393, 2, 15.2, 25, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10393, 14, 18.6, 42, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10393, 25, 11.2, 7, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10393, 26, 24.9, 70, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10393, 31, 10, 32, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10394, 13, 4.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10394, 62, 39.4, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10395, 46, 9.6, 28, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10395, 53, 26.2, 70, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10395, 69, 28.8, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10396, 23, 7.2, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10396, 71, 17.2, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10396, 72, 27.8, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10397, 21, 8, 10, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10397, 51, 42.4, 18, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10398, 35, 14.4, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10398, 55, 19.2, 120, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10399, 68, 10, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10399, 71, 17.2, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10399, 76, 14.4, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10399, 77, 10.4, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10400, 29, 99, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10400, 35, 14.4, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10400, 49, 16, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10401, 30, 20.7, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10401, 56, 30.4, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10401, 65, 16.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10401, 71, 17.2, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10402, 23, 7.2, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10402, 63, 35.1, 65, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10403, 16, 13.9, 21, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10403, 48, 10.2, 70, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10404, 26, 24.9, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10404, 42, 11.2, 40, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10404, 49, 16, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10405, 3, 8, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10406, 1, 14.4, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10406, 21, 8, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10406, 28, 36.4, 42, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10406, 36, 15.2, 5, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10406, 40, 14.7, 2, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10407, 11, 16.8, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10407, 69, 28.8, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10407, 71, 17.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10408, 37, 20.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10408, 54, 5.9, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10408, 62, 39.4, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10409, 14, 18.6, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10409, 21, 8, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10410, 33, 2, 49, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10410, 59, 44, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10411, 41, 7.7, 25, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10411, 44, 15.5, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10411, 59, 44, 9, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10412, 14, 18.6, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10413, 1, 14.4, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10413, 62, 39.4, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10413, 76, 14.4, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10414, 19, 7.3, 18, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10414, 33, 2, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10415, 17, 31.2, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10415, 33, 2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10416, 19, 7.3, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10416, 53, 26.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10416, 57, 15.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10417, 38, 210.8, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10417, 46, 9.6, 2, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10417, 68, 10, 36, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10417, 77, 10.4, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10418, 2, 15.2, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10418, 47, 7.6, 55, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10418, 61, 22.8, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10418, 74, 8, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10419, 60, 27.2, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10419, 69, 28.8, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10420, 9, 77.6, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10420, 13, 4.8, 2, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10420, 70, 12, 8, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10420, 73, 12, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10421, 19, 7.3, 4, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10421, 26, 24.9, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10421, 53, 26.2, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10421, 77, 10.4, 10, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10422, 26, 24.9, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10423, 31, 10, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10423, 59, 44, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10424, 35, 14.4, 60, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10424, 38, 210.8, 49, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10424, 68, 10, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10425, 55, 19.2, 10, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10425, 76, 14.4, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10426, 56, 30.4, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10426, 64, 26.6, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10427, 14, 18.6, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10428, 46, 9.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10429, 50, 13, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10429, 63, 35.1, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10430, 17, 31.2, 45, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10430, 21, 8, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10430, 56, 30.4, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10430, 59, 44, 70, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10431, 17, 31.2, 50, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10431, 40, 14.7, 50, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10431, 47, 7.6, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10432, 26, 24.9, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10432, 54, 5.9, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10433, 56, 30.4, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10434, 11, 16.8, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10434, 76, 14.4, 18, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10435, 2, 15.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10435, 22, 16.8, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10435, 72, 27.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10436, 46, 9.6, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10436, 56, 30.4, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10436, 64, 26.6, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10436, 75, 6.2, 24, 0.100000001490116)
GO

--
-- Data for table Detalles_Pedidos  (LIMIT 500,500)
--

INSERT INTO Detalles_Pedidos 
VALUES 
  (10437, 53, 26.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10438, 19, 7.3, 15, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10438, 34, 11.2, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10438, 57, 15.6, 15, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10439, 12, 30.4, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10439, 16, 13.9, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10439, 64, 26.6, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10439, 74, 8, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10440, 2, 15.2, 45, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10440, 16, 13.9, 49, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10440, 29, 99, 24, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10440, 61, 22.8, 90, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10441, 27, 35.1, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10442, 11, 16.8, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10442, 54, 5.9, 80, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10442, 66, 13.6, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10443, 11, 16.8, 6, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10443, 28, 36.4, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10444, 17, 31.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10444, 26, 24.9, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10444, 35, 14.4, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10444, 41, 7.7, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10445, 39, 14.4, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10445, 54, 5.9, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10446, 19, 7.3, 12, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10446, 24, 3.6, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10446, 31, 10, 3, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10446, 52, 5.6, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10447, 19, 7.3, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10447, 65, 16.8, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10447, 71, 17.2, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10448, 26, 24.9, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10448, 40, 14.7, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10449, 10, 24.8, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10449, 52, 5.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10449, 62, 39.4, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10450, 10, 24.8, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10450, 54, 5.9, 6, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10451, 55, 19.2, 120, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10451, 64, 26.6, 35, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10451, 65, 16.8, 28, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10451, 77, 10.4, 55, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10452, 28, 36.4, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10452, 44, 15.5, 100, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10453, 48, 10.2, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10453, 70, 12, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10454, 16, 13.9, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10454, 33, 2, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10454, 46, 9.6, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10455, 39, 14.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10455, 53, 26.2, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10455, 61, 22.8, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10455, 71, 17.2, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10456, 21, 8, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10456, 49, 16, 21, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10457, 59, 44, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10458, 26, 24.9, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10458, 28, 36.4, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10458, 43, 36.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10458, 56, 30.4, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10458, 71, 17.2, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10459, 7, 24, 16, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10459, 46, 9.6, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10459, 72, 27.8, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10460, 68, 10, 21, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10460, 75, 6.2, 4, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10461, 21, 8, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10461, 30, 20.7, 28, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10461, 55, 19.2, 60, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10462, 13, 4.8, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10462, 23, 7.2, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10463, 19, 7.3, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10463, 42, 11.2, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10464, 4, 17.6, 16, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10464, 43, 36.8, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10464, 56, 30.4, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10464, 60, 27.2, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10465, 24, 3.6, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10465, 29, 99, 18, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10465, 40, 14.7, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10465, 45, 7.6, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10465, 50, 13, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10466, 11, 16.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10466, 46, 9.6, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10467, 24, 3.6, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10467, 25, 11.2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10468, 30, 20.7, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10468, 43, 36.8, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10469, 2, 15.2, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10469, 16, 13.9, 35, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10469, 44, 15.5, 2, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10470, 18, 50, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10470, 23, 7.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10470, 64, 26.6, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10471, 7, 24, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10471, 56, 30.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10472, 24, 3.6, 80, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10472, 51, 42.4, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10473, 33, 2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10473, 71, 17.2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10474, 14, 18.6, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10474, 28, 36.4, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10474, 40, 14.7, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10474, 75, 6.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10475, 31, 10, 35, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10475, 66, 13.6, 60, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10475, 76, 14.4, 42, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10476, 55, 19.2, 2, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10476, 70, 12, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10477, 1, 14.4, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10477, 21, 8, 21, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10477, 39, 14.4, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10478, 10, 24.8, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10479, 38, 210.8, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10479, 53, 26.2, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10479, 59, 44, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10479, 64, 26.6, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10480, 47, 7.6, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10480, 59, 44, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10481, 49, 16, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10481, 60, 27.2, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10482, 40, 14.7, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10483, 34, 11.2, 35, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10483, 77, 10.4, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10484, 21, 8, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10484, 40, 14.7, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10484, 51, 42.4, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10485, 2, 15.2, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10485, 3, 8, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10485, 55, 19.2, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10485, 70, 12, 60, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10486, 11, 16.8, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10486, 51, 42.4, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10486, 74, 8, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10487, 19, 7.3, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10487, 26, 24.9, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10487, 54, 5.9, 24, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10488, 59, 44, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10488, 73, 12, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10489, 11, 16.8, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10489, 16, 13.9, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10490, 59, 44, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10490, 68, 10, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10490, 75, 6.2, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10491, 44, 15.5, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10491, 77, 10.4, 7, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10492, 25, 11.2, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10492, 42, 11.2, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10493, 65, 16.8, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10493, 66, 13.6, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10493, 69, 28.8, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10494, 56, 30.4, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10495, 23, 7.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10495, 41, 7.7, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10495, 77, 10.4, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10496, 31, 10, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10497, 56, 30.4, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10497, 72, 27.8, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10497, 77, 10.4, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10498, 24, 4.5, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10498, 40, 18.4, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10498, 42, 14, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10499, 28, 45.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10499, 49, 20, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10500, 15, 15.5, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10500, 28, 45.6, 8, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10501, 54, 7.45, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10502, 45, 9.5, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10502, 53, 32.8, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10502, 67, 14, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10503, 14, 23.25, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10503, 65, 21.05, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10504, 2, 19, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10504, 21, 10, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10504, 53, 32.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10504, 61, 28.5, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10505, 62, 49.3, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10506, 25, 14, 18, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10506, 70, 15, 14, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10507, 43, 46, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10507, 48, 12.75, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10508, 13, 6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10508, 39, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10509, 28, 45.6, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10510, 29, 123.79, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10510, 75, 7.75, 36, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10511, 4, 22, 50, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10511, 7, 30, 50, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10511, 8, 40, 10, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10512, 24, 4.5, 10, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10512, 46, 12, 9, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10512, 47, 9.5, 6, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10512, 60, 34, 12, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10513, 21, 10, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10513, 32, 32, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10513, 61, 28.5, 15, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10514, 20, 81, 39, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10514, 28, 45.6, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10514, 56, 38, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10514, 65, 21.05, 39, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10514, 75, 7.75, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10515, 9, 97, 16, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10515, 16, 17.45, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10515, 27, 43.9, 120, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10515, 33, 2.5, 16, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10515, 60, 34, 84, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10516, 18, 62.5, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10516, 41, 9.65, 80, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10516, 42, 14, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10517, 52, 7, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10517, 59, 55, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10517, 70, 15, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10518, 24, 4.5, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10518, 38, 263.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10518, 44, 19.45, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10519, 10, 31, 16, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10519, 56, 38, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10519, 60, 34, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10520, 24, 4.5, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10520, 53, 32.8, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10521, 35, 18, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10521, 41, 9.65, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10521, 68, 12.5, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10522, 1, 18, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10522, 8, 40, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10522, 30, 25.89, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10522, 40, 18.4, 25, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10523, 17, 39, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10523, 20, 81, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10523, 37, 26, 18, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10523, 41, 9.65, 6, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10524, 10, 31, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10524, 30, 25.89, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10524, 43, 46, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10524, 54, 7.45, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10525, 36, 19, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10525, 40, 18.4, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10526, 1, 18, 8, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10526, 13, 6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10526, 56, 38, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10527, 4, 22, 50, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10527, 36, 19, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10528, 11, 21, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10528, 33, 2.5, 8, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10528, 72, 34.8, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10529, 55, 24, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10529, 68, 12.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10529, 69, 36, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10530, 17, 39, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10530, 43, 46, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10530, 61, 28.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10530, 76, 18, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10531, 59, 55, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10532, 30, 25.89, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10532, 66, 17, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10533, 4, 22, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10533, 72, 34.8, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10533, 73, 15, 24, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10534, 30, 25.89, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10534, 40, 18.4, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10534, 54, 7.45, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10535, 11, 21, 50, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10535, 40, 18.4, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10535, 57, 19.5, 5, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10535, 59, 55, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10536, 12, 38, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10536, 31, 12.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10536, 33, 2.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10536, 60, 34, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10537, 31, 12.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10537, 51, 53, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10537, 58, 13.25, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10537, 72, 34.8, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10537, 73, 15, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10538, 70, 15, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10538, 72, 34.8, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10539, 13, 6, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10539, 21, 10, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10539, 33, 2.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10539, 49, 20, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10540, 3, 10, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10540, 26, 31.23, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10540, 38, 263.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10540, 68, 12.5, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10541, 24, 4.5, 35, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10541, 38, 263.5, 4, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10541, 65, 21.05, 36, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10541, 71, 21.5, 9, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10542, 11, 21, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10542, 54, 7.45, 24, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10543, 12, 38, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10543, 23, 9, 70, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10544, 28, 45.6, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10544, 67, 14, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10545, 11, 21, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10546, 7, 30, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10546, 35, 18, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10546, 62, 49.3, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10547, 32, 32, 24, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10547, 36, 19, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10548, 34, 14, 10, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10548, 41, 9.65, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10549, 31, 12.5, 55, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10549, 45, 9.5, 100, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10549, 51, 53, 48, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10550, 17, 39, 8, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10550, 19, 9.2, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10550, 21, 10, 6, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10550, 61, 28.5, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10551, 16, 17.45, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10551, 35, 18, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10551, 44, 19.45, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10552, 69, 36, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10552, 75, 7.75, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10553, 11, 21, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10553, 16, 17.45, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10553, 22, 21, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10553, 31, 12.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10553, 35, 18, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10554, 16, 17.45, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10554, 23, 9, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10554, 62, 49.3, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10554, 77, 13, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10555, 14, 23.25, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10555, 19, 9.2, 35, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10555, 24, 4.5, 18, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10555, 51, 53, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10555, 56, 38, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10556, 72, 34.8, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10557, 64, 33.25, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10557, 75, 7.75, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10558, 47, 9.5, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10558, 51, 53, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10558, 52, 7, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10558, 53, 32.8, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10558, 73, 15, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10559, 41, 9.65, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10559, 55, 24, 18, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10560, 30, 25.89, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10560, 62, 49.3, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10561, 44, 19.45, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10561, 51, 53, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10562, 33, 2.5, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10562, 62, 49.3, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10563, 36, 19, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10563, 52, 7, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10564, 17, 39, 16, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10564, 31, 12.5, 6, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10564, 55, 24, 25, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10565, 24, 4.5, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10565, 64, 33.25, 18, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10566, 11, 21, 35, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10566, 18, 62.5, 18, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10566, 76, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10567, 31, 12.5, 60, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10567, 51, 53, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10567, 59, 55, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10568, 10, 31, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10569, 31, 12.5, 35, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10569, 76, 18, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10570, 11, 21, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10570, 56, 38, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10571, 14, 23.25, 11, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10571, 42, 14, 28, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10572, 16, 17.45, 12, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10572, 32, 32, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10572, 40, 18.4, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10572, 75, 7.75, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10573, 17, 39, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10573, 34, 14, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10573, 53, 32.8, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10574, 33, 2.5, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10574, 40, 18.4, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10574, 62, 49.3, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10574, 64, 33.25, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10575, 59, 55, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10575, 63, 43.9, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10575, 72, 34.8, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10575, 76, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10576, 1, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10576, 31, 12.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10576, 44, 19.45, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10577, 39, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10577, 75, 7.75, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10577, 77, 13, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10578, 35, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10578, 57, 19.5, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10579, 15, 15.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10579, 75, 7.75, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10580, 14, 23.25, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10580, 41, 9.65, 9, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10580, 65, 21.05, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10581, 75, 7.75, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10582, 57, 19.5, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10582, 76, 18, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10583, 29, 123.79, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10583, 60, 34, 24, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10583, 69, 36, 10, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10584, 31, 12.5, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10585, 47, 9.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10586, 52, 7, 4, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10587, 26, 31.23, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10587, 35, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10587, 77, 13, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10588, 18, 62.5, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10588, 42, 14, 100, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10589, 35, 18, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10590, 1, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10590, 77, 13, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10591, 3, 10, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10591, 7, 30, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10591, 54, 7.45, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10592, 15, 15.5, 25, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10592, 26, 31.23, 5, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10593, 20, 81, 21, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10593, 69, 36, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10593, 76, 18, 4, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10594, 52, 7, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10594, 58, 13.25, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10595, 35, 18, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10595, 61, 28.5, 120, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10595, 69, 36, 65, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10596, 56, 38, 5, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10596, 63, 43.9, 24, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10596, 75, 7.75, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10597, 24, 4.5, 35, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10597, 57, 19.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10597, 65, 21.05, 12, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10598, 27, 43.9, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10598, 71, 21.5, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10599, 62, 49.3, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10600, 54, 7.45, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10600, 73, 15, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10601, 13, 6, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10601, 59, 55, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10602, 77, 13, 5, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10603, 22, 21, 48, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10603, 49, 20, 25, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10604, 48, 12.75, 6, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10604, 76, 18, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10605, 16, 17.45, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10605, 59, 55, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10605, 60, 34, 70, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10605, 71, 21.5, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10606, 4, 22, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10606, 55, 24, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10606, 62, 49.3, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10607, 7, 30, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10607, 17, 39, 100, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10607, 33, 2.5, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10607, 40, 18.4, 42, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10607, 72, 34.8, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10608, 56, 38, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10609, 1, 18, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10609, 10, 31, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10609, 21, 10, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10610, 36, 19, 21, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10611, 1, 18, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10611, 2, 19, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10611, 60, 34, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10612, 10, 31, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10612, 36, 19, 55, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10612, 49, 20, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10612, 60, 34, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10612, 76, 18, 80, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10613, 13, 6, 8, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10613, 75, 7.75, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10614, 11, 21, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10614, 21, 10, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10614, 39, 18, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10615, 55, 24, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10616, 38, 263.5, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10616, 56, 38, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10616, 70, 15, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10616, 71, 21.5, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10617, 59, 55, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10618, 6, 25, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10618, 56, 38, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10618, 68, 12.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10619, 21, 10, 42, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10619, 22, 21, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10620, 24, 4.5, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10620, 52, 7, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10621, 19, 9.2, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10621, 23, 9, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10621, 70, 15, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10621, 71, 21.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10622, 2, 19, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10622, 68, 12.5, 18, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10623, 14, 23.25, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10623, 19, 9.2, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10623, 21, 10, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10623, 24, 4.5, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10623, 35, 18, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10624, 28, 45.6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10624, 29, 123.79, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10624, 44, 19.45, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10625, 14, 23.25, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10625, 42, 14, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10625, 60, 34, 10, 0)
GO

--
-- Data for table Detalles_Pedidos  (LIMIT 1000,500)
--

INSERT INTO Detalles_Pedidos 
VALUES 
  (10626, 53, 32.8, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10626, 60, 34, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10626, 71, 21.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10627, 62, 49.3, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10627, 73, 15, 35, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10628, 1, 18, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10629, 29, 123.79, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10629, 64, 33.25, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10630, 55, 24, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10630, 76, 18, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10631, 75, 7.75, 8, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10632, 2, 19, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10632, 33, 2.5, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10633, 12, 38, 36, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10633, 13, 6, 13, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10633, 26, 31.23, 35, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10633, 62, 49.3, 80, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10634, 7, 30, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10634, 18, 62.5, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10634, 51, 53, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10634, 75, 7.75, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10635, 4, 22, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10635, 5, 21.35, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10635, 22, 21, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10636, 4, 22, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10636, 58, 13.25, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10637, 11, 21, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10637, 50, 16.25, 25, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10637, 56, 38, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10638, 45, 9.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10638, 65, 21.05, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10638, 72, 34.8, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10639, 18, 62.5, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10640, 69, 36, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10640, 70, 15, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10641, 2, 19, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10641, 40, 18.4, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10642, 21, 10, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10642, 61, 28.5, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10643, 28, 45.6, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10643, 39, 18, 21, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10643, 46, 12, 2, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10644, 18, 62.5, 4, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10644, 43, 46, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10644, 46, 12, 21, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10645, 18, 62.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10645, 36, 19, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10646, 1, 18, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10646, 10, 31, 18, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10646, 71, 21.5, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10646, 77, 13, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10647, 19, 9.2, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10647, 39, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10648, 22, 21, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10648, 24, 4.5, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10649, 28, 45.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10649, 72, 34.8, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10650, 30, 25.89, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10650, 53, 32.8, 25, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10650, 54, 7.45, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10651, 19, 9.2, 12, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10651, 22, 21, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10652, 30, 25.89, 2, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10652, 42, 14, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10653, 16, 17.45, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10653, 60, 34, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10654, 4, 22, 12, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10654, 39, 18, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10654, 54, 7.45, 6, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10655, 41, 9.65, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10656, 14, 23.25, 3, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10656, 44, 19.45, 28, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10656, 47, 9.5, 6, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10657, 15, 15.5, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10657, 41, 9.65, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10657, 46, 12, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10657, 47, 9.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10657, 56, 38, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10657, 60, 34, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10658, 21, 10, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10658, 40, 18.4, 70, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10658, 60, 34, 55, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10658, 77, 13, 70, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10659, 31, 12.5, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10659, 40, 18.4, 24, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10659, 70, 15, 40, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10660, 20, 81, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10661, 39, 18, 3, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10661, 58, 13.25, 49, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10662, 68, 12.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10663, 40, 18.4, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10663, 42, 14, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10663, 51, 53, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10664, 10, 31, 24, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10664, 56, 38, 12, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10664, 65, 21.05, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10665, 51, 53, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10665, 59, 55, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10665, 76, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10666, 29, 123.79, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10666, 65, 21.05, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10667, 69, 36, 45, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10667, 71, 21.5, 14, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10668, 31, 12.5, 8, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10668, 55, 24, 4, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10668, 64, 33.25, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10669, 36, 19, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10670, 23, 9, 32, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10670, 46, 12, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10670, 67, 14, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10670, 73, 15, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10670, 75, 7.75, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10671, 16, 17.45, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10671, 62, 49.3, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10671, 65, 21.05, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10672, 38, 263.5, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10672, 71, 21.5, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10673, 16, 17.45, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10673, 42, 14, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10673, 43, 46, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10674, 23, 9, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10675, 14, 23.25, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10675, 53, 32.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10675, 58, 13.25, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10676, 10, 31, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10676, 19, 9.2, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10676, 44, 19.45, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10677, 26, 31.23, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10677, 33, 2.5, 8, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10678, 12, 38, 100, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10678, 33, 2.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10678, 41, 9.65, 120, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10678, 54, 7.45, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10679, 59, 55, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10680, 16, 17.45, 50, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10680, 31, 12.5, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10680, 42, 14, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10681, 19, 9.2, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10681, 21, 10, 12, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10681, 64, 33.25, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10682, 33, 2.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10682, 66, 17, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10682, 75, 7.75, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10683, 52, 7, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10684, 40, 18.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10684, 47, 9.5, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10684, 60, 34, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10685, 10, 31, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10685, 41, 9.65, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10685, 47, 9.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10686, 17, 39, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10686, 26, 31.23, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10687, 9, 97, 50, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10687, 29, 123.79, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10687, 36, 19, 6, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10688, 10, 31, 18, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10688, 28, 45.6, 60, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10688, 34, 14, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10689, 1, 18, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10690, 56, 38, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10690, 77, 13, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10691, 1, 18, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10691, 29, 123.79, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10691, 43, 46, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10691, 44, 19.45, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10691, 62, 49.3, 48, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10692, 63, 43.9, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10693, 9, 97, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10693, 54, 7.45, 60, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10693, 69, 36, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10693, 73, 15, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10694, 7, 30, 90, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10694, 59, 55, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10694, 70, 15, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10695, 8, 40, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10695, 12, 38, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10695, 24, 4.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10696, 17, 39, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10696, 46, 12, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10697, 19, 9.2, 7, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10697, 35, 18, 9, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10697, 58, 13.25, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10697, 70, 15, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10698, 11, 21, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10698, 17, 39, 8, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10698, 29, 123.79, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10698, 65, 21.05, 65, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10698, 70, 15, 8, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10699, 47, 9.5, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10700, 1, 18, 5, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10700, 34, 14, 12, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10700, 68, 12.5, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10700, 71, 21.5, 60, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10701, 59, 55, 42, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10701, 71, 21.5, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10701, 76, 18, 35, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10702, 3, 10, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10702, 76, 18, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10703, 2, 19, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10703, 59, 55, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10703, 73, 15, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10704, 4, 22, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10704, 24, 4.5, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10704, 48, 12.75, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10705, 31, 12.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10705, 32, 32, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10706, 16, 17.45, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10706, 43, 46, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10706, 59, 55, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10707, 55, 24, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10707, 57, 19.5, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10707, 70, 15, 28, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10708, 5, 21.35, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10708, 36, 19, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10709, 8, 40, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10709, 51, 53, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10709, 60, 34, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10710, 19, 9.2, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10710, 47, 9.5, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10711, 19, 9.2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10711, 41, 9.65, 42, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10711, 53, 32.8, 120, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10712, 53, 32.8, 3, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10712, 56, 38, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10713, 10, 31, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10713, 26, 31.23, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10713, 45, 9.5, 110, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10713, 46, 12, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10714, 2, 19, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10714, 17, 39, 27, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10714, 47, 9.5, 50, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10714, 56, 38, 18, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10714, 58, 13.25, 12, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10715, 10, 31, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10715, 71, 21.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10716, 21, 10, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10716, 51, 53, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10716, 61, 28.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10717, 21, 10, 32, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10717, 54, 7.45, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10717, 69, 36, 25, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10718, 12, 38, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10718, 16, 17.45, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10718, 36, 19, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10718, 62, 49.3, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10719, 18, 62.5, 12, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10719, 30, 25.89, 3, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10719, 54, 7.45, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10720, 35, 18, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10720, 71, 21.5, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10721, 44, 19.45, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10722, 2, 19, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10722, 31, 12.5, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10722, 68, 12.5, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10722, 75, 7.75, 42, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10723, 26, 31.23, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10724, 10, 31, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10724, 61, 28.5, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10725, 41, 9.65, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10725, 52, 7, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10725, 55, 24, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10726, 4, 22, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10726, 11, 21, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10727, 17, 39, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10727, 56, 38, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10727, 59, 55, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10728, 30, 25.89, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10728, 40, 18.4, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10728, 55, 24, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10728, 60, 34, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10729, 1, 18, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10729, 21, 10, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10729, 50, 16.25, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10730, 16, 17.45, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10730, 31, 12.5, 3, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10730, 65, 21.05, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10731, 21, 10, 40, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10731, 51, 53, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10732, 76, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10733, 14, 23.25, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10733, 28, 45.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10733, 52, 7, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10734, 6, 25, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10734, 30, 25.89, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10734, 76, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10735, 61, 28.5, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10735, 77, 13, 2, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10736, 65, 21.05, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10736, 75, 7.75, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10737, 13, 6, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10737, 41, 9.65, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10738, 16, 17.45, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10739, 36, 19, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10739, 52, 7, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10740, 28, 45.6, 5, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10740, 35, 18, 35, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10740, 45, 9.5, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10740, 56, 38, 14, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10741, 2, 19, 15, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10742, 3, 10, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10742, 60, 34, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10742, 72, 34.8, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10743, 46, 12, 28, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10744, 40, 18.4, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10745, 18, 62.5, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10745, 44, 19.45, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10745, 59, 55, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10745, 72, 34.8, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10746, 13, 6, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10746, 42, 14, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10746, 62, 49.3, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10746, 69, 36, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10747, 31, 12.5, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10747, 41, 9.65, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10747, 63, 43.9, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10747, 69, 36, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10748, 23, 9, 44, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10748, 40, 18.4, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10748, 56, 38, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10749, 56, 38, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10749, 59, 55, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10749, 76, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10750, 14, 23.25, 5, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10750, 45, 9.5, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10750, 59, 55, 25, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10751, 26, 31.23, 12, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10751, 30, 25.89, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10751, 50, 16.25, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10751, 73, 15, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10752, 1, 18, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10752, 69, 36, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10753, 45, 9.5, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10753, 74, 10, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10754, 40, 18.4, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10755, 47, 9.5, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10755, 56, 38, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10755, 57, 19.5, 14, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10755, 69, 36, 25, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10756, 18, 62.5, 21, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10756, 36, 19, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10756, 68, 12.5, 6, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10756, 69, 36, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10757, 34, 14, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10757, 59, 55, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10757, 62, 49.3, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10757, 64, 33.25, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10758, 26, 31.23, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10758, 52, 7, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10758, 70, 15, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10759, 32, 32, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10760, 25, 14, 12, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10760, 27, 43.9, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10760, 43, 46, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10761, 25, 14, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10761, 75, 7.75, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10762, 39, 18, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10762, 47, 9.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10762, 51, 53, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10762, 56, 38, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10763, 21, 10, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10763, 22, 21, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10763, 24, 4.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10764, 3, 10, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10764, 39, 18, 130, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10765, 65, 21.05, 80, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10766, 2, 19, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10766, 7, 30, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10766, 68, 12.5, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10767, 42, 14, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10768, 22, 21, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10768, 31, 12.5, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10768, 60, 34, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10768, 71, 21.5, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10769, 41, 9.65, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10769, 52, 7, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10769, 61, 28.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10769, 62, 49.3, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10770, 11, 21, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10771, 71, 21.5, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10772, 29, 123.79, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10772, 59, 55, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10773, 17, 39, 33, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10773, 31, 12.5, 70, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10773, 75, 7.75, 7, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10774, 31, 12.5, 2, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10774, 66, 17, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10775, 10, 31, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10775, 67, 14, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10776, 31, 12.5, 16, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10776, 42, 14, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10776, 45, 9.5, 27, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10776, 51, 53, 120, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10777, 42, 14, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10778, 41, 9.65, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10779, 16, 17.45, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10779, 62, 49.3, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10780, 70, 15, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10780, 77, 13, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10781, 54, 7.45, 3, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10781, 56, 38, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10781, 74, 10, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10782, 31, 12.5, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10783, 31, 12.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10783, 38, 263.5, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10784, 36, 19, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10784, 39, 18, 2, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10784, 72, 34.8, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10785, 10, 31, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10785, 75, 7.75, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10786, 8, 40, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10786, 30, 25.89, 15, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10786, 75, 7.75, 42, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10787, 2, 19, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10787, 29, 123.79, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10788, 19, 9.2, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10788, 75, 7.75, 40, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10789, 18, 62.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10789, 35, 18, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10789, 63, 43.9, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10789, 68, 12.5, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10790, 7, 30, 3, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10790, 56, 38, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10791, 29, 123.79, 14, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10791, 41, 9.65, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10792, 2, 19, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10792, 54, 7.45, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10792, 68, 12.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10793, 41, 9.65, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10793, 52, 7, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10794, 14, 23.25, 15, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10794, 54, 7.45, 6, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10795, 16, 17.45, 65, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10795, 17, 39, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10796, 26, 31.23, 21, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10796, 44, 19.45, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10796, 64, 33.25, 35, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10796, 69, 36, 24, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10797, 11, 21, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10798, 62, 49.3, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10798, 72, 34.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10799, 13, 6, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10799, 24, 4.5, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10799, 59, 55, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10800, 11, 21, 50, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10800, 51, 53, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10800, 54, 7.45, 7, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10801, 17, 39, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10801, 29, 123.79, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10802, 30, 25.89, 25, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10802, 51, 53, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10802, 55, 24, 60, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10802, 62, 49.3, 5, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10803, 19, 9.2, 24, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10803, 25, 14, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10803, 59, 55, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10804, 10, 31, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10804, 28, 45.6, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10804, 49, 20, 4, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10805, 34, 14, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10805, 38, 263.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10806, 2, 19, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10806, 65, 21.05, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10806, 74, 10, 15, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10807, 40, 18.4, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10808, 56, 38, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10808, 76, 18, 50, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10809, 52, 7, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10810, 13, 6, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10810, 25, 14, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10810, 70, 15, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10811, 19, 9.2, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10811, 23, 9, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10811, 40, 18.4, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10812, 31, 12.5, 16, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10812, 72, 34.8, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10812, 77, 13, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10813, 2, 19, 12, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10813, 46, 12, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10814, 41, 9.65, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10814, 43, 46, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10814, 48, 12.75, 8, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10814, 61, 28.5, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10815, 33, 2.5, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10816, 38, 263.5, 30, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10816, 62, 49.3, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10817, 26, 31.23, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10817, 38, 263.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10817, 40, 18.4, 60, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10817, 62, 49.3, 25, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10818, 32, 32, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10818, 41, 9.65, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10819, 43, 46, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10819, 75, 7.75, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10820, 56, 38, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10821, 35, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10821, 51, 53, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10822, 62, 49.3, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10822, 70, 15, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10823, 11, 21, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10823, 57, 19.5, 15, 0)
GO

--
-- Data for table Detalles_Pedidos  (LIMIT 1500,500)
--

INSERT INTO Detalles_Pedidos 
VALUES 
  (10823, 59, 55, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10823, 77, 13, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10824, 41, 9.65, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10824, 70, 15, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10825, 26, 31.23, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10825, 53, 32.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10826, 31, 12.5, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10826, 57, 19.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10827, 10, 31, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10827, 39, 18, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10828, 20, 81, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10828, 38, 263.5, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10829, 2, 19, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10829, 8, 40, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10829, 13, 6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10829, 60, 34, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10830, 6, 25, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10830, 39, 18, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10830, 60, 34, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10830, 68, 12.5, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10831, 19, 9.2, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10831, 35, 18, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10831, 38, 263.5, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10831, 43, 46, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10832, 13, 6, 3, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10832, 25, 14, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10832, 44, 19.45, 16, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10832, 64, 33.25, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10833, 7, 30, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10833, 31, 12.5, 9, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10833, 53, 32.8, 9, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10834, 29, 123.79, 8, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10834, 30, 25.89, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10835, 59, 55, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10835, 77, 13, 2, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10836, 22, 21, 52, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10836, 35, 18, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10836, 57, 19.5, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10836, 60, 34, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10836, 64, 33.25, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10837, 13, 6, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10837, 40, 18.4, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10837, 47, 9.5, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10837, 76, 18, 21, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10838, 1, 18, 4, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10838, 18, 62.5, 25, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10838, 36, 19, 50, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10839, 58, 13.25, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10839, 72, 34.8, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10840, 25, 14, 6, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10840, 39, 18, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10841, 10, 31, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10841, 56, 38, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10841, 59, 55, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10841, 77, 13, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10842, 11, 21, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10842, 43, 46, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10842, 68, 12.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10842, 70, 15, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10843, 51, 53, 4, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10844, 22, 21, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10845, 23, 9, 70, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10845, 35, 18, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10845, 42, 14, 42, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10845, 58, 13.25, 60, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10845, 64, 33.25, 48, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10846, 4, 22, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10846, 70, 15, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10846, 74, 10, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10847, 1, 18, 80, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10847, 19, 9.2, 12, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10847, 37, 26, 60, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10847, 45, 9.5, 36, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10847, 60, 34, 45, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10847, 71, 21.5, 55, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10848, 5, 21.35, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10848, 9, 97, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10849, 3, 10, 49, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10849, 26, 31.23, 18, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10850, 25, 14, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10850, 33, 2.5, 4, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10850, 70, 15, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10851, 2, 19, 5, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10851, 25, 14, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10851, 57, 19.5, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10851, 59, 55, 42, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10852, 2, 19, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10852, 17, 39, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10852, 62, 49.3, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10853, 18, 62.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10854, 10, 31, 100, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10854, 13, 6, 65, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10855, 16, 17.45, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10855, 31, 12.5, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10855, 56, 38, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10855, 65, 21.05, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10856, 2, 19, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10856, 42, 14, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10857, 3, 10, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10857, 26, 31.23, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10857, 29, 123.79, 10, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10858, 7, 30, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10858, 27, 43.9, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10858, 70, 15, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10859, 24, 4.5, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10859, 54, 7.45, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10859, 64, 33.25, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10860, 51, 53, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10860, 76, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10861, 17, 39, 42, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10861, 18, 62.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10861, 21, 10, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10861, 33, 2.5, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10861, 62, 49.3, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10862, 11, 21, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10862, 52, 7, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10863, 1, 18, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10863, 58, 13.25, 12, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10864, 35, 18, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10864, 67, 14, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10865, 38, 263.5, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10865, 39, 18, 80, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10866, 2, 19, 21, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10866, 24, 4.5, 6, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10866, 30, 25.89, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10867, 53, 32.8, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10868, 26, 31.23, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10868, 35, 18, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10868, 49, 20, 42, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10869, 1, 18, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10869, 11, 21, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10869, 23, 9, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10869, 68, 12.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10870, 35, 18, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10870, 51, 53, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10871, 6, 25, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10871, 16, 17.45, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10871, 17, 39, 16, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10872, 55, 24, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10872, 62, 49.3, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10872, 64, 33.25, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10872, 65, 21.05, 21, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10873, 21, 10, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10873, 28, 45.6, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10874, 10, 31, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10875, 19, 9.2, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10875, 47, 9.5, 21, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10875, 49, 20, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10876, 46, 12, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10876, 64, 33.25, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10877, 16, 17.45, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10877, 18, 62.5, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10878, 20, 81, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10879, 40, 18.4, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10879, 65, 21.05, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10879, 76, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10880, 23, 9, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10880, 61, 28.5, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10880, 70, 15, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10881, 73, 15, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10882, 42, 14, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10882, 49, 20, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10882, 54, 7.45, 32, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10883, 24, 4.5, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10884, 21, 10, 40, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10884, 56, 38, 21, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10884, 65, 21.05, 12, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10885, 2, 19, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10885, 24, 4.5, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10885, 70, 15, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10885, 77, 13, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10886, 10, 31, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10886, 31, 12.5, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10886, 77, 13, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10887, 25, 14, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10888, 2, 19, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10888, 68, 12.5, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10889, 11, 21, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10889, 38, 263.5, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10890, 17, 39, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10890, 34, 14, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10890, 41, 9.65, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10891, 30, 25.89, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10892, 59, 55, 40, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10893, 8, 40, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10893, 24, 4.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10893, 29, 123.79, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10893, 30, 25.89, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10893, 36, 19, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10894, 13, 6, 28, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10894, 69, 36, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10894, 75, 7.75, 120, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10895, 24, 4.5, 110, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10895, 39, 18, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10895, 40, 18.4, 91, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10895, 60, 34, 100, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10896, 45, 9.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10896, 56, 38, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10897, 29, 123.79, 80, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10897, 30, 25.89, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10898, 13, 6, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10899, 39, 18, 8, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10900, 70, 15, 3, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10901, 41, 9.65, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10901, 71, 21.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10902, 55, 24, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10902, 62, 49.3, 6, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10903, 13, 6, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10903, 65, 21.05, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10903, 68, 12.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10904, 58, 13.25, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10904, 62, 49.3, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10905, 1, 18, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10906, 61, 28.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10907, 75, 7.75, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10908, 7, 30, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10908, 52, 7, 14, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10909, 7, 30, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10909, 16, 17.45, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10909, 41, 9.65, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10910, 19, 9.2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10910, 49, 20, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10910, 61, 28.5, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10911, 1, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10911, 17, 39, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10911, 67, 14, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10912, 11, 21, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10912, 29, 123.79, 60, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10913, 4, 22, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10913, 33, 2.5, 40, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10913, 58, 13.25, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10914, 71, 21.5, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10915, 17, 39, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10915, 33, 2.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10915, 54, 7.45, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10916, 16, 17.45, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10916, 32, 32, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10916, 57, 19.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10917, 30, 25.89, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10917, 60, 34, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10918, 1, 18, 60, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10918, 60, 34, 25, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10919, 16, 17.45, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10919, 25, 14, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10919, 40, 18.4, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10920, 50, 16.25, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10921, 35, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10921, 63, 43.9, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10922, 17, 39, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10922, 24, 4.5, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10923, 42, 14, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10923, 43, 46, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10923, 67, 14, 24, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10924, 10, 31, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10924, 28, 45.6, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10924, 75, 7.75, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10925, 36, 19, 25, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10925, 52, 7, 12, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10926, 11, 21, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10926, 13, 6, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10926, 19, 9.2, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10926, 72, 34.8, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10927, 20, 81, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10927, 52, 7, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10927, 76, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10928, 47, 9.5, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10928, 76, 18, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10929, 21, 10, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10929, 75, 7.75, 49, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10929, 77, 13, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10930, 21, 10, 36, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10930, 27, 43.9, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10930, 55, 24, 25, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10930, 58, 13.25, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10931, 13, 6, 42, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10931, 57, 19.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10932, 16, 17.45, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10932, 62, 49.3, 14, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10932, 72, 34.8, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10932, 75, 7.75, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10933, 53, 32.8, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10933, 61, 28.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10934, 6, 25, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10935, 1, 18, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10935, 18, 62.5, 4, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10935, 23, 9, 8, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10936, 36, 19, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10937, 28, 45.6, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10937, 34, 14, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10938, 13, 6, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10938, 43, 46, 24, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10938, 60, 34, 49, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10938, 71, 21.5, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10939, 2, 19, 10, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10939, 67, 14, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10940, 7, 30, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10940, 13, 6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10941, 31, 12.5, 44, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10941, 62, 49.3, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10941, 68, 12.5, 80, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10941, 72, 34.8, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10942, 49, 20, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10943, 13, 6, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10943, 22, 21, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10943, 46, 12, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10944, 11, 21, 5, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10944, 44, 19.45, 18, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10944, 56, 38, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10945, 13, 6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10945, 31, 12.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10946, 10, 31, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10946, 24, 4.5, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10946, 77, 13, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10947, 59, 55, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10948, 50, 16.25, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10948, 51, 53, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10948, 55, 24, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10949, 6, 25, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10949, 10, 31, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10949, 17, 39, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10949, 62, 49.3, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10950, 4, 22, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10951, 33, 2.5, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10951, 41, 9.65, 6, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10951, 75, 7.75, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10952, 6, 25, 16, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10952, 28, 45.6, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10953, 20, 81, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10953, 31, 12.5, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10954, 16, 17.45, 28, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10954, 31, 12.5, 25, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10954, 45, 9.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10954, 60, 34, 24, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10955, 75, 7.75, 12, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10956, 21, 10, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10956, 47, 9.5, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10956, 51, 53, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10957, 30, 25.89, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10957, 35, 18, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10957, 64, 33.25, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10958, 5, 21.35, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10958, 7, 30, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10958, 72, 34.8, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10959, 75, 7.75, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10960, 24, 4.5, 10, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10960, 41, 9.65, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10961, 52, 7, 6, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10961, 76, 18, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10962, 7, 30, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10962, 13, 6, 77, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10962, 53, 32.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10962, 69, 36, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10962, 76, 18, 44, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10963, 60, 34, 2, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10964, 18, 62.5, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10964, 38, 263.5, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10964, 69, 36, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10965, 51, 53, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10966, 37, 26, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10966, 56, 38, 12, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10966, 62, 49.3, 12, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10967, 19, 9.2, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10967, 49, 20, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10968, 12, 38, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10968, 24, 4.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10968, 64, 33.25, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10969, 46, 12, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10970, 52, 7, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10971, 29, 123.79, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10972, 17, 39, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10972, 33, 2.5, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10973, 26, 31.23, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10973, 41, 9.65, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10973, 75, 7.75, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10974, 63, 43.9, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10975, 8, 40, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10975, 75, 7.75, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10976, 28, 45.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10977, 39, 18, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10977, 47, 9.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10977, 51, 53, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10977, 63, 43.9, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10978, 8, 40, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10978, 21, 10, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10978, 40, 18.4, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10978, 44, 19.45, 6, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10979, 7, 30, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10979, 12, 38, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10979, 24, 4.5, 80, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10979, 27, 43.9, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10979, 31, 12.5, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10979, 63, 43.9, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10980, 75, 7.75, 40, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10981, 38, 263.5, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10982, 7, 30, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10982, 43, 46, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10983, 13, 6, 84, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10983, 57, 19.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10984, 16, 17.45, 55, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10984, 24, 4.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10984, 36, 19, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10985, 16, 17.45, 36, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10985, 18, 62.5, 8, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10985, 32, 32, 35, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10986, 11, 21, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10986, 20, 81, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10986, 76, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10986, 77, 13, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10987, 7, 30, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10987, 43, 46, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10987, 72, 34.8, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10988, 7, 30, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10988, 62, 49.3, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10989, 6, 25, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10989, 11, 21, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10989, 41, 9.65, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10990, 21, 10, 65, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10990, 34, 14, 60, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10990, 55, 24, 65, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10990, 61, 28.5, 66, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10991, 2, 19, 50, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10991, 70, 15, 20, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10991, 76, 18, 90, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10992, 72, 34.8, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10993, 29, 123.79, 50, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10993, 41, 9.65, 35, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10994, 59, 55, 18, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10995, 51, 53, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10995, 60, 34, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10996, 42, 14, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10997, 32, 32, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10997, 46, 12, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10997, 52, 7, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10998, 24, 4.5, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10998, 61, 28.5, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10998, 74, 10, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10998, 75, 7.75, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10999, 41, 9.65, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10999, 51, 53, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (10999, 77, 13, 21, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11000, 4, 22, 25, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11000, 24, 4.5, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11000, 77, 13, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11001, 7, 30, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11001, 22, 21, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11001, 46, 12, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11001, 55, 24, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11002, 13, 6, 56, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11002, 35, 18, 15, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11002, 42, 14, 24, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11002, 55, 24, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11003, 1, 18, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11003, 40, 18.4, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11003, 52, 7, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11004, 26, 31.23, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11004, 76, 18, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11005, 1, 18, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11005, 59, 55, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11006, 1, 18, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11006, 29, 123.79, 2, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11007, 8, 40, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11007, 29, 123.79, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11007, 42, 14, 14, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11008, 28, 45.6, 70, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11008, 34, 14, 90, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11008, 71, 21.5, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11009, 24, 4.5, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11009, 36, 19, 18, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11009, 60, 34, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11010, 7, 30, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11010, 24, 4.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11011, 58, 13.25, 40, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11011, 71, 21.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11012, 19, 9.2, 50, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11012, 60, 34, 36, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11012, 71, 21.5, 60, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11013, 23, 9, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11013, 42, 14, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11013, 45, 9.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11013, 68, 12.5, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11014, 41, 9.65, 28, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11015, 30, 25.89, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11015, 77, 13, 18, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11016, 31, 12.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11016, 36, 19, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11017, 3, 10, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11017, 59, 55, 110, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11017, 70, 15, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11018, 12, 38, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11018, 18, 62.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11018, 56, 38, 5, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11019, 46, 12, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11019, 49, 20, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11020, 10, 31, 24, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11021, 2, 19, 11, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11021, 20, 81, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11021, 26, 31.23, 63, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11021, 51, 53, 44, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11021, 72, 34.8, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11022, 19, 9.2, 35, 0)
GO

--
-- Data for table Detalles_Pedidos  (LIMIT 2000,500)
--

INSERT INTO Detalles_Pedidos 
VALUES 
  (11022, 69, 36, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11023, 7, 30, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11023, 43, 46, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11024, 26, 31.23, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11024, 33, 2.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11024, 65, 21.05, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11024, 71, 21.5, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11025, 1, 18, 10, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11025, 13, 6, 20, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11026, 18, 62.5, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11026, 51, 53, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11027, 24, 4.5, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11027, 62, 49.3, 21, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11028, 55, 24, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11028, 59, 55, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11029, 56, 38, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11029, 63, 43.9, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11030, 2, 19, 100, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11030, 5, 21.35, 70, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11030, 29, 123.79, 60, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11030, 59, 55, 100, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11031, 1, 18, 45, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11031, 13, 6, 80, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11031, 24, 4.5, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11031, 64, 33.25, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11031, 71, 21.5, 16, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11032, 36, 19, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11032, 38, 263.5, 25, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11032, 59, 55, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11033, 53, 32.8, 70, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11033, 69, 36, 36, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11034, 21, 10, 15, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11034, 44, 19.45, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11034, 61, 28.5, 6, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11035, 1, 18, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11035, 35, 18, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11035, 42, 14, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11035, 54, 7.45, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11036, 13, 6, 7, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11036, 59, 55, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11037, 70, 15, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11038, 40, 18.4, 5, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11038, 52, 7, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11038, 71, 21.5, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11039, 28, 45.6, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11039, 35, 18, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11039, 49, 20, 60, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11039, 57, 19.5, 28, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11040, 21, 10, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11041, 2, 19, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11041, 63, 43.9, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11042, 44, 19.45, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11042, 61, 28.5, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11043, 11, 21, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11044, 62, 49.3, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11045, 33, 2.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11045, 51, 53, 24, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11046, 12, 38, 20, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11046, 32, 32, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11046, 35, 18, 18, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11047, 1, 18, 25, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11047, 5, 21.35, 30, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11048, 68, 12.5, 42, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11049, 2, 19, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11049, 12, 38, 4, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11050, 76, 18, 50, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11051, 24, 4.5, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11052, 43, 46, 30, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11052, 61, 28.5, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11053, 18, 62.5, 35, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11053, 32, 32, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11053, 64, 33.25, 25, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11054, 33, 2.5, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11054, 67, 14, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11055, 24, 4.5, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11055, 25, 14, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11055, 51, 53, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11055, 57, 19.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11056, 7, 30, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11056, 55, 24, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11056, 60, 34, 50, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11057, 70, 15, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11058, 21, 10, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11058, 60, 34, 21, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11058, 61, 28.5, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11059, 13, 6, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11059, 17, 39, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11059, 60, 34, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11060, 60, 34, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11060, 77, 13, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11061, 60, 34, 15, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11062, 53, 32.8, 10, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11062, 70, 15, 12, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11063, 34, 14, 30, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11063, 40, 18.4, 40, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11063, 41, 9.65, 30, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11064, 17, 39, 77, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11064, 41, 9.65, 12, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11064, 53, 32.8, 25, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11064, 55, 24, 4, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11064, 68, 12.5, 55, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11065, 30, 25.89, 4, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11065, 54, 7.45, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11066, 16, 17.45, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11066, 19, 9.2, 42, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11066, 34, 14, 35, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11067, 41, 9.65, 9, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11068, 28, 45.6, 8, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11068, 43, 46, 36, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11068, 77, 13, 28, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11069, 39, 18, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11070, 1, 18, 40, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11070, 2, 19, 20, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11070, 16, 17.45, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11070, 31, 12.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11071, 7, 30, 15, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11071, 13, 6, 10, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11072, 2, 19, 8, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11072, 41, 9.65, 40, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11072, 50, 16.25, 22, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11072, 64, 33.25, 130, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11073, 11, 21, 10, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11073, 24, 4.5, 20, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11074, 16, 17.45, 14, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11075, 2, 19, 10, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11075, 46, 12, 30, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11075, 76, 18, 2, 0.150000005960464)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11076, 6, 25, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11076, 14, 23.25, 20, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11076, 19, 9.2, 10, 0.25)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 2, 19, 24, 0.200000002980232)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 3, 10, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 4, 22, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 6, 25, 1, 0.0199999995529652)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 7, 30, 1, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 8, 40, 2, 0.100000001490116)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 10, 31, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 12, 38, 2, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 13, 6, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 14, 23.25, 1, 0.0299999993294477)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 16, 17.45, 2, 0.0299999993294477)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 20, 81, 1, 0.0399999991059303)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 23, 9, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 32, 32, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 39, 18, 2, 0.0500000007450581)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 41, 9.65, 3, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 46, 12, 3, 0.0199999995529652)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 52, 7, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 55, 24, 2, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 60, 34, 2, 0.0599999986588955)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 64, 33.25, 2, 0.0299999993294477)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 66, 17, 1, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 73, 15, 2, 0.00999999977648258)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 75, 7.75, 4, 0)
GO

INSERT INTO Detalles_Pedidos 
VALUES 
  (11077, 77, 13, 2, 0)
GO

--
-- Data for table Pedidos  (LIMIT 0,500)
--
INSERT INTO Pedidos 
VALUES 
  (10248, 'WILMK', 5, '04/08/2021', '01/09/2021', '16/08/2021', 3, 32.38, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10249, 'TOMSP', 6, '05/08/2021', '16/09/2021', '10/08/2021', 1, 11.61, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10250, 'HANAR', 4, '08/08/2021', '05/09/2021', '12/08/2021', 2, 65.83, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10251, 'VICTE', 3, '08/08/2021', '05/09/2021', '15/08/2021', 1, 41.34, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10252, 'SUPRD', 4, '09/08/2021', '06/09/2021', '11/08/2021', 2, 51.3, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10253, 'HANAR', 3, '10/08/2021', '24/08/2021', '16/08/2021', 2, 58.17, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10254, 'CHOPS', 5, '11/08/2021', '08/09/2021', '23/08/2021', 2, 22.98, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10255, 'RICSU', 9, '12/08/2021', '09/09/2021', '15/08/2021', 3, 148.33, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10256, 'WELLI', 3, '15/08/2021', '12/09/2021', '17/08/2021', 2, 13.97, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10257, 'HILAA', 4, '16/08/2021', '13/09/2021', '22/08/2021', 3, 81.91, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10258, 'ERNSH', 1, '17/08/2021', '14/09/2021', '23/08/2021', 1, 140.51, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10259, 'CENTC', 4, '18/08/2021', '15/09/2021', '25/08/2021', 3, 3.25, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10260, 'OTTIK', 4, '19/08/2021', '16/09/2021', '29/08/2021', 1, 55.09, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10261, 'QUEDE', 4, '19/08/2021', '16/09/2021', '30/08/2021', 2, 3.05, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10262, 'RATTC', 8, '22/08/2021', '19/09/2021', '25/08/2021', 3, 48.29, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10263, 'ERNSH', 9, '23/08/2021', '20/09/2021', '31/08/2021', 3, 146.06, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10264, 'FOLKO', 6, '24/08/2021', '21/09/2021', '23/09/2021', 3, 3.67, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10265, 'BLONP', 2, '25/08/2021', '22/09/2021', '12/09/2021', 1, 55.28, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10266, 'WARTH', 3, '26/08/2021', '07/10/2021', '31/08/2021', 3, 25.73, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10267, 'FRANK', 4, '29/08/2021', '26/09/2021', '06/09/2021', 1, 208.58, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10268, 'GROSR', 8, '30/08/2021', '27/09/2021', '02/09/2021', 3, 66.29, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10269, 'WHITC', 5, '31/08/2021', '14/09/2021', '09/09/2021', 1, 4.56, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10270, 'WARTH', 1, '01/09/2021', '29/09/2021', '02/09/2021', 1, 136.54, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10271, 'SPLIR', 6, '01/09/2021', '29/09/2021', '30/09/2021', 2, 4.54, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10272, 'RATTC', 6, '02/09/2021', '30/09/2021', '06/09/2021', 2, 98.03, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10273, 'QUICK', 3, '05/09/2021', '03/10/2021', '12/09/2021', 3, 76.07, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10274, 'VINET', 6, '06/09/2021', '04/10/2021', '16/09/2021', 1, 6.01, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10275, 'MAGAA', 1, '07/09/2021', '05/10/2021', '09/09/2021', 1, 26.93, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10276, 'TORTU', 8, '08/09/2021', '22/09/2021', '14/09/2021', 3, 13.84, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10277, 'MORGK', 2, '09/09/2021', '07/10/2021', '13/09/2021', 3, 125.77, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10278, 'BERGS', 8, '12/09/2021', '10/10/2021', '16/09/2021', 2, 92.69, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10279, 'LEHMS', 8, '13/09/2021', '11/10/2021', '16/09/2021', 2, 25.83, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10280, 'BERGS', 2, '14/09/2021', '12/10/2021', '13/10/2021', 1, 8.98, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10281, 'ROMEY', 4, '14/09/2021', '28/09/2021', '21/09/2021', 1, 2.94, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10282, 'ROMEY', 4, '15/09/2021', '13/10/2021', '21/09/2021', 1, 12.69, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10283, 'LILAS', 3, '16/09/2021', '14/10/2021', '23/09/2021', 3, 84.81, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10284, 'LEHMS', 4, '19/09/2021', '17/10/2021', '27/09/2021', 1, 76.56, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10285, 'QUICK', 1, '20/09/2021', '18/10/2021', '26/09/2021', 2, 76.83, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10286, 'QUICK', 8, '21/09/2021', '19/10/2021', '30/09/2021', 3, 229.24, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10287, 'RICAR', 8, '22/09/2021', '20/10/2021', '28/09/2021', 3, 12.76, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10288, 'REGGC', 4, '23/09/2021', '21/10/2021', '04/10/2021', 1, 7.45, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10289, 'BSBEV', 7, '26/09/2021', '24/10/2021', '28/09/2021', 3, 22.77, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10290, 'COMMI', 8, '27/09/2021', '25/10/2021', '04/10/2021', 1, 79.7, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10291, 'QUEDE', 6, '27/09/2021', '25/10/2021', '05/10/2021', 2, 6.4, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10292, 'TRADH', 1, '28/09/2021', '26/10/2021', '03/10/2021', 2, 1.35, 'Tradição Hipermercados', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10293, 'TORTU', 1, '29/09/2021', '27/10/2021', '12/10/2021', 3, 21.18, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10294, 'RATTC', 4, '30/09/2021', '28/10/2021', '06/10/2021', 2, 147.26, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10295, 'VINET', 2, '03/10/2021', '31/10/2021', '11/10/2021', 2, 1.15, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10296, 'LILAS', 6, '04/10/2021', '01/11/2021', '12/10/2021', 1, 0.12, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10297, 'BLONP', 5, '05/10/2021', '16/11/2021', '11/10/2021', 2, 5.74, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10298, 'HUNGO', 6, '06/10/2021', '03/11/2021', '12/10/2021', 2, 168.22, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10299, 'RICAR', 4, '07/10/2021', '04/11/2021', '14/10/2021', 2, 29.76, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10300, 'MAGAA', 2, '10/10/2021', '07/11/2021', '19/10/2021', 2, 17.68, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10301, 'WANDK', 8, '10/10/2021', '07/11/2021', '18/10/2021', 2, 45.08, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10302, 'SUPRD', 4, '11/10/2021', '08/11/2021', '09/11/2021', 2, 6.27, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10303, 'GODOS', 7, '12/10/2021', '09/11/2021', '19/10/2021', 2, 107.83, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10304, 'TORTU', 1, '13/10/2021', '10/11/2021', '18/10/2021', 2, 63.79, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10305, 'OLDWO', 8, '14/10/2021', '11/11/2021', '09/11/2021', 3, 257.62, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10306, 'ROMEY', 1, '17/10/2021', '14/11/2021', '24/10/2021', 3, 7.56, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10307, 'LONEP', 2, '18/10/2021', '15/11/2021', '26/10/2021', 2, 0.56, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10308, 'ANATR', 7, '19/10/2021', '16/11/2021', '25/10/2021', 3, 1.61, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10309, 'HUNGO', 3, '20/10/2021', '17/11/2021', '23/11/2021', 1, 47.3, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10310, 'THEBI', 8, '21/10/2021', '18/11/2021', '28/10/2021', 2, 17.52, 'The Big Cheese', '89 Jefferson Way
Suite 2', 'Portland', 'OR', '97201', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10311, 'DUMON', 1, '21/10/2021', '04/11/2021', '27/10/2021', 3, 24.69, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10312, 'WANDK', 2, '24/10/2021', '21/11/2021', '03/11/2021', 2, 40.26, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10313, 'QUICK', 2, '25/10/2021', '22/11/2021', '04/11/2021', 2, 1.96, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10314, 'RATTC', 1, '26/10/2021', '23/11/2021', '04/11/2021', 2, 74.16, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10315, 'ISLAT', 4, '27/10/2021', '24/11/2021', '03/11/2021', 2, 41.76, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10316, 'RATTC', 1, '28/10/2021', '25/11/2021', '08/11/2021', 3, 150.15, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10317, 'LONEP', 6, '31/10/2021', '28/11/2021', '10/11/2021', 1, 12.69, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10318, 'ISLAT', 8, '01/11/2021', '29/11/2021', '04/11/2021', 2, 4.73, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10319, 'TORTU', 7, '02/11/2021', '30/11/2021', '11/11/2021', 3, 64.5, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10320, 'WARTH', 5, '03/11/2021', '17/11/2021', '18/11/2021', 3, 34.57, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10321, 'ISLAT', 3, '03/11/2021', '01/12/2021', '11/11/2021', 2, 3.43, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10322, 'PERIC', 7, '04/11/2021', '02/12/2021', '23/11/2021', 3, 0.4, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10323, 'KOENE', 4, '07/11/2021', '05/12/2021', '14/11/2021', 1, 4.88, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10324, 'SAVEA', 9, '08/11/2021', '06/12/2021', '10/11/2021', 1, 214.27, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10325, 'KOENE', 1, '09/11/2021', '23/11/2021', '14/11/2021', 3, 64.86, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10326, 'BOLID', 4, '10/11/2021', '08/12/2021', '14/11/2021', 2, 77.92, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10327, 'FOLKO', 2, '11/11/2021', '09/12/2021', '14/11/2021', 1, 63.36, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10328, 'FURIB', 4, '14/11/2021', '12/12/2021', '17/11/2021', 3, 87.03, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10329, 'SPLIR', 4, '15/11/2021', '27/12/2021', '23/11/2021', 2, 191.67, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10330, 'LILAS', 3, '16/11/2021', '14/12/2021', '28/11/2021', 1, 12.75, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10331, 'BONAP', 9, '16/11/2021', '28/12/2021', '21/11/2021', 1, 10.19, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10332, 'MEREP', 3, '17/11/2021', '29/12/2021', '21/11/2021', 2, 52.84, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10333, 'WARTH', 5, '18/11/2021', '16/12/2021', '25/11/2021', 3, 0.59, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10334, 'VICTE', 8, '21/11/2021', '19/12/2021', '28/11/2021', 2, 8.56, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10335, 'HUNGO', 7, '22/11/2021', '20/12/2021', '24/11/2021', 2, 42.11, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10336, 'PRINI', 7, '23/11/2021', '21/12/2021', '25/11/2021', 2, 15.51, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10337, 'FRANK', 4, '24/11/2021', '22/12/2021', '29/11/2021', 3, 108.26, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10338, 'OLDWO', 4, '25/11/2021', '23/12/2021', '29/11/2021', 3, 84.21, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10339, 'MEREP', 2, '28/11/2021', '26/12/2021', '05/12/2021', 2, 15.66, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10340, 'BONAP', 1, '29/11/2021', '27/12/2021', '09/12/2021', 3, 166.31, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10341, 'SIMOB', 7, '29/11/2021', '27/12/2021', '06/12/2021', 3, 26.78, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10342, 'FRANK', 4, '30/11/2021', '14/12/2021', '05/12/2021', 2, 54.83, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10343, 'LEHMS', 4, '01/12/2021', '29/12/2021', '07/12/2021', 1, 110.37, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10344, 'WHITC', 4, '02/12/2021', '30/12/2021', '06/12/2021', 2, 23.29, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10345, 'QUICK', 2, '05/12/2021', '02/01/2022', '12/12/2021', 2, 249.06, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10346, 'RATTC', 3, '06/12/2021', '17/01/2022', '09/12/2021', 3, 142.08, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10347, 'FAMIA', 4, '07/12/2021', '04/01/2022', '09/12/2021', 3, 3.1, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10348, 'WANDK', 4, '08/12/2021', '05/01/2022', '16/12/2021', 2, 0.78, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10349, 'SPLIR', 7, '09/12/2021', '06/01/2022', '16/12/2021', 1, 8.63, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10350, 'LAMAI', 6, '12/12/2021', '09/01/2022', '03/01/2022', 2, 64.19, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10351, 'ERNSH', 1, '12/12/2021', '09/01/2022', '21/12/2021', 1, 162.33, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10352, 'FURIB', 3, '13/12/2021', '27/12/2021', '19/12/2021', 3, 1.3, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10353, 'PICCO', 7, '14/12/2021', '11/01/2022', '26/12/2021', 3, 360.63, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10354, 'PERIC', 8, '15/12/2021', '12/01/2022', '21/12/2021', 3, 53.8, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10355, 'AROUT', 6, '16/12/2021', '13/01/2022', '21/12/2021', 1, 41.95, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10356, 'WANDK', 6, '19/12/2021', '16/01/2022', '28/12/2021', 2, 36.71, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10357, 'LILAS', 1, '20/12/2021', '17/01/2022', '02/01/2022', 3, 34.88, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10358, 'LAMAI', 5, '21/12/2021', '18/01/2022', '28/12/2021', 1, 19.64, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10359, 'SEVES', 5, '22/12/2021', '19/01/2022', '27/12/2021', 3, 288.43, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10360, 'BLONP', 4, '23/12/2021', '20/01/2022', '02/01/2022', 3, 131.7, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10361, 'QUICK', 1, '23/12/2021', '20/01/2022', '03/01/2022', 2, 183.17, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10362, 'BONAP', 3, '26/12/2021', '23/01/2022', '29/12/2021', 1, 96.04, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10363, 'DRACD', 4, '27/12/2021', '24/01/2022', '04/01/2022', 3, 30.54, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10364, 'EASTC', 1, '27/12/2021', '07/02/2022', '04/01/2022', 1, 71.97, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10365, 'ANTON', 3, '28/12/2021', '25/01/2022', '02/01/2022', 2, 22, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10366, 'GALED', 8, '29/12/2021', '09/02/2022', '30/01/2022', 2, 10.14, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10367, 'VAFFE', 7, '29/12/2021', '26/01/2022', '02/01/2022', 3, 13.55, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10368, 'ERNSH', 2, '30/12/2021', '27/01/2022', '02/01/2022', 2, 101.95, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10369, 'SPLIR', 8, '02/01/2022', '30/01/2022', '09/01/2022', 2, 195.68, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10370, 'CHOPS', 6, '03/01/2022', '31/01/2022', '27/01/2022', 2, 1.17, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10371, 'LAMAI', 1, '03/01/2022', '31/01/2022', '24/01/2022', 1, 0.45, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10372, 'QUEEN', 5, '04/01/2022', '01/02/2022', '09/01/2022', 2, 890.78, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10373, 'HUNGO', 4, '05/01/2022', '02/02/2022', '11/01/2022', 3, 124.12, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10374, 'WOLZA', 1, '05/01/2022', '02/02/2022', '09/01/2022', 3, 3.94, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polonia')
GO

INSERT INTO Pedidos 
VALUES 
  (10375, 'HUNGC', 3, '06/01/2022', '03/02/2022', '09/01/2022', 2, 20.12, 'Hungry Coyote Import Store', 'City Center Plaza
516 Main St.', 'Elgin', 'OR', '97827', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10376, 'MEREP', 1, '09/01/2022', '06/02/2022', '13/01/2022', 2, 20.39, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10377, 'SEVES', 1, '09/01/2022', '06/02/2022', '13/01/2022', 3, 22.21, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10378, 'FOLKO', 5, '10/01/2022', '07/02/2022', '19/01/2022', 3, 5.44, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10379, 'QUEDE', 2, '11/01/2022', '08/02/2022', '13/01/2022', 1, 45.03, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10380, 'HUNGO', 8, '12/01/2022', '09/02/2022', '16/02/2022', 3, 35.03, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10381, 'LILAS', 3, '12/01/2022', '09/02/2022', '13/01/2022', 3, 7.99, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10382, 'ERNSH', 4, '13/01/2022', '10/02/2022', '16/01/2022', 1, 94.77, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10383, 'AROUT', 8, '16/01/2022', '13/02/2022', '18/01/2022', 3, 34.24, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10384, 'BERGS', 3, '16/01/2022', '13/02/2022', '20/01/2022', 3, 168.64, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10385, 'SPLIR', 1, '17/01/2022', '14/02/2022', '23/01/2022', 2, 30.96, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10386, 'FAMIA', 9, '18/01/2022', '01/02/2022', '25/01/2022', 3, 13.99, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10387, 'SANTG', 1, '18/01/2022', '15/02/2022', '20/01/2022', 2, 93.63, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega')
GO

INSERT INTO Pedidos 
VALUES 
  (10388, 'SEVES', 2, '19/01/2022', '16/02/2022', '20/01/2022', 1, 34.86, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10389, 'BOTTM', 4, '20/01/2022', '17/02/2022', '24/01/2022', 2, 47.42, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10390, 'ERNSH', 6, '23/01/2022', '20/02/2022', '26/01/2022', 1, 126.38, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10391, 'DRACD', 3, '23/01/2022', '20/02/2022', '31/01/2022', 3, 5.45, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10392, 'PICCO', 2, '24/01/2022', '21/02/2022', '01/02/2022', 3, 122.46, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10393, 'SAVEA', 1, '25/01/2022', '22/02/2022', '03/02/2022', 3, 126.56, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10394, 'HUNGC', 1, '25/01/2022', '22/02/2022', '03/02/2022', 3, 30.34, 'Hungry Coyote Import Store', 'City Center Plaza
516 Main St.', 'Elgin', 'OR', '97827', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10395, 'HILAA', 6, '26/01/2022', '23/02/2022', '03/02/2022', 1, 184.41, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10396, 'FRANK', 1, '27/01/2022', '10/02/2022', '06/02/2022', 3, 135.35, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10397, 'PRINI', 5, '27/01/2022', '24/02/2022', '02/02/2022', 1, 60.26, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10398, 'SAVEA', 2, '30/01/2022', '27/02/2022', '09/02/2022', 3, 89.16, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10399, 'VAFFE', 8, '31/01/2022', '14/02/2022', '08/02/2022', 3, 27.36, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10400, 'EASTC', 1, '01/02/2022', '01/03/2022', '16/02/2022', 3, 83.93, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10401, 'RATTC', 1, '01/02/2022', '01/03/2022', '10/02/2022', 1, 12.51, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10402, 'ERNSH', 8, '02/02/2022', '16/03/2022', '10/02/2022', 2, 67.88, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10403, 'ERNSH', 4, '03/02/2022', '03/03/2022', '09/02/2022', 3, 73.79, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10404, 'MAGAA', 2, '03/02/2022', '03/03/2022', '08/02/2022', 1, 155.97, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10405, 'LINOD', 1, '06/02/2022', '06/03/2022', '22/02/2022', 1, 34.82, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10406, 'QUEEN', 7, '07/02/2022', '21/03/2022', '13/02/2022', 1, 108.04, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10407, 'OTTIK', 2, '07/02/2022', '07/03/2022', '02/03/2022', 2, 91.48, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10408, 'FOLIG', 8, '08/02/2022', '08/03/2022', '14/02/2022', 1, 11.26, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10409, 'OCEAN', 3, '09/02/2022', '09/03/2022', '14/02/2022', 1, 29.83, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585
Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10410, 'BOTTM', 3, '10/02/2022', '10/03/2022', '15/02/2022', 3, 2.4, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10411, 'BOTTM', 9, '10/02/2022', '10/03/2022', '21/02/2022', 3, 23.65, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10412, 'WARTH', 8, '13/02/2022', '13/03/2022', '15/02/2022', 2, 3.77, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10413, 'LAMAI', 3, '14/02/2022', '14/03/2022', '16/02/2022', 2, 95.66, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10414, 'FAMIA', 2, '14/02/2022', '14/03/2022', '17/02/2022', 3, 21.48, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10415, 'HUNGC', 3, '15/02/2022', '15/03/2022', '24/02/2022', 1, 0.2, 'Hungry Coyote Import Store', 'City Center Plaza
516 Main St.', 'Elgin', 'OR', '97827', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10416, 'WARTH', 8, '16/02/2022', '16/03/2022', '27/02/2022', 3, 22.72, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10417, 'SIMOB', 4, '16/02/2022', '16/03/2022', '28/02/2022', 3, 70.29, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10418, 'QUICK', 4, '17/02/2022', '17/03/2022', '24/02/2022', 1, 17.55, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10419, 'RICSU', 4, '20/02/2022', '20/03/2022', '02/03/2022', 2, 137.35, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10420, 'WELLI', 3, '21/02/2022', '21/03/2022', '27/02/2022', 1, 44.12, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10421, 'QUEDE', 8, '21/02/2022', '04/04/2022', '27/02/2022', 1, 99.23, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10422, 'FRANS', 2, '22/02/2022', '22/03/2022', '03/03/2022', 1, 3.02, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10423, 'GOURL', 6, '23/02/2022', '09/03/2022', '27/03/2022', 3, 24.5, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10424, 'MEREP', 7, '23/02/2022', '23/03/2022', '27/02/2022', 2, 370.61, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10425, 'LAMAI', 6, '24/02/2022', '24/03/2022', '17/03/2022', 2, 7.93, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10426, 'GALED', 4, '27/02/2022', '27/03/2022', '09/03/2022', 1, 18.69, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10427, 'PICCO', 4, '27/02/2022', '27/03/2022', '03/04/2022', 2, 31.29, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10428, 'REGGC', 7, '28/02/2022', '28/03/2022', '07/03/2022', 1, 11.09, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10429, 'HUNGO', 3, '01/03/2022', '12/04/2022', '10/03/2022', 2, 56.63, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10430, 'ERNSH', 4, '02/03/2022', '16/03/2022', '06/03/2022', 1, 458.78, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10431, 'BOTTM', 4, '02/03/2022', '16/03/2022', '10/03/2022', 2, 44.17, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10432, 'SPLIR', 3, '03/03/2022', '17/03/2022', '10/03/2022', 2, 4.34, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10433, 'PRINI', 3, '06/03/2022', '03/04/2022', '04/04/2022', 3, 73.83, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10434, 'FOLKO', 3, '06/03/2022', '03/04/2022', '16/03/2022', 2, 17.92, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10435, 'CONSH', 8, '07/03/2022', '18/04/2022', '10/03/2022', 2, 9.21, 'Consolidated Holdings', 'Berkeley Gardens
12  Brewery', 'London', NULL, 'WX1 6LT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10436, 'BLONP', 3, '08/03/2022', '05/04/2022', '14/03/2022', 2, 156.66, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10437, 'WARTH', 8, '08/03/2022', '05/04/2022', '15/03/2022', 1, 19.97, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10438, 'TOMSP', 3, '09/03/2022', '06/04/2022', '17/03/2022', 2, 8.24, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10439, 'MEREP', 6, '10/03/2022', '07/04/2022', '13/03/2022', 3, 4.07, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10440, 'SAVEA', 4, '13/03/2022', '10/04/2022', '31/03/2022', 2, 86.53, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10441, 'OLDWO', 3, '13/03/2022', '24/04/2022', '14/04/2022', 2, 73.02, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10442, 'ERNSH', 3, '14/03/2022', '11/04/2022', '21/03/2022', 2, 47.94, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10443, 'REGGC', 8, '15/03/2022', '12/04/2022', '17/03/2022', 1, 13.95, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10444, 'BERGS', 3, '15/03/2022', '12/04/2022', '24/03/2022', 3, 3.5, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10445, 'BERGS', 3, '16/03/2022', '13/04/2022', '23/03/2022', 1, 9.3, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10446, 'TOMSP', 6, '17/03/2022', '14/04/2022', '22/03/2022', 1, 14.68, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10447, 'RICAR', 4, '17/03/2022', '14/04/2022', '07/04/2022', 2, 68.66, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10448, 'RANCH', 4, '20/03/2022', '17/04/2022', '27/03/2022', 2, 38.82, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10449, 'BLONP', 3, '21/03/2022', '18/04/2022', '30/03/2022', 2, 53.3, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10450, 'VICTE', 8, '22/03/2022', '19/04/2022', '11/04/2022', 2, 7.23, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10451, 'QUICK', 4, '22/03/2022', '05/04/2022', '12/04/2022', 3, 189.09, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10452, 'SAVEA', 8, '23/03/2022', '20/04/2022', '29/03/2022', 1, 140.26, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10453, 'AROUT', 1, '24/03/2022', '21/04/2022', '29/03/2022', 2, 25.36, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10454, 'LAMAI', 4, '24/03/2022', '21/04/2022', '28/03/2022', 3, 2.74, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10455, 'WARTH', 8, '27/03/2022', '08/05/2022', '03/04/2022', 2, 180.45, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10456, 'KOENE', 8, '28/03/2022', '09/05/2022', '31/03/2022', 2, 8.12, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10457, 'KOENE', 2, '28/03/2022', '25/04/2022', '03/04/2022', 1, 11.57, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10458, 'SUPRD', 7, '29/03/2022', '26/04/2022', '04/04/2022', 3, 147.06, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10459, 'VICTE', 4, '30/03/2022', '27/04/2022', '31/03/2022', 2, 25.09, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10460, 'FOLKO', 8, '31/03/2022', '28/04/2022', '03/04/2022', 1, 16.27, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10461, 'LILAS', 1, '31/03/2022', '28/04/2022', '05/04/2022', 3, 148.61, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10462, 'CONSH', 2, '03/04/2022', '01/05/2022', '18/04/2022', 1, 6.17, 'Consolidated Holdings', 'Berkeley Gardens
12  Brewery', 'London', NULL, 'WX1 6LT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10463, 'SUPRD', 5, '04/04/2022', '02/05/2022', '06/04/2022', 3, 14.78, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10464, 'FURIB', 4, '04/04/2022', '02/05/2022', '14/04/2022', 2, 89, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10465, 'VAFFE', 1, '05/04/2022', '03/05/2022', '14/04/2022', 3, 145.04, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10466, 'COMMI', 4, '06/04/2022', '04/05/2022', '13/04/2022', 1, 11.93, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10467, 'MAGAA', 8, '06/04/2022', '04/05/2022', '11/04/2022', 2, 4.93, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10468, 'KOENE', 3, '07/04/2022', '05/05/2022', '12/04/2022', 3, 44.12, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10469, 'WHITC', 1, '10/04/2022', '08/05/2022', '14/04/2022', 1, 60.18, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10470, 'BONAP', 4, '11/04/2022', '09/05/2022', '14/04/2022', 2, 64.56, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10471, 'BSBEV', 2, '11/04/2022', '09/05/2022', '18/04/2022', 3, 45.59, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10472, 'SEVES', 8, '12/04/2022', '10/05/2022', '19/04/2022', 1, 4.2, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10473, 'ISLAT', 1, '13/04/2022', '27/04/2022', '21/04/2022', 3, 16.37, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10474, 'PERIC', 5, '13/04/2022', '11/05/2022', '21/04/2022', 2, 83.49, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10475, 'SUPRD', 9, '14/04/2022', '12/05/2022', '05/05/2022', 1, 68.52, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10476, 'HILAA', 8, '17/04/2022', '15/05/2022', '24/04/2022', 3, 4.41, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10477, 'PRINI', 5, '17/04/2022', '15/05/2022', '25/04/2022', 2, 13.02, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10478, 'VICTE', 2, '18/04/2022', '02/05/2022', '26/04/2022', 3, 4.81, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10479, 'RATTC', 3, '19/04/2022', '17/05/2022', '21/04/2022', 3, 708.95, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10480, 'FOLIG', 6, '20/04/2022', '18/05/2022', '24/04/2022', 2, 1.35, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10481, 'RICAR', 8, '20/04/2022', '18/05/2022', '25/04/2022', 2, 64.33, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10482, 'LAZYK', 1, '21/04/2022', '19/05/2022', '11/05/2022', 3, 7.48, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10483, 'WHITC', 7, '24/04/2022', '22/05/2022', '26/05/2022', 2, 15.28, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10484, 'BSBEV', 3, '24/04/2022', '22/05/2022', '02/05/2022', 3, 6.88, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10485, 'LINOD', 4, '25/04/2022', '09/05/2022', '01/05/2022', 2, 64.45, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10486, 'HILAA', 1, '26/04/2022', '24/05/2022', '03/05/2022', 2, 30.53, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10487, 'QUEEN', 2, '26/04/2022', '24/05/2022', '28/04/2022', 2, 71.07, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10488, 'FRANK', 8, '27/04/2022', '25/05/2022', '03/05/2022', 2, 4.93, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10489, 'PICCO', 6, '28/04/2022', '26/05/2022', '10/05/2022', 2, 5.29, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10490, 'HILAA', 7, '01/05/2022', '29/05/2022', '04/05/2022', 2, 210.19, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10491, 'FURIB', 8, '01/05/2022', '29/05/2022', '09/05/2022', 3, 16.96, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10492, 'BOTTM', 3, '02/05/2022', '30/05/2022', '12/05/2022', 1, 62.89, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10493, 'LAMAI', 4, '03/05/2022', '31/05/2022', '11/05/2022', 3, 10.64, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10494, 'COMMI', 4, '03/05/2022', '31/05/2022', '10/05/2022', 2, 65.99, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10495, 'LAUGB', 3, '04/05/2022', '01/06/2022', '12/05/2022', 3, 4.65, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10496, 'TRADH', 7, '05/05/2022', '02/06/2022', '08/05/2022', 2, 46.77, 'Tradição Hipermercados', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10497, 'LEHMS', 7, '05/05/2022', '02/06/2022', '08/05/2022', 1, 36.21, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10498, 'HILAA', 8, '08/05/2022', '05/06/2022', '12/05/2022', 2, 29.75, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10499, 'LILAS', 4, '09/05/2022', '06/06/2022', '17/05/2022', 2, 102.02, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10500, 'LAMAI', 6, '10/05/2022', '07/06/2022', '18/05/2022', 1, 42.68, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10501, 'BLAUS', 9, '10/05/2022', '07/06/2022', '17/05/2022', 3, 8.85, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10502, 'PERIC', 2, '11/05/2022', '08/06/2022', '30/05/2022', 1, 69.32, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10503, 'HUNGO', 6, '12/05/2022', '09/06/2022', '17/05/2022', 2, 16.74, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10504, 'WHITC', 4, '12/05/2022', '09/06/2022', '19/05/2022', 3, 59.13, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10505, 'MEREP', 3, '15/05/2022', '12/06/2022', '22/05/2022', 3, 7.13, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10506, 'KOENE', 9, '16/05/2022', '13/06/2022', '02/06/2022', 2, 21.19, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10507, 'ANTON', 7, '16/05/2022', '13/06/2022', '23/05/2022', 1, 47.45, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10508, 'OTTIK', 1, '17/05/2022', '14/06/2022', '13/06/2022', 2, 4.99, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10509, 'BLAUS', 4, '18/05/2022', '15/06/2022', '30/05/2022', 1, 0.15, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10510, 'SAVEA', 6, '19/05/2022', '16/06/2022', '29/05/2022', 3, 367.63, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10511, 'BONAP', 4, '19/05/2022', '16/06/2022', '22/05/2022', 3, 350.64, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10512, 'FAMIA', 7, '22/05/2022', '19/06/2022', '25/05/2022', 2, 3.53, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10513, 'WANDK', 7, '23/05/2022', '04/07/2022', '29/05/2022', 1, 105.65, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10514, 'ERNSH', 3, '23/05/2022', '20/06/2022', '16/06/2022', 2, 789.95, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10515, 'QUICK', 2, '24/05/2022', '07/06/2022', '23/06/2022', 1, 204.47, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10516, 'HUNGO', 2, '25/05/2022', '22/06/2022', '01/06/2022', 3, 62.78, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10517, 'NORTS', 3, '25/05/2022', '22/06/2022', '30/05/2022', 3, 32.07, 'North/South', 'South House
300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10518, 'TORTU', 4, '26/05/2022', '09/06/2022', '05/06/2022', 2, 218.15, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10519, 'CHOPS', 6, '29/05/2022', '26/06/2022', '01/06/2022', 3, 91.76, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10520, 'SANTG', 7, '30/05/2022', '27/06/2022', '01/06/2022', 1, 13.37, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega')
GO

INSERT INTO Pedidos 
VALUES 
  (10521, 'CACTU', 8, '30/05/2022', '27/06/2022', '02/06/2022', 2, 17.22, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10522, 'LEHMS', 4, '31/05/2022', '28/06/2022', '06/06/2022', 1, 45.33, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10523, 'SEVES', 7, '01/06/2022', '29/06/2022', '30/06/2022', 2, 77.63, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10524, 'BERGS', 1, '01/06/2022', '29/06/2022', '07/06/2022', 2, 244.79, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10525, 'BONAP', 1, '02/06/2022', '30/06/2022', '23/06/2022', 2, 11.06, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10526, 'WARTH', 4, '05/06/2022', '03/07/2022', '15/06/2022', 2, 58.59, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10527, 'QUICK', 7, '05/06/2022', '03/07/2022', '07/06/2022', 1, 41.9, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10528, 'GREAL', 6, '06/06/2022', '20/06/2022', '09/06/2022', 2, 3.35, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10529, 'MAISD', 5, '07/06/2022', '05/07/2022', '09/06/2022', 2, 66.69, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10530, 'PICCO', 3, '08/06/2022', '06/07/2022', '12/06/2022', 2, 339.22, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10531, 'OCEAN', 7, '08/06/2022', '06/07/2022', '19/06/2022', 1, 8.12, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585
Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10532, 'EASTC', 7, '09/06/2022', '07/07/2022', '12/06/2022', 3, 74.46, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10533, 'FOLKO', 8, '12/06/2022', '10/07/2022', '22/06/2022', 1, 188.04, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10534, 'LEHMS', 8, '12/06/2022', '10/07/2022', '14/06/2022', 2, 27.94, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10535, 'ANTON', 4, '13/06/2022', '11/07/2022', '21/06/2022', 1, 15.64, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10536, 'LEHMS', 3, '14/06/2022', '12/07/2022', '07/07/2022', 2, 58.88, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10537, 'RICSU', 1, '14/06/2022', '28/06/2022', '19/06/2022', 1, 78.85, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10538, 'BSBEV', 9, '15/06/2022', '13/07/2022', '16/06/2022', 3, 4.87, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10539, 'BSBEV', 6, '16/06/2022', '14/07/2022', '23/06/2022', 3, 12.36, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10540, 'QUICK', 3, '19/06/2022', '17/07/2022', '14/07/2022', 3, 1007.64, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10541, 'HANAR', 2, '19/06/2022', '17/07/2022', '29/06/2022', 1, 68.65, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10542, 'KOENE', 1, '20/06/2022', '18/07/2022', '26/06/2022', 3, 10.95, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10543, 'LILAS', 8, '21/06/2022', '19/07/2022', '23/06/2022', 2, 48.17, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10544, 'LONEP', 4, '21/06/2022', '19/07/2022', '30/06/2022', 1, 24.91, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10545, 'LAZYK', 8, '22/06/2022', '20/07/2022', '27/07/2022', 2, 11.92, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10546, 'VICTE', 1, '23/06/2022', '21/07/2022', '27/06/2022', 3, 194.72, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10547, 'SEVES', 3, '23/06/2022', '21/07/2022', '03/07/2022', 2, 178.43, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10548, 'TOMSP', 3, '26/06/2022', '24/07/2022', '03/07/2022', 2, 1.43, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10549, 'QUICK', 5, '27/06/2022', '11/07/2022', '30/06/2022', 1, 171.24, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10550, 'GODOS', 7, '28/06/2022', '26/07/2022', '07/07/2022', 3, 4.32, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10551, 'FURIB', 4, '28/06/2022', '09/08/2022', '07/07/2022', 3, 72.95, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10552, 'HILAA', 2, '29/06/2022', '27/07/2022', '06/07/2022', 1, 83.22, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10553, 'WARTH', 2, '30/06/2022', '28/07/2022', '04/07/2022', 2, 149.49, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10554, 'OTTIK', 4, '30/06/2022', '28/07/2022', '06/07/2022', 3, 120.97, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10555, 'SAVEA', 6, '03/07/2022', '31/07/2022', '05/07/2022', 3, 252.49, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10556, 'SIMOB', 2, '04/07/2022', '15/08/2022', '14/07/2022', 1, 9.8, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10557, 'LEHMS', 9, '04/07/2022', '18/07/2022', '07/07/2022', 2, 96.72, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10558, 'AROUT', 1, '05/07/2022', '02/08/2022', '11/07/2022', 2, 72.97, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10559, 'BLONP', 6, '06/07/2022', '03/08/2022', '14/07/2022', 1, 8.05, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10560, 'FRANK', 8, '07/07/2022', '04/08/2022', '10/07/2022', 1, 36.65, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10561, 'FOLKO', 2, '07/07/2022', '04/08/2022', '10/07/2022', 2, 242.21, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10562, 'REGGC', 1, '10/07/2022', '07/08/2022', '13/07/2022', 1, 22.95, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10563, 'RICAR', 2, '11/07/2022', '22/08/2022', '25/07/2022', 2, 60.43, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10564, 'RATTC', 4, '11/07/2022', '08/08/2022', '17/07/2022', 3, 13.75, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10565, 'MEREP', 8, '12/07/2022', '09/08/2022', '19/07/2022', 2, 7.15, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10566, 'BLONP', 9, '13/07/2022', '10/08/2022', '19/07/2022', 1, 88.4, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10567, 'HUNGO', 1, '13/07/2022', '10/08/2022', '18/07/2022', 1, 33.97, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10568, 'GALED', 3, '14/07/2022', '11/08/2022', '09/08/2022', 3, 6.54, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10569, 'RATTC', 5, '17/07/2022', '14/08/2022', '11/08/2022', 1, 58.98, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10570, 'MEREP', 3, '18/07/2022', '15/08/2022', '20/07/2022', 3, 188.99, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10571, 'ERNSH', 8, '18/07/2022', '29/08/2022', '04/08/2022', 3, 26.06, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10572, 'BERGS', 3, '19/07/2022', '16/08/2022', '26/07/2022', 2, 116.43, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10573, 'ANTON', 7, '20/07/2022', '17/08/2022', '21/07/2022', 3, 84.84, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10574, 'TRAIH', 4, '20/07/2022', '17/08/2022', '31/07/2022', 2, 37.6, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10575, 'MORGK', 5, '21/07/2022', '04/08/2022', '31/07/2022', 1, 127.34, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10576, 'TORTU', 3, '24/07/2022', '07/08/2022', '31/07/2022', 3, 18.56, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10577, 'TRAIH', 9, '24/07/2022', '04/09/2022', '31/07/2022', 2, 25.41, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10578, 'BSBEV', 4, '25/07/2022', '22/08/2022', '25/08/2022', 3, 29.6, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10579, 'LETSS', 1, '26/07/2022', '23/08/2022', '04/08/2022', 2, 13.73, 'Let''s Stop N Shop', '87 Polk St.
Suite 5', 'San Francisco', 'CA', '94117', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10580, 'OTTIK', 4, '27/07/2022', '24/08/2022', '01/08/2022', 3, 75.89, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10581, 'FAMIA', 3, '27/07/2022', '24/08/2022', '02/08/2022', 1, 3.01, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10582, 'BLAUS', 3, '28/07/2022', '25/08/2022', '14/08/2022', 2, 27.71, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10583, 'WARTH', 2, '31/07/2022', '28/08/2022', '04/08/2022', 2, 7.28, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10584, 'BLONP', 4, '31/07/2022', '28/08/2022', '04/08/2022', 1, 59.14, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10585, 'WELLI', 7, '01/08/2022', '29/08/2022', '10/08/2022', 1, 13.41, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10586, 'REGGC', 9, '02/08/2022', '30/08/2022', '09/08/2022', 1, 0.48, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10587, 'QUEDE', 1, '02/08/2022', '30/08/2022', '09/08/2022', 1, 62.52, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10588, 'QUICK', 2, '03/08/2022', '31/08/2022', '10/08/2022', 3, 194.67, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10589, 'GREAL', 8, '04/08/2022', '01/09/2022', '14/08/2022', 2, 4.42, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10590, 'MEREP', 4, '07/08/2022', '04/09/2022', '14/08/2022', 3, 44.77, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10591, 'VAFFE', 1, '07/08/2022', '21/08/2022', '16/08/2022', 1, 55.92, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10592, 'LEHMS', 3, '08/08/2022', '05/09/2022', '16/08/2022', 1, 32.1, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10593, 'LEHMS', 7, '09/08/2022', '06/09/2022', '13/09/2022', 2, 174.2, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10594, 'OLDWO', 3, '09/08/2022', '06/09/2022', '16/08/2022', 2, 5.24, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10595, 'ERNSH', 2, '10/08/2022', '07/09/2022', '14/08/2022', 1, 96.78, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10596, 'WHITC', 8, '11/08/2022', '08/09/2022', '12/09/2022', 1, 16.34, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10597, 'PICCO', 7, '11/08/2022', '08/09/2022', '18/08/2022', 3, 35.12, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10598, 'RATTC', 1, '14/08/2022', '11/09/2022', '18/08/2022', 3, 44.42, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10599, 'BSBEV', 6, '15/08/2022', '26/09/2022', '21/08/2022', 3, 29.98, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10600, 'HUNGC', 4, '16/08/2022', '13/09/2022', '21/08/2022', 1, 45.13, 'Hungry Coyote Import Store', 'City Center Plaza
516 Main St.', 'Elgin', 'OR', '97827', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10601, 'HILAA', 7, '16/08/2022', '27/09/2022', '22/08/2022', 1, 58.3, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10602, 'VAFFE', 8, '17/08/2022', '14/09/2022', '22/08/2022', 2, 2.92, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10603, 'SAVEA', 8, '18/08/2022', '15/09/2022', '08/09/2022', 2, 48.77, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10604, 'FURIB', 1, '18/08/2022', '15/09/2022', '29/08/2022', 1, 7.46, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10605, 'MEREP', 1, '21/08/2022', '18/09/2022', '29/08/2022', 2, 379.13, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10606, 'TRADH', 4, '22/08/2022', '19/09/2022', '31/08/2022', 3, 79.4, 'Tradição Hipermercados', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10607, 'SAVEA', 5, '22/08/2022', '19/09/2022', '25/08/2022', 1, 200.24, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10608, 'TOMSP', 4, '23/08/2022', '20/09/2022', '01/09/2022', 2, 27.79, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10609, 'DUMON', 7, '24/08/2022', '21/09/2022', '30/08/2022', 2, 1.85, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10610, 'LAMAI', 8, '25/08/2022', '22/09/2022', '06/09/2022', 1, 26.78, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10611, 'WOLZA', 6, '25/08/2022', '22/09/2022', '01/09/2022', 2, 80.65, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polonia')
GO

INSERT INTO Pedidos 
VALUES 
  (10612, 'SAVEA', 1, '28/08/2022', '25/09/2022', '01/09/2022', 2, 544.08, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10613, 'HILAA', 4, '29/08/2022', '26/09/2022', '01/09/2022', 2, 8.11, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10614, 'BLAUS', 8, '29/08/2022', '26/09/2022', '01/09/2022', 3, 1.93, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10615, 'WILMK', 2, '30/08/2022', '27/09/2022', '06/09/2022', 3, 0.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10616, 'GREAL', 1, '31/08/2022', '28/09/2022', '05/09/2022', 2, 116.53, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10617, 'GREAL', 4, '31/08/2022', '28/09/2022', '04/09/2022', 2, 18.53, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10618, 'MEREP', 1, '01/09/2022', '13/10/2022', '08/09/2022', 1, 154.68, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10619, 'MEREP', 3, '04/09/2022', '02/10/2022', '07/09/2022', 3, 91.05, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10620, 'LAUGB', 2, '05/09/2022', '03/10/2022', '14/09/2022', 3, 0.94, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10621, 'ISLAT', 4, '05/09/2022', '03/10/2022', '11/09/2022', 2, 23.73, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10622, 'RICAR', 4, '06/09/2022', '04/10/2022', '11/09/2022', 3, 50.97, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10623, 'FRANK', 8, '07/09/2022', '05/10/2022', '12/09/2022', 2, 97.18, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10624, 'THECR', 4, '07/09/2022', '05/10/2022', '19/09/2022', 2, 94.8, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10625, 'ANATR', 3, '08/09/2022', '06/10/2022', '14/09/2022', 1, 43.9, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10626, 'BERGS', 1, '11/09/2022', '09/10/2022', '20/09/2022', 2, 138.69, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10627, 'SAVEA', 8, '11/09/2022', '23/10/2022', '21/09/2022', 3, 107.46, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10628, 'BLONP', 4, '12/09/2022', '10/10/2022', '20/09/2022', 3, 30.36, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10629, 'GODOS', 4, '12/09/2022', '10/10/2022', '20/09/2022', 3, 85.46, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10630, 'KOENE', 1, '13/09/2022', '11/10/2022', '19/09/2022', 2, 32.35, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10631, 'LAMAI', 8, '14/09/2022', '12/10/2022', '15/09/2022', 1, 0.87, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10632, 'WANDK', 8, '14/09/2022', '12/10/2022', '19/09/2022', 1, 41.38, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10633, 'ERNSH', 7, '15/09/2022', '13/10/2022', '18/09/2022', 3, 477.9, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10634, 'FOLIG', 4, '15/09/2022', '13/10/2022', '21/09/2022', 3, 487.38, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10635, 'MAGAA', 8, '18/09/2022', '16/10/2022', '21/09/2022', 3, 47.46, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10636, 'WARTH', 4, '19/09/2022', '17/10/2022', '26/09/2022', 1, 1.15, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10637, 'QUEEN', 6, '19/09/2022', '17/10/2022', '26/09/2022', 1, 201.29, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10638, 'LINOD', 3, '20/09/2022', '18/10/2022', '02/10/2022', 1, 158.44, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10639, 'SANTG', 7, '20/09/2022', '18/10/2022', '27/09/2022', 3, 38.64, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega')
GO

INSERT INTO Pedidos 
VALUES 
  (10640, 'WANDK', 4, '21/09/2022', '19/10/2022', '28/09/2022', 1, 23.55, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10641, 'HILAA', 4, '22/09/2022', '20/10/2022', '26/09/2022', 2, 179.61, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10642, 'SIMOB', 7, '22/09/2022', '20/10/2022', '06/10/2022', 3, 41.89, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10643, 'ALFKI', 6, '25/09/2022', '23/10/2022', '03/10/2022', 2, 29.46, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlín', NULL, '12209', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10644, 'WELLI', 3, '25/09/2022', '23/10/2022', '02/10/2022', 2, 0.14, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10645, 'HANAR', 4, '26/09/2022', '24/10/2022', '03/10/2022', 1, 12.41, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10646, 'HUNGO', 9, '27/09/2022', '08/11/2022', '04/10/2022', 3, 142.33, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10647, 'QUEDE', 4, '27/09/2022', '11/10/2022', '04/10/2022', 2, 45.54, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10648, 'RICAR', 5, '28/09/2022', '09/11/2022', '10/10/2022', 2, 14.25, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10649, 'MAISD', 5, '28/09/2022', '26/10/2022', '29/09/2022', 3, 6.2, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10650, 'FAMIA', 5, '29/09/2022', '27/10/2022', '04/10/2022', 3, 176.81, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10651, 'WANDK', 8, '02/10/2022', '30/10/2022', '12/10/2022', 2, 20.6, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10652, 'GOURL', 4, '02/10/2022', '30/10/2022', '09/10/2022', 2, 7.14, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10653, 'FRANK', 1, '03/10/2022', '31/10/2022', '20/10/2022', 1, 93.25, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10654, 'BERGS', 5, '03/10/2022', '31/10/2022', '12/10/2022', 1, 55.26, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10655, 'REGGC', 1, '04/10/2022', '01/11/2022', '12/10/2022', 2, 4.41, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10656, 'GREAL', 6, '05/10/2022', '02/11/2022', '11/10/2022', 1, 57.15, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10657, 'SAVEA', 2, '05/10/2022', '02/11/2022', '16/10/2022', 2, 352.69, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10658, 'QUICK', 4, '06/10/2022', '03/11/2022', '09/10/2022', 1, 364.15, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10659, 'QUEEN', 7, '06/10/2022', '03/11/2022', '11/10/2022', 2, 105.81, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10660, 'HUNGC', 8, '09/10/2022', '06/11/2022', '15/11/2022', 1, 111.29, 'Hungry Coyote Import Store', 'City Center Plaza
516 Main St.', 'Elgin', 'OR', '97827', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10661, 'HUNGO', 7, '10/10/2022', '07/11/2022', '16/10/2022', 3, 17.55, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10662, 'LONEP', 3, '10/10/2022', '07/11/2022', '19/10/2022', 2, 1.28, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10663, 'BONAP', 2, '11/10/2022', '25/10/2022', '03/11/2022', 2, 113.15, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10664, 'FURIB', 1, '11/10/2022', '08/11/2022', '20/10/2022', 3, 1.27, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10665, 'LONEP', 1, '12/10/2022', '09/11/2022', '18/10/2022', 2, 26.31, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10666, 'RICSU', 7, '13/10/2022', '10/11/2022', '23/10/2022', 2, 232.42, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10667, 'ERNSH', 7, '13/10/2022', '10/11/2022', '20/10/2022', 1, 78.09, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10668, 'WANDK', 1, '16/10/2022', '13/11/2022', '24/10/2022', 2, 47.22, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10669, 'SIMOB', 2, '16/10/2022', '13/11/2022', '23/10/2022', 1, 24.39, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10670, 'FRANK', 4, '17/10/2022', '14/11/2022', '19/10/2022', 1, 203.48, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10671, 'FRANR', 1, '18/10/2022', '15/11/2022', '25/10/2022', 1, 30.34, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10672, 'BERGS', 9, '18/10/2022', '01/11/2022', '27/10/2022', 2, 95.75, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10673, 'WILMK', 2, '19/10/2022', '16/11/2022', '20/10/2022', 1, 22.76, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10674, 'ISLAT', 4, '19/10/2022', '16/11/2022', '31/10/2022', 2, 0.9, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10675, 'FRANK', 5, '20/10/2022', '17/11/2022', '24/10/2022', 2, 31.85, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10676, 'TORTU', 2, '23/10/2022', '20/11/2022', '30/10/2022', 2, 2.01, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10677, 'ANTON', 1, '23/10/2022', '20/11/2022', '27/10/2022', 3, 4.03, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10678, 'SAVEA', 7, '24/10/2022', '21/11/2022', '16/11/2022', 3, 388.98, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10679, 'BLONP', 8, '24/10/2022', '21/11/2022', '31/10/2022', 3, 27.94, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10680, 'OLDWO', 1, '25/10/2022', '22/11/2022', '27/10/2022', 1, 26.61, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10681, 'GREAL', 3, '26/10/2022', '23/11/2022', '31/10/2022', 3, 76.13, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10682, 'ANTON', 3, '26/10/2022', '23/11/2022', '01/11/2022', 2, 36.13, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10683, 'DUMON', 2, '27/10/2022', '24/11/2022', '01/11/2022', 1, 4.4, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10684, 'OTTIK', 3, '27/10/2022', '24/11/2022', '31/10/2022', 1, 145.63, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10685, 'GOURL', 4, '30/10/2022', '13/11/2022', '03/11/2022', 2, 33.75, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10686, 'PICCO', 2, '31/10/2022', '28/11/2022', '08/11/2022', 1, 96.5, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10687, 'HUNGO', 9, '31/10/2022', '28/11/2022', '30/11/2022', 2, 296.43, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10688, 'VAFFE', 4, '01/11/2022', '15/11/2022', '07/11/2022', 2, 299.09, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10689, 'BERGS', 1, '01/11/2022', '29/11/2022', '07/11/2022', 2, 13.42, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10690, 'HANAR', 1, '02/11/2022', '30/11/2022', '03/11/2022', 1, 15.8, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10691, 'QUICK', 2, '03/11/2022', '15/12/2022', '22/11/2022', 2, 810.05, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10692, 'ALFKI', 4, '03/11/2022', '01/12/2022', '13/11/2022', 2, 61.02, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlín', NULL, '12209', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10693, 'WHITC', 3, '06/11/2022', '20/11/2022', '10/11/2022', 3, 139.34, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10694, 'QUICK', 8, '06/11/2022', '04/12/2022', '09/11/2022', 3, 398.36, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10695, 'WILMK', 7, '07/11/2022', '19/12/2022', '14/11/2022', 1, 16.72, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10696, 'WHITC', 8, '08/11/2022', '20/12/2022', '14/11/2022', 3, 102.55, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10697, 'LINOD', 3, '08/11/2022', '06/12/2022', '14/11/2022', 1, 45.52, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10698, 'ERNSH', 4, '09/11/2022', '07/12/2022', '17/11/2022', 1, 272.47, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10699, 'MORGK', 3, '09/11/2022', '07/12/2022', '13/11/2022', 3, 0.58, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10700, 'SAVEA', 3, '10/11/2022', '08/12/2022', '16/11/2022', 1, 65.1, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10701, 'HUNGO', 6, '13/11/2022', '27/11/2022', '15/11/2022', 3, 220.31, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10702, 'ALFKI', 4, '13/11/2022', '25/12/2022', '21/11/2022', 1, 23.94, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlín', NULL, '12209', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10703, 'FOLKO', 6, '14/11/2022', '12/12/2022', '20/11/2022', 2, 152.3, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10704, 'QUEEN', 6, '14/11/2022', '12/12/2022', '08/12/2022', 1, 4.78, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10705, 'HILAA', 9, '15/11/2022', '13/12/2022', '19/12/2022', 2, 3.52, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10706, 'OLDWO', 8, '16/11/2022', '14/12/2022', '21/11/2022', 3, 135.63, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10707, 'AROUT', 4, '16/11/2022', '30/11/2022', '23/11/2022', 3, 21.74, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10708, 'THEBI', 6, '17/11/2022', '29/12/2022', '06/12/2022', 2, 2.96, 'The Big Cheese', '89 Jefferson Way
Suite 2', 'Portland', 'OR', '97201', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10709, 'GOURL', 1, '17/11/2022', '15/12/2022', '21/12/2022', 3, 210.8, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10710, 'FRANS', 1, '20/11/2022', '18/12/2022', '23/11/2022', 1, 4.98, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10711, 'SAVEA', 5, '21/11/2022', '02/01/2023', '29/11/2022', 2, 52.41, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10712, 'HUNGO', 3, '21/11/2022', '19/12/2022', '01/12/2022', 1, 89.93, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10713, 'SAVEA', 1, '22/11/2022', '20/12/2022', '24/11/2022', 1, 167.05, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10714, 'SAVEA', 5, '22/11/2022', '20/12/2022', '27/11/2022', 3, 24.49, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10715, 'BONAP', 3, '23/11/2022', '07/12/2022', '29/11/2022', 1, 63.2, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10716, 'RANCH', 4, '24/11/2022', '22/12/2022', '27/11/2022', 2, 22.57, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10717, 'FRANK', 1, '24/11/2022', '22/12/2022', '29/11/2022', 2, 59.25, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10718, 'KOENE', 1, '27/11/2022', '25/12/2022', '29/11/2022', 3, 170.88, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10719, 'LETSS', 8, '27/11/2022', '25/12/2022', '06/12/2022', 2, 51.44, 'Let''s Stop N Shop', '87 Polk St.
Suite 5', 'San Francisco', 'CA', '94117', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10720, 'QUEDE', 8, '28/11/2022', '12/12/2022', '06/12/2022', 2, 9.53, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10721, 'QUICK', 5, '29/11/2022', '27/12/2022', '01/12/2022', 3, 48.92, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10722, 'SAVEA', 8, '29/11/2022', '10/01/2023', '05/12/2022', 1, 74.58, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10723, 'WHITC', 3, '30/11/2022', '28/12/2022', '26/12/2022', 1, 21.72, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10724, 'MEREP', 8, '30/11/2022', '11/01/2023', '06/12/2022', 2, 57.75, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10725, 'FAMIA', 4, '01/12/2022', '29/12/2022', '06/12/2022', 3, 10.83, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10726, 'EASTC', 4, '04/12/2022', '18/12/2022', '05/01/2023', 1, 16.56, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10727, 'REGGC', 2, '04/12/2022', '01/01/2023', '05/01/2023', 1, 89.9, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10728, 'QUEEN', 4, '05/12/2022', '02/01/2023', '12/12/2022', 2, 58.33, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10729, 'LINOD', 8, '05/12/2022', '16/01/2023', '15/12/2022', 3, 141.06, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10730, 'BONAP', 5, '06/12/2022', '03/01/2023', '15/12/2022', 1, 20.12, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10731, 'CHOPS', 7, '07/12/2022', '04/01/2023', '15/12/2022', 1, 96.65, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10732, 'BONAP', 3, '07/12/2022', '04/01/2023', '08/12/2022', 1, 16.97, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10733, 'BERGS', 1, '08/12/2022', '05/01/2023', '11/12/2022', 3, 110.11, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10734, 'GOURL', 2, '08/12/2022', '05/01/2023', '13/12/2022', 3, 1.63, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10735, 'LETSS', 6, '11/12/2022', '08/01/2023', '22/12/2022', 2, 45.97, 'Let''s Stop N Shop', '87 Polk St.
Suite 5', 'San Francisco', 'CA', '94117', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10736, 'HUNGO', 9, '12/12/2022', '09/01/2023', '22/12/2022', 2, 44.1, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10737, 'VINET', 2, '12/12/2022', '09/01/2023', '19/12/2022', 2, 7.79, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10738, 'SPECD', 2, '13/12/2022', '10/01/2023', '19/12/2022', 1, 2.91, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10739, 'VINET', 3, '13/12/2022', '10/01/2023', '18/12/2022', 3, 11.08, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10740, 'WHITC', 4, '14/12/2022', '11/01/2023', '26/12/2022', 2, 81.88, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10741, 'BERGS', 4, '15/12/2022', '29/12/2022', '19/12/2022', 3, 10.96, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10742, 'BOTTM', 3, '15/12/2022', '12/01/2023', '19/12/2022', 3, 243.73, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10743, 'AROUT', 1, '18/12/2022', '15/01/2023', '22/12/2022', 2, 23.72, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10744, 'VAFFE', 6, '18/12/2022', '15/01/2023', '25/12/2022', 1, 69.19, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10745, 'QUICK', 9, '19/12/2022', '16/01/2023', '28/12/2022', 1, 3.52, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10746, 'CHOPS', 1, '20/12/2022', '17/01/2023', '22/12/2022', 3, 31.43, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10747, 'PICCO', 6, '20/12/2022', '17/01/2023', '27/12/2022', 1, 117.33, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

--
-- Data for table Pedidos  (LIMIT 500,500)
--

INSERT INTO Pedidos 
VALUES 
  (10748, 'SAVEA', 3, '21/12/2022', '18/01/2023', '29/12/2022', 1, 232.55, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10749, 'ISLAT', 4, '21/12/2022', '18/01/2023', '19/01/2023', 2, 61.53, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10750, 'WARTH', 9, '22/12/2022', '19/01/2023', '25/12/2022', 1, 79.3, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10751, 'RICSU', 3, '25/12/2022', '22/01/2023', '03/01/2023', 3, 130.79, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10752, 'NORTS', 2, '25/12/2022', '22/01/2023', '29/12/2022', 3, 1.39, 'North/South', 'South House
300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10753, 'FRANS', 3, '26/12/2022', '23/01/2023', '28/12/2022', 1, 7.7, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10754, 'MAGAA', 6, '26/12/2022', '23/01/2023', '28/12/2022', 3, 2.38, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10755, 'BONAP', 4, '27/12/2022', '24/01/2023', '29/12/2022', 2, 16.71, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10756, 'SPLIR', 8, '28/12/2022', '25/01/2023', '02/01/2023', 2, 73.21, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10757, 'SAVEA', 6, '28/12/2022', '25/01/2023', '15/01/2023', 1, 8.19, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10758, 'RICSU', 3, '29/12/2022', '26/01/2023', '04/01/2023', 3, 138.17, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10759, 'ANATR', 3, '29/12/2022', '26/01/2023', '12/01/2023', 3, 11.99, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10760, 'MAISD', 4, '01/01/2023', '29/01/2023', '10/01/2023', 1, 155.64, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10761, 'RATTC', 5, '02/01/2023', '30/01/2023', '08/01/2023', 2, 18.66, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10762, 'FOLKO', 3, '02/01/2023', '30/01/2023', '09/01/2023', 1, 328.74, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10763, 'FOLIG', 3, '03/01/2023', '31/01/2023', '08/01/2023', 3, 37.35, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10764, 'ERNSH', 6, '03/01/2023', '31/01/2023', '08/01/2023', 3, 145.45, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10765, 'QUICK', 3, '04/01/2023', '01/02/2023', '09/01/2023', 3, 42.74, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10766, 'OTTIK', 4, '05/01/2023', '02/02/2023', '09/01/2023', 1, 157.55, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10767, 'SUPRD', 4, '05/01/2023', '02/02/2023', '15/01/2023', 3, 1.59, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10768, 'AROUT', 3, '08/01/2023', '05/02/2023', '15/01/2023', 2, 146.32, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10769, 'VAFFE', 3, '08/01/2023', '05/02/2023', '12/01/2023', 1, 65.06, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10770, 'HANAR', 8, '09/01/2023', '06/02/2023', '17/01/2023', 3, 5.32, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10771, 'ERNSH', 9, '10/01/2023', '07/02/2023', '02/02/2023', 2, 11.19, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10772, 'LEHMS', 3, '10/01/2023', '07/02/2023', '19/01/2023', 2, 91.28, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10773, 'ERNSH', 1, '11/01/2023', '08/02/2023', '16/01/2023', 3, 96.43, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10774, 'FOLKO', 4, '11/01/2023', '25/01/2023', '12/01/2023', 1, 48.2, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10775, 'THECR', 7, '12/01/2023', '09/02/2023', '26/01/2023', 1, 20.25, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10776, 'ERNSH', 1, '15/01/2023', '12/02/2023', '18/01/2023', 3, 351.53, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10777, 'GOURL', 7, '15/01/2023', '29/01/2023', '21/02/2023', 2, 3.01, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10778, 'BERGS', 3, '16/01/2023', '13/02/2023', '24/01/2023', 1, 6.79, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10779, 'MORGK', 3, '16/01/2023', '13/02/2023', '14/02/2023', 2, 58.13, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10780, 'LILAS', 2, '16/01/2023', '30/01/2023', '25/01/2023', 1, 42.13, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10781, 'WARTH', 2, '17/01/2023', '14/02/2023', '19/01/2023', 3, 73.16, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10782, 'CACTU', 9, '17/01/2023', '14/02/2023', '22/01/2023', 3, 1.1, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10783, 'HANAR', 4, '18/01/2023', '15/02/2023', '19/01/2023', 2, 124.98, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10784, 'MAGAA', 4, '18/01/2023', '15/02/2023', '22/01/2023', 3, 70.09, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10785, 'GROSR', 1, '18/01/2023', '15/02/2023', '24/01/2023', 3, 1.51, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10786, 'QUEEN', 8, '19/01/2023', '16/02/2023', '23/01/2023', 1, 110.87, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10787, 'LAMAI', 2, '19/01/2023', '02/02/2023', '26/01/2023', 1, 249.93, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10788, 'QUICK', 1, '22/01/2023', '19/02/2023', '19/02/2023', 2, 42.7, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10789, 'FOLIG', 1, '22/01/2023', '19/02/2023', '31/01/2023', 2, 100.6, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10790, 'GOURL', 6, '22/01/2023', '19/02/2023', '26/01/2023', 1, 28.23, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10791, 'FRANK', 6, '23/01/2023', '20/02/2023', '01/02/2023', 2, 16.85, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10792, 'WOLZA', 1, '23/01/2023', '20/02/2023', '31/01/2023', 3, 23.79, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polonia')
GO

INSERT INTO Pedidos 
VALUES 
  (10793, 'AROUT', 3, '24/01/2023', '21/02/2023', '08/02/2023', 3, 4.52, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10794, 'QUEDE', 6, '24/01/2023', '21/02/2023', '02/02/2023', 1, 21.49, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10795, 'ERNSH', 8, '24/01/2023', '21/02/2023', '20/02/2023', 2, 126.66, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10796, 'HILAA', 3, '25/01/2023', '22/02/2023', '14/02/2023', 1, 26.52, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10797, 'DRACD', 7, '25/01/2023', '22/02/2023', '05/02/2023', 2, 33.35, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10798, 'ISLAT', 2, '26/01/2023', '23/02/2023', '05/02/2023', 1, 2.33, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10799, 'KOENE', 9, '26/01/2023', '08/03/2023', '05/02/2023', 3, 30.76, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10800, 'SEVES', 1, '26/01/2023', '23/02/2023', '05/02/2023', 3, 137.44, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10801, 'BOLID', 4, '29/01/2023', '26/02/2023', '31/01/2023', 2, 97.09, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10802, 'SIMOB', 4, '29/01/2023', '26/02/2023', '02/02/2023', 2, 257.26, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10803, 'WELLI', 4, '30/01/2023', '27/02/2023', '06/02/2023', 1, 55.23, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10804, 'SEVES', 6, '30/01/2023', '27/02/2023', '07/02/2023', 2, 27.33, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10805, 'THEBI', 2, '30/01/2023', '27/02/2023', '09/02/2023', 3, 237.34, 'The Big Cheese', '89 Jefferson Way
Suite 2', 'Portland', 'OR', '97201', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10806, 'VICTE', 3, '31/01/2023', '28/02/2023', '05/02/2023', 2, 22.11, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10807, 'FRANS', 4, '31/01/2023', '28/02/2023', '01/03/2023', 1, 1.36, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10808, 'OLDWO', 2, '01/02/2023', '01/03/2023', '09/02/2023', 3, 45.53, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10809, 'WELLI', 7, '01/02/2023', '01/03/2023', '07/02/2023', 1, 4.87, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10810, 'LAUGB', 2, '01/02/2023', '01/03/2023', '07/02/2023', 3, 4.33, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10811, 'LINOD', 8, '02/02/2023', '02/03/2023', '08/02/2023', 1, 31.22, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10812, 'REGGC', 5, '02/02/2023', '02/03/2023', '12/02/2023', 1, 59.78, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10813, 'RICAR', 1, '05/02/2023', '04/03/2023', '09/02/2023', 1, 47.38, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10814, 'VICTE', 3, '05/02/2023', '04/03/2023', '14/02/2023', 3, 130.94, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10815, 'SAVEA', 2, '05/02/2023', '04/03/2023', '14/02/2023', 3, 14.62, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10816, 'GREAL', 4, '06/02/2023', '05/03/2023', '06/03/2023', 2, 719.78, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10817, 'KOENE', 3, '06/02/2023', '20/02/2023', '13/02/2023', 2, 306.07, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10818, 'MAGAA', 7, '07/02/2023', '06/03/2023', '12/02/2023', 3, 65.48, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10819, 'CACTU', 2, '07/02/2023', '06/03/2023', '16/02/2023', 3, 19.76, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10820, 'RATTC', 3, '07/02/2023', '06/03/2023', '13/02/2023', 2, 37.52, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10821, 'SPLIR', 1, '08/02/2023', '07/03/2023', '15/02/2023', 1, 36.68, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10822, 'TRAIH', 6, '08/02/2023', '07/03/2023', '16/02/2023', 3, 7, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10823, 'LILAS', 5, '09/02/2023', '08/03/2023', '13/02/2023', 2, 163.97, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10824, 'FOLKO', 8, '09/02/2023', '08/03/2023', '01/03/2023', 1, 1.23, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10825, 'DRACD', 1, '09/02/2023', '08/03/2023', '14/02/2023', 1, 79.25, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10826, 'BLONP', 6, '12/02/2023', '11/03/2023', '08/03/2023', 1, 7.09, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10827, 'BONAP', 1, '12/02/2023', '26/02/2023', '08/03/2023', 2, 63.54, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10828, 'RANCH', 9, '13/02/2023', '27/02/2023', '06/03/2023', 1, 90.85, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10829, 'ISLAT', 9, '13/02/2023', '12/03/2023', '23/02/2023', 1, 154.72, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10830, 'TRADH', 4, '13/02/2023', '26/03/2023', '21/02/2023', 2, 81.83, 'Tradição Hipermercados', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10831, 'SANTG', 3, '14/02/2023', '13/03/2023', '23/02/2023', 2, 72.19, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega')
GO

INSERT INTO Pedidos 
VALUES 
  (10832, 'LAMAI', 2, '14/02/2023', '13/03/2023', '19/02/2023', 2, 43.26, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10833, 'OTTIK', 6, '15/02/2023', '14/03/2023', '23/02/2023', 2, 71.49, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10834, 'TRADH', 1, '15/02/2023', '14/03/2023', '19/02/2023', 3, 29.78, 'Tradição Hipermercados', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10835, 'ALFKI', 1, '15/02/2023', '14/03/2023', '21/02/2023', 3, 69.53, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlín', NULL, '12209', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10836, 'ERNSH', 7, '16/02/2023', '15/03/2023', '21/02/2023', 1, 411.88, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10837, 'BERGS', 9, '16/02/2023', '15/03/2023', '23/02/2023', 3, 13.32, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10838, 'LINOD', 3, '19/02/2023', '18/03/2023', '23/02/2023', 3, 59.28, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10839, 'TRADH', 3, '19/02/2023', '18/03/2023', '22/02/2023', 3, 35.43, 'Tradição Hipermercados', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10840, 'LINOD', 4, '19/02/2023', '01/04/2023', '18/03/2023', 2, 2.71, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10841, 'SUPRD', 5, '20/02/2023', '19/03/2023', '28/02/2023', 2, 424.3, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10842, 'TORTU', 1, '20/02/2023', '19/03/2023', '28/02/2023', 3, 54.42, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10843, 'VICTE', 4, '21/02/2023', '20/03/2023', '26/02/2023', 2, 9.26, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10844, 'PICCO', 8, '21/02/2023', '20/03/2023', '26/02/2023', 2, 25.22, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10845, 'QUICK', 8, '21/02/2023', '06/03/2023', '01/03/2023', 1, 212.98, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10846, 'SUPRD', 2, '22/02/2023', '04/04/2023', '23/02/2023', 3, 56.46, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10847, 'SAVEA', 4, '22/02/2023', '07/03/2023', '12/03/2023', 3, 487.57, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10848, 'CONSH', 7, '23/02/2023', '22/03/2023', '28/02/2023', 2, 38.24, 'Consolidated Holdings', 'Berkeley Gardens
12  Brewery', 'London', NULL, 'WX1 6LT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10849, 'KOENE', 9, '23/02/2023', '22/03/2023', '01/03/2023', 2, 0.56, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10850, 'VICTE', 1, '23/02/2023', '05/04/2023', '01/03/2023', 1, 49.19, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10851, 'RICAR', 5, '26/02/2023', '25/03/2023', '04/03/2023', 1, 160.55, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10852, 'RATTC', 8, '26/02/2023', '11/03/2023', '01/03/2023', 1, 174.05, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10853, 'BLAUS', 9, '27/02/2023', '26/03/2023', '05/03/2023', 2, 53.83, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10854, 'ERNSH', 3, '27/02/2023', '26/03/2023', '07/03/2023', 2, 100.22, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10855, 'OLDWO', 3, '27/02/2023', '26/03/2023', '06/03/2023', 1, 170.97, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10856, 'ANTON', 3, '28/02/2023', '27/03/2023', '12/03/2023', 2, 58.43, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10857, 'BERGS', 8, '28/02/2023', '27/03/2023', '08/03/2023', 2, 188.85, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10858, 'LACOR', 2, '28/02/2023', '28/03/2023', '05/03/2023', 1, 52.51, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10859, 'FRANK', 1, '28/02/2023', '28/03/2023', '04/03/2023', 2, 76.1, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10860, 'FRANR', 3, '28/02/2023', '28/03/2023', '06/03/2023', 3, 19.26, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10861, 'WHITC', 4, '01/03/2023', '29/03/2023', '19/03/2023', 2, 14.93, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10862, 'LEHMS', 8, '01/03/2023', '12/04/2023', '04/03/2023', 2, 53.23, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10863, 'HILAA', 4, '04/03/2023', '01/04/2023', '19/03/2023', 2, 30.26, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10864, 'AROUT', 4, '04/03/2023', '01/04/2023', '11/03/2023', 2, 3.04, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10865, 'QUICK', 2, '04/03/2023', '18/03/2023', '14/03/2023', 1, 348.14, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10866, 'BERGS', 5, '05/03/2023', '02/04/2023', '14/03/2023', 1, 109.11, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10867, 'LONEP', 6, '05/03/2023', '16/04/2023', '13/03/2023', 1, 1.93, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10868, 'QUEEN', 7, '06/03/2023', '03/04/2023', '25/03/2023', 2, 191.27, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10869, 'SEVES', 5, '06/03/2023', '03/04/2023', '11/03/2023', 1, 143.28, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10870, 'WHITC', 5, '06/03/2023', '03/04/2023', '15/03/2023', 3, 12.04, 'White Clover Markets', '305 - 14th Ave. S.
Suite 3B', 'Seattle', 'WA', '98128', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10871, 'BONAP', 9, '07/03/2023', '04/04/2023', '12/03/2023', 2, 112.27, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10872, 'GODOS', 5, '07/03/2023', '04/04/2023', '11/03/2023', 2, 175.32, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10873, 'WILMK', 4, '08/03/2023', '05/04/2023', '11/03/2023', 1, 0.82, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10874, 'GODOS', 5, '08/03/2023', '05/04/2023', '13/03/2023', 2, 19.58, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10875, 'BERGS', 4, '08/03/2023', '05/04/2023', '02/04/2023', 2, 32.37, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10876, 'BONAP', 7, '11/03/2023', '08/04/2023', '14/03/2023', 3, 60.42, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10877, 'RICAR', 1, '11/03/2023', '08/04/2023', '21/03/2023', 1, 38.06, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10878, 'QUICK', 4, '12/03/2023', '09/04/2023', '14/03/2023', 1, 46.69, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10879, 'WILMK', 3, '12/03/2023', '09/04/2023', '14/03/2023', 3, 8.5, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10880, 'FOLKO', 7, '12/03/2023', '23/04/2023', '20/03/2023', 1, 88.01, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10881, 'CACTU', 4, '13/03/2023', '10/04/2023', '20/03/2023', 1, 2.84, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10882, 'SAVEA', 4, '13/03/2023', '10/04/2023', '22/03/2023', 3, 23.1, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10883, 'LONEP', 8, '14/03/2023', '11/04/2023', '22/03/2023', 3, 0.53, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10884, 'LETSS', 4, '14/03/2023', '11/04/2023', '15/03/2023', 2, 90.97, 'Let''s Stop N Shop', '87 Polk St.
Suite 5', 'San Francisco', 'CA', '94117', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10885, 'SUPRD', 6, '14/03/2023', '11/04/2023', '20/03/2023', 3, 5.64, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10886, 'HANAR', 1, '15/03/2023', '12/04/2023', '01/04/2023', 1, 4.99, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10887, 'GALED', 8, '15/03/2023', '12/04/2023', '18/03/2023', 3, 1.25, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10888, 'GODOS', 1, '18/03/2023', '15/04/2023', '25/03/2023', 2, 51.87, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10889, 'RATTC', 9, '18/03/2023', '15/04/2023', '25/03/2023', 3, 280.61, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10890, 'DUMON', 7, '18/03/2023', '15/04/2023', '20/03/2023', 1, 32.76, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10891, 'LEHMS', 7, '19/03/2023', '16/04/2023', '21/03/2023', 2, 20.37, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10892, 'MAISD', 4, '19/03/2023', '16/04/2023', '21/03/2023', 2, 120.27, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10893, 'KOENE', 9, '20/03/2023', '17/04/2023', '22/03/2023', 2, 77.78, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10894, 'SAVEA', 1, '20/03/2023', '17/04/2023', '22/03/2023', 1, 116.13, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10895, 'ERNSH', 3, '20/03/2023', '17/04/2023', '25/03/2023', 1, 162.75, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10896, 'MAISD', 7, '21/03/2023', '18/04/2023', '29/03/2023', 3, 32.45, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10897, 'HUNGO', 3, '21/03/2023', '18/04/2023', '27/03/2023', 2, 603.54, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10898, 'OCEAN', 4, '22/03/2023', '19/04/2023', '05/04/2023', 2, 1.27, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585
Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10899, 'LILAS', 5, '22/03/2023', '19/04/2023', '28/03/2023', 3, 1.21, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10900, 'WELLI', 1, '22/03/2023', '19/04/2023', '03/04/2023', 2, 1.66, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10901, 'HILAA', 4, '25/03/2023', '22/04/2023', '28/03/2023', 1, 62.09, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10902, 'FOLKO', 1, '25/03/2023', '22/04/2023', '02/04/2023', 1, 44.15, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10903, 'HANAR', 3, '26/03/2023', '23/04/2023', '03/04/2023', 3, 36.71, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10904, 'WHITC', 3, '26/03/2023', '23/04/2023', '29/03/2023', 3, 162.95, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10905, 'WELLI', 9, '26/03/2023', '23/04/2023', '05/04/2023', 2, 13.72, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10906, 'WOLZA', 4, '27/03/2023', '10/04/2023', '02/04/2023', 3, 26.29, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polonia')
GO

INSERT INTO Pedidos 
VALUES 
  (10907, 'SPECD', 6, '27/03/2023', '24/04/2023', '29/03/2023', 3, 9.19, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10908, 'REGGC', 4, '28/03/2023', '25/04/2023', '05/04/2023', 2, 32.96, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10909, 'SANTG', 1, '28/03/2023', '25/04/2023', '09/04/2023', 2, 53.05, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega')
GO

INSERT INTO Pedidos 
VALUES 
  (10910, 'WILMK', 1, '28/03/2023', '25/04/2023', '03/04/2023', 3, 38.11, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (10911, 'GODOS', 3, '28/03/2023', '25/04/2023', '04/04/2023', 1, 38.19, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10912, 'HUNGO', 2, '28/03/2023', '25/04/2023', '17/04/2023', 2, 580.91, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10913, 'QUEEN', 4, '28/03/2023', '25/04/2023', '03/04/2023', 1, 33.05, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10914, 'QUEEN', 6, '29/03/2023', '26/04/2023', '01/04/2023', 1, 21.19, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10915, 'TORTU', 2, '29/03/2023', '26/04/2023', '01/04/2023', 2, 3.51, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10916, 'RANCH', 1, '29/03/2023', '26/04/2023', '08/04/2023', 2, 63.77, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10917, 'ROMEY', 4, '01/04/2023', '29/04/2023', '10/04/2023', 2, 8.29, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10918, 'BOTTM', 3, '01/04/2023', '29/04/2023', '10/04/2023', 3, 48.83, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10919, 'LINOD', 2, '01/04/2023', '29/04/2023', '03/04/2023', 2, 19.8, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10920, 'AROUT', 4, '02/04/2023', '30/04/2023', '08/04/2023', 2, 29.61, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10921, 'VAFFE', 1, '02/04/2023', '14/05/2023', '08/04/2023', 1, 176.48, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10922, 'HANAR', 5, '02/04/2023', '30/04/2023', '04/04/2023', 3, 62.74, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10923, 'LAMAI', 7, '02/04/2023', '14/05/2023', '12/04/2023', 3, 68.26, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10924, 'BERGS', 3, '03/04/2023', '01/05/2023', '08/05/2023', 2, 151.52, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10925, 'HANAR', 3, '03/04/2023', '01/05/2023', '12/04/2023', 1, 2.27, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10926, 'ANATR', 4, '03/04/2023', '01/05/2023', '10/04/2023', 3, 39.92, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10927, 'LACOR', 4, '04/04/2023', '02/05/2023', '08/05/2023', 1, 19.79, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10928, 'GALED', 1, '04/04/2023', '02/05/2023', '17/04/2023', 1, 1.36, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10929, 'FRANK', 6, '04/04/2023', '02/05/2023', '11/04/2023', 1, 33.93, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10930, 'SUPRD', 4, '05/04/2023', '17/05/2023', '17/04/2023', 3, 15.55, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10931, 'RICSU', 4, '05/04/2023', '19/04/2023', '18/04/2023', 2, 13.6, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10932, 'BONAP', 8, '05/04/2023', '03/05/2023', '23/04/2023', 1, 134.64, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10933, 'ISLAT', 6, '05/04/2023', '03/05/2023', '15/04/2023', 3, 54.15, 'Island Trading', 'Garden House
Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10934, 'LEHMS', 3, '08/04/2023', '06/05/2023', '11/04/2023', 3, 32.01, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10935, 'WELLI', 4, '08/04/2023', '06/05/2023', '17/04/2023', 3, 47.59, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10936, 'GREAL', 3, '08/04/2023', '06/05/2023', '17/04/2023', 2, 33.68, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10937, 'CACTU', 7, '09/04/2023', '23/04/2023', '12/04/2023', 3, 31.51, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10938, 'QUICK', 3, '09/04/2023', '07/05/2023', '15/04/2023', 2, 31.89, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10939, 'MAGAA', 2, '09/04/2023', '07/05/2023', '12/04/2023', 2, 76.33, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10940, 'BONAP', 8, '10/04/2023', '08/05/2023', '22/04/2023', 3, 19.77, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10941, 'SAVEA', 7, '10/04/2023', '08/05/2023', '19/04/2023', 2, 400.81, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10942, 'REGGC', 9, '10/04/2023', '08/05/2023', '17/04/2023', 3, 17.95, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10943, 'BSBEV', 4, '10/04/2023', '08/05/2023', '18/04/2023', 2, 2.17, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10944, 'BOTTM', 6, '11/04/2023', '25/04/2023', '12/04/2023', 3, 52.92, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10945, 'MORGK', 4, '11/04/2023', '09/05/2023', '17/04/2023', 1, 10.22, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10946, 'VAFFE', 1, '11/04/2023', '09/05/2023', '18/04/2023', 2, 27.2, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10947, 'BSBEV', 3, '12/04/2023', '10/05/2023', '15/04/2023', 2, 3.26, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10948, 'GODOS', 3, '12/04/2023', '10/05/2023', '18/04/2023', 3, 23.39, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10949, 'BOTTM', 2, '12/04/2023', '10/05/2023', '16/04/2023', 3, 74.44, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10950, 'MAGAA', 1, '15/04/2023', '13/05/2023', '22/04/2023', 2, 2.5, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (10951, 'RICSU', 9, '15/04/2023', '27/05/2023', '07/05/2023', 2, 30.85, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10952, 'ALFKI', 1, '15/04/2023', '27/05/2023', '23/04/2023', 1, 40.42, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlín', NULL, '12209', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10953, 'AROUT', 9, '15/04/2023', '29/04/2023', '24/04/2023', 2, 23.72, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10954, 'LINOD', 5, '16/04/2023', '28/05/2023', '19/04/2023', 1, 27.91, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10955, 'FOLKO', 8, '16/04/2023', '14/05/2023', '19/04/2023', 2, 3.26, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10956, 'BLAUS', 6, '16/04/2023', '28/05/2023', '19/04/2023', 2, 44.65, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10957, 'HILAA', 8, '17/04/2023', '15/05/2023', '26/04/2023', 3, 105.36, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10958, 'OCEAN', 7, '17/04/2023', '15/05/2023', '26/04/2023', 2, 49.56, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585
Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10959, 'GOURL', 6, '17/04/2023', '29/05/2023', '22/04/2023', 2, 4.98, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10960, 'HILAA', 3, '18/04/2023', '02/05/2023', '08/05/2023', 1, 2.08, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10961, 'QUEEN', 8, '18/04/2023', '16/05/2023', '29/04/2023', 1, 104.47, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10962, 'QUICK', 8, '18/04/2023', '16/05/2023', '22/04/2023', 2, 275.79, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10963, 'FURIB', 9, '18/04/2023', '16/05/2023', '25/04/2023', 3, 2.7, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (10964, 'SPECD', 3, '19/04/2023', '17/05/2023', '23/04/2023', 2, 87.38, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10965, 'OLDWO', 6, '19/04/2023', '17/05/2023', '29/04/2023', 3, 144.38, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10966, 'CHOPS', 4, '19/04/2023', '17/05/2023', '08/05/2023', 1, 27.19, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (10967, 'TOMSP', 2, '22/04/2023', '20/05/2023', '02/05/2023', 2, 62.22, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10968, 'ERNSH', 1, '22/04/2023', '20/05/2023', '01/05/2023', 3, 74.6, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10969, 'COMMI', 1, '22/04/2023', '20/05/2023', '29/04/2023', 2, 0.21, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10970, 'BOLID', 9, '23/04/2023', '07/05/2023', '24/05/2023', 1, 16.16, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (10971, 'FRANR', 2, '23/04/2023', '21/05/2023', '02/05/2023', 2, 121.82, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10972, 'LACOR', 4, '23/04/2023', '21/05/2023', '25/04/2023', 2, 0.02, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10973, 'LACOR', 6, '23/04/2023', '21/05/2023', '26/04/2023', 2, 15.17, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (10974, 'SPLIR', 3, '24/04/2023', '08/05/2023', '03/05/2023', 3, 12.96, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10975, 'BOTTM', 1, '24/04/2023', '22/05/2023', '26/04/2023', 3, 32.27, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10976, 'HILAA', 1, '24/04/2023', '05/06/2023', '03/05/2023', 1, 37.97, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10977, 'FOLKO', 8, '25/04/2023', '23/05/2023', '10/05/2023', 3, 208.5, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10978, 'MAISD', 9, '25/04/2023', '23/05/2023', '23/05/2023', 2, 32.82, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (10979, 'ERNSH', 8, '25/04/2023', '23/05/2023', '30/04/2023', 2, 353.07, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10980, 'FOLKO', 4, '26/04/2023', '07/06/2023', '17/05/2023', 1, 1.26, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10981, 'HANAR', 1, '26/04/2023', '24/05/2023', '02/05/2023', 2, 193.37, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10982, 'BOTTM', 2, '26/04/2023', '24/05/2023', '08/05/2023', 1, 14.01, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (10983, 'SAVEA', 2, '26/04/2023', '24/05/2023', '06/05/2023', 2, 657.54, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10984, 'SAVEA', 1, '29/04/2023', '27/05/2023', '03/05/2023', 3, 211.22, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10985, 'HUNGO', 2, '29/04/2023', '27/05/2023', '02/05/2023', 1, 91.51, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (10986, 'OCEAN', 8, '29/04/2023', '27/05/2023', '21/05/2023', 2, 217.86, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585
Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (10987, 'EASTC', 8, '30/04/2023', '28/05/2023', '06/05/2023', 1, 185.48, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (10988, 'RATTC', 3, '30/04/2023', '28/05/2023', '10/05/2023', 2, 61.14, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10989, 'QUEDE', 2, '30/04/2023', '28/05/2023', '02/05/2023', 1, 34.76, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (10990, 'ERNSH', 2, '01/05/2023', '12/06/2023', '07/05/2023', 3, 117.61, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (10991, 'QUICK', 1, '01/05/2023', '29/05/2023', '07/05/2023', 1, 38.51, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10992, 'THEBI', 1, '01/05/2023', '29/05/2023', '03/05/2023', 3, 4.27, 'The Big Cheese', '89 Jefferson Way
Suite 2', 'Portland', 'OR', '97201', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (10993, 'FOLKO', 7, '01/05/2023', '29/05/2023', '10/05/2023', 3, 8.81, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (10994, 'VAFFE', 2, '02/05/2023', '16/05/2023', '09/05/2023', 3, 65.53, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (10995, 'PERIC', 1, '02/05/2023', '30/05/2023', '06/05/2023', 3, 46, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (10996, 'QUICK', 4, '02/05/2023', '30/05/2023', '10/05/2023', 2, 1.12, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (10997, 'LILAS', 8, '03/05/2023', '14/06/2023', '13/05/2023', 2, 73.91, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (10998, 'WOLZA', 8, '03/05/2023', '17/05/2023', '17/05/2023', 2, 20.31, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polonia')
GO

INSERT INTO Pedidos 
VALUES 
  (10999, 'OTTIK', 6, '03/05/2023', '31/05/2023', '10/05/2023', 2, 96.35, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11000, 'RATTC', 2, '06/05/2023', '03/06/2023', '14/05/2023', 3, 55.12, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11001, 'FOLKO', 2, '06/05/2023', '03/06/2023', '14/05/2023', 2, 197.3, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (11002, 'SAVEA', 4, '06/05/2023', '03/06/2023', '16/05/2023', 1, 141.16, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11003, 'THECR', 3, '06/05/2023', '03/06/2023', '08/05/2023', 3, 14.91, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11004, 'MAISD', 3, '07/05/2023', '04/06/2023', '20/05/2023', 1, 44.84, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (11005, 'WILMK', 2, '07/05/2023', '04/06/2023', '10/05/2023', 1, 0.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (11006, 'GREAL', 3, '07/05/2023', '04/06/2023', '15/05/2023', 2, 25.19, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11007, 'PRINI', 8, '08/05/2023', '05/06/2023', '13/05/2023', 2, 202.24, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal')
GO

INSERT INTO Pedidos 
VALUES 
  (11008, 'ERNSH', 7, '08/05/2023', '05/06/2023', NULL, 3, 79.46, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (11009, 'GODOS', 2, '08/05/2023', '05/06/2023', '10/05/2023', 1, 59.11, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (11010, 'REGGC', 2, '09/05/2023', '06/06/2023', '21/05/2023', 2, 28.71, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (11011, 'ALFKI', 3, '09/05/2023', '06/06/2023', '13/05/2023', 1, 1.21, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlín', NULL, '12209', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11012, 'FRANK', 1, '09/05/2023', '23/05/2023', '17/05/2023', 3, 242.95, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11013, 'ROMEY', 2, '09/05/2023', '06/06/2023', '10/05/2023', 1, 32.99, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (11014, 'LINOD', 2, '10/05/2023', '07/06/2023', '15/05/2023', 3, 23.6, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (11015, 'SANTG', 2, '10/05/2023', '24/05/2023', '20/05/2023', 2, 4.62, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega')
GO

INSERT INTO Pedidos 
VALUES 
  (11016, 'AROUT', 9, '10/05/2023', '07/06/2023', '13/05/2023', 2, 33.8, 'Around the Horn', 'Brook Farm
Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (11017, 'ERNSH', 9, '13/05/2023', '10/06/2023', '20/05/2023', 2, 754.26, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (11018, 'LONEP', 4, '13/05/2023', '10/06/2023', '16/05/2023', 2, 11.65, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11019, 'RANCH', 6, '13/05/2023', '10/06/2023', NULL, 3, 3.17, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (11020, 'OTTIK', 2, '14/05/2023', '11/06/2023', '16/05/2023', 2, 43.3, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11021, 'QUICK', 3, '14/05/2023', '11/06/2023', '21/05/2023', 1, 297.18, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11022, 'HANAR', 9, '14/05/2023', '11/06/2023', '03/06/2023', 2, 6.27, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (11023, 'BSBEV', 1, '14/05/2023', '28/05/2023', '24/05/2023', 2, 123.83, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (11024, 'EASTC', 4, '15/05/2023', '12/06/2023', '20/05/2023', 1, 74.36, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (11025, 'WARTH', 6, '15/05/2023', '12/06/2023', '24/05/2023', 3, 29.17, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia')
GO

INSERT INTO Pedidos 
VALUES 
  (11026, 'FRANS', 4, '15/05/2023', '12/06/2023', '28/05/2023', 1, 47.09, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (11027, 'BOTTM', 1, '16/05/2023', '13/06/2023', '20/05/2023', 1, 52.52, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (11028, 'KOENE', 2, '16/05/2023', '13/06/2023', '22/05/2023', 1, 29.59, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11029, 'CHOPS', 4, '16/05/2023', '13/06/2023', '27/05/2023', 1, 47.84, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (11030, 'SAVEA', 7, '17/05/2023', '14/06/2023', '27/05/2023', 2, 830.75, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11031, 'SAVEA', 6, '17/05/2023', '14/06/2023', '24/05/2023', 2, 227.22, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11032, 'WHITC', 2, '17/05/2023', '14/06/2023', '23/05/2023', 3, 606.19, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11033, 'RICSU', 7, '17/05/2023', '14/06/2023', '23/05/2023', 3, 84.74, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (11034, 'OLDWO', 8, '20/05/2023', '01/07/2023', '27/05/2023', 1, 40.32, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11035, 'SUPRD', 2, '20/05/2023', '17/06/2023', '24/05/2023', 2, 0.17, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (11036, 'DRACD', 8, '20/05/2023', '17/06/2023', '22/05/2023', 3, 149.47, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11037, 'GODOS', 7, '21/05/2023', '18/06/2023', '27/05/2023', 1, 3.2, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España')
GO

INSERT INTO Pedidos 
VALUES 
  (11038, 'SUPRD', 1, '21/05/2023', '18/06/2023', '30/05/2023', 2, 29.59, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica')
GO

INSERT INTO Pedidos 
VALUES 
  (11039, 'LINOD', 1, '21/05/2023', '18/06/2023', NULL, 2, 65, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (11040, 'GREAL', 4, '22/05/2023', '19/06/2023', NULL, 3, 18.84, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11041, 'CHOPS', 3, '22/05/2023', '19/06/2023', '28/05/2023', 2, 48.22, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (11042, 'COMMI', 2, '22/05/2023', '05/06/2023', '31/05/2023', 1, 29.99, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (11043, 'SPECD', 5, '22/05/2023', '19/06/2023', '29/05/2023', 2, 8.8, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (11044, 'WOLZA', 4, '23/05/2023', '20/06/2023', '31/05/2023', 1, 8.72, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polonia')
GO

INSERT INTO Pedidos 
VALUES 
  (11045, 'BOTTM', 6, '23/05/2023', '20/06/2023', NULL, 2, 70.58, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (11046, 'WANDK', 8, '23/05/2023', '20/06/2023', '24/05/2023', 2, 71.64, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11047, 'EASTC', 7, '24/05/2023', '21/06/2023', '31/05/2023', 3, 46.62, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (11048, 'BOTTM', 7, '24/05/2023', '21/06/2023', '30/05/2023', 3, 24.12, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá')
GO

INSERT INTO Pedidos 
VALUES 
  (11049, 'GOURL', 3, '24/05/2023', '21/06/2023', '03/06/2023', 1, 8.34, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (11050, 'FOLKO', 8, '27/05/2023', '24/06/2023', '04/06/2023', 2, 59.41, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia')
GO

INSERT INTO Pedidos 
VALUES 
  (11051, 'LAMAI', 7, '27/05/2023', '24/06/2023', NULL, 3, 2.79, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (11052, 'HANAR', 3, '27/05/2023', '24/06/2023', '31/05/2023', 1, 67.26, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (11053, 'PICCO', 2, '27/05/2023', '24/06/2023', '29/05/2023', 2, 53.05, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (11054, 'CACTU', 8, '28/05/2023', '25/06/2023', NULL, 1, 0.33, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina')
GO

INSERT INTO Pedidos 
VALUES 
  (11055, 'HILAA', 7, '28/05/2023', '25/06/2023', '04/06/2023', 2, 120.92, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (11056, 'EASTC', 8, '28/05/2023', '11/06/2023', '31/05/2023', 2, 278.96, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (11057, 'NORTS', 3, '29/05/2023', '26/06/2023', '31/05/2023', 3, 4.13, 'North/South', 'South House
300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'Reino Unido')
GO

INSERT INTO Pedidos 
VALUES 
  (11058, 'BLAUS', 9, '29/05/2023', '26/06/2023', NULL, 3, 31.14, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11059, 'RICAR', 2, '29/05/2023', '10/07/2023', NULL, 2, 85.8, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (11060, 'FRANS', 2, '30/05/2023', '27/06/2023', '03/06/2023', 2, 10.98, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (11061, 'GREAL', 4, '30/05/2023', '11/07/2023', NULL, 3, 14.01, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11062, 'REGGC', 4, '30/05/2023', '27/06/2023', NULL, 2, 29.93, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia')
GO

INSERT INTO Pedidos 
VALUES 
  (11063, 'HUNGO', 3, '30/05/2023', '27/06/2023', '05/06/2023', 2, 81.73, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda')
GO

INSERT INTO Pedidos 
VALUES 
  (11064, 'SAVEA', 1, '31/05/2023', '28/06/2023', '03/06/2023', 1, 30.09, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11065, 'LILAS', 8, '31/05/2023', '28/06/2023', NULL, 1, 12.91, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (11066, 'WHITC', 7, '31/05/2023', '28/06/2023', '03/06/2023', 2, 44.72, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos')
GO

INSERT INTO Pedidos 
VALUES 
  (11067, 'DRACD', 1, '03/06/2023', '17/06/2023', '05/06/2023', 2, 7.98, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11068, 'QUEEN', 8, '03/06/2023', '01/07/2023', NULL, 2, 81.75, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil')
GO

INSERT INTO Pedidos 
VALUES 
  (11069, 'TORTU', 1, '03/06/2023', '01/07/2023', '05/06/2023', 2, 15.67, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (11070, 'LEHMS', 2, '04/06/2023', '02/07/2023', NULL, 1, 136, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Alemania')
GO

INSERT INTO Pedidos 
VALUES 
  (11071, 'LILAS', 1, '04/06/2023', '02/07/2023', NULL, 1, 0.93, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela')
GO

INSERT INTO Pedidos 
VALUES 
  (11072, 'ERNSH', 4, '04/06/2023', '02/07/2023', NULL, 2, 258.64, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria')
GO

INSERT INTO Pedidos 
VALUES 
  (11073, 'PERIC', 2, '04/06/2023', '02/07/2023', NULL, 2, 24.95, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México')
GO

INSERT INTO Pedidos 
VALUES 
  (11074, 'SIMOB', 7, '05/06/2023', '03/07/2023', NULL, 2, 18.44, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca')
GO

INSERT INTO Pedidos 
VALUES 
  (11075, 'RICSU', 8, '05/06/2023', '03/07/2023', NULL, 2, 6.19, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Suiza')
GO

INSERT INTO Pedidos 
VALUES 
  (11076, 'BONAP', 4, '05/06/2023', '03/07/2023', NULL, 2, 38.28, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia')
GO

INSERT INTO Pedidos 
VALUES 
  (11077, 'RATTC', 1, '05/06/2023', '03/07/2023', NULL, 2, 8.53, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos')
GO

--
-- Data for table Productos  (LIMIT 0,500)
--

INSERT INTO Productos 
VALUES 
  (1, 'Té Dharamsala', 1, 1, '10 cajas x 20 bolsas', 18, 39, 0, 10, 0)
GO

INSERT INTO Productos 
VALUES 
  (2, 'Cerveza tibetana Barley', 1, 1, '24 - bot. 12 l', 19, 17, 40, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (3, 'Sirope de regaliz', 1, 2, '12 - bot. 550 ml', 10, 13, 70, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (4, 'Especias Cajun del chef Anton', 2, 2, '48 - frascos 6 l', 22, 53, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (5, 'Mezcla Gumbo del chef Anton', 2, 2, '36 cajas', 21.35, 0, 0, 0, 1)
GO

INSERT INTO Productos 
VALUES 
  (6, 'Mermelada de grosellas de la abuela', 3, 2, '12 - frascos 8 l', 25, 120, 0, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (7, 'Peras secas orgánicas del tío Bob', 3, 7, '12 - paq. 1 kg', 30, 15, 0, 10, 0)
GO

INSERT INTO Productos 
VALUES 
  (8, 'Salsa de arándanos Northwoods', 3, 2, '12 - frascos 12 l', 40, 6, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (9, 'Buey Mishi Kobe', 4, 6, '18 - paq. 500 g', 97, 29, 0, 0, 1)
GO

INSERT INTO Productos 
VALUES 
  (10, 'Pez espada', 4, 8, '12 - frascos 200 ml', 31, 31, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (11, 'Queso Cabrales', 5, 4, 'paq. 1 kg', 21, 22, 30, 30, 0)
GO

INSERT INTO Productos 
VALUES 
  (12, 'Queso Manchego La Pastora', 5, 4, '10 - paq. 500 g', 38, 86, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (13, 'Algas Konbu', 6, 8, 'caja 2 kg', 6, 24, 0, 5, 0)
GO

INSERT INTO Productos 
VALUES 
  (14, 'Cuajada de judías', 6, 7, '40 - paq. 100 g', 23.25, 35, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (15, 'Salsa de soja baja en sodio', 6, 2, '24 - bot. 250 ml', 15.5, 39, 0, 5, 0)
GO

INSERT INTO Productos 
VALUES 
  (16, 'Postre de merengue Pavlova', 7, 3, '32 - cajas 500 g', 17.45, 29, 0, 10, 0)
GO

INSERT INTO Productos 
VALUES 
  (17, 'Cordero Alice Springs', 7, 6, '20 - latas 1 kg', 39, 0, 0, 0, 1)
GO

INSERT INTO Productos 
VALUES 
  (18, 'Langostinos tigre Carnarvon', 7, 8, 'paq. 16 kg', 62.5, 42, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (19, 'Pastas de té de chocolate', 8, 3, '10 cajas x 12 piezas', 9.2, 25, 0, 5, 0)
GO

INSERT INTO Productos 
VALUES 
  (20, 'Mermelada de Sir Rodney''s', 8, 3, '30 cajas regalo', 81, 40, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (21, 'Bollos de Sir Rodney''s', 8, 3, '24 paq. x 4 piezas', 10, 3, 40, 5, 0)
GO

INSERT INTO Productos 
VALUES 
  (22, 'Pan de centeno crujiente estilo Gustaf''s', 9, 5, '24 - paq. 500 g', 21, 104, 0, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (23, 'Pan fino', 9, 5, '12 - paq. 250 g', 9, 61, 0, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (24, 'Refresco Guaraná Fantástica', 10, 1, '12 - latas 355 ml', 4.5, 20, 0, 0, 1)
GO

INSERT INTO Productos 
VALUES 
  (25, 'Crema de chocolate y nueces NuNuCa', 11, 3, '20 - vasos  450 g', 14, 76, 0, 30, 0)
GO

INSERT INTO Productos 
VALUES 
  (26, 'Ositos de goma Gumbär', 11, 3, '100 - bolsas 250 g', 31.23, 15, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (27, 'Chocolate Schoggi', 11, 3, '100 - piezas 100 g', 43.9, 49, 0, 30, 0)
GO

INSERT INTO Productos 
VALUES 
  (28, 'Col fermentada Rössle', 12, 7, '25 - latas 825 g', 45.6, 26, 0, 0, 1)
GO

INSERT INTO Productos 
VALUES 
  (29, 'Salchicha Thüringer', 12, 6, '50 bolsas x 30 salch', 123.79, 0, 0, 0, 1)
GO

INSERT INTO Productos 
VALUES 
  (30, 'Arenque blanco del noroeste', 13, 8, '10 - vasos 200 g', 25.89, 10, 0, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (31, 'Queso gorgonzola Telino', 14, 4, '12 - paq. 100 g', 12.5, 0, 70, 20, 0)
GO

INSERT INTO Productos 
VALUES 
  (32, 'Queso Mascarpone Fabioli', 14, 4, '24 - paq. 200 g', 32, 9, 40, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (33, 'Queso de cabra', 15, 4, '500 g', 2.5, 112, 0, 20, 0)
GO

INSERT INTO Productos 
VALUES 
  (34, 'Cerveza Sasquatch', 16, 1, '24 - bot. 12 l', 14, 111, 0, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (35, 'Cerveza negra Steeleye', 16, 1, '24 - bot. 12 l', 18, 20, 0, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (36, 'Escabeche de arenque', 17, 8, '24 - frascos 250 g', 19, 112, 0, 20, 0)
GO

INSERT INTO Productos 
VALUES 
  (37, 'Salmón ahumado Gravad', 17, 8, '12 - paq. 500 g', 26, 11, 50, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (38, 'Vino Côte de Blaye', 18, 1, '12 - bot. 75 cl', 263.5, 17, 0, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (39, 'Licor verde Chartreuse', 18, 1, '750 cc por bot.', 18, 69, 0, 5, 0)
GO

INSERT INTO Productos 
VALUES 
  (40, 'Carne de cangrejo de Boston', 19, 8, '24 - latas 4 l', 18.4, 123, 0, 30, 0)
GO

INSERT INTO Productos 
VALUES 
  (41, 'Crema de almejas estilo Nueva Inglaterra', 19, 8, '12 - latas 12 l', 9.65, 85, 0, 10, 0)
GO

INSERT INTO Productos 
VALUES 
  (42, 'Tallarines de Singapur', 20, 5, '32 - 1 kg paq.', 14, 26, 0, 0, 1)
GO

INSERT INTO Productos 
VALUES 
  (43, 'Café de Malasia', 20, 1, '16 - latas 500 g', 46, 17, 10, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (44, 'Azúcar negra Malacca', 20, 2, '20 - bolsas 2 kg', 19.45, 27, 0, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (45, 'Arenque ahumado', 21, 8, 'paq. 1k', 9.5, 5, 70, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (46, 'Arenque salado', 21, 8, '4 - vasos 450 g', 12, 95, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (47, 'Galletas Zaanse', 22, 3, '10 - cajas 4 l', 9.5, 36, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (48, 'Chocolate holandés', 22, 3, '10 paq.', 12.75, 15, 70, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (49, 'Regaliz', 23, 3, '24 - paq. 50 g', 20, 10, 60, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (50, 'Chocolate blanco', 23, 3, '12 - barras 100 g', 16.25, 65, 0, 30, 0)
GO

INSERT INTO Productos 
VALUES 
  (51, 'Manzanas secas Manjimup', 24, 7, '50 - paq. 300 g', 53, 20, 0, 10, 0)
GO

INSERT INTO Productos 
VALUES 
  (52, 'Cereales para Filo', 24, 5, '16 - cajas 2 kg', 7, 38, 0, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (53, 'Empanada de carne', 24, 6, '48 porc.', 32.8, 0, 0, 0, 1)
GO

INSERT INTO Productos 
VALUES 
  (54, 'Empanada de cerdo', 25, 6, '16 tartas', 7.45, 21, 0, 10, 0)
GO

INSERT INTO Productos 
VALUES 
  (55, 'Paté chino', 25, 6, '24 cajas x 2 tartas', 24, 115, 0, 20, 0)
GO

INSERT INTO Productos 
VALUES 
  (56, 'Gnocchi de la abuela Alicia', 26, 5, '24 - paq. 250 g', 38, 21, 10, 30, 0)
GO

INSERT INTO Productos 
VALUES 
  (57, 'Raviolis Angelo', 26, 5, '24 - paq. 250 g', 19.5, 36, 0, 20, 0)
GO

INSERT INTO Productos 
VALUES 
  (58, 'Caracoles de Borgoña', 27, 8, '24 porc.', 13.25, 62, 0, 20, 0)
GO

INSERT INTO Productos 
VALUES 
  (59, 'Raclet de queso Courdavault', 28, 4, 'paq. 5 kg', 55, 79, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (60, 'Camembert Pierrot', 28, 4, '15 - paq. 300 g', 34, 19, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (61, 'Sirope de arce', 29, 2, '24 - bot. 500 ml', 28.5, 113, 0, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (62, 'Tarta de azúcar', 29, 3, '48 tartas', 49.3, 17, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (63, 'Sandwich de vegetales', 7, 2, '15 - frascos 625 g', 43.9, 24, 0, 5, 0)
GO

INSERT INTO Productos 
VALUES 
  (64, 'Bollos de pan de Wimmer', 12, 5, '20 bolsas x 4 porc.', 33.25, 22, 80, 30, 0)
GO

INSERT INTO Productos 
VALUES 
  (65, 'Salsa de pimiento picante de Luisiana', 2, 2, '32 - bot. 8 l', 21.05, 76, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (66, 'Especias picantes de Luisiana', 2, 2, '24 - frascos 8 l', 17, 4, 100, 20, 0)
GO

INSERT INTO Productos 
VALUES 
  (67, 'Cerveza Laughing Lumberjack', 16, 1, '24 - bot. 12 l', 14, 52, 0, 10, 0)
GO

INSERT INTO Productos 
VALUES 
  (68, 'Barras de pan de Escocia', 8, 3, '10 cajas x 8 porc.', 12.5, 6, 10, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (69, 'Queso Gudbrandsdals', 15, 4, 'paq. 10 kg', 36, 26, 0, 15, 0)
GO

INSERT INTO Productos 
VALUES 
  (70, 'Cerveza Outback', 7, 1, '24 - bot. 355 ml', 15, 15, 10, 30, 0)
GO

INSERT INTO Productos 
VALUES 
  (71, 'Crema de queso Fløtemys', 15, 4, '10 - paq. 500 g', 21.5, 26, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (72, 'Queso Mozzarella Giovanni', 14, 4, '24 - paq. 200 g', 34.8, 14, 0, 0, 0)
GO

INSERT INTO Productos 
VALUES 
  (73, 'Caviar rojo', 17, 8, '24 - frascos150 g', 15, 101, 0, 5, 0)
GO

INSERT INTO Productos 
VALUES 
  (74, 'Queso de soja Longlife', 4, 7, 'paq. 5 kg', 10, 4, 20, 5, 0)
GO

INSERT INTO Productos 
VALUES 
  (75, 'Cerveza Klosterbier Rhönbräu', 12, 1, '24 - bot. 0,5 l', 7.75, 125, 0, 25, 0)
GO

INSERT INTO Productos 
VALUES 
  (76, 'Licor Cloudberry', 23, 1, '500 ml', 18, 57, 0, 20, 0)
GO

INSERT INTO Productos 
VALUES 
  (77, 'Salsa verde original Frankfurter', 12, 2, '12 cajas', 13, 32, 0, 15, 0)
GO

--
-- Data for table Proveedores  (LIMIT 0,500)
--

INSERT INTO Proveedores 
VALUES 
  (1, 'Exotic Liquids', 'Charlotte Cooper', 'Gerente de compras', '49 Gilbert St.', 'Londres', NULL, 'EC1 4SD', 'Reino Unido', '(171) 555-2222', NULL),
  (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Administrador de pedidos', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'Estados Unidos', '(100) 555-4822', NULL),
  (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Representante de ventas', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'Estados Unidos', '(313) 555-5735', '(313) 555-3349'),
  (4, 'Tokyo Traders', 'Yoshi Nagase', 'Gerente de marketing', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japón', '(03) 3555-5011', NULL),
  (5, 'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Administrador de exportaciones', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'España', '(98) 598 76 54', NULL),
  (6, 'Mayumi''s', 'Mayumi Ohno', 'Representante de marketing', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japón', '(06) 431-7877', NULL),
  (7, 'Pavlova, Ltd.', 'Ian Devling', 'Gerente de marketing', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588'),
  (8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Representante de ventas', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'Reino Unido', '(161) 555-4448', NULL),
  (9, 'PB Knäckebröd AB', 'Lars Peterson', 'Agente de ventas', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Suecia', '031-987 65 43', '031-987 65 91'),
  (10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Gerente de marketing', 'Av. das Americanas 12.890', 'São Paulo', NULL, '5442', 'Brasil', '(11) 555 4640', NULL),
  (11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Gerente de ventas', 'Tiergartenstraße 5', 'Berlín', NULL, '10785', 'Alemania', '(010) 9984510', NULL),
  (12, 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'Ger. marketing internacional', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Alemania', '(069) 992755', NULL),
  (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinador de mercados', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Alemania', '(04721) 8713', '(04721) 8714'),
  (14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Representante de ventas', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italia', '(0544) 60323', '(0544) 60603'),
  (15, 'Norske Meierier', 'Beate Vileid', 'Gerente de marketing', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Noruega', '(0)2-953010', NULL) ,
  (16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Repr. de cuentas regional', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'Estados Unidos', '(503) 555-9931', NULL),
  (17, 'Svensk Sjöföda AB', 'Michael Björn', 'Representante de ventas', 'Brovallavägen 231', 'Stockholm', NULL, 'S-123 45', 'Suecia', '08-123 45 67', NULL),
  (18, 'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Gerente de ventas', '203, Rue des Francs-Bourgeois', 'París', NULL, '75004', 'Francia', '(1) 03.83.00.68', '(1) 03.83.00.62'),
  (19, 'New England Seafood Cannery', 'Robb Merchant', 'Agente de cuentas al por mayor', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'Estados Unidos', '(617) 555-3267', '(617) 555-3389'),
  (20, 'Leka Trading', 'Chandra Leka', 'Propietario', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapur', '555-8787', NULL),
  (21, 'Lyngbysild', 'Niels Petersen', 'Gerente de ventas', 'Lyngbysild Fiskebakken 10', 'Lyngby', NULL, '2800', 'Dinamarca', '43844108', '43844115'),
  (22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Gerente de contabilidad', 'Verkoop Rijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Holanda', '(12345) 1212', '(12345) 1210'),
  (23, 'Karkki Oy', 'Anne Heikkonen', 'Gerente de producción', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finlandia', '(953) 10956', NULL),
  (24, 'G''day, Mate', 'Wendy Mackenzie', 'Representante de ventas', '170 Prince Edward Parade Hunter''s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873'),
  (25, 'Ma Maison', 'Jean-Guy Lauzon', 'Gerente de marketing', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá', '(514) 555-9022', NULL),
  (26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Administrador de pedidos', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italia', '(089) 6547665', '(089) 6547667'),
  (27, 'Escargots Nouveaux', 'Marie Delamare', 'Gerente de ventas', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'Francia', '85.57.00.07', NULL),
  (28, 'Gai pâturage', 'Eliane Noz', 'Representante de ventas', 'Bat. B 3, rue des Alpes', 'Annecy', NULL, '74000', 'Francia', '38.76.98.06', '38.76.98.58'),
  (29, 'Forêts d''érables', 'Chantal Goulet', 'Gerente de contabilidad', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canadá', '(514) 555-2955', '(514) 555-2921')
GO

---------------------------------------------------
--
-- Data for table Empleados  (LIMIT 0,500)
--

INSERT INTO Empleados 
VALUES 
  (1, 'Davolio', 'Nancy', 'Representante de ventas', 'Srta.', '08/12/1973', '01/05/2008', '507 - 20th Ave. E. Apt. 2A', 'Seattle', 'WA', '98122', 'EE.UU.', '(206) 555-9857', '5467'),
  (2, 'Fuller', 'Andrew', 'Vicepresidente comercial', 'Dr.', '19/02/1977', '14/08/2008', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'EE.UU.', '(206) 555-9482', '3457'),
  (3, 'Leverling', 'Janet', 'Representante de ventas', 'Srta.', '30/08/1988', '01/04/2008', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'EE.UU.', '(206) 555-3412', '3355'),
  (4, 'Peacock', 'Margaret', 'Representante de ventas', 'Sra.', '19/09/1964', '03/05/2010', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'EE.UU.', '(206) 555-8122', '5176'),
  (5, 'Buchanan', 'Steven', 'Gerente de ventas', 'Sr.', '04/03/1980', '17/10/2010', '14 Garrett Hill', 'Londres', NULL, 'SW1 8JR', 'Reino Unido', '(71) 555-4848', '3453'),
  (6, 'Suyama', 'Michael', 'Representante de ventas', 'Sr.', '02/07/1988', '17/10/2010', 'Coventry House Miner Rd.', 'Londres', NULL, 'EC2 7JR', 'Reino Unido', '(71) 555-7773', '428'),
  (7, 'King', 'Robert', 'Representante de ventas', 'Sr.', '29/05/1986', '02/01/2013', 'Edgeham Hollow Winchester Way', 'Londres', NULL, 'RG1 9SP', 'Reino Unido', '(71) 555-5598', '465'),
  (8, 'Callahan', 'Laura', 'Coordinador ventas interno', 'Srta.', '09/01/1983', '05/03/2013', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'EE.UU.', '(206) 555-1189', '2344'),
  (9, 'Dodsworth', 'Anne', 'Representante de ventas', 'Srta.', '27/01/1986', '15/11/2015', '7 Houndstooth Rd.', 'Londres', NULL, 'WG2 7LT', 'Reino Unido', '(71) 555-4444', '452')
GO

--------------------------------------------------------------------

--
-- Definition for indices : 
--

ALTER TABLE Categorias
ADD CONSTRAINT PK_Categorias 
PRIMARY KEY CLUSTERED (IdCategoria)
GO

ALTER TABLE Clientes
ADD CONSTRAINT PK_Clientes 
PRIMARY KEY CLUSTERED (IdCliente)
GO

ALTER TABLE Empleados
ADD CONSTRAINT PK_Empleados 
PRIMARY KEY CLUSTERED (IdEmpleado)
GO

ALTER TABLE Pedidos
ADD CONSTRAINT PK_Pedidos 
PRIMARY KEY CLUSTERED (IdPedido)
GO

ALTER TABLE Productos
ADD CONSTRAINT PK_Productos 
PRIMARY KEY CLUSTERED (IdProducto)
GO

ALTER TABLE Proveedores
ADD CONSTRAINT PK_Proveedores 
PRIMARY KEY CLUSTERED (IdProveedor)
GO

--
-- Definition for foreign keys : 
--

ALTER TABLE Detalles_Pedidos
ADD CONSTRAINT FK_Detalles_Pedidos_Pedidos FOREIGN KEY (IdPedido) 
  REFERENCES Pedidos (IdPedido)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE Detalles_Pedidos
ADD CONSTRAINT FK_Detalles_Pedidos_Productos FOREIGN KEY (IdProducto) 
  REFERENCES Productos (IdProducto)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE Pedidos
ADD CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (IdCliente) 
  REFERENCES Clientes (IdCliente)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE Pedidos
ADD CONSTRAINT FK_Pedidos_Empleados FOREIGN KEY (IdEmpleado) 
  REFERENCES Empleados (IdEmpleado)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Categorias FOREIGN KEY (IdCategoria) 
  REFERENCES Categorias (IdCategoria)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Proveedores FOREIGN KEY (IdProveedor) 
  REFERENCES Proveedores (IdProveedor)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

-----------------------------------------------
ALTER TABLE CLIENTES 
	ADD Eliminado CHAR(2)
	CONSTRAINT DF_Clientes_Eliminado DEFAULT('No') WITH VALUES
GO

ALTER TABLE CATEGORIAS 
	ADD Eliminado CHAR(2) 
	CONSTRAINT DF_Categorias_Eliminado DEFAULT('No') WITH VALUES
GO

ALTER TABLE EMPLEADOS 
	ADD Eliminado CHAR(2) 
	CONSTRAINT DF_Empleados_Eliminado DEFAULT('No') WITH VALUES
GO

ALTER TABLE PRODUCTOS 
	ADD Eliminado CHAR(2) 
	CONSTRAINT DF_Productos_Eliminado DEFAULT('No') WITH VALUES
GO

ALTER TABLE PROVEEDORES 
	ADD Eliminado CHAR(2) 
	CONSTRAINT DF_Proveedores_Eliminado DEFAULT('No') WITH VALUES
GO

ALTER TABLE PEDIDOS 
	ADD Eliminado CHAR(2) 
	CONSTRAINT DF_Pedidos_Eliminado DEFAULT('No') WITH VALUES
GO

ALTER TABLE DETALLES_PEDIDOS 
	ADD Eliminado CHAR(2) 
	CONSTRAINT DF_Detalles_Pedidos_Eliminado DEFAULT('No') WITH VALUES
GO

ALTER TABLE DETALLES_PEDIDOS 
	ADD CONSTRAINT PK_Detalles_Pedidos 
	PRIMARY KEY(IdPedido, IdProducto)
GO



------------------------------------------------
SET NOCOUNT OFF
GO

SELECT 'BASE DE DATOS Neptuno2023 CREADA CORRECTAMENTE' AS MENSAJE
GO
