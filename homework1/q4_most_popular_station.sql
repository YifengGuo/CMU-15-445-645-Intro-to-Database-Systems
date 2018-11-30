-- For each city, find the most popular station in that city. "Popular" means that the station has the highest count of visits. 
-- As above, either starting a trip or finishing a trip at a station, the trip is counted as one "visit" to that station. 
-- The trip is only counted once if the start station and the end station are the same.
-- Details: For each station, print city name, most popular station name and its visit count. Sort by city name, ascending.

select * from 
	(select * from (select id, station_id from trip left join station where station.station_id = trip.start_station_id) as A 
	left join 
	(select id, station_id from trip left join station where station.station_id = trip.end_station_id) as B where A.id = B.id) 
	group by station_id;