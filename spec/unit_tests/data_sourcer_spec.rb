require './lib/data_sourcer'

describe DataSourcer do
  it 'can ammend the source file location' do
    subject.amend_source_location('./example_data_2.json')
    expect(subject.data_hash[0]).to eq({ 'date_of_birth' => '2000-05-12', 'location' => 'Springfield',
                                         'name' => 'Maggie Simpson' })
  end

  it 'will raise and error if an invalid path is chosen' do
    expect do
      subject.amend_source_location('./example_data_3.json')
    end.to raise_error('No such file or directory @ rb_sysopen - ./example_data_3.json')
  end
end
