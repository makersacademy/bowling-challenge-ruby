
class ScoreCard
  attr_reader :frames, :running_score, :frame_score, :scores

  def initialize
    @frames = 1
    @running_score = []
    @frame_score = []
    @scores = []
    @cumul_scores = []
  end

  def run
    while @frames < 10 do
      roll_1_input
      if strike?
        @frames += 1
        clear_frame
      else
        roll_2_input
        @frames += 1
        clear_frame
      end
    end
  roll_1_input
  if strike?
    roll_2_input
    bonus_roll_input
  else
    roll_2_input
  end
  if spare?
    bonus_roll_input
  end
  final_calc
  puts "Your final score after 10 frames is #{@running_score.sum}"
  cumul_calc
  puts "Your cumulative score over the 10 frames is #{@cumul_scores}"
  end

  def roll_1_input
    puts "Please enter roll 1 score"
    roll_1 = gets.chomp.to_i
    @scores << roll_1
    @frame_score << roll_1
  end

  def roll_2_input
    puts "Please enter roll 2 score"
    roll_2 = gets.chomp.to_i
    @scores << roll_2
    @frame_score << roll_2
  end

  def bonus_roll_input
    puts "Please enter roll 3 score"
    bonus_roll = gets.chomp.to_i
    @scores << bonus_roll
    @frame_score << bonus_roll
  end

  def strike?
    @frame_score[0] == 10
  end

  def spare?
    (@frame_score[0] + @frame_score[1]) == 10
  end

  def clear_frame
    @frame_score.clear
  end

  def final_calc
    i = 0
    while i < @scores.size-3
      if @scores[i] == 10
        @running_score << (@scores[i..(i+2)].inject(:+))
        i += 1
      elsif (@scores[i] + @scores[i+1]) == 10
        @running_score << (@scores[i..(i+2)].inject(:+))
        i += 2
      else
        @running_score << (@scores[i..(i+1)].inject(:+))
        i += 2
      end
    end
    final_frame_calc
  end

  def cumul_calc
    @cumul_scores = @running_score.inject([]) { |acc, value| acc << acc.last.to_i + value.to_i }
  end

  def final_frame_calc
    if @frame_score.sum > 10
      @running_score << (@scores[-3..-1].inject(:+))
    else
      @running_score << (@scores[-2..-1].inject(:+))
    end
  end

end
