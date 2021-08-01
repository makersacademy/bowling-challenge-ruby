# frozen_string_literal: true

class Score
  attr_reader :first_bowl, :second_bowl, :spare, :strike, :gutter, :score

  def initialize
    @first_bowl
    @second_bowl
    @spare = false
    @strike = false
    @gutter = false
  end

  def first_bowl(score:)
    @first_bowl = score
  end

  def second_bowl(score:)
    @second_bowl = score
  end

  def spare?
    @strike = (@first_bowl + @second_bowl == 10) && (@strike == false) ? true : false
  end

  def strike?
    @strike = true if @first_bowl == 10
  end

  def gutter?
    @gutter = true if @first_bowl || @second_bowl.zero?
  end
end
