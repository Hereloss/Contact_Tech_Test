require './lib/location_filter'

describe LocationFilter do

  it 'Feature test 1' do
    expect(subject.find_people("Springfield")).to eq("Homer Simpson\nMarge Simpson\nKrusty the Clown")
    expect(subject.find_people("Springfield")).to eq("Homer Simpson\nMarge Simpson\nKrusty the Clown")
    expect(subject.find_people("SPRINGFIELD")).to eq("Homer Simpson\nMarge Simpson\nKrusty the Clown")
    expect(subject.find_people('London')).to eq("")
  end

  it 'Feature test 2 with changed file' do
    subject.amend_source_location('./example_data_2.json')
    expect(subject.find_people("Springfield")).to eq("Maggie Simpson\nSideshow Bob")
    expect(subject.find_people("Springfield")).to eq("Maggie Simpson\nSideshow Bob")
    expect(subject.find_people("LOS ANGELES")).to eq("Bojack Horseman")
    expect(subject.find_people('London')).to eq("")
  end


end