CREATE PROCEDURE SP_FilterTransactionStats
	@CampaignId VARCHAR(10),
	@AgentId VARCHAR(10)
AS
BEGIN

DECLARE @query varchar(max)
DECLARE @whereClause varchar(255) = '';

IF(@CampaignId IS NOT NULL AND @AgentId IS NOT NULL)
	SET @whereClause = 'WHERE c.idCampanya=' + @CampaignId + ' AND u.idUsuario=' + @AgentId;

IF(@CampaignId IS NOT NULL AND @AgentId IS NULL)
	SET @whereClause = 'WHERE c.idCampanya=' + @CampaignId;

IF(@CampaignId IS NULL AND @AgentId IS NOT NULL)
	SET @whereClause = 'WHERE u.idUsuario=' + @AgentId;


SET @query = 'SELECT c.idCampanya,
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
INNER JOIN USUARIO u ON u.idUsuario = t.idUsuario '
+ @whereClause;

exec(@query)

END
GO

EXEC	[dbo].[SP_FilterTransactionStats]
		@CampaignId = N'3',
		@AgentId = N'3';
