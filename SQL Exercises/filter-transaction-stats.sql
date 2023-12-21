SELECT c.idCampanya,
	c.nombre,
    u.idUsuario,
    u.nombre,
    u.login,
    t.TotalTransacciones,
    t.TotalMinutos
FROM (
  select idCampanya,
  	idUsuario,
  	count(*) as TotalTransacciones,
    SUM(DATEDIFF(minute, tInicio, tFinal)) as TotalMinutos
  FROM TRANSACCION
  GROUP BY idCampanya, idUsuario
) t    
INNER JOIN CAMPANYA c ON c.idCampanya = t.idCampanya
INNER JOIN USUARIO u ON u.idUsuario = t.idUsuario;