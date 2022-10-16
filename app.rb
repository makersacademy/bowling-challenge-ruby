class Application
  def initialize(score)
    @scorecard = []
  end
  
  def play
    round = 1 
    10.times do
      puts "Please enter the score from your first roll from round #{round}"  
      @roll_1 = gets.chomp.to_i
        if @roll_1 < 10
          @scorecard << @roll_1
      puts "Please enter the score from your second roll from round #{round}"  
      @roll_2 = gets.chomp.to_i
        @scorecard << @roll_2
        round += 1 

        puts "Total so far is #{@scorecard}"

        elsif @roll_1 == 10
          @scorecard << @roll_1        
          round += 1 
        end
    end

    x = @scorecard.each_index.select { |ind| @scorecard[ind] == 10 }
    x.each { |ind| @scorecard.insert(ind, @scorecard[ind+1] + @scorecard[ind+2])}

   
    puts @scorecard.sum
  end 
end



       
app = Application.new(@score)
app.play
