require './lib/location_filter'

describe LocationFilter do
  context 'Feature Tests' do
    it 'will search by location, and return all people in that location in the correct format' do
      expect(subject.find_people('Springfield')).to eq("Homer Simpson\nMarge Simpson\nKrusty the Clown")
      expect(subject.find_people('Springfield')).to eq("Homer Simpson\nMarge Simpson\nKrusty the Clown")
      expect(subject.find_people('SPRINGFIELD')).to eq("Homer Simpson\nMarge Simpson\nKrusty the Clown")
      expect(subject.find_people('London')).to eq('')
    end

    it 'will change file, search by location, and return all people in that location in the correct format' do
      subject.amend_source_location('./example_data_2.json')
      expect(subject.find_people('Springfield')).to eq("Maggie Simpson\nSideshow Bob")
      expect(subject.find_people('Springfield')).to eq("Maggie Simpson\nSideshow Bob")
      expect(subject.find_people('LOS ANGELES')).to eq('Bojack Horseman')
      expect(subject.find_people('London')).to eq('')
    end

    it 'will do a incorrect file change, search by location and return data from the original file correctly' do
      expect do
        subject.amend_source_location('./example_data_3.json')
      end.to raise_error('Error - JSON data is malformed or location does not contain JSON file')
      expect(subject.find_people('Springfield')).to eq("Homer Simpson\nMarge Simpson\nKrusty the Clown")
    end
  end
end
