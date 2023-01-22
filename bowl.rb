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
        else
          balls(frame)
        end
      elsif index == frames.length - 1
        if strike?(frame)
          if frame[1] == 10
            balls(frame) + frame[2]
          elsif spare?(frame)
            balls(frame) + frame[2]
          end
        else balls(frame)
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

  def balls(frame)
    frame[0] + frame[1]
  end

  def draw_frame(frame)
    if(frame.empty?) 
      return " , |"
    else 
      return "#{frame[0]},#{frame[1]}|"
    end
  end

end