# frozen_string_literal: true

class Player
  attr_reader :bowl

  def roll
    'What is your roll?'
    @bowl = $stdin.gets.chomp.to_i
  end
end
