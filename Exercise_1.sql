SELECT 
  cuentas.c1 as periodo,
  cuentas.c3 as sucursal,
  SUM(cuentas.c6) AS saldo
FROM 
  Exercise1TableCuentas AS cuentas

JOIN 
  Exercise1Table2TableProductos AS products
  ON cuentas.c5 = products.c2

WHERE 
  cuentas.c1 = '201903'
AND 
  products.c3 = 'VIGENTE'
GROUP BY 
  cuentas.c1,
  cuentas.c3
  
HAVING
  SUM(cuentas.c6) > 10000 

ORDER BY
  SUM(cuentas.c6) ASC;