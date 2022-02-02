# This class formats and outputs the found people as a string, one per line
class Printer
  def self.print_formatted_output(people_in_location)
    formatted_people = formatted_people_in_location(people_in_location)
    puts formatted_people
    formatted_people
  end

  def self.formatted_people_in_location(people_in_location)
    (people_in_location.map { |person| person['name'] }).join("\n")
  end
end
