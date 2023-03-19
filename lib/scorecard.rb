class ScoreCard
  attr_accessor :score_card

  def initialize(io = Kernel)
    @io = io
    @score_card = _create_frames
  end

  def run

    @score_card.each_with_index do |frame, index|
      _game_setup(frame, index)
      
      @rolls.each do |roll|
    #--------------------------------------------
        
        input = @io.gets.chomp.to_i
        frame[:rolls] << input

        if roll == 1 && input == 10
          frame[:status] = "STRIKE"
          break
        end
        if roll == 2 && frame[:rolls].sum == 10
          frame[:status] = "SPARE" 
        end
      end
    end
  end

  private

  def _create_frames
    return unless @score_card.nil?
    @score_card = []
    (0..9).each do |index| 
      @score_card[index] = {number: nil, status: nil, rolls: [], bonus: []}
    end
    return @score_card
  end

  # ---------------------------------
  # GAME LOGIC ENTRY POINT
  # ---------------------------------
  def _game_setup(frame, index)
    @frame_number = index + 1
    frame[:number] = @frame_number
    @rolls = [1, 2]
  end
end
