def score
    @rolls = [5,5,6]
    @bonus = []
     @rolls.each_with_index{ |roll,index|
      # p roll
      # p index
       if index.odd?
         if roll + @rolls[index-1] == 10
          @bonus << @rolls[index+1]
         end
       end
     }
     @rolls.sum + @bonus.sum
end

   p score