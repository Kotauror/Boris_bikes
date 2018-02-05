class DockingStation
  
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    index = ""
    @bikes.each.with_index { |bike, i|
      if bike.working? then
        index = i
      end
    }
    if index != ""
      @bikes.delete_at(index.to_i)
    else
      fail 'No bikes available'
    end
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  def count_of_broken_bikes
    @bikes.count{ |bike| bike.working? }
  end

  def empty_station_of_broken_bikes
    broken_bikes_array = []
    @bikes.each { |bike|
      if !bike.working? then
        broken_bikes_array.push(bike)
        @bikes.delete(bike)
      end
    }
    return broken_bikes_array
  end

  private

  attr_reader :bikes

  def full?
    if @bikes.count >= capacity()
      true
    end
  end

  def empty?
    if @bikes.empty?
      true
    end
  end

end
