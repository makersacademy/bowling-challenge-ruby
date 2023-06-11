require_relative 'frame'

class ScoreCard
  def update_pending_bonuses(frames, current_frame)
    update_pending_strikes(frames, current_frame)
    update_pending_spares(frames, current_frame)
  end
  
  def show_scorecard(frames)
    segments = []    
    9.times do |i|
      segments << scorecard_segment(frames[i + 1], i + 1)
    end
    
    segments << scorecard_segment_frame_10(frames[10])
    
    lines = []
    
    6.times do |i|
      elements = []
      10.times do |l|
        elements.push(segments[l][i])
      end
      lines << elements
    end
    
    6.times do |i|
      puts lines[i].join
    end
  end

  private

  def update_pending_strikes(frames, current_frame)
    previous_frame = current_frame - 1
    frame_before_last = current_frame - 2

    return if previous_frame == 0
    if (frames[current_frame].two_balls?) && (frames[previous_frame].strike?) && (frames[previous_frame].bonus_score == 0)
      frames[previous_frame].update_bonus_score(frames[current_frame].frame_score)
    end
    
    return if frame_before_last == 0
    if (frames[current_frame].strike?) && (frames[previous_frame].strike?) && (frames[frame_before_last].strike?) && (frames[frame_before_last].bonus_score == 0)
      frames[frame_before_last].update_bonus_score(20)
    end
    
    return if frame_before_last == 0
    if (frames[current_frame].get_ball_score(1) > 0) && (frames[previous_frame].strike?) && (frames[frame_before_last].strike?) && (frames[frame_before_last].bonus_score == 0)
      frames[frame_before_last].update_bonus_score(10 + frames[current_frame].frame_score)
    end
  end

  def update_pending_spares(frames, current_frame)
    previous_frame = current_frame - 1
    return if previous_frame == 0

    if (frames[previous_frame].spare?)
      frames[previous_frame].update_bonus_score(frames[current_frame].get_ball_score(1))
    end
  end
  
  def scorecard_segment(frame, frame_number)
    ball_1 = frame.get_ball_score(1)
    ball_1 = " " if ball_1 == 0
    ball_1 = "X" if ball_1 == 10
    ball_1 = ball_1.to_s.ljust(2, " ")
    
    ball_2 = frame.get_ball_score(2)
    ball_2 = " " if ball_2 == 0
    ball_2 = "/" if frame.spare?
    ball_2 = ball_2.to_s.ljust(2, " ")
    
    total = frame.total_frame_score
    total = "   " if total == 0
    total = total.to_s.ljust(3, " ")
    
    template = ["      #{frame_number}    ", '┌────┬────┐', '│ 1 │ 2 │', '│    └────┤', '│    TTT    │', '└─────────┘']
    template.map! {|s| s.gsub(/\│ 1 \│ 2 \│/, "│ #{ball_1} │ #{ball_2} │")}
    template.map! {|s| s.gsub(/\│    TTT    \│/, "│    #{total}  │")}
    return template
  end
  
  def scorecard_segment_frame_10(frame)
    ball_1 = frame.get_ball_score(1)
    ball_1 = " " if ball_1 == 0
    ball_1 = "X" if ball_1 == 10
    ball_1 = ball_1.to_s.ljust(2, " ")
    
    ball_2 = frame.get_ball_score(2)
    ball_2 = " " if ball_2 == 0
    ball_2 = "X" if ball_2 == 10
    ball_2 = ball_2.to_s.ljust(2, " ")
    
    ball_3 = frame.get_ball_score(3)
    ball_3 = " " if ball_3 == 0
    ball_3 = "/" if ball_3 == 10
    ball_3 = ball_3.to_s.ljust(2, " ")
    
    total = frame.total_frame_score
    total = "   " if total == 0
    total = total.to_s.ljust(3, " ")
    
    template = ["      10     ", "┌────┬────┬────┐", "│ 1 │ 2 │ 3 │", "│    └────┴────┤", "│   TTT   │", "└──────────────┘"]
    template.map! {|s| s.gsub(/\│ 1 \│ 2 \│ 3 \│/, "│ #{ball_1} │ #{ball_2} │ #{ball_3} │")}
    template.map! {|s| s.gsub(/\│   TTT   \│/, "│     #{total}      │")}
    return template
  end
end
