#require 'game'
require 'frame_repository'
#require 'frame'

class GameRepository
  def initialize
    @game_score_card = []
  end
  
  def add(frame)
    while true do
      @game_score_card << frame
      break if @game_score_card.length <= 20
    end 
  end
  
  def score_card
    return @game_score_card.sum
  end
end