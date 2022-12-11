class Scorecard
  def initialize(io)
    @io = io
    @frames = []
  end

  def run
    while @frames.length < 10 do
      frame = Hash.new

      puts "Please enter the results from your frame"
      puts "Score 1:"
      point_1 = @io.gets.chomp.to_i
      point_2 = 0

      if point_1 == 10
        frame[:status] = 'strike'
      else
        puts "Score 2:"
        point_2 += @io.gets.chomp.to_i
        if point_1 + point_2 == 10
          frame[:status] = 'spare'
        end
      end

      frame[:score] = point_1 + point_2
      fail "Error. Please try again" if frame[:score] > 10
      @frames.push frame
      bonus(point_1, point_2)
    end

    # If the player rolls a strike or spare in the 10th frame they can roll the additional balls
    # for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional
    #rolls only count for the bonus not for the regular frame count
    tenth_frame = @frames[9]
    if tenth_frame[:status] == 'strike'
      @io.puts "Bonus round! Enter your score:"
      point_3 = @io.gets.chomp.to_i
      fail "Error. Please try again" if point_3 > 10
      tenth_frame[:score] += point_3
      if @frames[8][:status] == 'strike'
        @frames[8][:score] += point_3
      end
      if point_3 == 10
        @io.puts "Wow, extra bonus! Enter your score:"
        point_4 = @io.gets.chomp.to_i
        fail "Error. Please try again" if point_4 > 10
        tenth_frame[:score] += point_4
      end

    elsif tenth_frame[:status] == 'spare'
      @io.puts "Bonus round! Enter your score:"
      point_3 = @io.gets.chomp.to_i
      fail "Error. Please try again" if point_3 > 10
      tenth_frame[:score] += point_3
    end

    grand_total
  end


  def grand_total
    total = 0
    @frames.each do |frame|
      total += frame[:score]
    end
    return total
  end


  def bonus(point_1, point_2)
    # finding the index of the current and any previous frames (x = current frame).
    x = @frames.length - 1
    y = x - 1
    z = y - 1

    # if y exists, we have at least 2 frames. The bonus for y is the number of pins knocked down
    # by the next two rolls (x) - unless the player rolls another strike.
    if y >= 0
      y_frame = @frames[y]
      if y_frame[:status] == 'strike'
        y_frame[:score] += (point_1 + point_2)
      elsif y_frame[:status] == 'spare'
        y_frame[:score] += point_1
      end
      
      # if z exists, we have at least 3 frames. This only becomes relevant if y and z are strikes
      # as we need the points from x to add as a bonus 
      if y_frame[:status] == 'strike' && z >= 0
        z_frame = @frames[z]
        if z_frame[:status] == 'strike'
          z_frame[:score] += point_1
        end
      end
    end
  end
end

