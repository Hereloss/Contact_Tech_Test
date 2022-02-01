require './lib/location_filter'

describe LocationFilter do

  it 'see_data method displays the parsed Json' do
    expect(subject.see_data[0]).to eq({"name"=>"Homer Simpson", "location"=>"Springfield", "date_of_birth"=>"1956-05-12"})
  end

  it 'Location filter has a method to find the data which takes in an argument' do
    expect(subject).to respond_to(:find_people)
  end

end