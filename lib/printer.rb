# frozen_string_literal: true

# This class formats and outputs the found people as a string, one per line
class Printer
  def format_output(people_in_location)
    formatted_people = (people_in_location.map { |person| person['name'] }).join("\n")
    puts formatted_people
    formatted_people
  end
end
