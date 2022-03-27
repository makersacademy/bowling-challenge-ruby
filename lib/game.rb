class Game
  attr_accessor :scorecard
  def initialize
    @scorecard = [
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  def bowl(pins_down)
  # frame index required to determine which 
  # frame each bowl should be attributed to:
    frame_index = @scorecard.find_index do |frame|
      frame[:pins].sum < 10 && frame[:pins].size < 2
      end
  
  # now add the pins_down 
  # to the appropriate frame:
    @scorecard[frame_index][:pins] << pins_down

  # now to determine points,
  # if no spare scored previously:
  if @scorecard[frame_index - 1][:pins].sum < 10
    # no bonuses are scored:
    @scorecard[frame_index][:total] = @scorecard[frame_index][:pins].sum
  # elsif previous turn was a spare:
  elsif @scorecard[frame_index - 1][:pins].sum == 10 && @scorecard[frame_index - 1][:pins].size == 2
    # add the next score as normal
    @scorecard[frame_index][:total] = @scorecard[frame_index][:pins].sum
    # if this is the first bowl of the next turn...
    if @scorecard[frame_index][:pins].size == 1
      # then add the score as a bonus to the previous total
      @scorecard[frame_index - 1][:total] += @scorecard[frame_index][:pins][0]
      # if this is the 2nd bowl of the next turn then do nothing...
      else
    end
  # elsif previous turn was a strike
  elsif @scorecard[frame_index - 1][:pins][0] == 10
    # add the next score as normal
    @scorecard[frame_index][:total] = @scorecard[frame_index][:pins].sum
    # if this is the first bowl of the next turn...
    if @scorecard[frame_index][:pins].size == 1
      # then add the score as a bonus to the previous total
      @scorecard[frame_index - 1][:total] += @scorecard[frame_index][:pins][0]
    # if this is the 2nd bowl of the next turn...
    elsif @scorecard[frame_index][:pins].size == 2
    # then add the score as a bonus to the previous total
    @scorecard[frame_index - 1][:total] += @scorecard[frame_index][:pins][1]
    end
  end
  # display scorecard:
  @scorecard
  end

end
