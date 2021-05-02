class ScoreRecorder
  def current_frame(frames)
    frame_no = frames.length
    if frames == [] || frames[0].length == 2
      frame_no + 1
    else
      frame_no
    end
  end
end
