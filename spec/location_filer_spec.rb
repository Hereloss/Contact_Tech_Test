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

  it 'It will output the results as one per line' do
    expect(subject.find_people("Springfield")).to eq("Homer Simpson\nMarge Simpson\n")
  end

end