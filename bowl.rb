class Bowl
  def initialize(io)
    @io = io
  end

 " ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐
│ 1 │ 4 │ 4 │ 5 │ 6 │ / │ 5 │ / │   │ * │ 0 │ 1 │ 7 │ / │ 6 │ / │   │ * │ 2 │ / │ 6 │
│   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┴───┤
│   5   │   14  │  29   │  49   │  60   │   61  │   77  │   97  │  117  │    133    │
└───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────────┘"

  def score(frames)
    frames.map.with_index do |frame, index|
      calculate_frame_score(index, frames, frame)
    end.sum
  end

  def calculate_frame_score(index, frames, frame)
    if (regular_frame?(index, frames))
      score_regular_frame(index, frames, frame)
    else
      score_tenth_frame(index, frames, frame)
    end
  end

  def score_regular_frame(index, frames, frame)
    if strike?(frame)
      if frames.fetch(index + 1)[1].nil?
        frame[0] + frames.fetch(index + 1)[0] + frames.fetch(index + 2)[0]        
      else
        frame[0] + frames.fetch(index + 1)[0] + frames.fetch(index + 1)[1]
      end
    elsif spare?(frame)
      two_bowls(frame) + frames.fetch(index+1)[0]
    else
      two_bowls(frame)
    end
  end

  def score_tenth_frame(index, frames, frame)
    if strike?(frame)
      balls_tenth_frame?(frame)
    elsif spare?(frame)
      frame[0] + frame[1] + frame[2]
    else
       two_bowls(frame)
    end
  end

  def spare?(frame)
    frame[0] + frame[1] == 10 
  end

  def strike?(frame)
    frame[0] == 10
  end

  def open_frame?(frame)
    (frame[0] + frame[1]) < 10
  end

  def balls_tenth_frame?(frame)
    two_bowls(frame) + frame[2]
  end

  def two_bowls(frame)
    frame[0] + frame[1]
  end

  def last_possible_throw(frame)
    frame[2].nil? == false
  end

  def regular_frame?(index, frames)
    index <= frames.length - 2
  end

  def draw_frame(frame)
    if last_possible_throw(frame)
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

  def draw_frames(frames)
    frames.map do |frame|
      draw_frame(frame)
    end.join("")
  end

  def draw_board(frames)
    @io.puts "#{draw_frames(frames)} : #{score(frames)}"
  end
  def run
    puts score([[2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8,10]])
  end
  if __FILE__ == $0
    app = Bowl.new(Kernel)
    app.run
  end
end