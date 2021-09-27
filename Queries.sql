-- 1.1 Llista el total de factures d'un client en un període determinat

SELECT  *
FROM comanda_ulleres
WHERE client_id = 5 
AND (data_venda BETWEEN '2018-01-01' AND '2019-01-01')


-- 1.1 Llista els diferents models d'ulleres que ha venut un empleat durant un any

SELECT DISTINCT tipu_montura 
FROM comanda_ulleres
WHERE treballador_id = 2
AND (data_venda BETWEEN '2019-01-01' AND '2020-01-01')

-- 1.1 Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica

SELECT DISTINCT proveidor_id
FROM comanda_ulleres
WHERE data_venda IS NOT NULL
ORDER BY proveidor_id

-- 1.2 Llista quants productes de categoria 'Begudas' s'han venut en una determinada localitat

--1.2 Llista quantes comandes ha efectuat un determinat empleat

SELECT * 
FROM comanda c
JOIN Empleat e
ON e.botiga_id = c.botiga
AND e.nom = 'Manel'