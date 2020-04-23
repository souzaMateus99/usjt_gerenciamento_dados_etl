USE ORCAMENTO_PUBLICO;

DROP TABLE IF EXISTS DIMENSOES;

CREATE TEMPORARY TABLE DIMENSOES AS
(
	SELECT
		0 AS ID_DATA
	,	0 AS ID_AREA_ATUACAO
	,	0 AS ID_ORGAO
	,	0 AS ID_PROGRAMA
);

DELETE FROM DIMENSOES;

INSERT INTO DIMENSOES (ID_DATA)
	SELECT ID_DIMENSAO_DATA FROM TD_DATA WHERE DATE(DATA_CRIACAO) = DATE(NOW());

INSERT INTO DIMENSOES (ID_AREA_ATUACAO)
	SELECT ID_DIMENSAO_AREA_ATUACAO FROM TD_AREA_ATUACAO WHERE DATE(DATA_CRIACAO) = DATE(NOW());
    
INSERT INTO DIMENSOES (ID_ORGAO)
	SELECT ID_DIMENSAO_ORGAO FROM TD_ORGAO WHERE DATE(DATA_CRIACAO) = DATE(NOW());
    
INSERT INTO DIMENSOES (ID_PROGRAMA)
	SELECT ID_DIMENSAO_PROGRAMA FROM TD_PROGRAMA WHERE DATE(DATA_CRIACAO) = DATE(NOW());

INSERT INTO FT_DESPESAS_PUBLICAS
(
	VL_ORCADO
,	VL_LIQUIDADO
,	ID_DIMENSAO_PROGRAMA
,	ID_DIMENSAO_ORGAO
,	ID_DIMENSAO_AREA_ATUACAO
,	ID_DIMENSAO_DATA
)
SELECT 0.0, 0.0, D.ID_PROGRAMA, D.ID_ORGAO, D.ID_AREA_ATUACAO, D.ID_DATA  FROM DIMENSOES AS D;

DROP TABLE IF EXISTS DIMENSOES;