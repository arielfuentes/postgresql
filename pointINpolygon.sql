-- add column
ALTER TABLE zona_sit2 ADD COLUMN point_sum double precision;
UPDATE zona_sit2 set point_sum = (Select sum(count) FROM bip_abr12 WHERE ST_Intersects(bip_abr12.geom_abr12, 
zona_sit2.geom));

-- complete process
CREATE TABLE tb8bip12sersentot
(
  gid_abr12 serial NOT NULL,
  geom_abr12 geometry(Point,32719),
  count integer,
  x_subida double precision,
  y_subida double precision,
  fecha character varying,
  CONSTRAINT tb8bip12sersentot_pkey PRIMARY KEY (gid_abr12)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tb8bip12sersentot
  OWNER TO postgres;
UPDATE tb8bip12sersentot SET geom_abr12 = ST_SetSRID(ST_MakePoint(x_subida, y_subida), 32719);
ALTER TABLE tb8bip12sersentot ALTER COLUMN geom_abr12 TYPE geometry(Point, 4326) USING ST_Transform(geom_abr12, 4326);

CREATE TABLE tb8bip14sersentot
(
  gid_may14 serial NOT NULL,
  geom_may14 geometry(Point,32719),
  count integer,
  x_subida double precision,
  y_subida double precision,
  fecha character varying,
  CONSTRAINT tb8bip14sersentot_pkey PRIMARY KEY (gid_may14)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tb8bip14sersentot
  OWNER TO postgres;
UPDATE tb8bip14sersentot SET geom_may14 = ST_SetSRID(ST_MakePoint(x_subida, y_subida), 32719);
ALTER TABLE tb8bip14sersentot ALTER COLUMN geom_may14 TYPE geometry(Point, 4326) USING ST_Transform(geom_may14, 4326);

ALTER TABLE out_zona ADD COLUMN point_sumtb812sersenu6 double precision;
ALTER TABLE out_zona ADD COLUMN point_sumtb814sersenu6 double precision;
ALTER TABLE out_zona ADD COLUMN var_trxsersenu6 double precision;

ALTER TABLE zona_sit2 ADD COLUMN point_sumtb812sersenu6 double precision;
ALTER TABLE zona_sit2 ADD COLUMN point_sumtb814sersenu6 double precision;
ALTER TABLE zona_sit2 ADD COLUMN var_trxsersenu6 double precision;

UPDATE out_zona set point_sumtb812sersenu6 = (Select sum(count) FROM tb8bip12sersentot WHERE ST_Intersects(tb8bip12sersentot.geom_abr12, 
out_zona.geom_out) and tb8bip12sersentot.fecha in ('2012-04-16',
'2012-04-17',
'2012-04-18',
'2012-04-19',
'2012-04-20'));

UPDATE zona_sit2 set point_sumtb812sersenu6 = (Select sum(count) FROM tb8bip12sersentot WHERE ST_Intersects(tb8bip12sersentot.geom_abr12, 
zona_sit2.geom) and tb8bip12sersentot.fecha in ('2012-04-16',
'2012-04-17',
'2012-04-18',
'2012-04-19',
'2012-04-20'));

UPDATE out_zona set point_sumtb814sersenu6 = (Select sum(count) FROM tb8bip14sersentot WHERE ST_Intersects(tb8bip14sersentot.geom_may14, 
out_zona.geom_out) and tb8bip14sersentot.fecha in ('2014-05-26',
'2014-05-27',
'2014-05-28',
'2014-05-29',
'2014-05-30'));

UPDATE zona_sit2 set point_sumtb814sersenu6 = (Select sum(count) FROM tb8bip14sersentot WHERE ST_Intersects(tb8bip14sersentot.geom_may14, 
zona_sit2.geom) and tb8bip14sersentot.fecha in ('2014-05-26',
'2014-05-27',
'2014-05-28',
'2014-05-29',
'2014-05-30'));

UPDATE out_zona set var_trxsersenu6 = ((point_sumtb814sersenu6 - point_sumtb812sersenu6) / point_sumtb812sersenu6 * 100);
UPDATE zona_sit2 set var_trxsersenu6 = ((point_sumtb814sersenu6 - point_sumtb812sersenu6) / point_sumtb812sersenu6 * 100);
