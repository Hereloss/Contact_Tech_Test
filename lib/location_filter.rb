# frozen_string_literal: true

require 'json'
require_relative 'printer'
require_relative 'data_sourcer'

# This class searches for people by location
class LocationFilter
  def initialize(printer = Printer.new, data_sourcer = DataSourcer.new)
    @data_sourcer = data_sourcer
    @printer = printer
    @data_hash = @data_sourcer.data_hash
  end

  def find_people(location)
    people_in_location = @data_hash.select { |data| data['location'].downcase == location.downcase }
    @printer.format_output(people_in_location)
  end

  def amend_source_location(path)
    @data_hash = @data_sourcer.amend_source_location(path)
  end
end
