class Application
  def initialize(scorecard, round)
    @scorecard = []
    @round = 1 
  end

  def first_throw
    while @round <= 11 do
    if @round == 11
      strike_calculator
      puts "Thanks for playing. Your total score is #{@scorecard.sum}"
      break
    end
    
    puts "Please enter the score from your first roll from @round #{@round}"  
    @roll_1 = gets.chomp.to_i
      if @roll_1 < 10
        @scorecard << @roll_1
        second_throw
      else
        @scorecard << @roll_1        
        @round += 1 
      end
    end
  end

  def strike_calculator
    x = @scorecard.each_index.select { |ind| @scorecard[ind] == 10 }
    x.each { |ind| @scorecard.insert(ind, @scorecard[ind+1] + @scorecard[ind+2])}
  end
          
  def second_throw
    puts "Please enter the score from your second roll from @round #{@round}"  
    @roll_2 = gets.chomp.to_i
    @round += 1 
    if @roll_1 + @roll_2 == 10
      @scorecard << @roll_2
      spare
      puts "Tally so far is #{@scorecard}"  
    end
    first_throw
  end

  def spare
    a = @scorecard.count(10)
    @scorecard.delete(10)
    @scorecard.each_slice(2).to_a
    @scorecard.each { |spare| if spare == 10 || spare.sum == 10
            @scorecard.insert(0, [spare+1].sum)
            end
          }
    @scorecard.insert(0, a * 10) 
  end
end
       
app = Application.new(@scorecard, @round)
app.first_throw