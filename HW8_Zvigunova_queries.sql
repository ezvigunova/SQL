use ezvigunova;

-- New Task #1:
-- What document is the Russian translator working on? 
-- List their name, their contract ID and the document name.

SELECT t.TranslatorName, c.ContractID, cd.DocumentName
FROM Z_Translator_T t 
INNER JOIN Z_Contract_T c ON (t.TranslatorID = c.TranslatorID)
INNER JOIN Z_ContractDocument_T cd ON (c.ContractID = cd.ContractID) 
INNER JOIN Z_Language_T l ON (t.NativeLanguage = l.LanguageCode)
WHERE l.Lang = 'Russian'; 

-- New Task #2:
-- Name all the translators whose skill level is Intermediate.

SELECT t.TranslatorName
FROM Z_Translator_T t
INNER JOIN Z_LanguageSkill_T ls ON (t.TranslatorID = ls.TranslatorID)
WHERE ls.SkillLevel = 'Intermediate'
ORDER BY t.TranslatorName
;

-- New Task #3:
-- List the rounded cost of all current contracts with the US clients.

SELECT ROUND(SUM(cd.Price)) AS Cost
FROM Z_ContractDocument_T cd
INNER JOIN Z_Contract_T c ON (cd.ContractID = c.ContractID)
INNER JOIN Z_Client_T cl ON (c.ClientID = cl.ClientID)
WHERE cl.Country = 'USA'
;

-- New Task #4:
-- List all of our available Arabic speaking translators
-- (the ones that currently not doing any translations)

SELECT t.TranslatorName
FROM Z_Translator_T t 
LEFT JOIN Z_Contract_T c ON (t.TranslatorID = c.TranslatorID)
INNER JOIN Z_Language_T l ON (t.NativeLanguage = l.LanguageCode)
WHERE l.Lang = 'Arabic' AND c.ContractID IS NULL 
;

-- New Task #5:
-- How many translators are there for each language we offer?

SELECT l.Lang, COUNT(t.TranslatorID) AS NumOfTranslators
FROM Z_Translator_T t
INNER JOIN Z_Language_T l ON (t.NativeLanguage = l.LanguageCode)
GROUP BY t.NativeLanguage;

-- New Task #6:
-- Who is working on the document containing emergency information?

SELECT t.TranslatorName
FROM Z_Translator_T t
INNER JOIN Z_Contract_T c ON (t.TranslatorID = c.TranslatorID)
INNER JOIN Z_ContractDocument_T cd ON (c.ContractID = cd.ContractID)
WHERE cd.DocumentName LIKE ('%Emergency%')
ORDER BY t.TranslatorName
;

-- New Task #7:
-- List all of the countries where our customers are from
-- and how much earnings we get from each country.

SELECT DISTINCT c.Country, SUM(cd.Price) AS TotalEarnings
FROM Z_Client_T c
INNER JOIN Z_Contract_T ct ON (c.ClientID = ct.ClientID)
INNER JOIN Z_ContractDocument_T cd ON (ct.ContractID = cd.ContractID)
GROUP BY c.Country
;

-- New Task #8:
-- Update John Atkin's email address to "johnatkins@yahoo.com

UPDATE Z_Client_T
SET ContactEmail = 'johnatkins@yahoo.com'
WHERE ClientName = 'John Atkins'
;

-- New Task #9:
-- Find the translator who is making the most on their translations, 
-- and list the amount they are making.

SELECT MAX(cd.Price) AS Amount, t.TranslatorName
FROM Z_ContractDocument_T cd
INNER JOIN Z_Contract_T c ON (cd.ContractID = c.ContractID)
INNER JOIN Z_Translator_T t ON (c.TranslatorID = t.TranslatorID)
;

-- New Task #10:
-- Find how popular is each document format by listing how many
-- times clients have used each of them.

SELECT *
FROM
(
SELECT COUNT(DocumentName) AS PDF 
FROM Z_ContractDocument_T
WHERE DocumentName LIKE ('%.pdf')
) AS Result1
INNER JOIN 
(
SELECT COUNT(DocumentName) AS WORD
FROM Z_ContractDocument_T
WHERE DocumentName LIKE ('%.docx')
) AS Result2
;