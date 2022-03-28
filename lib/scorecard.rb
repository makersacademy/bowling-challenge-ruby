class Scorecard
  attr_reader :total_score, :current_frame, :score_hash, :remaining_pins

  def initialize
    @total_score = 0
    @current_frame = 1
    @remaining_pins = 10
    @score_hash = {
      1 => [],
      2 => [],
      3 => [],
      4 => [],
      5 => [],
      6 => [],
      7 => [],
      8 => [],
      9 => [],
      10 => []
     }
     @roll_no = 0
  end

  def add_score(score)
    @score_hash[@current_frame].push(score)
    @roll_no += 1
    calculate_score
  end

  
  def calculate_score
    @score_hash.each do |frame, value|
      # describe situation where its a strike
      if @score_hash[frame].first == 10
        strike(frame)
      elsif 
        spare(frame)
      end
    end
  end

  def strike(frame)
    @total_score += @score_hash[frame][@roll_no - 1]
    @current_frame += 1
    @roll_no = 0
  end

  def spare(frame)
    #@total_score += @score_hash[frame][@roll_no - 1]
  end
end