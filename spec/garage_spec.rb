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

  describe "#fix_bikes" do
    garage = Garage.new
    bike_broken = Bike.new(false)
    bike_working = Bike.new
    garage.collection_of_bikes = [bike_broken, bike_working]

    it "fixes all bikes" do
      expect(garage.fix_bikes[0].working?).to eq true
    end
  end

end
