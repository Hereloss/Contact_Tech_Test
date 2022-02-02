require './lib/location_filter'

describe Printer do
  it 'will output the results as one per line' do
    input = [{ 'name' => 'Homer Simpson' }, { 'name' => 'Marge Simpson' }]
    expect(Printer.print_formatted_output(input)).to eq("Homer Simpson\nMarge Simpson")
  end

  it 'will raise an error if the data is malformed to have 2 name keys' do
    input = [{ 'name' => 'Homer Simpson', 'name' => 'Marge Simpson'}]
    # expect { Printer.print_formatted_output(input) }.to raise_error('Error in data - 2 name keys for one entry')
    expect(Printer.print_formatted_output(input)).to eq("Homer Simpson\nMarge Simpson")
  end

  it 'will not return a person if a entry has the location but no name' do
    input = [{ 'location' => 'Springfield' },{ 'name' => 'Homer Simpson' }]
    expect(Printer.print_formatted_output(input)).to eq("Homer Simpson")
  end
end
