require './lib/location_filter'

describe LocationFilter do

  before(:each) do
    printer_double = double()
    allow(printer_double).to receive(:format_output) do |arg|
      all_people = ''
      arg.each do |person|
        all_people += person["name"]
      end
      all_people
    end
    @location = LocationFilter.new(printer_double)
  end

  it 'The data_hash variable displays the parsed Json' do
    expect(@location .data_hash[0]).to eq({"name"=>"Homer Simpson", "location"=>"Springfield", "date_of_birth"=>"1956-05-12"})
  end

  it 'Location filter has a method to find the data which takes in an argument' do
    expect(@location).to respond_to(:find_people).with(1).argument
  end

  it 'find_people will locate a person with the specified location' do
    expect(@location.find_people("Philidelphia")).to include("Frank Reynolds")
  end

  it 'If multiple people live in the same location, find_people will find them all' do
    expect(@location.find_people("Springfield")).to include("Homer Simpson")
    expect(@location.find_people("Springfield")).to include("Marge Simpson")
  end

  it 'Is case insensitive for searching location' do
    expect(@location.find_people("Springfield")).to include("Krusty the Clown")
    expect(@location.find_people("SpringField")).to include("Homer Simpson")
    expect(@location.find_people("SPRINGFIELD")).to include("Homer Simpson")
    expect(@location.find_people("springfield")).to include("Homer Simpson")
  end

  it 'If a location is typed with spaces, it will still find this as intended' do
    expect(@location.find_people("Los Angeles")).to include("Diane Nguyen")
  end

  it 'You can ammend the source file location' do
    @location.amend_source_location('./example_data_2.json')
    expect(@location.find_people("Springfield")).to include("Maggie Simpson")
    expect(@location.find_people("Philidelphia")).to include("Dennis Reynolds")
    expect(@location.find_people("Los Angeles")).to include("Bojack Horseman")
  end

  it 'If an invalid path is chosen, an error is raised and the file being accessed is unchanged' do
    expect{ @location.amend_source_location('./example_data_3.json') }.to raise_error("No such file or directory @ rb_sysopen - ./example_data_3.json")
    expect(@location.find_people("SpringField")).to include("Homer Simpson")
  end

end