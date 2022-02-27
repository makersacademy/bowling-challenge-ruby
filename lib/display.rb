class Display
  def initialize
    @line_1 = '| 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 |  10 |'
    @line_2 = ['|    |', '    |', '    |', '    |', '    |', '    |', '    |', '    |', '    |', '     |']
    @line_3 = ['|    ', '|    ', '|    ', '|    ', '|    ', '|    ', '|    ', '|    ', '|    ', '|     |']
  end

  def update_pins(frame_number:, pins:)
    if pins.length < 3
      if pins[0] == 10
        @line_2[frame_number - 1][1] = 'X'
      elsif pins.sum == 10
        @line_2[frame_number - 1][1] = pins[0].to_s
        @line_2[frame_number - 1][2] = '/'
      else
        @line_2[frame_number - 1][1] = pins[0].to_s
        @line_2[frame_number - 1][2] = pins[1].to_s
      end
    else
      if pins[0] == 10 && pins[1] != 10
        @line_2[frame_number - 1][1] = 'X'
        @line_2[frame_number - 1][2] = pins[1].to_s
      elsif pins[0] == 10 && pins[1] == 10
        @line_2[frame_number - 1][1] = 'X'
        @line_2[frame_number - 1][2] = 'X'
      elsif pins[0] + pins[1] == 10
        @line_2[frame_number - 1][1] = pins[0].to_s
        @line_2[frame_number - 1][2] = '/'
      end

      @line_2[frame_number - 1][3] = if pins[2] == 10
                                       'X'
                                     else
                                       pins[2].to_s
                                     end
    end
  end

  def update_score(frame_number:, score:)
    @line_3[frame_number - 1] = '|%03d ' % score
  end

  def show
    puts @line_1
    puts @line_2.join
    puts @line_3.join
  end
end
