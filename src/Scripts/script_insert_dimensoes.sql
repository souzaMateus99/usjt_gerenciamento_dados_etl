/*
	INSERT DIMENSÃO PROGRAMA
*/
INSERT INTO TD_PROGRAMA
(
	COD_PROGRAMA_ORCAMENTARIO
,	NOME_PROGRAMA_ORCAMENTARIO
,	COD_ACAO
,	NOME_ACAO
,	DATA_CRIACAO
)
VALUES
(
);


/*
	INSERT DIMENSÃO ÓRGÃO
*/
INSERT INTO TD_ORGAO
(
	COD_ORGAO_SUPERIOR
,	NOME_ORGAO_SUPERIOR
,	COD_ORGAO_SUBORDINADO
,	NOME_ORGAO_SUBORDINADO
,	COD_UNIDADE_ORCAMENTARIA
,	NOME_UNIDADE_ORCAMENTARIA
,	DATA_CRIACAO
)
VALUES
(
);

/*
	INSERT DIMENSÃO ÁREA DE ATUAÇÃO
*/
INSERT INTO TD_AREA_ATUACAO
(
	COD_FUNCAO
,	NOME_FUNCAO
,	COD_SUB_FUNCAO
,	NOME_SUB_FUNCAO
,	DATA_CRIACAO
)
VALUES
(
);


/*
	INSERT DIMENSÃO DATA
*/
INSERT INTO TD_DATA
(
	MES
,	ANO
,	DATA_CRIACAO
)
VALUES
(
);