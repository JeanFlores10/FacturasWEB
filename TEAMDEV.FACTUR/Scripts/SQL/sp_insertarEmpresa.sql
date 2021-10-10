CREATE PROC SP_insertarEmpresa(
@razonsocial varchar(200),
@ruc varchar(20),
@email varchar(100),
@idpais int,
@idmoneda int,
@Vendeconimpuestos int,
@TImpuestos int,
@idporcentaje int,
@direccion varchar(max),
@filename varchar(max),
@proyecto varchar(30)
)
AS
BEGIN
IF NOT EXISTS (SELECT * FROM EMPRESA WHERE ruc = @ruc)
BEGIN

INSERT INTO EMPRESA VALUES(
@razonsocial,
@ruc,
@email,
@idpais,
@idmoneda,
@Vendeconimpuestos,
@TImpuestos,
@idporcentaje,
@direccion,
@filename,
1,
@proyecto,
getdate())

SELECT 'ok' response
END
ELSE
BEGIN

SELECT 'LA EMPRESA YA SE ENCUENTRA REGISTRADA' response

END
END


select * from empresa