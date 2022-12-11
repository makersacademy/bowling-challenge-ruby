class Application

  def initialize(io)
    @io = io
  end

  def run
    first_bowl_score = 0
    second_bowl_score = 0
    total_score = 0
    bonus = "none"

    # 1st frame
    @io.puts "How many pins were knocked down by the first bowl?"
    first_bowl_score = @io.gets.chomp.to_i
    if first_bowl_score == 10
      total_score = 10
      bonus = "strike"
      @io.puts "Strike!"
    end

    if first_bowl_score != 10
      @io.puts "How many pins were knocked down by the second bowl?"
      second_bowl_score = @io.gets.chomp.to_i
      if (first_bowl_score + second_bowl_score) == 10
        total_score = 10
        bonus = "spare"
        @io.puts "Spare!"
      else
        total_score = first_bowl_score + second_bowl_score
      end
    end

    @io.puts "Total score at the end of this frame: #{total_score}"


    # 2nd to 9th frame


    # 10th frame

    
  end
end