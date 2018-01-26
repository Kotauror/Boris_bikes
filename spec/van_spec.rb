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
    it "it returns broken bikes in van" do
      expect(van.collect_bikes(station)).to eq [bike_broken]
    end
  end

end
