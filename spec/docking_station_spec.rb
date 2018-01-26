require 'docking_station'

describe DockingStation do

  let(:bike_working) { double "a bike that is working", working?: true }
  let(:bike_broken) { double "a bike that is not working", working?: false }
  # create two doubles at the top - for a working bike (will be tested in working bike methods)
  # and a bike that's not working. Instead of creating a double in each test (see hash in 'releases working bikes' test),
  # we create the doubles once and then reuse them.


  it { is_expected.to respond_to :release_bike}

  it 'releases working bikes' do

    # bike = double("a bike", working?: true)
    subject.dock(bike_working)
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks bike' do
    # bike = Bike.new # double here
    expect(subject.dock(bike_working)).to eq [bike_working]
   end

  describe '#dock' do
    it 'raises error when full' do
      subject.capacity.times { subject.dock bike_working} # double here
      expect { subject.dock bike_working }.to raise_error 'Docking station full' # double here
    end
  end

  describe '#release_bike' do
    it 'raises error when empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    it 'doesnt release broken bikes' do
      # bike = double("a bike", working?: false)
      # bike = Bike.new(false) # double here
      station = DockingStation.new
      station.dock(bike_broken)
      expect { station.release_bike }.to raise_error 'No bikes available' #doesn't release bike as there is only one bike and it is broken
    end
  end

  describe 'initialization' do
    # subject { DockingStation.new }
    # let(:bike) { Bike.new } # double here
    # bike = Bike.new
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike_broken)
      end
      expect{ subject.dock(bike_broken) }.to raise_error 'Docking station full'
    end
  end

  describe"#count_of_broken_bikes" do
    it "returns the count of broken bikes" do
      station= DockingStation.new
      station.dock(bike_working)
      station.dock(bike_broken)
      expect(station.count_of_broken_bikes).to eq 1
    end
  end

describe"#empty_station_of_broken_bikes" do
  it "empties the station of broken bikes" do
    station = DockingStation.new
    station.dock(bike_working)
    station.dock(bike_broken)
    expect(station.empty_station_of_broken_bikes).to eq [bike_broken]

  end
end

end
