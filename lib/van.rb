class Van

  attr_accessor :collection_of_bikes

  def initialize
    @collection_of_bikes = []
  end

  def collect_bikes(station)
    @collection_of_bikes = station.empty_station_of_broken_bikes
  end

  def empty?
    @collection_of_bikes.empty?
  end

  def pass_bikes
    @collection_of_bikes
  end

end
