class Bowl
 " ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐
│ 1 │ 4 │ 4 │ 5 │ 6 │ / │ 5 │ / │   │ * │ 0 │ 1 │ 7 │ / │ 6 │ / │   │ * │ 2 │ / │ 6 │
│   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┴───┤
│   5   │   14  │  29   │  49   │  60   │   61  │   77  │   97  │  117  │    133    │
└───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────────┘"

  def score(frames)
    frames.map.with_index do |frame, index|
      if (index <= frames.length - 2) && spare?(frame)
       balls(frame) + frames.fetch(index+1)[0]
      else
      balls(frame)
      end
    end.sum
  end

  def spare?(frame)
    frame[0] + frame[1] == 10 
  end

  def balls(frame)
    frame[0] + frame[1]
  end

end