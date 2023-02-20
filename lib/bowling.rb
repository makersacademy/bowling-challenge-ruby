class Bowling

def initialize
  @array = []
  @sum = 0
end

def score_card
  10.times do
    $mini_array = []
    puts "input the score of your first bowl"
    bowl1 = gets.chomp
    $mini_array << bowl1.to_i
    if bowl1.to_i == 10
      @array << [10,0]
    else
      puts "input the score of your second bowl"
      bowl2 = gets.chomp.to_i
      $mini_array << bowl2
      @array << $mini_array
    end
  end
  if @array[-1][0] == 10
    puts "input put the score of your bowl"
    bowl1 = gets.chomp
    puts "input put the score of your bowl"
    bowl2 = gets.chomp
    @array << [bowl1.to_i, bowl2.to_i]
  elsif @array[-1][0] + @array[-1][1] == 10
    puts "input put the score of your bowl"
    bowl1 = gets.chomp
    @array << [bowl1.to_i, 0]
  end
  p @array
  return score
end

def score
  @array.each_with_index do |el,i|
    if el[0].to_i == 10
      @sum += 10
      if @array[i+1][0] == 10
        @sum += @array[i+1][0] + @array[i+2][0]
      else
        @sum += @array[i+1][0] + @array[i+1][1]
      end
    elsif (el[0] + el[1]) == 10
      @sum += 10 + @array[i+1][0]
    else
      @sum += @array[i][0] + @array[i][1]
    end
    if i == 8
      if @array[9][0] == 10
        @sum += @array[9][0]
        break
      else
        @sum +=  @array[9][0] + @array[9][1]
        break
      end
    end
  end
  if @array[9][0] == 10
    @sum += (@array[10][0] + @array[10][1])
  elsif (@array[9][0] + @array[9][1]) == 10
    @sum += @array[10][0]
  end
  p @sum
  return @sum
end

end

game = Bowling.new
game.score_card
