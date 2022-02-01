require 'json'

class LocationFilter

  def see_data
    file = File.read('./example_data.json')
    data_hash = JSON.parse(file)
  end
end