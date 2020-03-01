/*

Evgeniya Zvigunova

*/
use ezvigunova;  

DROP TABLE IF EXISTS Z_ContractDocument_T  ;
DROP TABLE IF EXISTS Z_Contract_T;
DROP TABLE IF EXISTS Z_LanguageSkill_T  ;
DROP TABLE IF EXISTS Z_Translator_T;
DROP TABLE IF EXISTS Z_Language_T  ;
DROP TABLE IF EXISTS Z_Client_T  ;

CREATE TABLE Z_Client_T
             (ClientID          INTEGER(8)      NOT NULL,
              ClientName         VARCHAR(50)      ,
              Phone         VARCHAR(20)     ,
              Address         VARCHAR(30)  ,
              City         VARCHAR(30)     ,
              StateOrProvince         VARCHAR(30)  ,
              Country         VARCHAR(50)     ,
              PostalCode         INTEGER(8)   ,
              ContactPerson         VARCHAR(50)   ,
              ContactDepartment         VARCHAR(50)     ,
              ContactEmail         VARCHAR(50)   ,
CONSTRAINT Z_Client_PK PRIMARY KEY (ClientID));

CREATE TABLE Z_Language_T
             (LanguageCode  	INTEGER(4) NOT NULL,
              Lang             VARCHAR(25) ,
CONSTRAINT Z_Language_PK PRIMARY KEY (LanguageCode));

CREATE TABLE Z_Translator_T
             (TranslatorID          INTEGER(6)    NOT NULL,
              TranslatorName        VARCHAR(25)    ,
              TranslatorEmail     VARCHAR(30)    ,
              TranslatorPhone   VARCHAR(30)            ,
              NativeLanguage    INTEGER(4)   NOT NULL ,
CONSTRAINT Z_Translator_PK PRIMARY KEY (TranslatorID),
CONSTRAINT Z_Translator_FK1 FOREIGN KEY (NativeLanguage) REFERENCES Z_Language_T(LanguageCode));

CREATE TABLE Z_LanguageSkill_T
             (TranslatorID     INTEGER(6)    NOT NULL,
			  Lang    			INTEGER(4)  NOT NULL ,
			  SkillLevel   		 VARCHAR(15)    ,
CONSTRAINT Z_LanguageSkill_PK PRIMARY KEY (TranslatorID, Lang),
CONSTRAINT Z_LanguageSkill_FK1 FOREIGN KEY (TranslatorID) REFERENCES Z_Translator_T(TranslatorID),
CONSTRAINT Z_LanguageSkill_FK2 FOREIGN KEY (Lang) REFERENCES Z_Language_T(LanguageCode));


CREATE TABLE Z_Contract_T
             (ContractID          INTEGER (6)  NOT NULL,
			  ContractDate        DATE,
			  ClientID     		  INTEGER(8)  NOT NULL  ,
              TranslatorID        INTEGER(6) NOT NULL   ,              
              TargetLanguage      INTEGER(4) NOT NULL    ,
CONSTRAINT Z_Contract_PK PRIMARY KEY (ContractID),
CONSTRAINT Z_Contract_FK1 FOREIGN KEY (ClientID) REFERENCES Z_Client_T(ClientID),
CONSTRAINT Z_Contract_FK2 FOREIGN KEY (TranslatorID) REFERENCES Z_Translator_T(TranslatorID),
CONSTRAINT Z_Contract_FK3 FOREIGN KEY (TargetLanguage) REFERENCES Z_Language_T(LanguageCode));



CREATE TABLE Z_ContractDocument_T
             (ContractID         INTEGER(6)      NOT NULL,
              DocumentName       VARCHAR(50)  NOT NULL  ,
              SourceLanguage      INTEGER(4)    ,
              DateReceived       DATE    ,
              DateDue       	DATE    ,
              InitialDate       DATE    ,
              ReviewDate       DATE    ,
              Price       DECIMAL(6,2)    ,
              Difficulty       VARCHAR(15)    ,
CONSTRAINT Z_ContractDocument_PK PRIMARY KEY (ContractID, DocumentName),
CONSTRAINT Z_ContractDocument_FK1 FOREIGN KEY (ContractID) REFERENCES Z_Contract_T(ContractID),
CONSTRAINT Z_ContractDocument_FK2 FOREIGN KEY (SourceLanguage) REFERENCES Z_Language_T(LanguageCode));


INSERT INTO Z_Client_T  (ClientID, ClientName, Phone, Address, City, StateOrProvince, Country, PostalCode, ContactPerson, ContactDepartment, ContactEmail)
VALUES  (30023871, 'Anastasiya Ivanova', '1-816-253-2323', '8175 Creek Blvd', 'Kansas City', 'MO', 'USA', '64150', 'Askale', '', 'askale.h@gmail.com');
INSERT INTO Z_Client_T  (ClientID, ClientName, Phone, Address, City, StateOrProvince, Country, PostalCode, ContactPerson, ContactDepartment, ContactEmail)
VALUES  (18375902, 'Liliya Pulkova', '7-963-232-5353', '12352 Yasnaya Polyana', 'Zvenigorod', '', 'Russia', '109245', 'Liliya', '', 'lilya235@mail.ru');
INSERT INTO Z_Client_T  (ClientID, ClientName, Phone, Address, City, StateOrProvince, Country, PostalCode, ContactPerson, ContactDepartment, ContactEmail)
VALUES  (24598645, 'Reem Almutairi', '966-56-364-4444', '55 King Abdulaziz Street', 'Riyadh', '', 'Saudi Arabia', '238793', 'Reem', 'Department of Education', 'reem35235@hotmail.com');
INSERT INTO Z_Client_T  (ClientID, ClientName, Phone, Address, City, StateOrProvince, Country, PostalCode, ContactPerson, ContactDepartment, ContactEmail)
VALUES  (98726983, 'Kumar Patel', '1-314-343-4490', '875 Broadway Blvd', 'Sacramento', 'CA', 'USA', '466987', 'Kumar, Anita', 'Human Resources', 'kumarpatel@gmail.com');
INSERT INTO Z_Client_T  (ClientID, ClientName, Phone, Address, City, StateOrProvince, Country, PostalCode, ContactPerson, ContactDepartment, ContactEmail)
VALUES  (61775358, 'Natasha Rostova', '1-913-990-5458', '76735 Gateway Ave', 'Overland Park', 'KS', 'USA', '66212', 'Natasha', '', 'nataliar@yahoo.com');
INSERT INTO Z_Client_T  (ClientID, ClientName, Phone, Address, City, StateOrProvince, Country, PostalCode, ContactPerson, ContactDepartment, ContactEmail)
VALUES  (12375988, 'John Atkins', '1-934-464-6699', '1255 East Line Road', 'Chicago', 'IL', 'USA', '35787', 'John', 'Information Technology', 'johnthebest@hotmail.com');

INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (3982, 'Arabic');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (9873, 'Russian');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (2283, 'Ukrainian');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (1209, 'Amharic');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (9833, 'Maori');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (3587, 'Telugu');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (2358, 'Tamil');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (9887, 'English');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (2322, 'Indonesian');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (1920, 'French');
INSERT INTO Z_Language_T  (LanguageCode, Lang)
VALUES  (0292, 'Swahili');

INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (983641, 'Askale Hailekristos', 'askaleh@gmail.com', '1-646-346-4699', 1209);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (225982, 'Galina Abramova', 'galyaabramova@gmail.com', '1-314-535-5592', 9873);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (583824, 'Ahmed Alanazi', 'aalanazi@hotmail.com', '1-536-774-5755', 3982);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (468979, 'Priyanka Singh', 'priyankasingh@gmail.com', '1-339-446-6523', 2358);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (295855, 'Marina Devyatova', 'marinka@mail.ru', '1-315-353-2259', 2283);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (235768, 'Kate Johnson', 'katejohnson@gmail.com', '1-654-554-33-72', 9833);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (772264, 'Vera Antsiferova', 'veraants@yahoo.com', '1-633-538-9950', 2283);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (091375, 'John Samuel', 'johnsamuel20@gmail.com', '1-199-335-2588', 0292);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (330955, 'Maria Beaumont', 'beaumontm@gmail.com', '1-557-225-3390', 1920);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (141800, 'Raj Singh', 'rajeshsingh@hotmail.com', '1-235-995-0923', 3587);
INSERT INTO Z_Translator_T  (TranslatorID, TranslatorName, TranslatorEmail, TranslatorPhone, NativeLanguage)
VALUES  (883756, 'Noora Alanazi', 'noora9098@gmail.com', '1-980-355-5569', 3982);

INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (983641, 1209, 'Basic');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (225982, 9873, 'Intermediate');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (583824, 3982, 'Basic');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (468979, 2358, 'Advanced');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (295855, 2283, 'Intermediate');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (235768, 9833, 'Intermediate');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (772264, 2283, 'Advanced');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (091375, 0292, 'Intermediate');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (330955, 1920, 'Advanced');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (141800, 3587, 'Advanced');
INSERT INTO Z_LanguageSkill_T  (TranslatorID, Lang, SkillLevel)
VALUES  (883756, 3982, 'Intermediate');


INSERT INTO Z_Contract_T  (ContractID, ContractDate, ClientID, TranslatorID, TargetLanguage)
VALUES  (298457, str_to_date('01/Nov/14', '%d/%M/%y'), 30023871, 983641, 9887);
INSERT INTO Z_Contract_T  (ContractID, ContractDate, ClientID, TranslatorID, TargetLanguage)
VALUES  (345986, str_to_date('27/Nov/14', '%d/%M/%y'), 18375902, 225982, 9887);
INSERT INTO Z_Contract_T  (ContractID, ContractDate, ClientID, TranslatorID, TargetLanguage)
VALUES  (846472, str_to_date('09/Dec/14', '%d/%M/%y'), 24598645, 583824, 9887);
INSERT INTO Z_Contract_T  (ContractID, ContractDate, ClientID, TranslatorID, TargetLanguage)
VALUES  (100346, str_to_date('31/Dec/14', '%d/%M/%y'), 98726983, 468979, 9887);
INSERT INTO Z_Contract_T  (ContractID, ContractDate, ClientID, TranslatorID, TargetLanguage)
VALUES  (581198, str_to_date('25/Jan/15', '%d/%M/%y'), 61775358, 295855, 9887);
INSERT INTO Z_Contract_T  (ContractID, ContractDate, ClientID, TranslatorID, TargetLanguage)
VALUES  (929515, str_to_date('29/Jan/15', '%d/%M/%y'), 12375988, 235768, 9887);


INSERT INTO Z_ContractDocument_T  (ContractID, DocumentName, SourceLanguage, DateReceived, DateDue, InitialDate, ReviewDate, Price, Difficulty)
VALUES  (298457, 'Repair Manual.pdf', 1209, str_to_date('01/Nov/14', '%d/%M/%y'), str_to_date('03/Nov/14', '%d/%M/%y'), str_to_date('01/Nov/14', '%d/%M/%y'), str_to_date('01/Nov/14', '%d/%M/%y'), 45.00, 'Basic');
INSERT INTO Z_ContractDocument_T  (ContractID, DocumentName, SourceLanguage, DateReceived, DateDue, InitialDate, ReviewDate, Price, Difficulty)
VALUES  (345986, 'Last Testament.docx', 9873, str_to_date('26/Nov/14', '%d/%M/%y'), str_to_date('30/Nov/14', '%d/%M/%y'), str_to_date('27/Nov/14', '%d/%M/%y'), str_to_date('27/Nov/14', '%d/%M/%y'), 130.00, 'Intermediate');
INSERT INTO Z_ContractDocument_T  (ContractID, DocumentName, SourceLanguage, DateReceived, DateDue, InitialDate, ReviewDate, Price, Difficulty)
VALUES  (846472, 'University transcript.pdf', 3982, str_to_date('09/Dec/14', '%d/%M/%y'), str_to_date('25/Dec/14', '%d/%M/%y'), str_to_date('09/Dec/14', '%d/%M/%y'), str_to_date('09/Dec/14', '%d/%M/%y'), 40.50, 'Basic');
INSERT INTO Z_ContractDocument_T  (ContractID, DocumentName, SourceLanguage, DateReceived, DateDue, InitialDate, ReviewDate, Price, Difficulty)
VALUES  (100346, 'Important announcement.docx', 2358, str_to_date('30/Dec/14', '%d/%M/%y'), str_to_date('02/Jan/15', '%d/%M/%y'), str_to_date('31/Dec/14', '%d/%M/%y'), str_to_date('31/Dec/14', '%d/%M/%y'), 235.75, 'Advanced');
INSERT INTO Z_ContractDocument_T  (ContractID, DocumentName, SourceLanguage, DateReceived, DateDue, InitialDate, ReviewDate, Price, Difficulty)
VALUES  (581198, 'Basics of hacking.pdf', 2283, str_to_date('25/Jan/15', '%d/%M/%y'), str_to_date('29/Jan/15', '%d/%M/%y'), str_to_date('25/Jan/15', '%d/%M/%y'), str_to_date('25/Jan/15', '%d/%M/%y'), 97.00, 'Intermediate');
INSERT INTO Z_ContractDocument_T  (ContractID, DocumentName, SourceLanguage, DateReceived, DateDue, InitialDate, ReviewDate, Price, Difficulty)
VALUES  (929515, 'Emergency guidelines.pdf', 9833, str_to_date('29/Jan/15', '%d/%M/%y'), str_to_date('15/Feb/15', '%d/%M/%y'), str_to_date('29/Jan/15', '%d/%M/%y'), str_to_date('29/Jan/15', '%d/%M/%y'), 145.50, 'Intermediate');

select * from Z_Contract_T;
select * from Z_ContractDocument_T;
select * from Z_Client_T;
select * from Z_Translator_T;
select * from Z_LanguageSkill_T;
select * from Z_Language_T;

COMMIT;
