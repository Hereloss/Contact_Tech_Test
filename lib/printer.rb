class Printer

  def format_output(people_in_location)
    formatted_people = (people_in_location.map {|person| person['name']}).join("\n")
    puts formatted_people
    formatted_people
  end

end