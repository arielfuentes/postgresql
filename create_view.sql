CREATE VIEW viajes_vista AS
SELECT SUM(factorexpansion) AS DDA, DATE(tiemposubida) AS DIA, mediahoramediodeviaje AS MH, 
serv_1era_etapa, serv_2da_etapa, serv_3era_etapa, serv_4ta_etapa, 
paraderosubida_1era, paraderosubida_2da, paraderosubida_3era, paraderosubida_4ta, 
paraderobajada_1era, paraderobajada_2da, paraderobajada_3era, paraderobajada_4ta
FROM public.viajes2019_abr
GROUP BY DATE(tiemposubida), mediahoramediodeviaje, 
serv_1era_etapa, serv_2da_etapa, serv_3era_etapa, serv_4ta_etapa, 
paraderosubida_1era, paraderosubida_2da, paraderosubida_3era, paraderosubida_4ta, 
paraderobajada_1era, paraderobajada_2da, paraderobajada_3era, paraderobajada_4ta;
