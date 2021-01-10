
def play_a_frame
  puts 'What is your first roll?'
  roll_one = gets.chomp
  
  puts 'What is your second roll?'
  roll_two = gets.chomp
  
  total_score = roll_one +  roll_two
  end
  
  def play_a_game
    frame = 1
    while frame < 11
      puts "Frame number: #{frame}"
      play_a_frame
      frame += 1
    end
  end
  
  play_a_game
  puts 'Game End'