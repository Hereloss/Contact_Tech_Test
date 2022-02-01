require './lib/location_filter'

describe LocationFilter do

  it 'see_data method displays the parsed Json' do
    expect(subject.see_data[0]).to eq({"name"=>"Homer Simpson", "location"=>"Springfield", "date_of_birth"=>"1956-05-12"})
  end

end