SELECT ST_Buffer(eod_2012.geom, 50) as buffer, eod_2012.gid as gideod, zonas_ts.gid as gidts, zonas_ts.geom as geomts 
from zonas_ts, eod_2012 
where eod_2012.id = '103'
and ST_Intersects(zonas_ts.geom, eod_2012.geom);
