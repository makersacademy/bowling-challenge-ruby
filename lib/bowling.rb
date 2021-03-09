require_relative './frame'

class Bowling

  # attr_reader :frame_number, :scores

  def play(frame_class = Frame)
    current_frame = frame_class.new.get_rolls
    score(current_frame)
  end

  def score(current_frame)

  end
#   def initialize
#     @frames = []
#     @frame_number = 1
#   end
#
#   def start
#     while @frame_number < 10 #while loop needed eventually
#       frame = get_frame
#       if frame == strike
#         Strike.new(@frame_number)
#       elsif
#       calculate(@frames)
#       @frame_number += 1 #think about where to do this
#     end
#   end
#
#   def get_frame
#     puts "Frame #{@frame_number}, Roll 1:"
#     roll1 = gets.chomp
#     puts "Frame #{@frame_number}, Roll 2:"
#     roll2 = gets.chomp
#     frame = [roll1, roll2]
#   end
#
#   def direct(scores)
#     if scores.sum < 10
#       less_than_10(scores)
#     elsif scores[0] != 10
#       spare(scores)
#     else
#       strike(scores)
#     end
#   end
#
#   def less_than_10(scores)
#     score_card << [scores[0], scores[1], scores.sum]
#   end
#
#   def spare(scores)
#     score_card << [scores[0], scores[1], 'pending']
#     request_roll_following_spare
#   end
#
#   def strike(scores)
#     score_card << [scores[0], scores[1], 'pending']
#   end
#
end
