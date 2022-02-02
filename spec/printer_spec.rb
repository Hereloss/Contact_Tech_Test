require './lib/location_filter'

describe Printer do

  it 'It will output the results as one per line' do
    input = [{"name"=>"Homer Simpson"}, {"name"=>"Marge Simpson"}]
    expect(subject.format_output(input)).to eq("Homer Simpson\nMarge Simpson")
  end

end