require 'garage'
require 'van'
require 'bike'

describe Garage do

  describe "#receive_bikes" do
    garage = Garage.new
    van = Van.new
    bike = Bike.new
    van.collection_of_bikes = [bike]
    it "gets bikes from van" do
      expect(garage.receive_bikes(van)).to eq [bike]      
    end
  end

end
