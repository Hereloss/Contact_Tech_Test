require './lib/location_filter'

describe LocationFilter do
  let(:data_sourcer_double) { double :data_sourcer, data_hash: JSON.parse(File.read('./example_data.json')) }

  before(:each) do
    printer_double = double
    allow(printer_double).to receive(:print_formatted_output) do |arg|
      arg.map { |person| person['name'] }
    end
    @location = LocationFilter.new(printer_double, data_sourcer_double)
  end

  it 'will locate a person with the specified location' do
    expect(@location.find_people('Philidelphia')).to include('Frank Reynolds')
  end

  it 'will find all people if multiple people live in the same location' do
    expect(@location.find_people('Springfield')).to include('Homer Simpson', 'Marge Simpson')
  end

  it 'is case insensitive and space insensitive for searching location' do
    expect(@location.find_people('Springfield')).to include('Krusty the Clown')
    expect(@location.find_people('SpringField')).to include('Homer Simpson')
    expect(@location.find_people('SPRINGFIELD')).to include('Homer Simpson')
    expect(@location.find_people('springfield')).to include('Homer Simpson')
    expect(@location.find_people('Los Angeles')).to include('Diane Nguyen')
  end
end
