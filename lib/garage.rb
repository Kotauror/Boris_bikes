class Garage

  def initialize
    @collection_of_bikes = []
  end

  def receive_bikes(van)
    @collection_of_bikes = van.pass_bikes
    van.delete_bikes
    return @collection_of_bikes
  end

end
