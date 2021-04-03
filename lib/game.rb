class Game 

  attr_reader :total, :frames, :frames_total, :state, :frame_counter

  def initialize
    @total = 0
    @frames = []
    @frames_total = []
    @state = []
    @frame_counter = 0
  end

  def frame(bowl1, bowl2 = 0)
    if bowl1 == 10
      @state << 'strike'
    elsif bowl1 + bowl2 == 10
      @state << 'spare'
    else
      @state << 'open frame'
    end
    @frames << [bowl1, bowl2]
    frame_ends
  end

  def tenth_frame_extra(bowl1, bowl2 = 0)
    if @state.last == 'spare' && @frame_counter == 10; frame(bowl1, bowl2); end
    if @state.last == 'strike' && @frame_counter == 11; frame(bowl1); end
    if @state.last == 'strike' && @frame_counter == 10; frame(bowl1); end
  end

  def frame_ends
    case state.last
    when 'strike'
      strike
    when 'spare'
      spare
    when 'open frame'
      @frame_counter >= 10 ? tenth_open_frame : open_frame
    end
    @frame_counter += 1
    total_update
  end

  def strike
    case prev_condition
    when 'x2_strike'
      @frames_total.push(30)
    when 'spare'
      @frames_total.push(20)
    end
  end

  def spare
    case prev_condition
    when 'x2_strike'
      @frames_total.push(20 + current_frame(0), 20)
    when 'x1_strike'
      @frames_total.push(20)
    when 'spare'
      @frames_total.push(10 + current_frame(0))
    end
  end

  def open_frame
    case prev_condition
    when 'x2_strike'
      @frames_total.push(20 + current_frame(0), 10 + current_open_frame, current_open_frame)
    when 'x1_strike'
      @frames_total.push(10 + current_open_frame, current_open_frame)
    when 'spare'
      @frames_total.push(10 + current_frame(0), current_open_frame)
    else
      open_frame_score
    end
  end

  def tenth_open_frame
    case prev_condition
    when 'x2_strike'
      @frames_total.push(20 + current_frame(0))
    when 'spare'
      @frames_total.push(10 + current_frame(0))
    end
  end

  def prev_condition
    if @state[@frame_counter - 1] == 'strike' && @state[@frame_counter - 2] == 'strike'
      return 'x2_strike' unless @frame_counter <= 1

      return 'x1_strike'; end
    if @state[@frame_counter - 1] == 'strike'
      return 'x1_strike'; end
    if @state[@frame_counter - 1] == 'spare'
      return 'spare'; end
  end

  def current_frame(bowl)
    @frames[@frame_counter][bowl]
  end

  def current_open_frame
    current_frame(0) + current_frame(1)
  end

  def total_update
    @total = 0
    @frames_total.each { |frame| @total += frame }
  end

  def open_frame_score
    @frames_total << current_open_frame
  end
end
