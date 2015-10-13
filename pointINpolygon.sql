-- add column
ALTER TABLE zona_sit2 ADD COLUMN point_sum double precision;
UPDATE zona_sit2 set point_sum = (Select sum(count) FROM bip_abr12 WHERE ST_Intersects(bip_abr12.geom_abr12, 
zona_sit2.geom));
