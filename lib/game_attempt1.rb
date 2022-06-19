class Game

attr_reader :score_card, :current_round, :current_frame, :total_score

def initialize
  @score_card = Array.new(14) { Array.new(2) }
  @current_frame = 1
  @current_round = 1
  @total_score = 0
  @spare_bonus = false
  @pins_remaining = 10
end

def roll(pins)

  if pins == 10 && @current_round == 1
    score_card[@current_frame - 1][0] = pins
    score_card[@current_frame - 1][1] = "X"
    @current_frame += 1
    return
  else
    score_card[@current_frame - 1][@current_round - 1] = pins
    @pins_remaining -= pins
  end

  if @spare_bonus == true
    @total_score += pins
    @spare_bonus = false
  end

  if @current_round == 2
    @current_round = 1
    @current_frame += 1
    if @pins_remaining == 0
      @spare_bonus = true
    end
    @pins_remaining = 10
  else
    @current_round += 1
  end

end

def resolve_scores
  @score_card.each_with_index do |x, xi|
    x.each_with_index do |y, yi|
      if y == "X"
        if @score_card[xi+1][0] != nil && @score_card[xi+1][1] != "X"
          @score_card[xi][yi] = @score_card[xi+1][0] + @score_card[xi+1][1]
        elsif @score_card[xi+1][0] != nil && @score_card[xi+2][0] != nil
          @score_card[xi][yi] = @score_card[xi+1][0] + @score_card[xi+2][0]
        end
      end
    end
  end

  @score_card.each_with_index do |x, xi|
    x.each_with_index do |y, yi|
      #puts "element [#{xi}, #{yi}] is #{y}"
    end
  end



end

def current_score
  @score_card.each do |score|
    score.each do |points, index|
      @total_score += points unless points == "X" || points == nil
    end
  end

end


end