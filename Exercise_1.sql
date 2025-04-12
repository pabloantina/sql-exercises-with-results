SELECT 
  cuentas.PERIODO as periodo,
  cuentas.SUCURSAL as sucursal,
  SUM(cuentas.SALDO) AS saldo
FROM 
  table_cuentas AS cuentas

JOIN 
  table_productos AS products
  ON cuentas.PRODUCTO = products.PRODUCTO

WHERE 
  cuentas.PERIODO = '201903'
AND 
  products.ESTADO = 'VIGENTE'
GROUP BY 
  cuentas.PERIODO,
  cuentas.SUCURSAL
  
HAVING
  SUM(cuentas.SALDO) > 10000 

ORDER BY
  SUM(cuentas.SALDO) ASC;
