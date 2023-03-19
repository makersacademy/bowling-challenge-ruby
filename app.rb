class Application
  def ask_for_input
    puts "Please enter a score: "
    input = gets.chomp
    if input =~ /^([1-9]|10)/
      return input.to_i
    else
      raise ArgumentError, "Invalid input: #{input}"
    end
  end
end