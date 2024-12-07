CREATE DATABASE tech_1;
GO

USE tech_1;
GO

CREATE LOGIN svc_con_mngt
WITH PASSWORD = '${SVC_PASS}';
GO

CREATE USER svc_con_mngt
FOR LOGIN svc_con_mngt;
GO

USE tech_1;
GO

EXEC sp_addrolemember 'db_datareader', 'svc_con_mngt';
GO
EXEC sp_addrolemember 'db_datawriter', 'svc_con_mngt';
GO

CREATE SCHEMA ContactsManagement;
GO

CREATE TABLE ContactsManagement.Contact (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Nome varchar(255) NOT NULL,
	Email varchar(255) NOT NULL,
	Ddd int,
	Telefone int,
    SituacaoAnterior int NULL,
    SituacaoAtual int NULL
);
GO

IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'Contact_Ddd')   
    DROP INDEX IX_Contact_Ddd ON ContactsManagement.Contact;
GO

CREATE NONCLUSTERED INDEX IX_Contact_Ddd   
    ON ContactsManagement.Contact (Ddd);   
GO  

INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Mr. Kelli Robel',N'Trinity.Morissette38@gmail.com',51,82855853,NULL,1),
	 (N'Sonya OConnell',N'Lisette_OConner@hotmail.com',97,51006137,NULL,1),
	 (N'Toby Terry',N'Josiane2@yahoo.com',72,69708345,NULL,1),
	 (N'Dolores Watsica',N'Lesley72@hotmail.com',87,65352134,NULL,1),
	 (N'Sheri Bradtke IV',N'Shanelle.Boehm83@hotmail.com',93,68573890,NULL,1),
	 (N'Lori Effertz',N'Julio_OConnell@yahoo.com',62,67064397,NULL,1),
	 (N'Wilma Abernathy',N'Ignacio.Barrows@hotmail.com',68,44782172,NULL,1),
	 (N'Dianne Little',N'Eduardo_OKon@gmail.com',32,66138510,NULL,1),
	 (N'Whitney Dare',N'Osborne_Bergstrom66@hotmail.com',66,17675741,NULL,1),
	 (N'Ms. Jan Quigley PhD',N'Angeline28@hotmail.com',41,79192554,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Belinda Greenfelder',N'Ruben33@gmail.com',76,18818067,NULL,1),
	 (N'Ed Bruen',N'Vivian.Lubowitz97@yahoo.com',15,60968555,NULL,1),
	 (N'Dorothy Hudson I',N'Guy74@hotmail.com',40,65142078,NULL,1),
	 (N'Marianne Lesch',N'Alden.Reinger@gmail.com',13,64992087,NULL,1),
	 (N'Ms. Olga White',N'Maria.Bernier@hotmail.com',19,39786113,NULL,1),
	 (N'Sophia Pacocha',N'Angeline_Denesik@gmail.com',70,94837656,NULL,1),
	 (N'Beth Kohler',N'Orland.DAmore58@hotmail.com',46,66890965,NULL,1),
	 (N'Esther Crooks',N'Marilyne.Herman34@hotmail.com',31,49867592,NULL,1),
	 (N'Owen Watsica',N'Shad_Orn@yahoo.com',91,93383746,NULL,1),
	 (N'Aubrey Kunde',N'Eliezer_Quitzon23@hotmail.com',17,63230001,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Christina McKenzie',N'Adeline52@hotmail.com',20,69848249,NULL,1),
	 (N'Paulette Rolfson',N'Chyna.Gottlieb@hotmail.com',51,8583420,NULL,1),
	 (N'Drew Rogahn',N'Aaliyah.Kiehn62@hotmail.com',33,92535150,NULL,1),
	 (N'Sherry Smith',N'Broderick.Upton52@yahoo.com',94,38608924,NULL,1),
	 (N'Lynda Harber',N'Heber.Boyle@hotmail.com',17,49985910,NULL,1),
	 (N'Lena Runolfsson',N'Elroy_Denesik14@gmail.com',81,30216943,NULL,1),
	 (N'Vickie Hagenes',N'Kristofer43@hotmail.com',58,78137988,NULL,1),
	 (N'Lula Schuster',N'Pearl25@yahoo.com',23,83405873,NULL,1),
	 (N'Vicki Yost',N'Dylan.Reilly@yahoo.com',11,24464037,NULL,1),
	 (N'Angelo Monahan',N'Josianne.Macejkovic97@gmail.com',30,92336048,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Myra Nader',N'Mathew.Rippin97@yahoo.com',81,74826255,NULL,1),
	 (N'Mr. Luz Gerlach',N'Arch54@yahoo.com',50,94328942,NULL,1),
	 (N'Pauline Gulgowski',N'Jerald_Bednar@gmail.com',98,25358030,NULL,1),
	 (N'Mr. Harvey Kautzer',N'Lyric_Watsica@hotmail.com',45,88321750,NULL,1),
	 (N'Samantha McGlynn',N'Vinnie17@yahoo.com',48,55885997,NULL,1),
	 (N'Theresa Lindgren',N'Oswald64@hotmail.com',48,6034551,NULL,1),
	 (N'David Marvin',N'Onie.Cassin@hotmail.com',86,61482364,NULL,1),
	 (N'Sheryl Champlin',N'Laura_Hahn@gmail.com',38,6739058,NULL,1),
	 (N'Kristen Greenfelder',N'Lucile_McGlynn@hotmail.com',15,21928127,NULL,1),
	 (N'Ismael Hegmann',N'Carole_Ziemann7@yahoo.com',37,48066034,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Natasha Breitenberg',N'Kurt39@gmail.com',65,25729797,NULL,1),
	 (N'Jim Hintz',N'Pearl_Schoen28@hotmail.com',71,95295643,NULL,1),
	 (N'Melba Sanford',N'Ethelyn.Quigley@gmail.com',20,58340292,NULL,1),
	 (N'Angie Hackett',N'Peyton_Kirlin95@yahoo.com',33,47572198,NULL,1),
	 (N'Sherman Johns',N'Dina.Lindgren59@hotmail.com',15,34221661,NULL,1),
	 (N'Samuel Balistreri',N'Susanna.Pacocha33@gmail.com',95,98294227,NULL,1),
	 (N'Carlton Mraz',N'Lucious94@yahoo.com',10,60795097,NULL,1),
	 (N'Richard Rice',N'Nathaniel_Johnson95@gmail.com',42,61178457,NULL,1),
	 (N'Ryan Runte',N'Willa_Green@gmail.com',46,4342914,NULL,1),
	 (N'Ms. Steven Sawayn',N'Merl.Marquardt@yahoo.com',14,40339293,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Orville Johns',N'Lester.Stamm97@hotmail.com',94,33801048,NULL,1),
	 (N'Leah Lowe',N'Brooklyn_Shields18@gmail.com',16,59390862,NULL,1),
	 (N'Janie OKeefe II',N'Lorna_Bins19@gmail.com',58,3919307,NULL,1),
	 (N'Terrell Cummings',N'Scottie.Barrows25@hotmail.com',56,13113651,NULL,1),
	 (N'Iris Legros',N'Loma_Hickle67@yahoo.com',58,68754448,NULL,1),
	 (N'Dianne Wiza',N'Israel.Casper23@gmail.com',85,26411477,NULL,1),
	 (N'Annette McGlynn',N'Kristoffer_Boehm@yahoo.com',30,41104750,NULL,1),
	 (N'Mrs. Preston Jakubowski',N'Elda_Lakin@yahoo.com',81,40601194,NULL,1),
	 (N'Bonnie Nader',N'Royal87@hotmail.com',72,79921750,NULL,1),
	 (N'Kay Heaney',N'Kayden8@hotmail.com',64,85317496,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Miss Cecelia Anderson',N'Felipe_Torphy@yahoo.com',94,10512888,NULL,1),
	 (N'Gladys Muller',N'Conner.Herman@yahoo.com',85,75785728,NULL,1),
	 (N'Emily Hermann',N'Eladio.Denesik@gmail.com',54,90138620,NULL,1),
	 (N'Christina McGlynn',N'Bernice_Goyette@hotmail.com',55,93687891,NULL,1),
	 (N'David Bins',N'Carley_Vandervort69@gmail.com',10,4154837,NULL,1),
	 (N'Bert Fisher DVM',N'Evans_Beatty@yahoo.com',64,41422757,NULL,1),
	 (N'Mrs. Carmen Sauer',N'Kayden95@gmail.com',51,25790266,NULL,1),
	 (N'Sammy Altenwerth',N'Name.Barrows@yahoo.com',43,2391467,NULL,1),
	 (N'Erma Morissette',N'Fae48@hotmail.com',31,86814293,NULL,1),
	 (N'Olivia Block II',N'Amir30@gmail.com',99,76915050,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Becky Konopelski',N'Rowan56@gmail.com',97,90254575,NULL,1),
	 (N'Beatrice Mills',N'Krystina_Schowalter@yahoo.com',71,99668620,NULL,1),
	 (N'Julius Jaskolski',N'Vida.Bogisich72@gmail.com',27,80301332,NULL,1),
	 (N'Nelson Wuckert',N'Ryder.Beatty48@yahoo.com',51,69947467,NULL,1),
	 (N'Mrs. Billy Wuckert',N'Frederick.Gulgowski86@hotmail.com',97,90765787,NULL,1),
	 (N'Johnny Little',N'Cory_Frami44@yahoo.com',17,83750816,NULL,1),
	 (N'Wade Crona',N'Mathilde_Collier@yahoo.com',78,94106829,NULL,1),
	 (N'Louis Schinner',N'Jaime.Hills34@hotmail.com',34,72981802,NULL,1),
	 (N'Viola Hand',N'Joyce_King57@hotmail.com',95,20632465,NULL,1),
	 (N'Alex Roberts II',N'Lewis46@yahoo.com',34,94237611,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Lila Kub III',N'Janice45@yahoo.com',24,5945090,NULL,1),
	 (N'Eunice Wyman',N'Corrine.Kemmer@yahoo.com',85,45456014,NULL,1),
	 (N'Desiree Schuster',N'Susanna56@hotmail.com',34,53485080,NULL,1),
	 (N'Becky Rice DDS',N'Violette16@hotmail.com',19,19125709,NULL,1),
	 (N'Tasha Mayert',N'Gabe_Mayert29@gmail.com',68,50441723,NULL,1),
	 (N'Delores Mertz',N'Olen_VonRueden@yahoo.com',60,10279620,NULL,1),
	 (N'Mrs. Gerard Flatley',N'Tobin_Satterfield50@yahoo.com',54,22202480,NULL,1),
	 (N'Claude Schimmel DVM',N'Mitchell.Luettgen@yahoo.com',37,73573640,NULL,1),
	 (N'Jennie Gorczany',N'Jeramie3@hotmail.com',83,51804791,NULL,1),
	 (N'Edna Williamson',N'Izaiah_OConnell45@hotmail.com',33,54165543,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Cristina McDermott',N'Adriel.Trantow68@gmail.com',11,57007929,NULL,1),
	 (N'Van Sawayn V',N'Mollie61@hotmail.com',25,94879606,NULL,1),
	 (N'Ray Kozey',N'Eleazar.Pfannerstill@hotmail.com',90,54500882,NULL,1),
	 (N'Heidi Bradtke',N'Amani_Goodwin8@yahoo.com',41,17891811,NULL,1),
	 (N'Olivia Zulauf',N'Mariana_Beer82@hotmail.com',56,82094943,NULL,1),
	 (N'Audrey Torp',N'Rozella_Lueilwitz88@gmail.com',81,94657019,NULL,1),
	 (N'Miss Lora Mann',N'Irma_Greenfelder@yahoo.com',39,72381326,NULL,1),
	 (N'Elaine Crona I',N'Marilyne.Yost40@gmail.com',67,55370840,NULL,1),
	 (N'Aaron Will',N'Alessia.Ernser8@hotmail.com',36,56372815,NULL,1),
	 (N'Nelson Macejkovic',N'Dave67@yahoo.com',69,68048382,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Claude Robel',N'Andreane14@hotmail.com',69,318905,NULL,1),
	 (N'Muriel Rice',N'Loraine20@yahoo.com',87,40995347,NULL,1),
	 (N'Ms. Samantha Jacobi',N'Edmond.Schneider@yahoo.com',25,97855230,NULL,1),
	 (N'Viola Dibbert',N'Orpha_West16@gmail.com',98,52303286,NULL,1),
	 (N'Ron Pfeffer',N'Rey6@gmail.com',33,18539466,NULL,1),
	 (N'Barry Moen',N'Mark_Swift56@hotmail.com',45,73090675,NULL,1),
	 (N'Israel Haag',N'Justen_Kuphal@hotmail.com',63,45615803,NULL,1),
	 (N'Evelyn Blick',N'Karl.Gislason24@hotmail.com',77,76685771,NULL,1),
	 (N'Ms. Bennie Waters',N'Aylin_Cormier9@gmail.com',55,20476686,NULL,1),
	 (N'Elsa Hagenes',N'Cole_Hammes57@gmail.com',61,440141,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Beulah Hickle PhD',N'Earline.Dooley@yahoo.com',77,80938675,NULL,1),
	 (N'Ross Howe',N'Summer28@yahoo.com',21,53182625,NULL,1),
	 (N'Jerald Wintheiser DVM',N'Jada_Parker@yahoo.com',16,9006568,NULL,1),
	 (N'Tami Ward',N'Lonie68@yahoo.com',23,67190132,NULL,1),
	 (N'Jonathan Lowe',N'Xander21@hotmail.com',19,91711781,NULL,1),
	 (N'Bernice Kihn',N'Dean30@yahoo.com',82,76587393,NULL,1),
	 (N'Karla Schinner',N'Gene_Hackett@hotmail.com',92,73755204,NULL,1),
	 (N'Jennie Kilback',N'Reid_Kautzer52@yahoo.com',23,46836796,NULL,1),
	 (N'Mr. Gretchen Gulgowski',N'Dana63@gmail.com',37,30522329,NULL,1),
	 (N'Mrs. Melinda Dickens',N'Cleora_Hickle22@yahoo.com',78,44248648,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Sara Sanford',N'Matilda_Heathcote@yahoo.com',23,36577541,NULL,1),
	 (N'Dale Langosh',N'Alta36@hotmail.com',76,83459616,NULL,1),
	 (N'Lola Kris',N'Retta.Jenkins54@yahoo.com',71,5150883,NULL,1),
	 (N'Beth Huels',N'Quentin_Wiegand55@gmail.com',64,20656641,NULL,1),
	 (N'Priscilla Hayes',N'Dayton97@hotmail.com',86,43310370,NULL,1),
	 (N'Darrell Moore',N'Janis76@gmail.com',48,32323468,NULL,1),
	 (N'Gregg Langworth',N'Barton98@hotmail.com',54,7365492,NULL,1),
	 (N'Bradley Dare',N'Marcos78@gmail.com',69,33109173,NULL,1),
	 (N'Sonia Dooley',N'Lindsey95@yahoo.com',83,73179650,NULL,1),
	 (N'Jeffery Satterfield',N'Dillan_Hoeger24@gmail.com',11,96921980,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ricardo Sauer',N'Marcellus.Tillman87@hotmail.com',29,55176102,NULL,1),
	 (N'Ebony Oberbrunner',N'Kelsie.Corkery5@hotmail.com',10,71145284,NULL,1),
	 (N'Mr. Toby Huels',N'Katheryn_Stamm@gmail.com',47,75195142,NULL,1),
	 (N'Laura Schultz DVM',N'Makenzie.Ryan@yahoo.com',59,14083010,NULL,1),
	 (N'Nancy Franey',N'Winnifred4@hotmail.com',69,71417296,NULL,1),
	 (N'Seth Reynolds I',N'Monserrat43@gmail.com',83,10913819,NULL,1),
	 (N'Marta Langworth',N'Berry_Legros17@hotmail.com',59,63859988,NULL,1),
	 (N'Barbara Krajcik IV',N'Lemuel_Swaniawski@yahoo.com',37,5395947,NULL,1),
	 (N'Lillian McCullough',N'Aurelio.Langworth@hotmail.com',98,26867921,NULL,1),
	 (N'Alfred Runolfsson',N'Luella_Roberts10@yahoo.com',47,62314808,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Marlene Waters',N'Buford.Flatley15@yahoo.com',77,90970039,NULL,1),
	 (N'Phyllis Klein',N'Frederick56@hotmail.com',61,48863654,NULL,1),
	 (N'Sammy Romaguera DDS',N'Keagan.Kirlin@hotmail.com',39,96170268,NULL,1),
	 (N'Theresa Wehner Sr.',N'Gabriella67@hotmail.com',62,58166735,NULL,1),
	 (N'Glenda Terry',N'Mariana_Barton33@hotmail.com',67,73288583,NULL,1),
	 (N'Dr. Darlene McClure',N'Waldo6@hotmail.com',58,3007677,NULL,1),
	 (N'Paula Wiza',N'Lorenzo.Tillman@hotmail.com',99,42312788,NULL,1),
	 (N'Bennie Padberg',N'Ellis.Berge44@hotmail.com',91,74306945,NULL,1),
	 (N'Scott Little',N'Javier.Emmerich@gmail.com',69,76778387,NULL,1),
	 (N'Wallace Ernser',N'Uriah.Robel39@yahoo.com',88,43423953,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Casey Ankunding',N'Corine_Reynolds0@gmail.com',34,79000414,NULL,1),
	 (N'Craig McLaughlin',N'Abdul.Bashirian@hotmail.com',30,66733890,NULL,1),
	 (N'Johnnie Wintheiser',N'Thora_Dooley57@gmail.com',75,13699270,NULL,1),
	 (N'Joshua Pfannerstill',N'Theodore35@hotmail.com',21,36758097,NULL,1),
	 (N'Henrietta Erdman',N'Lily_Gulgowski@gmail.com',87,3788305,NULL,1),
	 (N'Sheldon Nienow',N'Shemar5@hotmail.com',12,43896638,NULL,1),
	 (N'Miss Roger Stracke',N'Lorenzo_Barrows97@gmail.com',35,55357736,NULL,1),
	 (N'Billy Collier',N'Lolita_Bins4@yahoo.com',76,6692990,NULL,1),
	 (N'Evan Davis PhD',N'Leonel_Hermiston84@yahoo.com',81,26655265,NULL,1),
	 (N'Austin Russel',N'Dock46@yahoo.com',52,791457,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Mabel Schamberger',N'Barney_Rempel22@gmail.com',62,58863295,NULL,1),
	 (N'Dr. Derrick Schumm',N'Iva_Mante@gmail.com',64,88740878,NULL,1),
	 (N'Miss Natalie Skiles',N'Eliseo_Greenfelder@gmail.com',99,32659404,NULL,1),
	 (N'Kenny Friesen',N'Kaitlyn_VonRueden91@gmail.com',19,68337258,NULL,1),
	 (N'Lewis Bins',N'Austin.Bergstrom16@yahoo.com',55,31534332,NULL,1),
	 (N'Sally Huels',N'Sigmund_Gutmann@gmail.com',50,54529033,NULL,1),
	 (N'Derek Dicki',N'Dorothea.Sporer25@hotmail.com',82,21362357,NULL,1),
	 (N'Susie Mohr',N'Americo.Wolff84@yahoo.com',19,73317395,NULL,1),
	 (N'Harvey Kuhic',N'Eusebio.Heller34@yahoo.com',90,21297501,NULL,1),
	 (N'Gilbert Lynch',N'Felipa_Hane@gmail.com',83,78822028,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Diane Vandervort',N'Jillian26@hotmail.com',95,79381827,NULL,1),
	 (N'Jared Farrell',N'Onie.Jerde@hotmail.com',21,95258149,NULL,1),
	 (N'Wilfred Kutch',N'Janet.Hartmann62@hotmail.com',56,68029261,NULL,1),
	 (N'Calvin Lindgren',N'Angus.Oberbrunner51@hotmail.com',26,31720618,NULL,1),
	 (N'Gary Fahey',N'Rossie_Schroeder@yahoo.com',21,22798039,NULL,1),
	 (N'Bobby Will',N'Ford19@hotmail.com',83,96947335,NULL,1),
	 (N'Jon Walker I',N'Wilford25@yahoo.com',84,47948873,NULL,1),
	 (N'Ron McDermott DDS',N'Laisha.OKeefe8@gmail.com',53,11909614,NULL,1),
	 (N'Erik Olson',N'Jacques_Hauck95@gmail.com',98,85672700,NULL,1),
	 (N'Regina Dooley',N'Orpha51@yahoo.com',69,3844774,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Mrs. Kirk Schimmel',N'Kyle_Balistreri@yahoo.com',13,59334218,NULL,1),
	 (N'Kevin Gleichner',N'Bud_Brakus70@gmail.com',52,55346386,NULL,1),
	 (N'Mr. Dora Ruecker',N'Lonnie.Schinner3@yahoo.com',15,28548096,NULL,1),
	 (N'Spencer Murazik',N'Adolphus74@hotmail.com',19,95340880,NULL,1),
	 (N'Arthur Will',N'Norris_Abshire98@hotmail.com',71,86964814,NULL,1),
	 (N'Terrence Frami V',N'Travis_Gottlieb@yahoo.com',88,44043640,NULL,1),
	 (N'Mrs. Nathaniel Hickle',N'Porter_Batz@yahoo.com',92,88680174,NULL,1),
	 (N'Alfredo Parisian',N'Zane93@hotmail.com',95,97520680,NULL,1),
	 (N'Lucille Vandervort',N'Gretchen12@gmail.com',63,43748351,NULL,1),
	 (N'Woodrow Anderson',N'Miller.Bergstrom@yahoo.com',29,17413570,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Saul Nolan',N'Kayla.Nitzsche@hotmail.com',13,25630595,NULL,1),
	 (N'Eunice Zulauf',N'Dolly46@yahoo.com',97,6646722,NULL,1),
	 (N'Michael Champlin',N'Gilbert.Lynch@hotmail.com',42,77909885,NULL,1),
	 (N'Joann Hudson',N'Maxime_Morar85@gmail.com',31,41052942,NULL,1),
	 (N'Felicia Jacobi',N'Helga.Rath37@yahoo.com',39,79265022,NULL,1),
	 (N'Mr. Grace Hettinger',N'Sophie87@hotmail.com',52,24854912,NULL,1),
	 (N'Mrs. Jasmine Schmitt',N'Kristina.Mueller@gmail.com',68,4425817,NULL,1),
	 (N'Jared Pagac',N'Pablo.Pfeffer@yahoo.com',99,195188,NULL,1),
	 (N'Miranda Weimann',N'Adriel.Morissette1@hotmail.com',38,97944667,NULL,1),
	 (N'Raymond Nicolas I',N'Tessie_Spencer32@yahoo.com',55,96563992,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Patrick Leannon',N'Eva52@gmail.com',26,64098661,NULL,1),
	 (N'Ivan Rohan',N'Russ94@yahoo.com',46,95375815,NULL,1),
	 (N'Tina Konopelski',N'Theron.Kilback98@hotmail.com',67,85160750,NULL,1),
	 (N'Sherman Hahn',N'Letha41@gmail.com',30,39184619,NULL,1),
	 (N'Kenny Spinka',N'Maribel77@hotmail.com',39,21423463,NULL,1),
	 (N'Jimmie Keebler Sr.',N'Name.Prohaska@gmail.com',72,15709863,NULL,1),
	 (N'Terrell Hamill',N'Julie_Parker@yahoo.com',32,6690071,NULL,1),
	 (N'Timothy Hickle',N'Antonia.Mann@hotmail.com',24,36793010,NULL,1),
	 (N'Wayne Legros',N'Lauriane88@gmail.com',34,51287220,NULL,1),
	 (N'Jamie Cummerata II',N'Marvin.Jakubowski@hotmail.com',59,24008127,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Georgia Smith',N'Eugene22@gmail.com',37,42412444,NULL,1),
	 (N'Doreen Franey',N'Deondre.Leannon85@yahoo.com',71,17689647,NULL,1),
	 (N'Erma Smitham',N'Buster.Gorczany78@hotmail.com',89,13468990,NULL,1),
	 (N'Daniel Legros',N'Elmer.Casper16@hotmail.com',53,16408397,NULL,1),
	 (N'Judy Lubowitz',N'Maudie29@hotmail.com',88,41318440,NULL,1),
	 (N'Eunice Hermiston',N'Jessie_Streich@yahoo.com',33,48961091,NULL,1),
	 (N'Roland Schimmel',N'Oleta_Gleichner@gmail.com',82,48810556,NULL,1),
	 (N'Mae Barton',N'Jayde35@yahoo.com',40,85498331,NULL,1),
	 (N'Naomi Cormier',N'Gloria_Schinner@hotmail.com',85,60519885,NULL,1),
	 (N'Matthew Dickinson',N'Percival4@hotmail.com',42,62421598,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Adrienne Spinka',N'Jonatan_Okuneva@hotmail.com',79,2581062,NULL,1),
	 (N'Samantha Abbott',N'Tamia.Olson@hotmail.com',80,21940716,NULL,1),
	 (N'Earl Stracke',N'Aileen_DAmore56@hotmail.com',74,84036903,NULL,1),
	 (N'Freddie Davis',N'Bianka_Leannon9@hotmail.com',58,22738248,NULL,1),
	 (N'David Grant',N'Kyler82@hotmail.com',48,17558418,NULL,1),
	 (N'Louis Kulas',N'Alaina20@gmail.com',58,58333236,NULL,1),
	 (N'Rachael Konopelski',N'Nelle.Nolan27@gmail.com',50,7698571,NULL,1),
	 (N'Rosemarie Smitham',N'Pedro.Toy@hotmail.com',20,85534533,NULL,1),
	 (N'Phil Cummerata',N'Bernadine_Bayer74@hotmail.com',17,27121580,NULL,1),
	 (N'Jamie Dickinson',N'Daija.Larkin7@yahoo.com',36,9740453,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Victor Kerluke',N'Kale_Langworth@gmail.com',34,60450056,NULL,1),
	 (N'Essie Braun',N'Axel.Johns52@yahoo.com',34,83516790,NULL,1),
	 (N'Patricia Swift',N'Paul.Collins22@yahoo.com',36,50673443,NULL,1),
	 (N'Milton Nitzsche',N'Jeromy1@gmail.com',88,28263888,NULL,1),
	 (N'Salvatore McClure',N'Eloy33@gmail.com',20,40396298,NULL,1),
	 (N'Luke Kohler',N'Genoveva.McCullough5@gmail.com',15,41892345,NULL,1),
	 (N'Timothy Towne',N'Rod84@gmail.com',44,51925674,NULL,1),
	 (N'Crystal Dietrich',N'Darby.Upton88@gmail.com',55,39587288,NULL,1),
	 (N'Wanda Durgan',N'Mohammad.Schaden@gmail.com',34,65339443,NULL,1),
	 (N'Micheal McKenzie',N'Marty_Ziemann32@hotmail.com',26,46159139,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Earl Wintheiser',N'Freddy_Gottlieb32@gmail.com',93,70254790,NULL,1),
	 (N'Leslie Halvorson',N'Yadira.Zemlak@gmail.com',44,15208393,NULL,1),
	 (N'Ms. Kristy Lowe',N'Gerda81@hotmail.com',99,14980466,NULL,1),
	 (N'Thomas Legros PhD',N'Aglae.Cole@yahoo.com',42,20229217,NULL,1),
	 (N'Veronica Turcotte',N'Alize3@yahoo.com',31,98344251,NULL,1),
	 (N'Guy Morar',N'Kellen.Beer@yahoo.com',99,46394359,NULL,1),
	 (N'Diana Strosin',N'Jonatan95@hotmail.com',58,36313875,NULL,1),
	 (N'Eugene Hickle Sr.',N'Dan.Hintz@hotmail.com',19,22919399,NULL,1),
	 (N'Debbie Rosenbaum',N'Sigrid76@gmail.com',81,80301588,NULL,1),
	 (N'Bradley Price I',N'Quinten49@gmail.com',30,63317870,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ruth Gusikowski',N'Jules14@gmail.com',21,18767961,NULL,1),
	 (N'Lila White',N'Damien50@yahoo.com',38,84726017,NULL,1),
	 (N'Tonya Haley',N'Cassidy.Christiansen43@hotmail.com',99,26251454,NULL,1),
	 (N'Pamela Lind',N'Ramiro27@hotmail.com',54,44397381,NULL,1),
	 (N'Raul Predovic',N'Cierra_Boyer@yahoo.com',44,43690626,NULL,1),
	 (N'Kathy Morar',N'Karen.Abshire@hotmail.com',79,38617856,NULL,1),
	 (N'Angelo Swaniawski',N'Providenci.Koepp3@hotmail.com',92,21367337,NULL,1),
	 (N'Shawn Bauch',N'Ruby_Legros12@yahoo.com',31,36349590,NULL,1),
	 (N'Kay Greenholt',N'Fritz.Green@hotmail.com',30,16399089,NULL,1),
	 (N'Ms. Janet Mann',N'Kenneth.Funk5@gmail.com',52,12659243,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ms. Ben Dach',N'Dee.Howe21@gmail.com',44,797577,NULL,1),
	 (N'Stewart Beatty',N'Jeanette12@gmail.com',78,41660621,NULL,1),
	 (N'Alejandro Howell PhD',N'Orval.Lesch98@hotmail.com',85,8305697,NULL,1),
	 (N'Grace Prohaska MD',N'Trent.OKeefe@gmail.com',30,76997956,NULL,1),
	 (N'Juana MacGyver',N'Ayden_Rice@gmail.com',31,65667766,NULL,1),
	 (N'Ronnie Hauck',N'Darien.Konopelski10@gmail.com',98,7568622,NULL,1),
	 (N'Mr. Casey Nikolaus',N'Van77@yahoo.com',19,32585903,NULL,1),
	 (N'Inez OKeefe',N'Estell_Beer77@hotmail.com',77,69605295,NULL,1),
	 (N'Dora Bergnaum Sr.',N'Dillan_Kub@hotmail.com',60,92154632,NULL,1),
	 (N'Lionel Sauer',N'Leonor72@gmail.com',36,53612065,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Shelly Bechtelar',N'Dedric29@gmail.com',87,81115687,NULL,1),
	 (N'April Kozey IV',N'Hal_Ratke78@hotmail.com',83,6339568,NULL,1),
	 (N'Bobby McLaughlin',N'Thalia_Romaguera@gmail.com',81,7270167,NULL,1),
	 (N'Dr. Levi Turcotte',N'Shawn71@gmail.com',67,15912557,NULL,1),
	 (N'Estelle Bayer',N'Amalia.Hilpert28@gmail.com',34,65102501,NULL,1),
	 (N'Mrs. Deborah Lang',N'Soledad12@yahoo.com',47,87429012,NULL,1),
	 (N'Patty Mayer',N'Janae.Hermiston5@hotmail.com',78,61144237,NULL,1),
	 (N'Viola Rolfson',N'Kurtis86@gmail.com',25,23909873,NULL,1),
	 (N'Ignacio Spinka',N'Madge52@yahoo.com',34,67494235,NULL,1),
	 (N'Clifton Beahan PhD',N'Lindsey_Stiedemann@hotmail.com',93,62704635,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Bobby Tremblay',N'Chyna_Satterfield@yahoo.com',42,98315506,NULL,1),
	 (N'Brett Waelchi',N'Leonard.Nolan67@yahoo.com',62,62481339,NULL,1),
	 (N'Israel Abernathy',N'Odie_Senger35@gmail.com',59,98259144,NULL,1),
	 (N'Miss Lois Kertzmann',N'Grant.Nitzsche@yahoo.com',29,5344744,NULL,1),
	 (N'Pamela Stark DDS',N'Bernard_Stark82@gmail.com',52,41266325,NULL,1),
	 (N'Krystal Morissette',N'Estella77@yahoo.com',27,69193773,NULL,1),
	 (N'Michael Thiel',N'Oleta20@hotmail.com',95,78971236,NULL,1),
	 (N'Sylvester Gibson',N'Eldora_Turcotte@gmail.com',47,84247051,NULL,1),
	 (N'Dan Stiedemann',N'Sigmund_Schmidt75@gmail.com',10,67258856,NULL,1),
	 (N'Elsie Hegmann PhD',N'Fabian_Friesen@hotmail.com',90,34644056,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Juanita Boyle',N'Aaliyah18@hotmail.com',96,17149966,NULL,1),
	 (N'Laverne Kautzer',N'Blaise.Dickens51@hotmail.com',51,36231662,NULL,1),
	 (N'Glen Heller',N'Marietta25@hotmail.com',76,81023497,NULL,1),
	 (N'Mr. Hugh Crist',N'Damion.Murray@hotmail.com',95,35104431,NULL,1),
	 (N'Mercedes Kirlin',N'Olen.Bogisich@yahoo.com',44,46050208,NULL,1),
	 (N'Marianne Metz',N'Nicholaus17@yahoo.com',40,29206616,NULL,1),
	 (N'Judy Mills',N'Emelie_Torphy74@gmail.com',10,40696066,NULL,1),
	 (N'Marion Koss',N'Susan.Zieme83@hotmail.com',10,9321636,NULL,1),
	 (N'Dianne Stanton',N'Loma.Flatley26@gmail.com',79,39653966,NULL,1),
	 (N'Ken Hintz',N'Connor_Deckow38@gmail.com',99,20824054,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ruben Mayert',N'Eladio_Mraz11@gmail.com',51,62961869,NULL,1),
	 (N'Stephanie Carroll',N'Elissa46@yahoo.com',43,20322487,NULL,1),
	 (N'Patti White',N'Jamarcus_Nolan@gmail.com',66,61916923,NULL,1),
	 (N'Caroline Crist DDS',N'Irving18@yahoo.com',89,93487315,NULL,1),
	 (N'Wendell Wisozk',N'Elisabeth40@gmail.com',93,69791050,NULL,1),
	 (N'Mrs. Benny OReilly I',N'Claudine_Gutmann@hotmail.com',36,36616960,NULL,1),
	 (N'Dustin Baumbach Sr.',N'Arlene_Kuvalis90@hotmail.com',34,23964832,NULL,1),
	 (N'Gregg McClure',N'Alek.Ritchie@hotmail.com',88,59097125,NULL,1),
	 (N'Ms. Katrina Lubowitz',N'Albertha.Leffler36@yahoo.com',65,61075813,NULL,1),
	 (N'Meredith Ziemann PhD',N'Louie.Durgan@hotmail.com',22,46636471,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Wendell Koepp',N'Baylee.Runolfsdottir@hotmail.com',63,57426096,NULL,1),
	 (N'Mr. Alejandro Parisian',N'Kari_Gulgowski@gmail.com',90,26153030,NULL,1),
	 (N'Angelo Haley',N'Darryl_Kuhic@hotmail.com',61,83446663,NULL,1),
	 (N'Angelina Legros DVM',N'Isadore_Herzog5@hotmail.com',33,77707566,NULL,1),
	 (N'Eva Hettinger',N'Reva_Beahan54@yahoo.com',58,49845462,NULL,1),
	 (N'Tim Nader',N'Jaeden56@yahoo.com',91,18547369,NULL,1),
	 (N'Andrea Leannon Jr.',N'Fay.Brekke@hotmail.com',25,75078887,NULL,1),
	 (N'Marty Fisher',N'Ceasar.Schaden@yahoo.com',64,91771485,NULL,1),
	 (N'Felipe Rolfson',N'Adrien.Jacobi@yahoo.com',30,45579448,NULL,1),
	 (N'Ethel Farrell',N'Muhammad47@yahoo.com',27,35256416,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Casey Upton',N'Marguerite.Hilpert52@yahoo.com',96,3379926,NULL,1),
	 (N'Lynne Mosciski',N'Timothy.Hartmann@hotmail.com',14,32945794,NULL,1),
	 (N'Dr. Kelly Bednar',N'Shane_Shanahan@hotmail.com',92,91411628,NULL,1),
	 (N'Russell Turcotte',N'Abby2@yahoo.com',66,97558862,NULL,1),
	 (N'Mrs. Wesley Schmeler',N'Woodrow_Koepp@hotmail.com',48,32822127,NULL,1),
	 (N'Ms. Ross Daugherty',N'Mose_Flatley72@gmail.com',86,43950423,NULL,1),
	 (N'Jesus Kuhlman',N'Hubert_Kunde@yahoo.com',15,69829071,NULL,1),
	 (N'Jeffrey Heathcote',N'Antonietta12@hotmail.com',95,67952601,NULL,1),
	 (N'Maureen Raynor',N'Leif98@gmail.com',62,93523091,NULL,1),
	 (N'Hugh Gulgowski',N'Mittie_Schiller@hotmail.com',16,75586110,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Debbie Grant II',N'Kallie_Jones@yahoo.com',94,6048025,NULL,1),
	 (N'Melvin Leuschke',N'Maye70@hotmail.com',72,92767240,NULL,1),
	 (N'Cory Haley IV',N'Bianka80@gmail.com',52,36166069,NULL,1),
	 (N'Neil Hodkiewicz',N'Nora.Schinner@hotmail.com',42,92906076,NULL,1),
	 (N'Kelvin Schinner',N'Kellen83@hotmail.com',22,79927005,NULL,1),
	 (N'Mrs. Josefina West',N'Sigrid_Anderson54@gmail.com',47,3799406,NULL,1),
	 (N'Dr. Calvin Lakin Jr.',N'Gino67@gmail.com',94,34654002,NULL,1),
	 (N'Andrew Gorczany',N'Marilie30@gmail.com',20,76522860,NULL,1),
	 (N'Ronnie Huels',N'Marco_Kshlerin70@hotmail.com',16,98274094,NULL,1),
	 (N'Pat Reichert',N'Laurine_Reinger@yahoo.com',54,76074779,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Aaron Schroeder',N'Marie.Wiza58@yahoo.com',92,51481286,NULL,1),
	 (N'Miss Stanley Abshire',N'Trudie.Donnelly38@hotmail.com',86,44409720,NULL,1),
	 (N'Mrs. Henry Johns',N'Herminia6@yahoo.com',83,8667463,NULL,1),
	 (N'Jackie Zulauf',N'Jeremie.Klein36@yahoo.com',93,86793457,NULL,1),
	 (N'Mrs. Gwen Quitzon',N'Lorena_Altenwerth@gmail.com',15,55073919,NULL,1),
	 (N'Duane Schulist',N'Cristian_Stehr@gmail.com',49,88637456,NULL,1),
	 (N'Geneva Hegmann',N'Barry_Simonis@hotmail.com',11,32051170,NULL,1),
	 (N'Wilma Gibson',N'Darrel_Harris87@yahoo.com',91,63466061,NULL,1),
	 (N'Karl Harvey',N'Aric_Halvorson@hotmail.com',73,79775647,NULL,1),
	 (N'Kelly Feeney',N'Ezequiel.Predovic@gmail.com',40,21977440,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Chris Bayer',N'Mandy.Hamill45@yahoo.com',58,57986847,NULL,1),
	 (N'Corey Greenfelder MD',N'Jairo.Rau@hotmail.com',15,23591573,NULL,1),
	 (N'Silvia Kunde',N'Kraig_Koepp@hotmail.com',56,92137117,NULL,1),
	 (N'Rita Bailey',N'Lacey89@yahoo.com',18,38905519,NULL,1),
	 (N'Randal Stroman',N'Darren_White35@yahoo.com',72,90661801,NULL,1),
	 (N'Ms. Carlos Durgan',N'Hudson0@yahoo.com',77,83421019,NULL,1),
	 (N'Isaac Walker',N'Bernardo.Orn@yahoo.com',20,82778058,NULL,1),
	 (N'Margarita Schowalter',N'Palma78@gmail.com',30,53823927,NULL,1),
	 (N'Dr. Ted Carroll',N'Audie82@gmail.com',91,12405657,NULL,1),
	 (N'Ashley Murphy I',N'Johann48@gmail.com',67,71415232,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Beatrice Corwin',N'Roman_Kris78@gmail.com',16,49590438,NULL,1),
	 (N'Bridget Labadie',N'Imogene87@yahoo.com',13,93463648,NULL,1),
	 (N'Bill Beatty',N'Lenny.Luettgen54@hotmail.com',49,33962369,NULL,1),
	 (N'Roxanne Schinner',N'Angeline72@gmail.com',33,35112901,NULL,1),
	 (N'Annie Torp IV',N'Verdie.Rowe93@gmail.com',51,32732108,NULL,1),
	 (N'Bernard Terry',N'Milan.Moen@yahoo.com',10,88784776,NULL,1),
	 (N'Marc Sanford Jr.',N'Fay43@gmail.com',96,74490514,NULL,1),
	 (N'Donald Daugherty',N'Bridie_McKenzie@hotmail.com',87,99779643,NULL,1),
	 (N'Enrique Tremblay',N'Harley.Mohr80@gmail.com',70,91700399,NULL,1),
	 (N'Laura Treutel',N'Aimee86@yahoo.com',75,41738927,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Marjorie Kozey',N'Jerrold_Williamson@gmail.com',83,3368731,NULL,1),
	 (N'Terrence Zulauf',N'Helen.Hodkiewicz71@hotmail.com',85,47096555,NULL,1),
	 (N'Donna Jaskolski',N'Raul.Koelpin86@gmail.com',61,65780320,NULL,1),
	 (N'Martin Ondricka',N'Cole_Davis@hotmail.com',87,24972466,NULL,1),
	 (N'Marcos Tromp',N'Royce.Schamberger4@yahoo.com',76,52834674,NULL,1),
	 (N'Donald Russel',N'Idella84@hotmail.com',65,70693268,NULL,1),
	 (N'Kelvin Grady',N'Margarett65@yahoo.com',70,32824140,NULL,1),
	 (N'Ms. Alberta Mann',N'Austen89@hotmail.com',76,94585712,NULL,1),
	 (N'Daryl Brakus',N'Dominic.Green@yahoo.com',74,85419364,NULL,1),
	 (N'Miss Caroline Fay',N'Aron44@yahoo.com',90,79364569,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Carl Oberbrunner',N'Everett.Ernser75@yahoo.com',36,95962197,NULL,1),
	 (N'Joe Franey',N'Bryon.Hills@hotmail.com',20,50020162,NULL,1),
	 (N'Mr. Sonia Franecki Sr.',N'Taryn.Hilll20@hotmail.com',80,89734864,NULL,1),
	 (N'Becky Schamberger',N'Colt79@yahoo.com',75,83750581,NULL,1),
	 (N'Alma Stokes',N'Samantha.Klein@yahoo.com',36,72282299,NULL,1),
	 (N'Mitchell Klocko',N'Eloise_Hahn@gmail.com',73,16259112,NULL,1),
	 (N'Ernestine Hamill',N'Oliver_Pacocha68@yahoo.com',63,89960070,NULL,1),
	 (N'Darla MacGyver',N'Alfredo_Koelpin36@hotmail.com',63,66671422,NULL,1),
	 (N'Sue Kuhic V',N'Morton_Bruen@yahoo.com',15,97859468,NULL,1),
	 (N'Matthew Graham',N'Novella_Torp@hotmail.com',34,41657993,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Edith Rogahn',N'Lew_Johns54@yahoo.com',55,33149109,NULL,1),
	 (N'Elmer Gulgowski',N'Roxane17@yahoo.com',70,76753656,NULL,1),
	 (N'Laura Ondricka',N'Lionel.Grant78@hotmail.com',11,57909846,NULL,1),
	 (N'Tyler Zulauf',N'Alexander_Price13@hotmail.com',16,93435699,NULL,1),
	 (N'Alma Yundt',N'Albertha.Ondricka@hotmail.com',66,73970903,NULL,1),
	 (N'Herbert Wolf',N'Piper38@gmail.com',69,14686030,NULL,1),
	 (N'Lindsey Mills',N'Isabel3@yahoo.com',93,9448763,NULL,1),
	 (N'Kurt Marks',N'Katrine23@gmail.com',69,47232448,NULL,1),
	 (N'Pete Dickinson',N'Madie_Hackett96@gmail.com',76,45707357,NULL,1),
	 (N'Mae Ryan',N'Carlos.Krajcik@yahoo.com',96,15280719,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Laverne Bruen',N'Constance.Champlin56@yahoo.com',31,30040206,NULL,1),
	 (N'Harold Mitchell',N'Dayna.Howe@yahoo.com',60,86129439,NULL,1),
	 (N'Erma Lehner',N'Janice.Schultz@hotmail.com',39,87491798,NULL,1),
	 (N'Angelo Watsica',N'Rhett.Bogan@gmail.com',64,56662617,NULL,1),
	 (N'Christy Hansen',N'Leanne_Rutherford57@hotmail.com',19,54985026,NULL,1),
	 (N'Jeanne Stroman',N'Chaya_Dicki48@gmail.com',97,65677056,NULL,1),
	 (N'Mrs. Shannon Jakubowski',N'Adrian.Bogisich@yahoo.com',36,17515346,NULL,1),
	 (N'Charlie Ullrich',N'Dell.Ziemann65@yahoo.com',21,77939312,NULL,1),
	 (N'Mrs. Miranda Gleichner',N'Kenna_Erdman57@yahoo.com',23,82588696,NULL,1),
	 (N'Jody Deckow',N'Olin25@yahoo.com',37,32443737,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Karl Jaskolski',N'Priscilla.Shanahan52@gmail.com',25,68140902,NULL,1),
	 (N'Ernesto Nikolaus',N'Vivian.Russel@gmail.com',74,34323400,NULL,1),
	 (N'Elvira Cartwright',N'Rolando.Bernhard@yahoo.com',41,13479143,NULL,1),
	 (N'Dr. Annette Ledner',N'Saige_Okuneva@yahoo.com',35,46096800,NULL,1),
	 (N'Miss Lee Gottlieb',N'Abraham.Mayer@yahoo.com',67,24244370,NULL,1),
	 (N'Miss Lloyd Wolff',N'Mustafa.Balistreri@gmail.com',42,85987381,NULL,1),
	 (N'Wilbur Mills',N'Laurianne_Cole31@yahoo.com',22,95841014,NULL,1),
	 (N'Cristina Streich',N'Mireille_Haag@yahoo.com',22,71901740,NULL,1),
	 (N'Katrina Kilback Jr.',N'Bill61@yahoo.com',27,40506,NULL,1),
	 (N'Candace Powlowski I',N'Josie_Maggio@hotmail.com',59,19927214,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Marian Schowalter',N'Susana.Brakus@gmail.com',87,66146254,NULL,1),
	 (N'Darrel Stoltenberg',N'Arnulfo.Davis@gmail.com',19,99212140,NULL,1),
	 (N'Anna Stark',N'Evelyn51@hotmail.com',25,70568846,NULL,1),
	 (N'Connie Hilpert',N'Jovani.Glover@hotmail.com',52,72555907,NULL,1),
	 (N'Tabitha Fahey',N'Dane.Purdy67@gmail.com',61,51485865,NULL,1),
	 (N'Gwen Wisozk III',N'Everette_Von91@hotmail.com',46,34142276,NULL,1),
	 (N'Julia Prosacco',N'Rigoberto.Satterfield@yahoo.com',75,8493850,NULL,1),
	 (N'Annie Towne',N'Camden79@hotmail.com',93,80059717,NULL,1),
	 (N'Arnold Conroy',N'Kellen10@yahoo.com',83,1614787,NULL,1),
	 (N'Ms. Noah Hamill',N'Lura61@yahoo.com',86,43626915,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Mr. Antoinette Veum',N'Tyrel65@gmail.com',73,55692046,NULL,1),
	 (N'Genevieve Paucek Jr.',N'Cindy15@hotmail.com',73,72368193,NULL,1),
	 (N'Joanne Cremin',N'June95@gmail.com',75,65126355,NULL,1),
	 (N'Darin Barton',N'Naomi79@yahoo.com',21,63602467,NULL,1),
	 (N'Miss Joyce Hilll',N'Matilde_Johns@hotmail.com',61,17165559,NULL,1),
	 (N'Jan Goldner I',N'Demario71@hotmail.com',45,92958922,NULL,1),
	 (N'Jon Rolfson IV',N'Royal23@yahoo.com',20,93472627,NULL,1),
	 (N'Ruben King',N'Gerard.Schaden50@hotmail.com',84,72182777,NULL,1),
	 (N'Colleen Heaney',N'Andreanne_Braun86@gmail.com',10,11449295,NULL,1),
	 (N'Shari Emmerich',N'Howell_Franecki@hotmail.com',24,24995710,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Francis Torp',N'Stacey_Feil62@hotmail.com',30,51672148,NULL,1),
	 (N'Ernesto Labadie',N'Alice_Emard@gmail.com',15,42385509,NULL,1),
	 (N'Luke Runolfsdottir',N'Esperanza_Rosenbaum99@hotmail.com',45,33717375,NULL,1),
	 (N'Willie Murray DVM',N'Susan_Stroman@gmail.com',11,27368020,NULL,1),
	 (N'Winston Cronin',N'Garret.Ryan@gmail.com',20,21402659,NULL,1),
	 (N'Miss Florence Jast',N'Eliezer.Von74@hotmail.com',72,82093974,NULL,1),
	 (N'Charlene Predovic',N'Edna92@gmail.com',21,79097131,NULL,1),
	 (N'Max Mayer',N'Braeden.Armstrong@hotmail.com',79,64936614,NULL,1),
	 (N'Bryan Williamson',N'Miguel.Hammes@hotmail.com',50,105577,NULL,1),
	 (N'Roberta Gutkowski',N'Etha.Hahn@gmail.com',14,27998407,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Monique Powlowski',N'Marcelina64@yahoo.com',89,9395708,NULL,1),
	 (N'Miriam Borer',N'Velva_Conn48@gmail.com',17,73725330,NULL,1),
	 (N'Ismael Hirthe',N'Horace.Jones53@hotmail.com',19,91161695,NULL,1),
	 (N'Roger Cruickshank',N'Pearlie72@hotmail.com',17,13318683,NULL,1),
	 (N'Stuart Marvin',N'Sylvester_Hoppe@yahoo.com',41,53193218,NULL,1),
	 (N'Dr. Cameron Runolfsson',N'Annamae_OReilly58@hotmail.com',15,97921110,NULL,1),
	 (N'Lauren Robel',N'Matilde.Ernser@gmail.com',72,67511019,NULL,1),
	 (N'Sherry Gibson',N'Colin.Emard@yahoo.com',38,33799302,NULL,1),
	 (N'Lindsay Satterfield',N'Fritz32@yahoo.com',99,10732528,NULL,1),
	 (N'Mrs. Ellis Upton',N'Josefa_Feest@yahoo.com',35,32929879,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Mr. Lindsay Langosh',N'Kiley33@gmail.com',26,39139530,NULL,1),
	 (N'Mrs. Cary Christiansen',N'Isac10@gmail.com',27,77449726,NULL,1),
	 (N'Lora Quigley',N'Mozell_Tremblay@gmail.com',83,95713319,NULL,1),
	 (N'Kelley Labadie',N'Zita45@hotmail.com',61,61263045,NULL,1),
	 (N'Sarah Cormier',N'Bernadette_Ruecker@hotmail.com',83,80239292,NULL,1),
	 (N'Ms. Lula Lesch',N'Casey_Fahey@gmail.com',38,15044668,NULL,1),
	 (N'Bryan Reynolds',N'Meta_Sauer44@hotmail.com',18,46438984,NULL,1),
	 (N'Mike Tillman',N'Vicky_Kshlerin69@hotmail.com',33,99017435,NULL,1),
	 (N'Charlene Ebert',N'Eugenia_Heidenreich6@yahoo.com',13,19706,NULL,1),
	 (N'Marc McKenzie',N'Aida96@gmail.com',51,70924,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Eugene Buckridge',N'Antonetta.Okuneva@yahoo.com',96,31253752,NULL,1),
	 (N'Nancy DAmore',N'Stefan.Glover@yahoo.com',87,78046784,NULL,1),
	 (N'Miss Cornelius Rutherford Jr.',N'Marcelo.Schuster@yahoo.com',15,18044137,NULL,1),
	 (N'Kayla Kiehn',N'Arne50@gmail.com',69,3126027,NULL,1),
	 (N'Marguerite Torp',N'Clark_Purdy66@gmail.com',14,40868874,NULL,1),
	 (N'Alejandro Lakin',N'Pamela.Reinger@hotmail.com',28,48218723,NULL,1),
	 (N'Raul Tromp',N'Susanna_Buckridge@gmail.com',11,51113695,NULL,1),
	 (N'Lena Herman',N'Jaylon39@hotmail.com',31,98169397,NULL,1),
	 (N'Dr. Hubert Hermiston Sr.',N'Krystal_Lind0@hotmail.com',35,42179977,NULL,1),
	 (N'Theodore Stamm',N'Josh72@hotmail.com',36,84157774,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Bobby Wolff',N'Kasandra_Brown32@gmail.com',16,9498926,NULL,1),
	 (N'Ernestine Sporer',N'Mohammed_Koepp@hotmail.com',47,99178962,NULL,1),
	 (N'Julian Mohr DDS',N'Jaqueline_Veum11@gmail.com',94,69203988,NULL,1),
	 (N'Ramona Zieme',N'Eldridge0@hotmail.com',45,38425102,NULL,1),
	 (N'Carol Sawayn',N'Eli.Collier@gmail.com',26,55735124,NULL,1),
	 (N'Rogelio Johnston',N'Amos27@gmail.com',78,74593418,NULL,1),
	 (N'Elijah Parisian',N'Wallace61@yahoo.com',59,18664520,NULL,1),
	 (N'Jean Koepp',N'Greta_Effertz@yahoo.com',31,71192714,NULL,1),
	 (N'Mr. Kerry King',N'Vesta.Crona39@gmail.com',29,20256493,NULL,1),
	 (N'Nora Predovic',N'Michel.Schaden81@hotmail.com',21,14033169,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Christopher Langosh',N'Rosalia_Gutmann@hotmail.com',94,87590881,NULL,1),
	 (N'Gretchen Schmitt',N'Roslyn_Goodwin54@gmail.com',12,15055277,NULL,1),
	 (N'Dr. Marshall Larkin MD',N'Jaquan_Turcotte10@yahoo.com',78,96212546,NULL,1),
	 (N'Jeremiah Schowalter',N'Arjun_Cole8@hotmail.com',32,30919337,NULL,1),
	 (N'Patrick Bogan DDS',N'Abbie72@gmail.com',64,1087154,NULL,1),
	 (N'Trevor Greenholt',N'Elroy.Jerde@yahoo.com',28,14892176,NULL,1),
	 (N'Bennie Green',N'Delpha86@yahoo.com',17,58539995,NULL,1),
	 (N'Oscar Bernier',N'Roel_OReilly94@hotmail.com',20,26493154,NULL,1),
	 (N'Pauline Champlin',N'Willie_Crooks@yahoo.com',59,88519465,NULL,1),
	 (N'Arnold Satterfield',N'Hilma66@gmail.com',26,89065507,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ray Graham',N'Julie44@yahoo.com',32,16768933,NULL,1),
	 (N'Carla Lebsack Jr.',N'Lucas.Orn34@gmail.com',87,33955494,NULL,1),
	 (N'Clifton Becker',N'Regan_Medhurst@gmail.com',79,98127181,NULL,1),
	 (N'Sara Hettinger',N'Aubrey33@hotmail.com',83,52131025,NULL,1),
	 (N'Darrin Walsh',N'Monte_Parker@gmail.com',31,56862044,NULL,1),
	 (N'Marcos Berge',N'Elta.Hauck@gmail.com',81,26517162,NULL,1),
	 (N'Ruby Walker',N'Bonnie44@gmail.com',34,84733436,NULL,1),
	 (N'Mrs. Cesar Kshlerin IV',N'Alanis_Morar7@hotmail.com',73,35473899,NULL,1),
	 (N'Lois Von',N'Neva.Tremblay@gmail.com',76,10978095,NULL,1),
	 (N'Florence Fritsch',N'Hannah98@gmail.com',64,47238639,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Mitchell Heidenreich',N'Lauryn22@yahoo.com',97,32850903,NULL,1),
	 (N'Gilbert Kautzer',N'Genevieve.Herman@gmail.com',54,32790369,NULL,1),
	 (N'Erin Franecki',N'Alex75@yahoo.com',94,23035814,NULL,1),
	 (N'Dr. Ellen Bernhard',N'Ari37@hotmail.com',40,45971841,NULL,1),
	 (N'Elvira Beier',N'Shyann_Hane29@hotmail.com',87,15253368,NULL,1),
	 (N'Mr. Arlene Ward',N'Brennan_Hagenes@hotmail.com',23,6234586,NULL,1),
	 (N'Glenn Price DVM',N'Cristobal9@yahoo.com',25,73161343,NULL,1),
	 (N'Stephanie McLaughlin',N'Zackery43@gmail.com',86,28025097,NULL,1),
	 (N'Leland Gusikowski',N'Kristy_Homenick@hotmail.com',60,37217457,NULL,1),
	 (N'Tommie Torphy',N'Walter26@gmail.com',27,15413252,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Henry Howe DVM',N'Trey_Sporer97@hotmail.com',92,66066966,NULL,1),
	 (N'Felicia Stehr',N'Wava87@yahoo.com',65,66668915,NULL,1),
	 (N'Jose Schimmel',N'Verla19@yahoo.com',63,4167009,NULL,1),
	 (N'Daisy Ryan',N'Jonas.Monahan83@hotmail.com',79,46091264,NULL,1),
	 (N'Charlene Carter',N'Kariane.Feil@gmail.com',11,56961421,NULL,1),
	 (N'Delia Boyle',N'Edyth15@yahoo.com',94,6938167,NULL,1),
	 (N'Lola Cassin',N'Jamel58@gmail.com',29,61368661,NULL,1),
	 (N'Dr. Seth Bashirian',N'Heather_Collins50@gmail.com',43,81620731,NULL,1),
	 (N'Ginger Sipes',N'Brock.Heaney@gmail.com',36,91916519,NULL,1),
	 (N'Virgil Hoppe',N'Oceane.Beatty@hotmail.com',39,37212495,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Angel Goldner',N'Princess.Bruen@yahoo.com',30,44270815,NULL,1),
	 (N'Shannon Kilback',N'Krystal.Hilpert@yahoo.com',18,9409948,NULL,1),
	 (N'Javier Marks',N'Ray51@yahoo.com',15,44614850,NULL,1),
	 (N'Woodrow Price Sr.',N'Bethany16@hotmail.com',19,30681576,NULL,1),
	 (N'Jamie Nolan',N'Elizabeth_Funk60@yahoo.com',49,22269980,NULL,1),
	 (N'Oscar OKon PhD',N'Keshaun73@yahoo.com',69,65464722,NULL,1),
	 (N'Desiree Hauck V',N'Magdalen_Cruickshank@hotmail.com',76,89817027,NULL,1),
	 (N'Joanna Cormier',N'Aditya1@yahoo.com',42,80185955,NULL,1),
	 (N'Santos Kuhlman',N'Gracie.Goodwin93@yahoo.com',56,56892449,NULL,1),
	 (N'Cheryl Sipes',N'Verona_Bernier@gmail.com',74,69404775,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ana Huel',N'Susan_Lemke@gmail.com',97,41783067,NULL,1),
	 (N'Sue Gibson',N'Abbie_Franey2@gmail.com',53,39103261,NULL,1),
	 (N'Jaime Champlin',N'Keshaun3@yahoo.com',95,48088243,NULL,1),
	 (N'Mrs. Lance Fisher',N'Humberto73@hotmail.com',81,84777140,NULL,1),
	 (N'Howard Little',N'Joe_Swaniawski@hotmail.com',35,39573465,NULL,1),
	 (N'Katrina Hyatt',N'Brandy.Maggio@yahoo.com',59,95333299,NULL,1),
	 (N'Harold Bartoletti',N'Garrison_Turcotte@gmail.com',74,32899548,NULL,1),
	 (N'Ruben Dooley',N'Ophelia56@yahoo.com',76,36642922,NULL,1),
	 (N'Kelly Erdman',N'Adrian63@gmail.com',22,86757284,NULL,1),
	 (N'Desiree Hauck',N'Jefferey10@gmail.com',84,82777781,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Janet McDermott',N'Jolie_Skiles92@gmail.com',72,91070773,NULL,1),
	 (N'Lloyd Goldner',N'Alberta_Schaden26@hotmail.com',41,54230315,NULL,1),
	 (N'Marjorie Cartwright',N'Benedict12@gmail.com',33,45569106,NULL,1),
	 (N'Erik Lesch',N'Michale_Paucek@hotmail.com',81,12523684,NULL,1),
	 (N'Aaron Abernathy',N'Javonte17@hotmail.com',77,25689580,NULL,1),
	 (N'Fred Hegmann PhD',N'Armand.Boehm10@hotmail.com',20,91433442,NULL,1),
	 (N'Tommie Shields',N'Lorna_Ullrich@gmail.com',14,21435250,NULL,1),
	 (N'Elsie Schinner',N'Bryana_Rowe92@gmail.com',89,84504051,NULL,1),
	 (N'Nathaniel Gorczany',N'Jena_Weimann@hotmail.com',32,86983593,NULL,1),
	 (N'Miss Judith Vandervort',N'Wilmer.Collier97@gmail.com',54,12277520,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Gail Mosciski',N'Alivia_Senger77@hotmail.com',57,3881940,NULL,1),
	 (N'Ms. Bradley Hayes',N'Akeem.Quitzon61@hotmail.com',63,53565576,NULL,1),
	 (N'Judy Dach',N'Mattie39@gmail.com',16,78386912,NULL,1),
	 (N'Willie Hackett',N'Newell.Powlowski15@yahoo.com',29,75896060,NULL,1),
	 (N'Mindy Roberts II',N'Karine69@hotmail.com',34,61027295,NULL,1),
	 (N'Jonathan Stokes',N'Isabel_Fay@yahoo.com',12,65720054,NULL,1),
	 (N'Angelo Metz',N'Alek.Daugherty69@yahoo.com',40,44273138,NULL,1),
	 (N'Brian Ward MD',N'Jorge61@hotmail.com',16,64731790,NULL,1),
	 (N'Jon Ledner',N'Drake.Rutherford@hotmail.com',90,77026969,NULL,1),
	 (N'Lynne Donnelly',N'Janae.Russel0@gmail.com',71,88960052,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Laverne Connelly',N'Israel6@hotmail.com',97,43970024,NULL,1),
	 (N'Mandy Beahan MD',N'Jacinthe.Crist95@yahoo.com',22,17525380,NULL,1),
	 (N'Roberta Lehner',N'Anika.Haley@hotmail.com',87,61324536,NULL,1),
	 (N'Boyd Wiegand',N'Roscoe76@hotmail.com',72,12927224,NULL,1),
	 (N'Jordan Stamm',N'Kellen_Ebert@hotmail.com',12,17701181,NULL,1),
	 (N'Lucille Cruickshank',N'Myra.Harris@gmail.com',45,5588920,NULL,1),
	 (N'Stanley Doyle',N'Wyman.Kreiger5@hotmail.com',91,95062879,NULL,1),
	 (N'Hugh Ebert',N'Ike_Stracke@hotmail.com',76,22094140,NULL,1),
	 (N'Elsa Marks',N'Breanne.Ernser@gmail.com',54,93852400,NULL,1),
	 (N'Mrs. Andres OKeefe',N'Dario42@hotmail.com',92,1024589,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Minnie Ratke',N'Elwin.Hessel@hotmail.com',27,34248755,NULL,1),
	 (N'Neil Becker',N'Rosie77@yahoo.com',63,77631656,NULL,1),
	 (N'Barbara Gerhold',N'Noelia28@gmail.com',36,9828379,NULL,1),
	 (N'Mrs. Billy Carter Sr.',N'Jody.Blick37@hotmail.com',97,26292673,NULL,1),
	 (N'Carolyn Spinka',N'Kris.Roob@gmail.com',56,96760479,NULL,1),
	 (N'Cesar Ebert Jr.',N'Pierce_Fahey81@gmail.com',54,24979438,NULL,1),
	 (N'Freda Gottlieb',N'Celine.Wolf35@gmail.com',51,743614,NULL,1),
	 (N'Elias Collins',N'Dudley.Shanahan@gmail.com',12,83253039,NULL,1),
	 (N'George Heller',N'Isaiah.Feil@gmail.com',75,38710734,NULL,1),
	 (N'Tracy Block',N'Valerie.Schoen@gmail.com',56,19890264,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Tiffany Lesch',N'Grayce37@hotmail.com',59,86062651,NULL,1),
	 (N'Lorene Jakubowski',N'Jude_Baumbach91@gmail.com',76,50113238,NULL,1),
	 (N'Felix Kreiger',N'Jaqueline_Schinner15@gmail.com',43,14715153,NULL,1),
	 (N'Lucy Gottlieb',N'Maybell_Spinka@hotmail.com',85,9616471,NULL,1),
	 (N'Camille Sawayn',N'Buford17@gmail.com',18,66730118,NULL,1),
	 (N'Julius Windler',N'Mekhi_Casper0@gmail.com',67,85314287,NULL,1),
	 (N'Heidi Schneider',N'Sophie_Lynch@yahoo.com',22,78858455,NULL,1),
	 (N'Kristine Kohler',N'Jamal.Lemke@yahoo.com',20,86236414,NULL,1),
	 (N'Jan Lind',N'Kyler.OHara@yahoo.com',27,40738990,NULL,1),
	 (N'Judith Glover IV',N'Francesco81@gmail.com',72,96613563,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Albert Bins',N'Gunner.Hettinger@yahoo.com',34,82568920,NULL,1),
	 (N'Antonio Cruickshank',N'Stevie0@yahoo.com',12,85768101,NULL,1),
	 (N'Wesley Runte',N'Erna.Stark33@yahoo.com',20,8920157,NULL,1),
	 (N'Ervin Mosciski',N'Wyman40@gmail.com',21,52242204,NULL,1),
	 (N'Joyce Cremin',N'Hayden.Sawayn58@yahoo.com',83,6354292,NULL,1),
	 (N'Nathan Feest',N'Gia_Becker@hotmail.com',74,82923036,NULL,1),
	 (N'Hope Lind MD',N'Griffin82@gmail.com',64,79255488,NULL,1),
	 (N'Lynne Roob',N'Maximillian.Koepp93@yahoo.com',72,79358050,NULL,1),
	 (N'Lorraine Vandervort',N'Connie_Herzog@gmail.com',98,24538345,NULL,1),
	 (N'Natalie Braun',N'Sylvia89@yahoo.com',95,88678105,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Beth Cassin',N'Jarrett.Gulgowski68@gmail.com',85,30234598,NULL,1),
	 (N'Nick Stehr Sr.',N'Fredrick.Halvorson99@gmail.com',68,7361628,NULL,1),
	 (N'Kelli Upton',N'Brenden.Hilpert@yahoo.com',33,58063940,NULL,1),
	 (N'Maryann Gottlieb',N'Maximilian_Padberg@hotmail.com',79,48800910,NULL,1),
	 (N'Jerald Welch',N'Micah_Borer@gmail.com',87,15790558,NULL,1),
	 (N'Ignacio Rosenbaum',N'Brooke88@gmail.com',58,56559646,NULL,1),
	 (N'Dr. Saul Fay',N'Pearl71@yahoo.com',14,19546425,NULL,1),
	 (N'Craig Ullrich',N'Tessie24@gmail.com',41,63166405,NULL,1),
	 (N'Jimmy Reichel',N'Antonina77@gmail.com',43,95554909,NULL,1),
	 (N'Rudy Satterfield',N'Eveline_Hermann0@gmail.com',44,51068584,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Brett Hilll',N'Everette.Grady99@gmail.com',85,79997099,NULL,1),
	 (N'Ms. Lisa Reilly',N'Nolan_Dicki36@hotmail.com',42,51986941,NULL,1),
	 (N'Matt Kuhic',N'Rahul36@hotmail.com',70,34256874,NULL,1),
	 (N'Beatrice Wolff',N'Meagan_Leannon99@gmail.com',82,61497501,NULL,1),
	 (N'Aaron Schaden',N'Aric_Conn@gmail.com',77,73209168,NULL,1),
	 (N'Kelvin Nikolaus',N'Cade45@hotmail.com',32,76809213,NULL,1),
	 (N'Raymond Predovic',N'Jadon_Strosin@hotmail.com',48,96940768,NULL,1),
	 (N'Donna DAmore',N'Brain38@yahoo.com',95,38939620,NULL,1),
	 (N'Kellie Grady',N'Eve59@yahoo.com',35,45057547,NULL,1),
	 (N'Francisco OKeefe',N'Bernice.Lubowitz@hotmail.com',20,67552286,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Steve White',N'Jerrod68@hotmail.com',72,62109081,NULL,1),
	 (N'Kerry Mante MD',N'Misael.Rodriguez26@gmail.com',56,3001952,NULL,1),
	 (N'Guillermo Gislason',N'Tracy_Corkery4@hotmail.com',39,68648092,NULL,1),
	 (N'Omar Kohler',N'Roy.Kemmer@gmail.com',43,80364960,NULL,1),
	 (N'Dr. Rosie Haley DDS',N'Autumn_Morar@gmail.com',83,75900571,NULL,1),
	 (N'Sidney McClure',N'Cade36@yahoo.com',33,68351763,NULL,1),
	 (N'Miss Elijah Kling',N'Cristal83@gmail.com',95,13999781,NULL,1),
	 (N'Paula Friesen',N'Ebba.Mohr46@hotmail.com',13,30731146,NULL,1),
	 (N'Vera Kling',N'Francisca43@gmail.com',92,44238826,NULL,1),
	 (N'Priscilla Mante Jr.',N'Shaina_Terry42@gmail.com',48,71448945,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Corey Cassin',N'Vilma_Robel84@yahoo.com',65,57382357,NULL,1),
	 (N'Miss Gilberto Hudson',N'Tristian68@gmail.com',46,78201401,NULL,1),
	 (N'Henry Sipes',N'Brooks.Kovacek74@gmail.com',94,20958442,NULL,1),
	 (N'Ivan Runte',N'Glennie.Keebler@yahoo.com',48,12702788,NULL,1),
	 (N'Joy Spencer',N'Weldon.Swift13@gmail.com',24,73490079,NULL,1),
	 (N'Ruben Mraz',N'Bridie_Lebsack@hotmail.com',77,12290820,NULL,1),
	 (N'Kelly Mraz',N'Antonia.Spinka@hotmail.com',68,93799376,NULL,1),
	 (N'Peter Schmidt',N'Brando_Kovacek@hotmail.com',17,99831192,NULL,1),
	 (N'Irvin Kuhn',N'Dorris.Kertzmann47@hotmail.com',95,30182345,NULL,1),
	 (N'Ian Cruickshank',N'Ole_Ledner@yahoo.com',49,81234940,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Danielle Grant',N'Rylee.Hayes@gmail.com',42,77003370,NULL,1),
	 (N'Virgil Botsford',N'Demarco_Rutherford75@hotmail.com',42,74331506,NULL,1),
	 (N'Dr. Tim Orn IV',N'Mitchell_Parisian@hotmail.com',91,27701732,NULL,1),
	 (N'Jessie Grady Jr.',N'Nelson.Erdman@yahoo.com',24,7676854,NULL,1),
	 (N'Mr. Gregg Thiel',N'Franz89@gmail.com',26,52825726,NULL,1),
	 (N'Earl Waelchi',N'Bobby41@hotmail.com',91,17531010,NULL,1),
	 (N'April Kihn DVM',N'Gwen.Stehr@hotmail.com',30,8254639,NULL,1),
	 (N'Felicia Bernier',N'Ariel_Stehr@gmail.com',13,87709716,NULL,1),
	 (N'Alice Crist',N'Carmine.Emmerich@gmail.com',96,53710982,NULL,1),
	 (N'Stuart Rohan',N'Nya_Kilback@gmail.com',18,32218002,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ms. Tony Pagac',N'Wendy_Zieme@gmail.com',71,77729531,NULL,1),
	 (N'Mandy Murray',N'Willard_Schultz80@gmail.com',12,64308861,NULL,1),
	 (N'Belinda Towne',N'Bennett.Parker@gmail.com',24,68736609,NULL,1),
	 (N'Essie Volkman',N'Arden_McCullough@hotmail.com',77,14629796,NULL,1),
	 (N'Mrs. Vernon Hyatt',N'Jesse.Wiegand26@gmail.com',33,26522181,NULL,1),
	 (N'Mark Schowalter',N'Tyson_Gerlach@yahoo.com',92,98520494,NULL,1),
	 (N'Tamara Miller',N'Carrie.Morissette@hotmail.com',72,7750624,NULL,1),
	 (N'Tomas Kuhn',N'Kirstin25@hotmail.com',37,77193578,NULL,1),
	 (N'Shirley Senger DVM',N'Ansley_Harris@yahoo.com',49,66372920,NULL,1),
	 (N'Glenn Abernathy',N'Dariana_Stark@gmail.com',26,69792009,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Gabriel Wyman',N'Lavina56@gmail.com',58,81569265,NULL,1),
	 (N'Guadalupe Donnelly',N'Aliya.Maggio@gmail.com',32,47813914,NULL,1),
	 (N'Dr. Ronnie Schroeder',N'Jeanne6@hotmail.com',99,45167313,NULL,1),
	 (N'Charlene Lueilwitz',N'Maia_Haag0@gmail.com',42,72991880,NULL,1),
	 (N'Dr. Sheldon Collins',N'Adelle96@gmail.com',55,55252536,NULL,1),
	 (N'Shirley Harber',N'Kimberly_Koss48@hotmail.com',25,71816225,NULL,1),
	 (N'Toni Bashirian',N'Kenneth88@yahoo.com',87,81452860,NULL,1),
	 (N'Ruth Becker',N'Ryann.Lubowitz@gmail.com',47,55676660,NULL,1),
	 (N'Sabrina DAmore',N'Tanya70@gmail.com',18,30373575,NULL,1),
	 (N'Mrs. Guadalupe Wilderman',N'Mavis_Raynor71@yahoo.com',34,66125365,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Elsie Kovacek',N'Eloisa94@yahoo.com',39,72076433,NULL,1),
	 (N'Kent Williamson',N'Cullen_Dibbert@gmail.com',41,37747783,NULL,1),
	 (N'Angel Koss II',N'Tess_OKon47@gmail.com',89,13905814,NULL,1),
	 (N'Barbara Larkin',N'Murray78@yahoo.com',28,20139196,NULL,1),
	 (N'Clifton Zieme',N'Petra_Greenfelder@yahoo.com',26,39905989,NULL,1),
	 (N'Ben Schaefer',N'Neva_Huels@gmail.com',96,61246914,NULL,1),
	 (N'Blanche Turcotte',N'Gerhard_Borer80@yahoo.com',22,74440421,NULL,1),
	 (N'Jerald Marquardt',N'Ervin_Wyman@hotmail.com',63,25207508,NULL,1),
	 (N'Sharon Morar',N'Jovan.Wolff73@gmail.com',18,18136724,NULL,1),
	 (N'Jacob Turner',N'Carolina.Blick86@gmail.com',17,13138023,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Alvin Hoppe',N'Lucious_King1@gmail.com',50,6790184,NULL,1),
	 (N'Sue Rath',N'Ole.Kautzer90@yahoo.com',23,48575450,NULL,1),
	 (N'Theresa Fisher',N'Zetta.Wehner@yahoo.com',73,45443368,NULL,1),
	 (N'Lois Sipes',N'Franco_Murray22@hotmail.com',32,69829926,NULL,1),
	 (N'Natalie Zemlak',N'Aglae_White12@hotmail.com',50,59418389,NULL,1),
	 (N'Mrs. Naomi Weimann',N'Alisa.Mayer@hotmail.com',91,4750180,NULL,1),
	 (N'Kristy Mayer',N'Kiel.Pouros@hotmail.com',88,71740546,NULL,1),
	 (N'Dallas Waelchi',N'Alysson33@gmail.com',41,81391459,NULL,1),
	 (N'Jeffery Ebert',N'Willie.Auer40@yahoo.com',27,18078282,NULL,1),
	 (N'Jamie Hayes',N'Lucile_Nikolaus@hotmail.com',78,4743725,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Luis Wyman V',N'Fernando.Fahey3@yahoo.com',83,56310719,NULL,1),
	 (N'Wilson Frami',N'Jessie46@gmail.com',86,14392002,NULL,1),
	 (N'Edward Breitenberg',N'Rosalee_Bashirian72@gmail.com',56,3386572,NULL,1),
	 (N'Joanne Lindgren',N'Carson_Breitenberg@yahoo.com',65,13939766,NULL,1),
	 (N'Ms. Fannie Harber',N'Clemens_Cronin79@yahoo.com',76,61736180,NULL,1),
	 (N'Angelo Mayert',N'Meaghan_Mills@hotmail.com',35,59468095,NULL,1),
	 (N'Ted Mitchell Jr.',N'Saul.Borer@hotmail.com',44,37033680,NULL,1),
	 (N'Ethel Doyle MD',N'Kim_Ebert@yahoo.com',86,87140210,NULL,1),
	 (N'Kelly McClure',N'Myrtie80@hotmail.com',10,75318440,NULL,1),
	 (N'Vanessa Price',N'Robb.Reilly@hotmail.com',93,6892287,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Fredrick Bergnaum',N'Casimer_Lakin@yahoo.com',60,28662164,NULL,1),
	 (N'Maryann Lind',N'Jewell.Breitenberg@gmail.com',56,47749825,NULL,1),
	 (N'Archie Hudson',N'Frank_Cummings@yahoo.com',41,85047449,NULL,1),
	 (N'Pedro Bergstrom V',N'Carmen52@yahoo.com',57,4715993,NULL,1),
	 (N'Raquel Williamson',N'Aryanna_Lebsack@yahoo.com',90,78370702,NULL,1),
	 (N'Sadie Carter',N'Benton_Beatty99@yahoo.com',36,82880805,NULL,1),
	 (N'Elbert Langworth',N'Felipa.Lind@hotmail.com',61,81135252,NULL,1),
	 (N'Hope Kohler',N'Nola79@gmail.com',64,78999627,NULL,1),
	 (N'Sam Dibbert',N'Valentine_Rippin12@gmail.com',63,68011400,NULL,1),
	 (N'Randall Corwin',N'Paula.Hirthe@gmail.com',85,72973624,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Carolyn Bins',N'Lavern52@hotmail.com',65,21514895,NULL,1),
	 (N'Bernice Schamberger MD',N'Annette41@yahoo.com',57,5209878,NULL,1),
	 (N'Mrs. Gerard Koch',N'Vicente40@yahoo.com',12,40834194,NULL,1),
	 (N'Gayle Windler',N'Malinda.Daugherty@gmail.com',52,43972335,NULL,1),
	 (N'Gertrude Feest',N'Aylin.Dach62@gmail.com',71,81481879,NULL,1),
	 (N'June Buckridge',N'Leslie_Leffler80@gmail.com',16,52900421,NULL,1),
	 (N'Olga Lebsack',N'Clay57@yahoo.com',70,30615457,NULL,1),
	 (N'Vera Shanahan',N'Trey.Doyle@gmail.com',93,72636086,NULL,1),
	 (N'Renee Lebsack',N'Donna2@gmail.com',96,41644515,NULL,1),
	 (N'Dr. Julius Schmeler',N'Minerva_Murazik@gmail.com',37,22885578,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Carlos Predovic DVM',N'Rogers77@gmail.com',50,31048994,NULL,1),
	 (N'Penny Rowe',N'Germaine93@hotmail.com',99,40135006,NULL,1),
	 (N'Jack Haag',N'Amanda12@gmail.com',87,96393972,NULL,1),
	 (N'Betty Kessler',N'Joshua.Ruecker27@hotmail.com',19,64740633,NULL,1),
	 (N'Sarah Skiles',N'Tony_Lakin@gmail.com',93,19563403,NULL,1),
	 (N'Kent Boyle',N'Jarrod.Nader@gmail.com',67,42932567,NULL,1),
	 (N'Clint Herzog Jr.',N'Isai87@gmail.com',32,34458239,NULL,1),
	 (N'Theodore Bednar Jr.',N'Kathryne_Parker@gmail.com',75,93829914,NULL,1),
	 (N'Ms. Cary OConner',N'Emelia95@hotmail.com',60,50651975,NULL,1),
	 (N'Billie Sauer',N'Keenan_Schumm@yahoo.com',65,49789977,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Hazel Jacobi',N'Whitney36@hotmail.com',44,55091759,NULL,1),
	 (N'Ashley Parker',N'Stephen_Cremin@hotmail.com',27,49561960,NULL,1),
	 (N'Randy McCullough',N'Iliana.Davis@yahoo.com',47,75585546,NULL,1),
	 (N'Shawna Goyette',N'Audreanne_Feeney49@yahoo.com',32,77209209,NULL,1),
	 (N'Monique Hickle',N'Hassie47@gmail.com',84,92157840,NULL,1),
	 (N'Jesse Cronin',N'Ansley_Larson9@hotmail.com',92,62107501,NULL,1),
	 (N'Karla Gorczany',N'Nora_Funk13@hotmail.com',67,14009012,NULL,1),
	 (N'Edwin Steuber',N'Jed.Brown@hotmail.com',60,7489658,NULL,1),
	 (N'Traci Miller',N'Darian.Dach@hotmail.com',14,89673263,NULL,1),
	 (N'Dawn Parisian',N'Maddison.Schaefer@hotmail.com',43,49324982,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Wendy Nolan',N'Allison80@hotmail.com',51,85297062,NULL,1),
	 (N'Miss Tom Jaskolski',N'Emile32@yahoo.com',49,33231955,NULL,1),
	 (N'Daisy Harvey',N'Elna57@yahoo.com',16,53834570,NULL,1),
	 (N'Sophie Schiller',N'Hassan_Spinka63@hotmail.com',51,90708759,NULL,1),
	 (N'Amos Spinka',N'Wiley53@hotmail.com',26,92345795,NULL,1),
	 (N'Benjamin Schamberger',N'Caterina_Armstrong@hotmail.com',62,64252629,NULL,1),
	 (N'Miss Sandra Hudson',N'Clementine_Hauck6@gmail.com',85,13812357,NULL,1),
	 (N'Dr. Lionel Labadie',N'Garfield.Mitchell16@gmail.com',74,90545011,NULL,1),
	 (N'Ernestine Kunze',N'Emelia_Heller@gmail.com',58,66296257,NULL,1),
	 (N'Harold Stiedemann',N'Arno1@hotmail.com',74,4538753,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Mr. Roberto Bernier',N'Nella.Wisozk14@gmail.com',94,96502997,NULL,1),
	 (N'Jodi Mante Sr.',N'Jayce_Wehner@yahoo.com',89,86571924,NULL,1),
	 (N'Hugh Kuhn',N'Loyal_McClure92@yahoo.com',20,96576591,NULL,1),
	 (N'Raul Roob',N'Rocky.Bashirian1@yahoo.com',10,66242549,NULL,1),
	 (N'Abel Nader',N'Kolby_Powlowski@gmail.com',84,44578813,NULL,1),
	 (N'Lydia Schaefer',N'Devin89@hotmail.com',40,91509165,NULL,1),
	 (N'Winifred Halvorson IV',N'Camila6@gmail.com',26,95607985,NULL,1),
	 (N'Marta Collins',N'Laurence50@gmail.com',44,25854619,NULL,1),
	 (N'Timmy Bogisich',N'Elinore62@yahoo.com',32,87245904,NULL,1),
	 (N'Brendan Willms',N'Dashawn_Greenfelder88@yahoo.com',41,60402292,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Annie Frami',N'Gretchen_Tillman48@yahoo.com',12,56181667,NULL,1),
	 (N'Estelle Beahan',N'Devan_Tremblay@yahoo.com',64,8993441,NULL,1),
	 (N'Christie Roob Jr.',N'Loy.Block69@gmail.com',40,63298460,NULL,1),
	 (N'Billie Haag',N'Jocelyn.Sawayn@gmail.com',13,70139104,NULL,1),
	 (N'Danielle Corkery',N'Gonzalo4@hotmail.com',55,99102086,NULL,1),
	 (N'Kristopher Gibson',N'Eloy.Boyle11@yahoo.com',95,33201282,NULL,1),
	 (N'Frank Cummings',N'Edmond38@hotmail.com',85,51035841,NULL,1),
	 (N'Elisa Christiansen',N'Lucile_Metz@hotmail.com',51,31946410,NULL,1),
	 (N'Samantha Altenwerth',N'Jennings39@yahoo.com',66,52524315,NULL,1),
	 (N'Fernando Kozey',N'Maxwell.Wiegand82@gmail.com',96,8161219,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Miss Gregg Robel',N'Patsy11@gmail.com',50,4639830,NULL,1),
	 (N'Dr. Gayle Rippin',N'Edwardo.Hyatt@yahoo.com',78,32982923,NULL,1),
	 (N'Terrance Thompson',N'Annamae15@hotmail.com',21,26295886,NULL,1),
	 (N'Lowell Hettinger DVM',N'Roslyn_Kub@gmail.com',19,16215990,NULL,1),
	 (N'Joseph Quigley',N'Paolo4@yahoo.com',70,48351681,NULL,1),
	 (N'Mrs. Becky Kautzer Sr.',N'Robin_Stark@hotmail.com',94,57289925,NULL,1),
	 (N'Mr. Stephanie Jacobs',N'Candido92@hotmail.com',17,91306259,NULL,1),
	 (N'Harold Lebsack IV',N'Alexandro.Lynch92@gmail.com',45,86399859,NULL,1),
	 (N'Willard Gottlieb',N'Claudine.Fadel17@yahoo.com',23,72720211,NULL,1),
	 (N'Wayne Abbott Jr.',N'Enrique.Nicolas@yahoo.com',36,84954948,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Greg Jaskolski',N'Eveline_Glover49@yahoo.com',74,61403168,NULL,1),
	 (N'Mr. Pete Swift MD',N'Eugene_Conn31@gmail.com',21,74324932,NULL,1),
	 (N'Patricia Rohan',N'Annabell.Fay@hotmail.com',35,52253883,NULL,1),
	 (N'Edgar Bergnaum',N'Gerardo.Deckow@gmail.com',12,64864309,NULL,1),
	 (N'Harold Kunde',N'Roxanne59@gmail.com',99,79878559,NULL,1),
	 (N'Allen Hamill',N'Timmothy.Dare2@yahoo.com',85,57999459,NULL,1),
	 (N'Desiree Roberts V',N'Zachary85@gmail.com',11,81094958,NULL,1),
	 (N'Archie Russel',N'Evans.Aufderhar@gmail.com',23,12317811,NULL,1),
	 (N'Julie Kuhic',N'Juliana32@hotmail.com',51,42019916,NULL,1),
	 (N'Ms. Holly Wolf',N'Karianne.Herman72@yahoo.com',48,51582097,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Sandra Hamill',N'Candido_Dach92@hotmail.com',98,51598376,NULL,1),
	 (N'Ms. Beverly Miller I',N'Jeffry.Adams82@hotmail.com',82,37615285,NULL,1),
	 (N'Pam Tremblay',N'Felix.Purdy@gmail.com',50,64381783,NULL,1),
	 (N'Kellie Fahey',N'Idella.Kozey16@gmail.com',43,37218151,NULL,1),
	 (N'Jacqueline Breitenberg',N'Nathen85@yahoo.com',79,47689737,NULL,1),
	 (N'Herbert Ullrich',N'Bethany.Haley@hotmail.com',30,27275850,NULL,1),
	 (N'Luther Jast',N'Koby3@hotmail.com',36,43295640,NULL,1),
	 (N'Myron Kohler',N'Kiera.Wolf53@hotmail.com',15,32063426,NULL,1),
	 (N'Mr. Wilson Monahan',N'Deontae.Zboncak@hotmail.com',94,39313409,NULL,1),
	 (N'Terrell Skiles DVM',N'Alvera_Cronin54@gmail.com',79,46964387,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ellen Bogan',N'Skylar.Boyer@yahoo.com',91,67388905,NULL,1),
	 (N'Earl OKon',N'Deanna_Green@yahoo.com',87,28733647,NULL,1),
	 (N'Mrs. Ignacio Maggio',N'Gene30@yahoo.com',29,56083129,NULL,1),
	 (N'Neal Murazik',N'Nikolas5@yahoo.com',91,11635255,NULL,1),
	 (N'Forrest Rodriguez',N'Minerva.Koch83@hotmail.com',68,92438460,NULL,1),
	 (N'Erin Wilkinson',N'Robin.Cruickshank56@hotmail.com',70,47827609,NULL,1),
	 (N'Sonja Will',N'Karl_Morissette42@gmail.com',87,51506653,NULL,1),
	 (N'Isabel Wisoky',N'Blaze_Lueilwitz17@yahoo.com',14,64789127,NULL,1),
	 (N'Robin Turner',N'Gustave.Ebert16@hotmail.com',42,7037041,NULL,1),
	 (N'Todd Kerluke',N'Javon_Crona36@gmail.com',77,19052420,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Jasmine Thompson',N'Selina.Cole@hotmail.com',41,76027303,NULL,1),
	 (N'Ralph Langworth',N'Carolyne.Stanton26@hotmail.com',57,98423280,NULL,1),
	 (N'Jermaine Walker',N'Stan_Walter69@yahoo.com',90,26962068,NULL,1),
	 (N'Elena Bode',N'Josefina_Weissnat16@yahoo.com',64,78518469,NULL,1),
	 (N'Misty Monahan',N'Patience28@hotmail.com',36,26243828,NULL,1),
	 (N'Sherman Carroll',N'Amaya.Abernathy@hotmail.com',24,37454061,NULL,1),
	 (N'Marsha Leuschke',N'Jaylin_Kunze99@yahoo.com',44,11831406,NULL,1),
	 (N'Sabrina Greenholt',N'Beryl.Collier@hotmail.com',83,29912671,NULL,1),
	 (N'Bernard Kovacek',N'Chad44@gmail.com',29,36667559,NULL,1),
	 (N'Traci Hilll',N'Kareem88@gmail.com',17,65306550,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Cheryl Gibson',N'Kylie_Runolfsdottir@yahoo.com',99,63473826,NULL,1),
	 (N'Nancy Crist',N'Corene5@gmail.com',26,279126,NULL,1),
	 (N'Gilberto Konopelski',N'Whitney86@hotmail.com',76,271562,NULL,1),
	 (N'Hope Dietrich',N'Ben57@yahoo.com',11,87019162,NULL,1),
	 (N'Daryl Blick',N'Amelia31@gmail.com',47,60332743,NULL,1),
	 (N'Pauline Walsh',N'Jany_Bradtke@yahoo.com',14,72604316,NULL,1),
	 (N'Flora Olson',N'Litzy92@hotmail.com',15,69300348,NULL,1),
	 (N'Sylvester Bins',N'Ray.Aufderhar@gmail.com',98,65273651,NULL,1),
	 (N'Ignacio Wisoky',N'Christina_Brown@yahoo.com',31,97984293,NULL,1),
	 (N'Lyle Bogan',N'Graham_Hermiston9@yahoo.com',90,87455820,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Anita Collier',N'Ulices.Macejkovic@hotmail.com',74,36581935,NULL,1),
	 (N'Perry Lynch',N'Nathaniel69@gmail.com',70,11232864,NULL,1),
	 (N'Ms. Carla Jacobs',N'Ocie.Kessler19@gmail.com',68,61331367,NULL,1),
	 (N'Kara Lockman',N'Lauryn25@gmail.com',88,26679551,NULL,1),
	 (N'Max Mertz',N'Jacques.Crist@yahoo.com',24,85017175,NULL,1),
	 (N'Meredith Smith',N'Onie.Kshlerin@gmail.com',60,54839817,NULL,1),
	 (N'Nicole Mann III',N'Merle.Rogahn83@gmail.com',67,94384665,NULL,1),
	 (N'Kristopher Goyette II',N'Gilberto.OConnell@hotmail.com',53,77649277,NULL,1),
	 (N'Diane Wiza',N'Bryana.Wehner@yahoo.com',27,17963794,NULL,1),
	 (N'Sylvester Kilback PhD',N'Edythe.Satterfield42@yahoo.com',64,20896246,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Estelle Strosin',N'Willa48@yahoo.com',90,7336885,NULL,1),
	 (N'Bethany Raynor MD',N'Rhoda.Bergstrom@hotmail.com',39,3864290,NULL,1),
	 (N'Alexis Mills',N'Juvenal56@hotmail.com',48,28981018,NULL,1),
	 (N'Celia Langosh',N'Christ_Moore76@hotmail.com',37,33514273,NULL,1),
	 (N'Belinda Howell',N'Cordelia.Emmerich@hotmail.com',94,81839184,NULL,1),
	 (N'Moses Metz',N'Sigmund_Lind10@yahoo.com',66,43945292,NULL,1),
	 (N'Christie Kerluke',N'Lonzo.Douglas@gmail.com',85,37942151,NULL,1),
	 (N'Ms. Emily Schmitt',N'Bonita14@yahoo.com',29,24204534,NULL,1),
	 (N'Dr. Olive OConnell DVM',N'Trace_Volkman@hotmail.com',47,48333551,NULL,1),
	 (N'Ernesto Douglas',N'Murphy_Kertzmann@gmail.com',15,81304657,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Louise Abshire',N'Madaline57@yahoo.com',99,96568023,NULL,1),
	 (N'Neil Haley IV',N'Philip.Braun48@hotmail.com',76,78628263,NULL,1),
	 (N'Conrad Stoltenberg',N'Jacey91@gmail.com',70,44405216,NULL,1),
	 (N'Loren Kerluke',N'Beaulah29@hotmail.com',36,56643067,NULL,1),
	 (N'Joyce Littel IV',N'Adalberto66@gmail.com',70,79743225,NULL,1),
	 (N'Diana Mayer',N'Quinn.Buckridge@gmail.com',79,17021601,NULL,1),
	 (N'Terrence Walker',N'Rylan.Hills46@hotmail.com',29,63785050,NULL,1),
	 (N'Emily Prosacco',N'Elroy34@yahoo.com',29,2406640,NULL,1),
	 (N'Jeannie Collier',N'Davonte.Wiza@hotmail.com',77,44866457,NULL,1),
	 (N'Jeff Emmerich',N'Britney.Renner@yahoo.com',46,79748703,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Phil Legros',N'Abigayle31@gmail.com',78,12796625,NULL,1),
	 (N'Kim Sporer',N'Clovis.Harris45@yahoo.com',37,34756649,NULL,1),
	 (N'Dana Schuppe',N'Scarlett.Spinka81@yahoo.com',53,49850818,NULL,1),
	 (N'Cristina Bergnaum',N'Shanny55@hotmail.com',62,52686401,NULL,1),
	 (N'Lucy Rogahn',N'Jedidiah38@gmail.com',21,66294477,NULL,1),
	 (N'Pedro Kerluke',N'Erik9@gmail.com',81,84005277,NULL,1),
	 (N'Louise Connelly',N'Trevor83@hotmail.com',57,80301112,NULL,1),
	 (N'Ernest Hermiston',N'Era_Moen22@gmail.com',35,54183634,NULL,1),
	 (N'Natasha Reynolds IV',N'Fern_Mosciski23@gmail.com',94,88014810,NULL,1),
	 (N'Tara Mayert III',N'Lauretta.Robel6@yahoo.com',82,40786707,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Jodi Batz',N'Jayda30@hotmail.com',16,38443927,NULL,1),
	 (N'Lowell McKenzie',N'Angelita27@yahoo.com',37,73813648,NULL,1),
	 (N'Sheri Hodkiewicz',N'Aliyah_Huels@yahoo.com',13,43948432,NULL,1),
	 (N'Mrs. Gregg Williamson',N'Jesse.Treutel35@yahoo.com',73,65534989,NULL,1),
	 (N'Jacqueline Beier',N'Alana_Morissette@hotmail.com',21,58297273,NULL,1),
	 (N'Jane Kuphal',N'Pearlie.Aufderhar20@gmail.com',63,94979474,NULL,1),
	 (N'Terri Pacocha MD',N'Casey.Krajcik@gmail.com',93,73263494,NULL,1),
	 (N'Mitchell Trantow',N'Antwon17@gmail.com',50,899329,NULL,1),
	 (N'Veronica Bergstrom',N'Gabriel.Zemlak@gmail.com',99,99922323,NULL,1),
	 (N'Alton OKeefe MD',N'Hollis6@hotmail.com',96,71914574,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Virginia Fisher',N'Joanne.Keebler@gmail.com',64,4516068,NULL,1),
	 (N'Willie Toy',N'Shakira.Haag@gmail.com',96,40992424,NULL,1),
	 (N'Ada Reinger',N'Barry_Rice@gmail.com',95,16331330,NULL,1),
	 (N'Sally Bruen Jr.',N'Lucas.Kassulke40@gmail.com',38,88352941,NULL,1),
	 (N'Alonzo OKeefe DDS',N'Leila_Ledner70@yahoo.com',31,3034967,NULL,1),
	 (N'Andres Crooks',N'Buster52@gmail.com',68,38135174,NULL,1),
	 (N'Joanne Cormier',N'Payton.Kuvalis@gmail.com',31,94534360,NULL,1),
	 (N'Harvey Trantow',N'Joesph_Renner@hotmail.com',19,89379829,NULL,1),
	 (N'April Daniel',N'Cleveland.Lemke@hotmail.com',55,16057704,NULL,1),
	 (N'Kari Smith',N'Boris76@gmail.com',88,84140708,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Jack Wilkinson',N'Gabriel_Macejkovic43@gmail.com',61,66491685,NULL,1),
	 (N'Yvette Moore III',N'Jaron_Romaguera@hotmail.com',26,3536489,NULL,1),
	 (N'Rachael Swaniawski',N'Otha14@hotmail.com',11,62926528,NULL,1),
	 (N'Jared Terry',N'Sydni68@yahoo.com',70,61164581,NULL,1),
	 (N'Louise Bartoletti',N'Greta.Hahn14@hotmail.com',70,9820760,NULL,1),
	 (N'Jacqueline Anderson',N'Hunter22@hotmail.com',60,88791347,NULL,1),
	 (N'Dr. Paul Boyle',N'Joany_Walsh62@yahoo.com',67,989992,NULL,1),
	 (N'Grant Stanton',N'Aletha_Champlin@gmail.com',46,98776632,NULL,1),
	 (N'Julius Johnston',N'Kara73@yahoo.com',62,49574045,NULL,1),
	 (N'Jerome Huels',N'Emelie.Quigley28@gmail.com',49,74020372,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Nancy Kozey',N'Pierce35@gmail.com',71,932598,NULL,1),
	 (N'Audrey Russel',N'Cathryn_Swift79@gmail.com',34,68806919,NULL,1),
	 (N'Hugh Legros',N'Leo.Farrell@gmail.com',96,78092033,NULL,1),
	 (N'Sharon Murazik',N'Tito15@yahoo.com',47,44087722,NULL,1),
	 (N'Norman Toy',N'Robb60@yahoo.com',25,6432789,NULL,1),
	 (N'Elsie Sipes',N'Dina95@yahoo.com',65,37798730,NULL,1),
	 (N'Edwin Ruecker',N'Crystel_Green@hotmail.com',89,87992996,NULL,1),
	 (N'Mr. Carlton Walter',N'Jessica.Herzog@yahoo.com',59,32588416,NULL,1),
	 (N'Beth Larson Sr.',N'Elizabeth98@hotmail.com',67,71869119,NULL,1),
	 (N'Trevor Kassulke',N'Irving.Ziemann@hotmail.com',44,44244907,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Ann Zulauf',N'Howard.Turcotte@gmail.com',88,98153639,NULL,1),
	 (N'Betty Hessel',N'Dana.Simonis33@yahoo.com',91,95141748,NULL,1),
	 (N'Fannie Nicolas V',N'Shemar_Willms@yahoo.com',77,8194068,NULL,1),
	 (N'Mrs. Rhonda Walker',N'Armand_Witting@gmail.com',88,68529043,NULL,1),
	 (N'Teresa Miller',N'Lorine.Borer@gmail.com',84,51977363,NULL,1),
	 (N'Angel Maggio',N'Leslie1@gmail.com',46,70793759,NULL,1),
	 (N'Sheila Kovacek',N'Lacey.Kuphal96@gmail.com',90,88117515,NULL,1),
	 (N'Maggie Towne',N'Yazmin_Gerlach21@gmail.com',96,43321402,NULL,1),
	 (N'Mrs. Gustavo Cormier',N'Delta_Turner70@hotmail.com',92,36135656,NULL,1),
	 (N'Darin Wiza',N'Grayce_Braun11@gmail.com',30,98189784,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Gene Goodwin',N'Sherman17@hotmail.com',50,56993300,NULL,1),
	 (N'Janet Mohr',N'Donavon_Langworth@gmail.com',31,47662460,NULL,1),
	 (N'Evelyn Tillman',N'Princess.Lind@hotmail.com',29,25793974,NULL,1),
	 (N'Jesus Schamberger',N'Wyatt_Schaden@yahoo.com',57,28493240,NULL,1),
	 (N'Gail Harber',N'Camron_Smith59@yahoo.com',30,64572002,NULL,1),
	 (N'Ken Muller',N'Sincere.Yundt@gmail.com',13,75898259,NULL,1),
	 (N'Faye Rolfson',N'Vivianne47@yahoo.com',51,43017890,NULL,1),
	 (N'Edwin Bogan',N'Lavina_Trantow@gmail.com',16,74165612,NULL,1),
	 (N'Benny MacGyver',N'Mara_Carroll3@hotmail.com',53,84306006,NULL,1),
	 (N'Joey Russel',N'Maximilian_Prosacco@gmail.com',93,58601227,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Shannon Rohan',N'Moshe75@yahoo.com',13,88896878,NULL,1),
	 (N'Stacey Reichel',N'Vita_Breitenberg@hotmail.com',62,62284259,NULL,1),
	 (N'Harvey Hammes',N'Zita_Kiehn@yahoo.com',47,47761949,NULL,1),
	 (N'Ms. Maureen OReilly',N'Camylle49@gmail.com',79,99389279,NULL,1),
	 (N'Denise Kovacek',N'Alana61@gmail.com',74,96714818,NULL,1),
	 (N'Darla Carroll',N'Kirsten.Christiansen@hotmail.com',28,48807506,NULL,1),
	 (N'Alonzo Lebsack',N'Betty62@hotmail.com',64,97539626,NULL,1),
	 (N'Marion Schroeder',N'Salvatore.Prosacco@gmail.com',78,38367591,NULL,1),
	 (N'Clay Cartwright',N'Donato.Larson@yahoo.com',21,50776706,NULL,1),
	 (N'Elsa Harvey',N'Tierra.Macejkovic87@gmail.com',28,57241447,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Olivia Wuckert',N'Pauline_Zulauf50@gmail.com',31,98354527,NULL,1),
	 (N'Joey Schulist',N'Bettie84@gmail.com',87,36388174,NULL,1),
	 (N'Amber Brakus',N'Alexie.Abbott@hotmail.com',67,11842230,NULL,1),
	 (N'Nettie Lubowitz V',N'Lue45@hotmail.com',88,45912416,NULL,1),
	 (N'Gilbert Abernathy',N'Francesco.Wiza15@gmail.com',44,88263825,NULL,1),
	 (N'Jonathon Orn',N'Lucious.Cronin@hotmail.com',41,22896812,NULL,1),
	 (N'Rosa Tromp',N'Casper31@hotmail.com',50,31913461,NULL,1),
	 (N'Natalie Reynolds',N'Andrew_Wyman9@gmail.com',40,37189153,NULL,1),
	 (N'Dr. Priscilla Padberg',N'Shirley93@hotmail.com',65,80965584,NULL,1),
	 (N'Ms. Estelle Gorczany',N'Lukas58@yahoo.com',79,51920856,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Tanya Bashirian',N'Shawna58@gmail.com',26,60631731,NULL,1),
	 (N'Donnie Marks',N'Nyah.Russel3@hotmail.com',81,11943443,NULL,1),
	 (N'Gwendolyn Trantow',N'Braeden5@hotmail.com',53,98278092,NULL,1),
	 (N'Terrell Schultz',N'Frankie33@gmail.com',16,93473995,NULL,1),
	 (N'Ronnie Leffler',N'Raymond_Larson61@gmail.com',33,91879162,NULL,1),
	 (N'Carolyn Thompson',N'Flavie31@yahoo.com',24,39882173,NULL,1),
	 (N'Ken Marks',N'Linwood_Bartell98@yahoo.com',18,70787952,NULL,1),
	 (N'Antonio Lebsack',N'Clement_Auer29@gmail.com',32,93017123,NULL,1),
	 (N'Michele Jast',N'Janet.Gislason38@hotmail.com',75,60559871,NULL,1),
	 (N'Juana Dickinson',N'Eulah_Bogan29@gmail.com',77,93966986,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Colleen Mertz',N'Amara_Rodriguez@gmail.com',92,93617541,NULL,1),
	 (N'Dr. Jane Zboncak',N'Theron_Howe@hotmail.com',93,56991400,NULL,1),
	 (N'Daryl Haag',N'Jason_Thompson@hotmail.com',12,62434016,NULL,1),
	 (N'Kate Hermiston',N'Lindsey64@yahoo.com',79,30276281,NULL,1),
	 (N'Dr. Christine Senger',N'Filomena.Tillman22@yahoo.com',28,51437157,NULL,1),
	 (N'Winifred Schmeler',N'Norris9@yahoo.com',73,78922058,NULL,1),
	 (N'Ramona OReilly',N'Paolo_McKenzie@hotmail.com',37,55906757,NULL,1),
	 (N'Mrs. Celia Balistreri',N'Newell71@hotmail.com',19,52617116,NULL,1),
	 (N'Julie Pfannerstill Sr.',N'Annie.Lowe@gmail.com',23,99293572,NULL,1),
	 (N'Bryant Tremblay',N'Jeanette20@gmail.com',55,54594486,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Wilson Baumbach',N'Melyssa83@yahoo.com',35,63058814,NULL,1),
	 (N'Candice Christiansen',N'Deon.Hyatt67@yahoo.com',40,25162377,NULL,1),
	 (N'Gene Brown',N'Joannie_Hahn@hotmail.com',41,8974979,NULL,1),
	 (N'Casey Gulgowski',N'Nedra.Jacobs@gmail.com',94,60522219,NULL,1),
	 (N'Roy DuBuque',N'Nicholas_Kovacek33@gmail.com',63,81900049,NULL,1),
	 (N'Mrs. Philip Murray',N'Lenna66@hotmail.com',76,28500573,NULL,1),
	 (N'Jennie Harber',N'Jayden24@yahoo.com',19,29576424,NULL,1),
	 (N'Lorena Hand',N'Cora45@hotmail.com',99,68745878,NULL,1),
	 (N'Adam Barrows',N'Nannie22@gmail.com',76,29347189,NULL,1),
	 (N'Johanna Gulgowski',N'Marilyne_Lubowitz73@hotmail.com',75,91578551,NULL,1);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone,SituacaoAnterior,SituacaoAtual) VALUES
	 (N'Lola Rolfson',N'Drew.Wuckert@gmail.com',37,70431348,NULL,1),
	 (N'Ramiro Grimes',N'Jaron_Hoppe@yahoo.com',63,22807286,NULL,1),
	 (N'Jan Macejkovic',N'Minerva.Abshire@yahoo.com',57,17672407,NULL,1),
	 (N'Patti Hammes',N'Maryse39@hotmail.com',21,53378215,NULL,1),
	 (N'Tyler Marvin',N'Eloisa_Barrows@gmail.com',91,58087890,NULL,1),
	 (N'Hazel Waters',N'Korbin_Kling18@hotmail.com',48,52742333,NULL,1),
	 (N'Morris Stamm Sr.',N'Myrl_Sauer@hotmail.com',68,66044422,NULL,1),
	 (N'Shelly Gusikowski',N'Estel7@yahoo.com',23,57908802,NULL,1),
	 (N'Karen Barton',N'Turner.Mills23@gmail.com',95,58981183,NULL,1),
	 (N'Lucas Nienow',N'Erling47@hotmail.com',83,17280281,NULL,1);

CREATE TABLE ContactsManagement.UserType(
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Description varchar(255) UNIQUE NOT NULL
);
GO

CREATE TABLE ContactsManagement.ApiUser (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Username varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	UserType int NOT NULL REFERENCES ContactsManagement.UserType(Id),
);
GO

INSERT INTO ContactsManagement.UserType(Description) VALUES('Common');
INSERT,NULL,1 INTO ContactsManagement.UserType(Description) VALUES('Administrator');
INSERT INTO ContactsManagement.ApiUser (Username, Password, UserType) VALUES('Admin', 'AQAAAAIAAYagAAAAEAhqL3a26EnFvTX/QOCvf3r1Ni1yqCSzm7WXV2qgWdGivHohZJVeJj857UHaQJ/otQ==', 2);
INSERT INTO ContactsManagement.ApiUser (Username, Password, UserType) VALUES('User', 'AQAAAAIAAYagAAAAEO5Av+AjYV5oMcMvglugM5K/yXPuH6Kx5A2D2rcgzbUDO1V23gciSOk5hvK48cbjdg==', 1);