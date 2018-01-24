class DockingStation

  attr_reader :bike
  # when we write on an instance of DockingStation class (eg. docking_station)
  # docking_station.bike, then it will return what is stored under @bike. 

  def release_bike
    return Bike.new
  end

  def dock(bike)
    @bike = bike
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
