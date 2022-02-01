require './lib/location_filter'

describe LocationFilter do

  it 'see_data method displays the parsed Json' do
    expect(subject.see_data[0]).to eq({"name"=>"Homer Simpson", "location"=>"Springfield", "date_of_birth"=>"1956-05-12"})
  end

  it 'Location filter has a method to find the data which takes in an argument' do
    expect(subject).to respond_to(:find_people).with(1).argument
  end

  it 'find_people will locate people with the specified location' do
    expect(subject.find_people("Philidelphia")).to include("Frank Reynolds")
  end

end