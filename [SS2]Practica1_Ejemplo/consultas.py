# --Paises con mayor inflacion de la historia
QUERY1 = ('SELECT COUNT(*) AS "Tabla Country" FROM Country'
          )
QUERY1_2 = ('SELECT COUNT(*) AS "Tabla Dates" FROM Dates'
            )
QUERY1_3 = ('SELECT COUNT(*) AS "Tabla Location_Name" FROM Location_Name'
            )
QUERY1_4 = ('SELECT COUNT(*) AS "Tabla Tsunami" FROM Tsunami'
            )
QUERY1_5 = ('SELECT COUNT(*) AS "Tabla Temporal" FROM TEMPORAL'
            )
QUERY1_6 = ('SELECT COUNT(*) AS "Tabla History" FROM History'
            )

# --Paises con mayor crecimiento de la historia
QUERY2 = ('SELECT TOP 5 p.nombre as pais,SUM(inf.valor_indicador) as valor '
          'FROM crecimiento_economico inf '
          'INNER JOIN pais p '
          'ON p.id=inf.pais_id '
          'INNER JOIN anio a '
          'ON a.id=inf.anio_id '
          'INNER JOIN indicador ind '
          'ON ind.id=inf.indicador_id '
          'GROUP BY p.nombre '
          'ORDER BY valor DESC')

# --Anios con mayor inflacion de la historia
QUERY3 = ('SELECT TOP 5 a.num as anio,SUM(inf.valor_indicador) as valor '
          'FROM inflacion inf '
          'INNER JOIN pais p '
          'ON p.id=inf.pais_id '
          'INNER JOIN anio a '
          'ON a.id=inf.anio_id '
          'INNER JOIN indicador ind '
          'ON ind.id=inf.indicador_id '
          'GROUP BY a.num '
          'ORDER BY valor DESC')

# --Paises con mayor crecimiento de la historia
QUERY4 = ('SELECT TOP 5 p.nombre as pais,SUM(inf.valor_indicador) as valor '
          'FROM crecimiento_economico inf '
          'INNER JOIN pais p '
          'ON p.id=inf.pais_id '
          'INNER JOIN anio a '
          'ON a.id=inf.anio_id '
          'INNER JOIN indicador ind '
          'ON ind.id=inf.indicador_id '
          'GROUP BY p.nombre '
          'ORDER BY valor DESC')


# --Pais con mayor inflacion de 2020
QUERY5 = ('SELECT TOP 1 p.nombre as pais,inf.valor_indicador as valor '
          'FROM inflacion inf '
          'INNER JOIN pais p '
          'ON p.id=inf.pais_id '
          'INNER JOIN anio a '
          'ON a.id=inf.anio_id '
          'INNER JOIN indicador ind '
          'ON ind.id=inf.indicador_id '
          'WHERE a.num=2020 '
          'ORDER BY valor DESC')

# --Pais con menor inflacion de 2020
QUERY6 = ('SELECT TOP 1 p.nombre as pais,inf.valor_indicador as valor '
          'FROM inflacion inf '
          'INNER JOIN pais p '
          'ON p.id=inf.pais_id '
          'INNER JOIN anio a '
          'ON a.id=inf.anio_id '
          'INNER JOIN indicador ind '
          'ON ind.id=inf.indicador_id '
          'WHERE a.num=2020 AND inf.valor_indicador>0 '
          'ORDER BY valor ASC;')

# --Pais con mayor crecimiento economico de 2020
QUERY7 = ('SELECT TOP 1 p.nombre as pais,inf.valor_indicador as valor '
          'FROM crecimiento_economico inf '
          'INNER JOIN pais p '
          'ON p.id=inf.pais_id '
          'INNER JOIN anio a '
          'ON a.id=inf.anio_id '
          'INNER JOIN indicador ind '
          'ON ind.id=inf.indicador_id '
          'WHERE a.num=2020 '
          'ORDER BY valor DESC')


# --Pais con menor crecimiento economico de 2020
QUERY8 = ('SELECT TOP 1 p.nombre as pais,inf.valor_indicador as valor '
          'FROM crecimiento_economico inf '
          'INNER JOIN pais p '
          'ON p.id=inf.pais_id '
          'INNER JOIN anio a '
          'ON a.id=inf.anio_id '
          'INNER JOIN indicador ind '
          'ON ind.id=inf.indicador_id '
          'WHERE a.num=2020 AND inf.valor_indicador>0 '
          'ORDER BY valor ASC;')

# --Pais de mayor inflacion de cada anio
QUERY9 = ('SELECT subq.rn,subq.anio,subq.pais,subq.valor FROM ( '
          'SELECT rank() over(partition by a.num order by SUM(inf.valor_indicador) DESC) as rn,  a.num as anio,p.nombre as pais,SUM(inf.valor_indicador) as valor '
          'FROM inflacion inf '
          'INNER JOIN pais p '
          'ON p.id=inf.pais_id '
          'INNER JOIN anio a '
          'ON a.id=inf.anio_id '
          'INNER JOIN indicador ind '
          'ON ind.id=inf.indicador_id '
          'GROUP BY a.num,p.nombre '
          ') '
          'AS subq '
          'WHERE rn = 1;')


# --Pais de menor inflacion de cada anio
QUERY10 = ('SELECT subq.rn,subq.anio,subq.pais,subq.valor FROM ( '
           'SELECT rank() over(partition by a.num order by SUM(inf.valor_indicador) ASC) as rn,  a.num as anio,p.nombre as pais,SUM(inf.valor_indicador) as valor '
           'FROM inflacion inf '
           'INNER JOIN pais p '
           'ON p.id=inf.pais_id '
           'INNER JOIN anio a '
           'ON a.id=inf.anio_id '
           'INNER JOIN indicador ind '
           'ON ind.id=inf.indicador_id '
           'WHERE inf.valor_indicador>0 '
           'GROUP BY a.num,p.nombre '
           ') '
           'AS subq '
           'WHERE rn = 1;')

# --Pais de mayor crecimiento_economico de cada anio
QUERY11 = ('SELECT subq.rn,subq.anio,subq.pais,subq.valor FROM ( '
           'SELECT rank() over(partition by a.num order by SUM(inf.valor_indicador) DESC) as rn,  a.num as anio,p.nombre as pais,SUM(inf.valor_indicador) as valor '
           'FROM crecimiento_economico inf '
           'INNER JOIN pais p '
           'ON p.id=inf.pais_id '
           'INNER JOIN anio a '
           'ON a.id=inf.anio_id '
           'INNER JOIN indicador ind '
           'ON ind.id=inf.indicador_id '
           'WHERE inf.valor_indicador>0 '
           'GROUP BY a.num,p.nombre '
           ') '
           'AS subq '
           'WHERE rn = 1;')


# --Pais de mayor crecimiento_economico de cada anio
QUERY12 = ('SELECT subq.rn,subq.anio,subq.pais,subq.valor  FROM ( '
           'SELECT rank() over(partition by a.num order by SUM(inf.valor_indicador) ASC,p.nombre ASC) as rn,  a.num as anio,p.nombre as pais,SUM(inf.valor_indicador) as valor '
           'FROM crecimiento_economico inf '
           'INNER JOIN pais p '
           'ON p.id=inf.pais_id '
           'INNER JOIN anio a '
           'ON a.id=inf.anio_id '
           'INNER JOIN indicador ind '
           'ON ind.id=inf.indicador_id '
           'WHERE inf.valor_indicador>0 '
           "AND NOT p.nombre=' Ingreso mediano'"
           'GROUP BY a.num,p.nombre '
           ') '
           'AS subq '
           'WHERE rn = 1;')
