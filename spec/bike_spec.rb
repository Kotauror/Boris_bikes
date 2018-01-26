require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?}

  it 'reports working bike' do
    bike = Bike.new(true)
    expect(bike.report).to eq "Bike is working"
  end

  it 'reports broken bike' do
    bike = Bike.new(false)
    expect(bike.report).to eq "Bike is not working"
  end

end
