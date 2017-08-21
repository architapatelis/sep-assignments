# Following distance between two coordinates is calculate using the Haversine formula https://stackoverflow.com/questions/365826/calculate-distance-between-2-gps-coordinates
require_relative 'city'

def degreesToRadians(degrees)
  degrees * Math::PI / 180
end

def distance(lat1, lon1, lat2, lon2)
  earthRadiusKm = 6371

  dLat = degreesToRadians(lat2-lat1)
  dLon = degreesToRadians(lon2-lon1)

  lat1 = degreesToRadians(lat1);
  lat2 = degreesToRadians(lat2);

  a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2)
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  return earthRadiusKm * c
end

def nearest_neighbor(graph_of_cities, current_city)
  graph = [current_city.name]
  until graph_of_cities[0].nil?
    next_city = graph_of_cities[0]
    graph_of_cities.each do |current_neighbor|
      distance_of_next_city = distance(current_city.lat, current_city.lon, next_city.lat, next_city.lon)
      distance_of_current_neighbor = distance(current_city.lat, current_city.lon, current_neighbor.lat, current_neighbor.lon)
      if distance_of_next_city > distance_of_current_neighbor
        next_city = current_neighbor
      end
    end
    current_city = next_city
    graph_of_cities.delete(next_city)
    graph.push(current_city.name)
  end
  graph
end

#test:

start = City.new("San Francisco", 37.7749, 122.4194)
chicago = City.new("Chicago", 41.8781, 87.6298)
seattle = City.new("Seattle", 47.6062, 122.3321)
denver = City.new("Denver", 39.7392, 104.9903)
miami = City.new("Miami", 25.7617, 80.1918)
new_york = City.new("New York", 40.7128, 74.0059)
new_haven = City.new("New Haven", 41.3083, 72.9279)

city_graph = [chicago, seattle, denver, miami, new_york, new_haven]

graph_of_trip = nearest_neighbor(city_graph, start)
puts graph_of_trip
