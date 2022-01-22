require 'scoreboard'

describe 'Scoreboard' do

  let (:frame) {0}
  let (:roll) {0}
  let (:knocked_down_pins) {0}
  let (:total_score) {0}
#  let (scoreboard) {Scoreboard.create(frame: frame, roll: roll, knocked_down_pins: knocked_down_pins, total_score: total_score)}


  context 'When testing the .create method' do
    it 'creates a new scoreboard class' do
      scoreboard = Scoreboard.create(frame: frame, 
      roll: roll, 
      knocked_down_pins: knocked_down_pins,
      total_score: total_score
      )
      expect(scoreboard).to be_a Scoreboard
      expect(scoreboard.frame).to eq 0
      expect(scoreboard.roll).to eq 0 
      expect(scoreboard.knocked_down_pins).to eq 0
      expect(scoreboard.total_score).to eq 0
    end
  end
end
    
