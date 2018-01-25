class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []

  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def full?
    if @bikes.count >= DEFAULT_CAPACITY
      true
    end
  end

  def empty?
    if @bikes.empty?
      true
    end
  end

end
