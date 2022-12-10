class Scorecard

  def run

    @frames = []

    while @frames.length < 10 do
      puts "Please enter the results from your frame"
      puts "Score 1:"
      total = gets.chomp.to_i
      if total != 10
        puts "Score 2:"
        input_2 = gets.chomp.to_i
        total += input_2
      end

      frame = Hash.new
      frame[:score] = total

      @frames.push frame
    end

  end


  def grand_total

    total = 0

    @frames.each do |frame|
      total += frame[:score]
    end

    return total
  end

end


#test = Scorecard.new
#test.run
