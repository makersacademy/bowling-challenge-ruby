# frozen_string_literal: true

class Scorecard
  attr_reader :total_score
  
  def initialize(*frames)
    @total_score = frames.inject(:+)
  end
end
