require 'json_duplikey_stopper'

# This class loads the data from a data source. This data source can be changed with amend_source_location
class DataSourcer
  attr_reader :data_hash

  def initialize
    file = File.read('./example_data.json')
    @data_hash = JSON.parse(file, { object_class: JsonDuplikeyStopper })
  end

  def amend_source_location(path)
    file = File.read(path)
    @data_hash = JSON.parse(file, { object_class: JsonDuplikeyStopper })
  rescue StandardError
    raise 'Error - JSON data is malformed or location does not contain JSON file'
  end
end
