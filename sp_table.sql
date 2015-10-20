CREATE TABLE bip_abr12u6v2
(
  gid_abr12 serial NOT NULL,
  geom_abr12 geometry(Point,32719),
  count integer,
  x_subida double precision,
  y_subida double precision,
  fecha character varying,
  CONSTRAINT bip_abr12u6_pkey2 PRIMARY KEY (gid_abr12)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bip_abr12u6v2
  OWNER TO postgres;
UPDATE bip_abr12u6v2 SET geom_abr12 = ST_SetSRID(ST_MakePoint(x_subida, y_subida), 32719);
ALTER TABLE bip_abr12u6v2 ALTER COLUMN geom_abr12 TYPE geometry(Point, 4326) USING ST_Transform(geom_abr12, 4326);
