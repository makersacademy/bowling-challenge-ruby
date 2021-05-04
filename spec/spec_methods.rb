def eight_frames
  no_of_frames(8)
end

def nine_frames
  no_of_frames(9)
end

def no_of_frames(number)
  frames = []
  number.times { frames << [0, 0] }
  frames
end
