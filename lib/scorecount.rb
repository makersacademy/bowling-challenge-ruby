require_relative './frame'

class Scorecount
  def initialize(io)
    @io = io
    @points = 0
    @frames = []
    @bonus = []
  end

  def count_points
    @frames.flatten!.each_with_index do |score, index|
      if score == 'X'
        if (index == @frames.length - 1) || (index == @frames.length - 2) 
          @points += 10
        else
          @points += 10
          @bonus << @frames[index + 1]
          @bonus << @frames[index + 2]
        end
      elsif score == '/'
        @points += 10
        @points -= @frames[index - 1] 
        puts index - 1
        puts @frames[index - 1]
        @bonus << @frames[index + 1]
      else
        @points += score
      end
    end
  end

  def calculate_bonus
    #@bonus.each do |frame| 
      @bonus.each do |score|
        if score == 'X'
          score = 10 
        end
        @points += score
      end
    #end
    
  end

  def run
    n = 1
    9.times do
      puts "Frame #{n}"
      frame = Frame.new(@io).run
      @frames << frame
      n += 1
    end
    @frames << Frame.new(@io).tenth
    print @frames
    count_points
    calculate_bonus
    p @points
    return @points
  end

end

Scorecount.new(Kernel).run