class Application
  def initialize(scorecard, round)
    @scorecard = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @round = 1 
  end

  def play_1
    while @round <= 10 do
    if @round == 10 
      puts "Thanks for playing. Your total score is #{@scorecard.sum}"
    end
    puts "Please enter the score from your first roll from @round #{@round}"  
    @roll_1 = gets.chomp.to_i
      if @roll_1 < 10
        @scorecard << @roll_1
        play_2
      else 
        @scorecard << @roll_1
        @scorecard << 0
        @round += 1
        x = @scorecard.each_index.select { |ind| @scorecard[ind] == 10 }
        x.each { |index| @scorecard.insert(index, @scorecard[index+1] + @scorecard[index+2])}
      end
    end
  end
          
  def play_2
    puts "Please enter the score from your second roll from @round #{@round}"  
    @roll_2 = gets.chomp.to_i
    @round += 1 
    if @roll_1 + @roll_2 == 10
      @scorecard << @roll_2
      spare
      puts "Tally so far is #{@scorecard}"  
    end
    play_1
  end

  # def spare
  #   a = @scorecard.count(10)
  #   @scorecard.delete(10)
  #   @scorecard.each_slice(2).to_a
  #   @scorecard.each { |spare| if spare.sum == 10
  #           @scorecard.insert(0, spare+1].sum)
  #           end
  #         }
  #   @scorecard.insert(0, a * 10) 
  # end
end
       
app = Application.new(@scorecard, @round)
app.play_1
