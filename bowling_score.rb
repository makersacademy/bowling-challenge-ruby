class Scorecard
  def initialize(io)
    @io = io
    @score = []
    @card = []
    @total = 0
    @frame_count = 1
  end

  def play
    until @frame_count == 11
        puts "frame: #{@frame_count}"
        if @frame_count < 10
            @frame = []
            puts "how many pins?"
            answer = gets.chomp.to_i
            @frame << answer if answer >= 0 && answer <= 10
            if @frame.sum == 10
                puts "strike!"
                @frame == [10, 0]
                @score << @frame
                @card << 2
            else
                puts "how many pins?"
                answer = gets.chomp.to_i
                @frame << answer if answer + @frame[0] <= 10
                puts "spare!" if @frame.sum == 10 && @frame[1] >= 1
                @card << 1 if @frame.sum == 10 && @frame[1] >= 1
            end
            @score << @frame
        else
            @frame = []
            puts "how many pins?"
            answer = gets.chomp.to_i
            @frame << answer if answer >= 0 && answer <= 10
            #if @frame.sum == 10
             # @card << 2
              #puts "strike!" 
            puts "how many pins?"
            answer = gets.chomp.to_i
            @frame << answer if answer >= 0 && answer <= 10
            puts "strike!" if @frame.sum == 20
            puts "spare!" if @frame.sum == 10
            if 
            puts "how many pins?"
            answer = gets.chomp.to_i
            @frame << answer if answer >= 0 && answer <= 10
            puts "strike!" if @frame.sum == 30
            puts "spare!" if @frame.sum == 10
        end
        @frame_count += 1
        @score
    end
  end

  def scores
    @total
  end

  def bonuses
    @score.each do |frame|
    end
  end



end

bowl = Scorecard.new(@io)
bowl.play