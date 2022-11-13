require_relative '../lib/bowling_scoring'

describe BowlingScoring do
  context 'after the first frame' do
    it 'returns a score without a spare or strike' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[2, 3]])
      expect(result).to eq(5)
    end
  end

  context 'after second frame' do
    it 'returns total score without a spare or strike' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[2, 3], [2, 5]])
      expect(result).to eq(12)
    end

    it 'returns total score with a spare in 1st frame' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[2, 8], [2, 5]])
      expect(result).to eq(19)
    end

    it 'returns total score with a strike in 1st frame' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[10, 0], [1, 5]])
      expect(result).to eq(22)
    end
  end

  context 'after multiple frames but fewer than 10 frames' do
    it 'returns correct total score with no spares or strikes' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7], [3, 6], [0, 9], [8, 1]])
      expect(result).to eq(81)
    end

    it 'returns correct total score with spares and strikes' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 2], [3, 7], [3, 6], [0, 9], [8, 2], [3, 7], [3, 6], [0, 9], [10, 0]])
      expect(result).to eq(98)
    end
  end

  context 'after a full 10 frame game' do
    it 'returns correct total score with no spares or strikes' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7]])
      expect(result).to eq(90)
    end

    it 'returns correct total score with spares and strikes' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 2], [3, 7], [3, 6], [0, 9], [8, 2], [3, 7], [3, 6], [0, 9], [10, 0], [1, 9, 4]])
      expect(result).to eq(122)
    end

    it 'returns correct total score with 3 strikes in 10th frame' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 2], [3, 7], [3, 6], [0, 9], [8, 2], [3, 7], [3, 6], [0, 9], [10, 0], [10, 10, 10]])
      expect(result).to eq(148)
    end

    it 'returns correct total score for perfect game' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10, 10]])
      expect(result).to eq(300)
    end
  end

  context 'when collecting score user input' do
    it 'collects scores for 10 frames of bowls' do
      terminal = double(:terminal)
      expect(terminal).to receive(:puts).with("Frame 1: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("2").ordered
      expect(terminal).to receive(:puts).with("Frame 1: How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("8").ordered
      expect(terminal).to receive(:puts).with("Frame 2: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("10").ordered
      expect(terminal).to receive(:puts).with("Frame 3: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("10").ordered
      expect(terminal).to receive(:puts).with("Frame 4: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("3").ordered
      expect(terminal).to receive(:puts).with("Frame 4: How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("7").ordered
      expect(terminal).to receive(:puts).with("Frame 5: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("5").ordered
      expect(terminal).to receive(:puts).with("Frame 5: How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("5").ordered
      expect(terminal).to receive(:puts).with("Frame 6: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("2").ordered
      expect(terminal).to receive(:puts).with("Frame 6: How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("8").ordered
      expect(terminal).to receive(:puts).with("Frame 7: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("8").ordered
      expect(terminal).to receive(:puts).with("Frame 7: How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("1").ordered
      expect(terminal).to receive(:puts).with("Frame 8: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("6").ordered
      expect(terminal).to receive(:puts).with("Frame 8: How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("2").ordered
      expect(terminal).to receive(:puts).with("Frame 9: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("10").ordered
      expect(terminal).to receive(:puts).with("Last frame! How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("5").ordered
      expect(terminal).to receive(:puts).with("Last frame! How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("5").ordered
      expect(terminal).to receive(:puts).with("Last frame! How many pins did your bonus bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("10").ordered
      expect(terminal).to receive(:puts).with("Your scorecard: [[2, 8], [10, 0], [10, 0], [3, 7], [5, 5], [2, 8], [8, 1], [6, 2], [10, 0], [5, 5, 10]]").ordered
      expect(terminal).to receive(:puts).with("Your final score: 172").ordered
      new_game = BowlingScoring.new
      new_game.collect_scores(terminal)
    end
  end
end