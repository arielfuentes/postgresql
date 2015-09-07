SELECT ST_Buffer(eod_2012.geom, 50) as buffer, eod_2012.gid as gideod, zonas_ts.gid as gidts, zonas_ts.geom as geomts 
from zonas_ts, eod_2012 
where eod_2012.id = '103'
and ST_Intersects(zonas_ts.geom, eod_2012.geom);
---------------------------------------------------------------------------------------------------------------
SELECT ST_Buffer(eod_2012.geom, 50) as buffer, eod_2012.gid as gideod, servicios_ago22_2015.gid as gidser, 
ST_Transform(servicios_ago22_2015.geom, 32719) as geomser,  servicios_ago22_2015.route_name
from servicios_ago22_2015, eod_2012 
where servicios_ago22_2015.route_name in ('B01I', 'C01I')
and ST_Intersects(ST_Transform(servicios_ago22_2015.geom, 32719), eod_2012.geom);
