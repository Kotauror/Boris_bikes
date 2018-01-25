require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike}

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_instance_of(Bike)
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks bike' do
     bike = Bike.new
     expect(subject.dock(bike)).to eq [bike]
   end

  describe '#dock' do
    it 'raises error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'raises error when empty' do
      @bikes = []
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'initialization' do
    # subject { DockingStation.new }
    let(:bike) { Bike.new }
    # bike = Bike.new
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

end
