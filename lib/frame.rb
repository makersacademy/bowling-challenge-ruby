class Frame
  def initialize(num, io = kernel)
    @io = io
    @frame_num = num
    @rolls = 2
    @final_roll = ''
    @frame = []
  end

  def final_roll(amount)
    case @final_roll
    when 'strike'
      @frame << amount
      @rolls -= 1
    when 'split'
      @frame << amount
      @rolls -= 1
    end
  end

  def get_input
    if @rolls > 0
      @io.puts "Please input your roll:"
      amount = @io.gets.chomp
      amount.to_i
    end
  end

  def roll
    amount = get_input
    # past frame 10 logic
    if @final_roll.match?(/^(split|strike)$/) && @rolls > 0
      final_roll(amount)
      # recursive call
      roll
    end
    # frame 10 logic
    if @frame_num == 10 && @rolls > 0
      if amount == 10
        @final_roll = 'strike'
        @frame << amount
        # recursive call
        roll
      elsif !@frame.last.nil? && (amount + @frame.last) == 10
        @final_roll = 'split'
        @frame << amount
        # recursive call
        roll
      else
        @frame << amount
        @rolls -= 1
        # recursive call
        roll
      end
    # all other frames
    elsif @frame_num < 10 && @rolls > 0
      if amount == 10
        @frame << amount
        @rolls = 0
      else
        @frame << amount
        @rolls -= 1
        # recursive call
        roll
      end
    end
    return @frame
  end

end