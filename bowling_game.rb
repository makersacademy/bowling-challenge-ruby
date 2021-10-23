require './lib/bowling'

def bowlinggame(bowling = Bowling.new)
  @bowling = bowling
  @turn = 1
  @frame = 1
  puts "Welcome! Let's begin."
  loop do
    puts "Frame #{@frame}, turn #{@turn}. Please enter your roll:"
    roll_one = gets.chomp.to_i
    @bowling.roll(roll_one)
    if roll_one == 10
      puts "Strike!"
    else
      @turn += 1
      puts "Frame #{@frame}, turn #{@turn}. Please enter your roll:"
      roll_two = gets.chomp.to_i
      @bowling.roll(roll_two)
      if roll_two + roll_one == 10
        puts "Spare!"
      else
        puts "Unlucky! Maybe next round!"
      end
    end
    @frame += 1
    @turn = 1
    break if @frame == 10
  end
  puts "Final frame! Give it your all!"
  puts "Turn #{@turn}. Please enter your roll:"
  turn_one = gets.chomp.to_i
  @bowling.roll(turn_one)
  if turn_one < 10
    puts "Go for the spare!"
    puts "Please enter your roll:"
    turn_two = gets.chomp.to_i
    @bowling.roll(turn_two)
  else
    puts "Strike! Go again!"
    puts "Please enter your roll:"
    turn_two = gets.chomp.to_i
    @bowling.roll(turn_two)
    puts "Last shot! Make it count!"
    puts "Please enter your roll:"
    turn_three = gets.chomp.to_i
    @bowling.roll(turn_three)
  end
  puts "GGWP!"
  puts "Final score: #{@bowling.score}"
  return "Thanks for playing!"
end
