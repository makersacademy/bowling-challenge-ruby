class Players

  attr_reader :names

  def initialize
    @names = {}
  end

  def input_number
    puts 'How many players are there?'
    number = gets.to_i
    # add the number of players to the player hash
    # TBC - at the moment default is 1 player as scorecard only allows 1 player.
    (1..number).each { |key| @names[key] = '' }
    puts "You have chosen #{@names.count} player/s"
  end

  def input_names
    @names.each do |key, value|
      puts "Please enter player #{key}'s name."
      name = gets.chomp
      @names[key] = name
    end
  end

  def list
    @names.each do |key, value|
      puts "Player #{key}: #{value}"
    end
  end
end
