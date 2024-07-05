-- POPOLA LE TABELLE
INSERT INTO Anagrafica (Cognome, Nome, Indirizzo, Citta, CAP, Cod_Fiscale)
VALUES
('Rossi', 'Mario', 'Via Roma 1', 'Roma', '00100', 'RSSMRA85M01H501Z'),
('Bianchi', 'Luca', 'Via Milano 2', 'Milano', '20100', 'BNCLCU89H10F205V'),
('Verdi', 'Giulia', 'Via Napoli 3', 'Napoli', '80100', 'VRDGLE92D41G702K'),
('Gialli', 'Sara', 'Via Torino 4', 'Torino', '10100', 'GLLSRA90A54L219E'),
('Neri', 'Anna', 'Via Firenze 5', 'Firenze', '50100', 'NERNNA80A65D612Q');

INSERT INTO [Tipo Violazione] (Descrizione)
VALUES
('Eccesso di velocità'),
('Sosta vietata'),
('Guida senza casco'),
('Scavalco semaforo rosso'),
('Mancato uso della cintura');

INSERT INTO [dbo].Verbale (IndirizzoViolazione, NominativoAgente, IdAnagrafica, IdViolazione, Importo)
VALUES
('Via Roma 10', 'Agente1', 1, 1, 100.00),
('Via Milano 20', 'Agente2', 2, 2, 150.00),
('Via Napoli 30', 'Agente3', 3, 3, 120.00),
('Via Torino 40', 'Agente4', 4, 4, 200.00),
('Via Firenze 50', 'Agente5', 5, 5, 180.00);

