require 'scoreboard'


# Define a method roll(pins) 
# that takes in the number of pins knocked down in a roll and adds it to the @rolls array.

RSpec.describe do
  context 'player never hits a pin(20 zero scores)' do
    it 'is a gutter game' do
      game = Scoreboard.new
      rolls = [0] * 20
      rolls.each { |pins| game.roll(pins) }
      expect(game.score).to eq(0)
    end
  end
  
  context 'Perfect Game' do
    it 'scores 300' do
      game = Scoreboard.new
      rolls = [10] * 12
      rolls.each { |pins| game.roll(pins) }
      expect(game.score).to eq(300)
    end
  end
  
  context '10th frame with strike' do
    it 'allows for two extra rols and adds the next two rolls as a bonus' do
      game = Scoreboard.new
      rolls = [0] * 18 + [10, 3, 4]
      rolls.each { |pins| game.roll(pins) }
      expect(game.score).to eq(17)
    end
  end
  
  context '10th frame with only one strike' do
    it 'one extra roll used as bonus' do
      game = Scoreboard.new
      rolls = [0] * 18 + [5, 5, 3]
      rolls.each { |pins| game.roll(pins) }
      expect(game.score).to eq(13)
    end
  end
end