# frozen_string_literal: true

class Score
  attr_reader :score_card, :total_score

  def initialize
    @total_score = 0
    @score_card = []
  end

  def scorer(score1, score2)
    set = Hash.new(@total_score)
    if score1 == 10
      set[:roll1] = score1
      set[:strike?] = true
      @total_score += score1
      set[:total_score] = @total_score
      @score_card << set
    elsif score1 + score2 == 10
      set[:spare?] = true
      set[:roll1] = score1
      set[:roll2] = score2
      @total_score += 10
      set[:total_score] += (score1 + score2)
      @score_card << set
    else
      set[:roll1] = score1
      set[:roll2] = score2
      @total_score += (score1 + score2)
      set[:total_score] += (score1 + score2)
      @score_card << set
    end
  end

  def update_bonus
    (0...@score_card.length).each do |i|
      @score_card[i - 1][:total_score] += @score_card[i][:roll1] if @score_card[i - 1][:spare?] == true
      @score_card[i - 1][:total_score] += @score_card[i][:roll1] if @score_card[i - 1][:strike?] == true
      @score_card[i - 1][:total_score] += @score_card[i][:roll2] if @score_card[i - 1][:strike?] == true
    end
  end

  def display
    @score_card.each do |set|
      puts "#{set[:roll1]}, #{set[:roll2]}, #{set[:total_score]}"
    end
  end
end
