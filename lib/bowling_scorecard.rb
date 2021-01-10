class Scorecard

  attr_reader :pins_knocked, :frame_scores, :strikes_spares, :frame, :roll

  def initialize
    @pins_knocked = []
    @frame_scores = []
    @strikes_spares = {}
    @frame = 0
    @roll = 0
  end

  def keep_score
    while true do
      input_roll
      break if frame > 9
    end
    extra_rolls
    final_score
  end

  def input_roll
    message
    result = gets.chomp.to_i
    @pins_knocked << [] unless @pins_knocked[@frame]
    @pins_knocked[@frame] << result
    @roll += 1
    if frame_complete?
      calculate_frame
      new_frame
    end
  end

  def calculate_frame
    @frame_scores << @pins_knocked[@frame].sum
    strike_or_spare
    apply_bonus
  end

  def apply_bonus
    if @strikes_spares[@frame -1] == 'strike' && @strikes_spares[@frame -2] == 'strike'
      @frame_scores[@frame -1] += @pins_knocked[@frame].sum unless @frame >= 10
      @frame_scores[@frame -2] += @pins_knocked[@frame].sum unless @frame >= 11
    elsif @strikes_spares[@frame -1] == 'strike'
      @frame_scores[@frame -1] += @pins_knocked[@frame].sum unless @frame >= 10
    elsif @strikes_spares[@frame -1] == 'spare'
      @frame_scores[@frame -1] += @pins_knocked[@frame][0] unless @frame >= 10
    end
  end

  def strike_or_spare
    if @pins_knocked[@frame][0] == 10
      add_strike
    elsif @pins_knocked[@frame].sum == 10
      add_spare
    end
  end

  private

  def add_strike
    @strikes_spares[@frame] = 'strike'
  end

  def add_spare
    @strikes_spares[@frame] = 'spare'
  end

  def frame_complete?
    @roll > 1 || @pins_knocked[@frame].sum == 10
  end

  def new_frame
    @frame += 1
    @roll = 0 unless @frame > 9
  end

  def extra_rolls
    if @strikes_spares[9] == 'strike'
      2.times { input_roll }
    elsif @strikes_spares[9] == 'spare'
      input_roll
    end
  end

  def final_score
    puts "Congratulations - your final score was #{@frame_scores.sum}!"
  end

  def message
    if frame > 9
      puts "Please enter your roll result for frame 10, roll #{roll + 1}:"
    else
      puts "Please enter your roll result for frame #{@frame + 1}, roll #{roll + 1}:"
    end
  end

end