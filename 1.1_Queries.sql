--1.1 Llista el total de factures d'un client en un període determinat

SELECT  *
FROM comanda_ulleres
WHERE client_id = 5 
AND (data_venda BETWEEN '2018-01-01' AND '2019-01-01')


--1.1 Llista els diferents models d'ulleres que ha venut un empleat durant un any

SELECT * 
FROM comanda_ulleres
WHERE treballador_id = 3
AND (data_venda BETWEEN '2018-01-01' AND '2019-01-01')

-- 1.1 Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
