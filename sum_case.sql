SELECT COUNT(CASE WHEN etapas201504_transparencia.tipo_dia = 'LABORAL' THEN 1 ELSE NULL END)/5 AS trx_dln,
COUNT(CASE WHEN etapas201504_transparencia.tipo_dia = 'SABADO' THEN 1 ELSE NULL END)/2 AS trx_sab,
COUNT(CASE WHEN etapas201504_transparencia.tipo_dia = 'DOMINGO' THEN 1 ELSE NULL END) AS trx_dom,
dicc_rutas_sonda.route_name, etapas201504_transparencia.tipo_dia
FROM etapas201504_transparencia
INNER JOIN dicc_rutas_sonda ON dicc_rutas_sonda.cod_sinrut = etapas201504_transparencia.tipo_operador
WHERE etapas201504_transparencia.tipo_transporte = 'BUS' AND dicc_rutas_sonda.cod_usu in ('102',
                                                                                          '402',
                                                                                          '406',
                                                                                          '407',
                                                                                          '418',
                                                                                          '426',
                                                                                          '427',
                                                                                          '414e',
                                                                                          '414enc',
                                                                                          '415e',
                                                                                          '415enc',
                                                                                          'D13',
                                                                                          '101',
                                                                                          '103',
                                                                                          '106',
                                                                                          '107',
                                                                                          '108',
                                                                                          '109')
GROUP BY dicc_rutas_sonda.route_name, etapas201504_transparencia.tipo_dia;
