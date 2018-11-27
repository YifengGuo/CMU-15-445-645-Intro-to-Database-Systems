SELECT city, ROUND((scount * 1.0 / (SELECT COUNT(*) FROM trip)), 4) AS ratio FROM 
(SELECT city, COUNT(station_id) AS scount FROM station 
INNER JOIN trip 
WHERE station.station_id = trip.start_station_id OR station.station_id = trip.end_station_id
GROUP BY city)
ORDER BY ratio DESC, city ASC;