require './lib/location_filter'

describe LocationFilter do

  it 'The data_hash variable displays the parsed Json' do
    expect(subject.data_hash[0]).to eq({"name"=>"Homer Simpson", "location"=>"Springfield", "date_of_birth"=>"1956-05-12"})
  end

  it 'Location filter has a method to find the data which takes in an argument' do
    expect(subject).to respond_to(:find_people).with(1).argument
  end

  it 'find_people will locate a person with the specified location' do
    expect(subject.find_people("Philidelphia")).to include("Frank Reynolds")
  end

  it 'If multiple people live in the same location, find_people will find them all' do
    expect(subject.find_people("Springfield")).to include("Homer Simpson")
    expect(subject.find_people("Springfield")).to include("Marge Simpson")
  end

  it 'Is case insensitive for searching location' do
    expect(subject.find_people("Springfield")).to include("Krusty the Clown")
    expect(subject.find_people("SpringField")).to include("Homer Simpson")
    expect(subject.find_people("SPRINGFIELD")).to include("Homer Simpson")
    expect(subject.find_people("springfield")).to include("Homer Simpson")
  end

  it 'It will output the results as one per line' do
    expect(subject.find_people("Springfield")).to eq("Homer Simpson\nMarge Simpson\nKrusty the Clown\n")
  end

  it 'If a location is typed with spaces, it will still find this as intended' do
    expect(subject.find_people("Los Angeles")).to include("Diane Nguyen")
  end

  it 'You can ammend the source file location' do
    subject.amend_source_location('./example_data_2.json')
    expect(subject.find_people("Springfield")).to include("Maggie Simpson")
    expect(subject.find_people("Philidelphia")).to include("Dennis Reynolds")
    expect(subject.find_people("Los Angeles")).to include("Bojack Horseman")
  end

end