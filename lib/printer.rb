class Printer

  def format_output(people_in_location)
    output = ''
    people_in_location.each do |person|
      output += person + "\n"
    end
    puts output
    output
  end

end