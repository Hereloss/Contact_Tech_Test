require 'json'
require_relative 'printer.rb'

class LocationFilter

  attr_reader :data_hash

  def initialize(printer = Printer.new)
    file = File.read('./example_data.json')
    @data_hash = JSON.parse(file)
    @printer = printer
  end

  def find_people(location)
    people_in_location = @data_hash.select { |data| data["location"].downcase == location.downcase }
    p people_in_location
    @printer.format_output(people_in_location)
  end

  def amend_source_location(path)
    file = File.read(path)
    @data_hash = JSON.parse(file)
  end
end