require 'scorecard'

describe Scorecard do
  context 'everything but a strike' do
   it 'stores 2 rolls' do
     this_game = Scorecard.new
     this_game.input_rolls('Frame 1', 2, 4)
     expect(this_game.scorecard).to eq([{'Frame 1' => [2, 4]}])
   end
  end
  context 'strike is rolled' do
    it 'stores 1 roll' do
      this_game = Scorecard.new
      this_game.input_rolls('Frame 1', 'X')
      expect(this_game.scorecard).to eq([{'Frame 1' => ['X', '-']}])
    end
  end
  it 'can input scores' do
    it 'appends the score to the scorecard for the frame' do
      this_game = Scorecard.new
      this_game.input_rolls('Frame 1', 'X')
      this_game.input_score(10)
      expect(this_game.scorecard).to eq([{'Frame 1' => ['X', '-', 10]}])
    end
  end

end
