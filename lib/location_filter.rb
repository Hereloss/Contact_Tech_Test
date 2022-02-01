require 'json'

class LocationFilter

  attr_reader :data_hash

  def initialize
    file = File.read('./example_data.json')
    @data_hash = JSON.parse(file)
  end

  def find_people(location)
    @people_in_location = []
    @data_hash.each do |data|
      if data["location"].downcase == location.downcase
        @people_in_location << data["name"]
      end
    end
    format_output
  end

  def format_output
    output = ''
    @people_in_location.each do |person|
      output += person + "\n"
    end
    puts output
    output
  end

  def amend_source_location(path)
    file = File.read(path)
    @data_hash = JSON.parse(file)
  end
end