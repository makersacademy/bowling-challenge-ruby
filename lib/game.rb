# frozen_string_literal: true

require_relative 'frame'

class Game
  attr_reader :score, :scorecard

  def initialize(frame1 = Frame.new, frame2 = Frame.new,
                 frame3 = Frame.new, frame4 = Frame.new,
                 frame5 = Frame.new, frame6 = Frame.new,
                 frame7 = Frame.new, frame8 = Frame.new,
                 frame9 = Frame.new, frame10 = Frame.new)
    @score = 0
    @scorecard = { frame1: frame1, frame2: frame2,
                   frame3: frame3, frame4: frame4,
                   frame5: frame5, frame6: frame6,
                   frame7: frame7, frame8: frame8,
                   frame9: frame9, frame10: frame10 }
  end

  # this method accepts an integer input from the user.
  # it checks what the current frame is
  # it updates the framescore for that frame appropriately
  def input_score(score)
    @userscore = score
    raise 'Please input a valid score' if score > 10 || score.negative?

    update = @scorecard[frame?]
    if update.framescore[:roll_1].nil?
      if score == 10
        update.framescore[:roll_2] = '-'
        update.framescore[:roll_1] = 'X'
      else
        update.framescore[:roll_1] = score
      end
    elsif (update.framescore[:roll_1] + score) > 10
      raise 'Please input a valid score'
    elsif (update.framescore[:roll_1] + score) == 10
      update.framescore[:roll_2] = '/'
    else
      update.framescore[:roll_2] = score
    end
    spare_bonus(score)
  end

  # this method will search for a frame with '/' where [:bonus] == 0
  # this relies on the frames having numberical order to their keys in @scorecards
  def spare_bonus(score)
    bonus_frame = []
    @scorecard.each do |_key, value|
      bonus_frame << value if value.framescore[:roll_2] == '/' && value.framescore[:bonus].nil?
    end
    if bonus_frame.empty? != true
      # no need to sort the array, as frames already have numerical ordering
      bonus_frame[0].framescore[:bonus] = score
    end
    # this returns the Frame class instance
  end
  # --------------------------------------
  # def strike_bonus
  #   bonus_frame
  # end
  # --------------------------------------

  # this method returns the 'key' value from the @scorecards hash for the current frame
  # it finds the frame by looking for the first frame that doesn't have a complete framescore
  # it relies on STRIKE being 'X' and SPARE being '/'
  # it relies on the frames being given numberically ordered keys e.g. frame1, frame2 etc.
  def frame?
    current_frame = []
    @scorecard.each do |key, value|
      current_frame << key if value.framescore[:roll_1].nil? || value.framescore[:roll_2].nil?
    end
    current_frame.sort
    # to get the current frame as an integer, use this:
    # p current_frame[0][-1].to_i
    current_frame[0]
  end
end
