# frozen_string_literal: true

require './lib/data_sourcer'

describe DataSourcer do
  it 'The data_hash variable displays the parsed Json' do
    expect(subject.data_hash[0]).to eq({ 'name' => 'Homer Simpson', 'location' => 'Springfield',
                                         'date_of_birth' => '1956-05-12' })
  end

  it 'You can ammend the source file location' do
    subject.amend_source_location('./example_data_2.json')
    expect(subject.data_hash[0]).to eq({ 'date_of_birth' => '2000-05-12', 'location' => 'Springfield',
                                         'name' => 'Maggie Simpson' })
  end

  it 'If an invalid path is chosen, an error is raised' do
    expect do
      subject.amend_source_location('./example_data_3.json')
    end.to raise_error('No such file or directory @ rb_sysopen - ./example_data_3.json')
  end
end
