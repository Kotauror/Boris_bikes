class Van

  def initialize
    @collection_of_bikes = []
  end

  def collect_bikes(station)
    @collection_of_bikes = station.empty_station_of_broken_bikes
  end

end
