require './lib/data_sourcer'

describe DataSourcer do
  it 'can ammend the source file location' do
    subject.amend_source_location('./example_data_2.json')
    expect(subject.data_hash[0]).to eq({ 'date_of_birth' => '2000-05-12', 'location' => 'Springfield',
                                         'name' => 'Maggie Simpson' })
  end

  it 'will raise an error if an invalid path is chosen' do
    expect do
      subject.amend_source_location('./example_data_3.json')
    end.to raise_error('Error - JSON data is malformed or location does not contain JSON file')
  end

  it 'will raise an error if the chosen JSON file is invalid' do
    expect do
      subject.amend_source_location('./malformed_data.json')
    end.to raise_error('Error - JSON data is malformed or location does not contain JSON file')
    expect do
      subject.amend_source_location('./malformed_data_2.json')
    end.to raise_error('Error - JSON data is malformed or location does not contain JSON file')
  end
end
