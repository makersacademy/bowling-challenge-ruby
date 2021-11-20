# frozen_string_literal: true

class Game

    def initialize
      @rolls = []
    end

  def roll(pins)
    @rolls << pins
  end

  def score
    @bonus = []
    @rolls.each_with_index{|roll,index|
      if index.odd?
        if roll + @rolls[index-1] == 10
         @bonus << @rolls[index+1]
        end
      end
    }
    @rolls.sum + @bonus.sum
  end


end
