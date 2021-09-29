-- 1.1 Llista el total de factures d'un client en un període determinat

SELECT  *
FROM comanda_ulleres
WHERE client = 5 
AND (data_venda BETWEEN '2018-01-01' AND '2019-01-01')


-- 1.1 Llista els diferents models d'ulleres que ha venut un empleat durant un any

SELECT DISTINCT tipu_montura 
FROM comanda_ulleres
WHERE treballador = 2
AND (data_venda BETWEEN '2019-01-01' AND '2020-01-01')

-- 1.1 Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica

SELECT DISTINCT p.proveidor_nom
FROM comanda_ulleres cu
JOIN Proveidor p
ON p.proveidor_id = cu.proveidor
AND data_venda IS NOT NULL

-- 1.2 Llista quants productes de categoria 'Begudas' s'han venut en una determinada localitat (Tona)
SELECT *
FROM comanda c
JOIN Producte p
ON c.producte = p.producte_id
AND p.tipus_producte = 'Begu'
JOIN botiga b
ON c.botiga = b.botiga_id
JOIN localitat l
ON l.localitat_id = b.localitat_id
AND l.localitat = 'Tona'

--1.2 Llista quantes comandes ha efectuat un determinat empleat

SELECT * 
FROM comanda c
JOIN Empleat e
ON e.botiga_id = c.botiga
AND e.nom = 'Manel'