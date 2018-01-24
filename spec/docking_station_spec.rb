require 'docking_station'

# With RSpec, we are always describing the behavior of classes,
# modules and their methods. The describe block is always used at the top to
# put specs in a context. It can accept either a class name, in which case the
# class needs to exist, or any string you'd like.

describe DockingStation do # syntax for testing class instance - accepts class name
  it { is_expected.to respond_to :release_bike}
  it 'releases working bikes' do
    bike = Bike.new # someone takes a bike
    subject.dock(bike) # this bike is stored in memory as @bike
    expect(subject.release_bike).to eq bike
    # to check working returns false, use not_to eg.
    # expect(bike).not_to be_working
  end
  it { is_expected.to respond_to(:dock).with(1).argument }
  # it { is_expected.to respond_to(:bike) }

  it 'docks something' do
     bike = Bike.new
     # We want to return the bike we dock
     expect(subject.dock(bike)).to eq [bike]
   end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    # We want to return the bike we dock
    # expect(subject.bike).to eq bike
  end

  describe '#dock' do
    it 'raises error when full' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock Bike.new }.to raise_error "Docking station full"
    end
  end

  describe '#release_bike' do
    it 'raises error when empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end


end



# be_XX where XX is name of method, responds to method call. eg. be_crying responds to crying? (true or false)
# the test will pass if the method returns true

# subject in line 11 is basically self. So we call method release_bike on class DockingStation.
# this method - when called - returns new instance of class Bike.
# we call it bike :P
