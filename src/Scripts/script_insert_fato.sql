USE ORCAMENTO_PUBLICO;

DROP TABLE IF EXISTS DIMENSOES;
DROP TABLE IF EXISTS FATO;

CREATE TEMPORARY TABLE DIMENSOES AS
(
	SELECT
		0 AS ID_DIMENSAO_PROGRAMA
	,	0 AS ID_DIMENSAO_ORGAO
	,	0 AS ID_DIMENSAO_AREA_ATUACAO
	,	0 AS ID_DIMENSAO_DATA
);

DELETE FROM DIMENSOES;

CREATE TEMPORARY TABLE FATO AS
(
	SELECT
		ID_DIMENSAO_PROGRAMA
	,	ID_DIMENSAO_ORGAO
    ,	ID_DIMENSAO_AREA_ATUACAO
    ,	ID_DIMENSAO_DATA
	FROM
		FT_DESPESAS_PUBLICAS
);

INSERT INTO FT_DESPESAS_PUBLICAS
(
	VL_ORCADO
,	VL_LIQUIDADO
,	ID_DIMENSAO_PROGRAMA
,	ID_DIMENSAO_ORGAO
,	ID_DIMENSAO_AREA_ATUACAO
,	ID_DIMENSAO_DATA
)
	SELECT D.ID_DIMENSAO_PROGRAMA, D.ID_DIMENSAO_ORGAO, D.ID_DIMENSAO_AREA_ATUACAO, D.ID_DIMENSAO_DATA
	FROM DIMENSOES AS D
	WHERE D.ID_DIMENSAO_DATA NOT IN (SELECT ID_DIMENSAO_DATA FROM FATO);

DROP TABLE IF EXISTS DIMENSOES;
DROP TABLE IF EXISTS FATO;