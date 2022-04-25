class Scoresheet

MAX_FRAMES = 10
  
    def initialize(frames)
      @frames = frames
      @subsequent_frame = subsequent_frame
    end

    def total_score
      total_score = 0
      @frames.map.with_index do |frame, i|
      total_score += frame.inject(0, :+)
      total_score += bonus_with_strike(frame, i)
      end
      return total_score
    end
  
    def bonus_with_strike(frame, i)
      return 0 if not strike?(frame)
      return 0 if i == 9
      @subsequent_frame = @frames[i + 1]
      subsequent_frame = @subsequent_frame
      @tenth_frame = @frames[9]
      
      if strike?(subsequent_frame)
        @subsequent_frame[0] + @tenth_frame[0]
      else
        @subsequent_frame.inject(0, :+)
      end
    end

    private

    def strike?(frame)
      frame.include?(10)
    end
    
    attr_reader :frames, :subsequent_frame
  end