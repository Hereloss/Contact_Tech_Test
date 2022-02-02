require './lib/location_filter'

describe Printer do

  it 'It will output the results as one per line' do
    expect(subject.format_output(['Homer Simpson','Marge Simpson'])).to eq("Homer Simpson\nMarge Simpson\n")
  end

end