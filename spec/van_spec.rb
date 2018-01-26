require 'van'
require 'docking_station'
require 'bike'



describe Van do
  bike_working = Bike.new
  bike_broken = Bike.new(false)
  station = DockingStation.new
  van = Van.new
  station.dock(bike_broken)
  station.dock(bike_working)
  # let(:bike_broken) { double('bike', working?: false) }
  # let(:station) { double("station" }
  describe "#collect_bikes" do
    it "returns broken bikes in van" do
      expect(van.collect_bikes(station)).to eq [bike_broken]
    end
  end

  describe "#empty?" do
    it "returns false for non-empty van" do
      van = Van.new
      van.collection_of_bikes = [bike_working, bike_broken]
      expect(van).not_to be_empty
    end


    it "returns true for empty van" do
      van = Van.new
      expect(van).to be_empty
    end
  end

  describe "#delete_bikes" do
    it "deletes bikes from van" do
    van = Van.new
    van.collection_of_bikes = [bike_working, bike_broken]
    expect(van.delete_bikes).to be_empty
    end
  end 
end
