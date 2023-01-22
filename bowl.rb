class Bowl
 " ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐
│ 1 │ 4 │ 4 │ 5 │ 6 │ / │ 5 │ / │   │ * │ 0 │ 1 │ 7 │ / │ 6 │ / │   │ * │ 2 │ / │ 6 │
│   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┴───┤
│   5   │   14  │  29   │  49   │  60   │   61  │   77  │   97  │  117  │    133    │
└───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────────┘"

  def score(frames)
    frames.map.with_index do |frame, index|
      if (index <= frames.length - 2)
        if strike?(frame)
          if frames.fetch(index + 1)[1].nil? 
            frame[0] + frames.fetch(index + 1)[0] + frames.fetch(index + 2)[0]        
          else
            frame[0] + frames.fetch(index + 1)[0] + frames.fetch(index + 1)[1]
          end
        elsif spare?(frame)
          balls(frame) + frames.fetch(index+1)[0]
        elsif open_frame?(frame)
          balls(frame)
        end
      elsif index == frames.length - 1
        if strike?(frame)
          if frame[1] == 10
            balls_last_frame?(frame)
          elsif spare?(frame)
            balls_last_frame?(frame)
          end
        elsif open_frame?(frame)
           balls(frame)
        end
      end
    end.sum
  end

  def spare?(frame)
    frame[0] + frame[1] == 10 
  end

  def strike?(frame)
    frame[0] == 10
  end

  def open_frame?(frame)
    frame[0] + frame[1] < 10
  end

  def balls_last_frame?(frame)
    balls(frame) + frame[2]
  end

  def balls(frame)
    frame[0] + frame[1]
  end

  def last_frame(frame)
    frame[2].nil? == false
  end

  def draw_frame(frame)
    if last_frame(frame)
      if strike?(frame)
        if frame[1] == 10 && frame[2] != 10
          return " X, X, #{frame[2]}|"
        elsif frame[1] == 10 && frame[2] == 10
          return " X, X, X|"
        else
          return " X, #{frame[1]} , #{frame[2]}"
        end
      elsif spare?(frame) && frame[2] != 10
        return " #{frame[0]}, / , #{frame[2]}|"
      elsif spare?(frame) && frame[2] == 10
        return " #{frame[0]}, / , X|"
      elsif open_frame?(frame)
        return " #{frame[0]} , #{frame[1]} |"
      end
    elsif(frame.empty?) 
      return " , |"
    elsif strike?(frame)
      return " X |"
    elsif spare?(frame)
      return " #{frame[0]}, / |"
    elsif open_frame?(frame)
      return " #{frame[0]} , #{frame[1]} |"
    end
end

  def draw_board(frames)
    frames.map do |frame|
      draw_frame(frame)
  end.join("")
end
end