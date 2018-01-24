require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike}

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do
     bike = Bike.new
     expect(subject.dock(bike)).to eq [bike]
   end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
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
