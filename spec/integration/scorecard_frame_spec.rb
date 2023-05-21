require 'frame'
require 'scorecard'

describe 'integration' do
  context 'when there are no spares or strikes' do
    it 'calculates the score' do
      scorecard = Scorecard.new
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)

      expect(scorecard.calculate_score).to eq 30
    end
  end
  
  context 'when there are spares' do
    it 'calculates the score' do
      scorecard = Scorecard.new
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 9)
      scorecard.add_frame(3, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(5, 5)
      scorecard.add_frame(9, 0)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      
      expect(scorecard.calculate_score).to eq 64
    end
  end

  context 'when there are strikes' do
    it 'calculates the score' do
      scorecard = Scorecard.new
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(10)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(10)
      scorecard.add_frame(3, 2)
  
      expect(scorecard.calculate_score).to eq 54
    end
  end

  context 'when there are multiple strikes in a row' do
    it 'calculates the score' do
      scorecard = Scorecard.new
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(3, 2)
      scorecard.add_frame(3, 2)
      
      expect(scorecard.calculate_score).to eq 89
    end
  end
  
  context 'when 10th frame is a spare' do
    it 'adds the first endgame bonus score to the total score' do
      scorecard = Scorecard.new
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(3, 2)
      scorecard.add_frame(3, 7)
      # bonus
      scorecard.add_frame(3)
      
      expect(scorecard.calculate_score).to eq 97
    end
  end

  context 'when 10th frame is a strike' do
    it 'adds two endgame bonus scores to the total score' do
      scorecard = Scorecard.new
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(3, 2)
      scorecard.add_frame(10)
      # bonus
      scorecard.add_frame(3, 10)
      
      expect(scorecard.calculate_score).to eq 107
    end
  end

  context 'the game ends with two strikes in a row' do
    it 'the first endgame bonus is used as a bonus for the ninth frame' do
      scorecard = Scorecard.new
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(1, 2)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      # bonus
      scorecard.add_frame(3, 10)
      
      expect(scorecard.calculate_score).to eq 125
    end
  end

  context 'the game is all strikes' do
    it 'is a perfect game with score of 300' do
      scorecard = Scorecard.new
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      # bonus
      scorecard.add_frame(10, 10)
  
      expect(scorecard.calculate_score).to eq 300
      expect(scorecard.perfect_game?).to eq true
      expect(scorecard.gutter_game?).to eq false
    end
  end

  context 'the player never hits a pin' do
    it 'is a gutter game with a score of 0' do
      scorecard = Scorecard.new
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      
      expect(scorecard.calculate_score).to eq 0
      expect(scorecard.perfect_game?).to eq false
      expect(scorecard.gutter_game?).to eq true
    end
  end

  context 'the player hits one pin' do
    it 'is not a gutter game' do
      scorecard = Scorecard.new
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 1)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)
      scorecard.add_frame(0, 0)

      expect(scorecard.calculate_score).to eq 1
      expect(scorecard.perfect_game?).to eq false
      expect(scorecard.gutter_game?).to eq false
    end
  end

  context 'the player doesn\'t get all strikes' do
    it 'is not a perfect game' do
      scorecard = Scorecard.new
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(9, 1)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      scorecard.add_frame(10)
      # bonus
      scorecard.add_frame(10, 10)

      expect(scorecard.calculate_score).to eq 279
      expect(scorecard.perfect_game?).to eq false
      expect(scorecard.gutter_game?).to eq false
    end
  end
end