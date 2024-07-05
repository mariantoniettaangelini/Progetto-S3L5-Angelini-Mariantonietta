-- 1. Conteggio dei verbali trascritti
SELECT 
	COUNT(IdVerbale)
	FROM Verbale

-- 2. Conteggio dei verbali trascritti raggruppati per anagrafe
SELECT
    a.Nome,
    COUNT(v.IdVerbale) AS NumeroVerbali
	FROM Anagrafica a JOIN Verbale v ON a.Id = v.IdAnagrafica
	GROUP BY a.Nome

-- 3. Conteggio dei verbali trascritti raggruppati per tipo di violazione
SELECT 
	t.Descrizione,
	COUNT(v.IdVerbale) AS VerbaliPerTipo
	FROM [Tipo Violazione] t JOIN Verbale v ON t.IdViolazione = v.IdViolazione
	GROUP BY t.Descrizione

-- 4. Totale dei punti decurtati per ogni anagrafe
UPDATE Verbale
SET DecurtamentoPunti = CASE IdVerbale
    WHEN 1 THEN 3
    WHEN 2 THEN 5
    WHEN 3 THEN 2
    WHEN 4 THEN 4
    WHEN 5 THEN 1
    ELSE DecurtamentoPunti 
END;

SELECT
    a.Nome,
    SUM(v.DecurtamentoPunti) AS PuntiDecurtati
    FROM Anagrafica a JOIN Verbale v ON a.Id = v.IdAnagrafica
    GROUP BY a.Nome

-- 5. Cognome, Nome, Data violazione, Indirizzo violazione, importo e punti decurtati per tutti gli anagrafici residenti a Palermo
SELECT 
    a.Nome, a.Cognome, v.DataViolazione, v.IndirizzoViolazione, v.Importo, v.DecurtamentoPunti AS MulteAPalermo
    FROM Anagrafica a JOIN Verbale v ON a.Id = v.IdAnagrafica
    WHERE a.Citta = 'Palermo'

-- 6. Cognome, Nome, Indirizzo, Data violazione, importo e punti decurtati per le violazioni fatte tra il febbraio 2009 e luglio 2009
SELECT
    a.Nome, a.Cognome, a.Indirizzo, v.DataViolazione, v.Importo, v.DecurtamentoPunti AS ViolazioniCommesse
    FROM Anagrafica a JOIN Verbale v ON a.Id = v.IdAnagrafica
    WHERE V.DataViolazione BETWEEN '2009-02-01' AND '2009-07-31'

-- 7. Totale degli importi per ogni anagrafico
SELECT 
    a.Nome, SUM(v.Importo) AS ImportiPerPersona
    FROM Anagrafica a JOIN Verbale v ON a.Id = v.IdAnagrafica
    GROUP BY a.Nome

-- 8. Visualizzazione di tutti gli anagrafici residenti a Palermo
SELECT 
    COUNT(*) AS Palermitani
    FROM Anagrafica
    WHERE Citta = 'Palermo'

-- 9. Query che visualizzi Data violazione, Importo e decurta mento punti relativi ad una certa data
SELECT
    DataViolazione, Importo, DecurtamentoPunti
    FROM Verbale
    WHERE DataViolazione >= '2023-07-05' 

-- 10. Conteggio delle violazioni contestate raggruppate per Nominativo dell’agente di Polizia
SELECT 
    NominativoAgente, COUNT(IdVerbale) AS ViolazioniContestate
    FROM Verbale
    GROUP BY NominativoAgente

-- 11. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino il decurtamento di 5 punti
SELECT
    a.Cognome, a.Nome, a.Indirizzo, v.DataViolazione, v.Importo, v.DecurtamentoPunti
    FROM Anagrafica a JOIN Verbale v ON a.Id = v.IdAnagrafica
    WHERE v.DecurtamentoPunti = 5

-- 12. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino l’importo di 400 euro
SELECT
    a.Cognome, a.Nome, a.Indirizzo, v.DataViolazione, v.Importo, v.DecurtamentoPunti
    FROM Anagrafica a JOIN Verbale v ON a.Id = v.IdAnagrafica
    WHERE v.Importo > 400
