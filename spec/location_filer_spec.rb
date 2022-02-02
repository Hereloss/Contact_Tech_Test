# frozen_string_literal: true

require './lib/location_filter'

describe LocationFilter do
  before(:each) do
    printer_double = double
    allow(printer_double).to receive(:format_output) do |arg|
      arg.map { |person| person['name'] }
    end
    data_sourcer_double = double
    data_hash = JSON.parse(File.read('./example_data.json'))
    allow(data_sourcer_double).to receive(:data_hash).and_return(data_hash)
    @location = LocationFilter.new(printer_double)
  end

  it 'find_people will locate a person with the specified location' do
    expect(@location.find_people('Philidelphia')).to include('Frank Reynolds')
  end

  it 'If multiple people live in the same location, find_people will find them all' do
    expect(@location.find_people('Springfield')).to include('Homer Simpson', 'Marge Simpson')
  end

  it 'Is case insensitive and space insensitive for searching location' do
    expect(@location.find_people('Springfield')).to include('Krusty the Clown')
    expect(@location.find_people('SpringField')).to include('Homer Simpson')
    expect(@location.find_people('SPRINGFIELD')).to include('Homer Simpson')
    expect(@location.find_people('springfield')).to include('Homer Simpson')
    expect(@location.find_people('Los Angeles')).to include('Diane Nguyen')
  end
end
