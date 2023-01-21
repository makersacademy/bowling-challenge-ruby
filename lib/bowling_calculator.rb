class BowlingCalculator
  def initialize
    @total_score = 0
    @frames = [
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
    ]
  end

  def register_next_roll(pins_knocked)
    for i in 0 ... @frames.length
      frame = @frames[i]
      # puts "frame: #{frame}"
      @frame_score = 0

      for j in 0 ... frame.length
        if frame[j] == nil
          @frame_score += pins_knocked
          @total_score += @frame_score

          frame[j] = @frame_score
          # puts "new frame: #{frame}"
          # puts "total score: #{@total_score}" if j == (frame.length - 1)
          return @total_score
        end
      end
    end
  end

  def can_still_play?
    @frames.each do |frame|
      frame.each do |roll|
        return true if roll == nil
      end
    end
    return false
  end

  private

  # def process(pins_knocked)
  #   total_score = 0
  #   for frame in 1 .. 10 do
  #     for roll in 1 .. 2 do
  #       pins_knocked = gets.chomp.to_i
  #       is_valid_input
  #       total_score += pins_knocked
  #       puts total_score if roll == 2
  #     end
  #   end
  #   return total_score
  # end
end
