require 'json'

class LocationFilter

  attr_reader :data_hash

  def initialize
    file = File.read('./example_data.json')
    @data_hash = JSON.parse(file)
  end

  def find_people(location)
    @data_hash.each do |data|
      if data["location"] == location
        return data["name"]
      end
    end
  end
end