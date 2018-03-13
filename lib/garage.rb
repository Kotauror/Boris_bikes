require_relative 'bike'

class Garage

  attr_accessor :collection_of_bikes

  def initialize
    @collection_of_bikes = []
  end

  def receive_bikes(van)
    @collection_of_bikes = van.pass_bikes
    van.delete_bikes
    return @collection_of_bikes
  end

  def fix_bikes
    @collection_of_bikes.each { |bike| bike.working = true }
  end

end
