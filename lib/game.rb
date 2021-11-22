class Game

  NUMBER_OF_FRAMES = 10  

  def initialize(frame = 0)
    @current_frame = frame
  end

  def start_game
    loop_frames
    gameover
  end

  private

  def loop_frames
    while true do
      start_frame
      break if @current_frame == NUMBER_OF_FRAMES
      @current_frame += 1
    end
  end
  
  def start_frame
    
  end  

  def gameover
    p "Game Over"
  end
end  


  