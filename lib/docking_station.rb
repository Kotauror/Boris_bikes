class DockingStation

  # attr_reader :bikes
  # when we write on an instance of DockingStation class (eg. docking_station)
  # docking_station.bike, then it will return what is stored under @bike.

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if @bikes.count >= 20
    @bikes << bike
  end



  # dock method is only "taking" the bike from user and pass it to a variable,
  # so we can use this 'bike' in other methods as well.
  # stores bike as an instance variable :P It doesn't return anything.

  # def bike
  #   return @bike
  # end

  # this function takes the bike 'passed' in dock by the user and returns it.

  # we can replace the def bike method by using the attr_reader.
  # attr_reader: bike is basically:
  # def bike
    # @bike
  # end



end
