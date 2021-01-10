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
    puts "Please enter your roll result for frame #{@frame + 1}, roll #{roll + 1}:"
    result = gets.chomp.to_i
    p "Pins: #{result}"
    @pins_knocked << [] unless @pins_knocked[@frame]
    @pins_knocked[@frame] << result
    @roll += 1
    p "Roll: #{@roll}"
    if frame_complete?
      calculate_frame
      new_frame
      p "Frame: #{@frame}"
    end
  end

  def calculate_frame
    @frame_scores << @pins_knocked[@frame].sum
    strike_or_spare
    p @frame_scores
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

  def add_strike
    @strikes_spares[@frame] = 'strike'
  end

  def add_spare
    @strikes_spares[@frame] = 'spare'
  end

  private

  def frame_complete?
    @roll > 1 || @pins_knocked[@frame].sum == 10
  end

  def new_frame
    @frame += 1
    @roll = 0
  end

  def extra_rolls
    p "Strikes/spares: #{@strikes_spares}"
    if @strikes_spares[9] == 'strike'
      p "I'm in strike!"
      2.times { input_roll }
    elsif @strikes_spares[9] == 'spare'
      p "I'm in spare!"
      input_roll
    end
  end

  def final_score
    puts "Congratulations - your final score was #{@frame_scores.sum}!"
  end

end