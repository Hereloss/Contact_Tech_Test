# frozen_string_literal: true

require 'json'
require_relative 'printer'

# This class loads the data, and then searches by location. The data source can also be amended with
# The amend_source_location method
class LocationFilter
  attr_reader :data_hash

  def initialize(printer = Printer.new)
    file = File.read('./example_data.json')
    @data_hash = JSON.parse(file)
    @printer = printer
  end

  def find_people(location)
    people_in_location = @data_hash.select { |data| data['location'].downcase == location.downcase }
    @printer.format_output(people_in_location)
  end

  def amend_source_location(path)
    file = File.read(path)
    @data_hash = JSON.parse(file)
  end
end
