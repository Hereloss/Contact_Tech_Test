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
    people_in_location = []
    @data_hash.each do |data|
      if data["location"].downcase == location.downcase
        people_in_location << data["name"]
      end
    end
    @printer.format_output(people_in_location)
  end

  def amend_source_location(path)
    file = File.read(path)
    @data_hash = JSON.parse(file)
  end
end