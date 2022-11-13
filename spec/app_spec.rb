require_relative '../app'

describe Application do
  context 'when collecting score user input' do
    it 'collects scores for 10 frames of bowls with valid inputs' do
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
      new_game = Application.new(terminal)
      new_game.collect_scores
    end
  end

  context 'invalid inputs' do
    it 'rejects second bowl greater than pins left' do
      terminal = double(:terminal)
      expect(terminal).to receive(:puts).with("Frame 1: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("8").ordered
      expect(terminal).to receive(:puts).with("Frame 1: How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("8").ordered
      expect(terminal).to receive(:puts).with("There were fewer than 8 pins after your first bowl.").ordered
      expect(terminal).to receive(:puts).with("Input a number less than 2.").ordered
      expect(terminal).to receive(:puts).with("Frame 1: How many pins did your 2nd bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("2").ordered
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
      expect(terminal).to receive(:puts).with("Your scorecard: [[8, 2], [10, 0], [10, 0], [3, 7], [5, 5], [2, 8], [8, 1], [6, 2], [10, 0], [5, 5, 10]]").ordered
      expect(terminal).to receive(:puts).with("Your final score: 172").ordered
      new_game = Application.new(terminal)
      new_game.collect_scores
    end

    xit 'rejects leters' do
      terminal = double(:terminal)
      expect(terminal).to receive(:puts).with("Frame 1: How many pins did your 1st bowl knock down?").ordered
      expect(terminal).to receive(:gets).and_return("t").ordered
      expect(terminal).to receive(:puts).with("Invalid input. Enter a number between 0 and 10.").ordered
      new_game = Application.new(terminal)
      new_game.collect_scores
    end
  end

end