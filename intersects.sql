SELECT * 
from zonas_ts, eod_2012 
where eod_2012.id = '103'
and ST_Intersects(zonas_ts.geom, eod_2012.geom);
