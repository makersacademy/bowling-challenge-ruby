require 'standard_frame'
describe StandardFrame do

  let(:frame) { StandardFrame.new(1) }

  context 'I want the game to have 10 frames' do

    it 'inits' do
      expect(frame.frame_number).to eq 1
    end

  end

  context 'I want the pins to reset after every frame' do

    it 'inits with pins of 10' do
      expect(frame.remaining_pins).to eq 10
    end

  end

  context 'I want to be able to knock over 10 pins in a roll' do

    it 'knocks 10 pins' do
      allow(frame).to receive(:get_player_input).and_return(10)
      frame.play
      expect(frame.remaining_pins).to eq 0
    end

  end

  context 'I want my current frame to be marked complete after a strike' do
    
    it 'doesnt give allow input of second value if first score = 10' do
      allow(frame).to receive(:record_roll).and_return(10)
      frame.play
      expect(frame.second_roll_score).to eq 0
    end

  end

  context 'I want to be able to keep track of my score' do

    it 'records first score' do
      allow(frame).to receive(:get_player_input).and_return(2,3)
      frame.play
      expect(frame.first_roll_score).to eq 2
      expect(frame.second_roll_score).to eq 3
    end

  end

  context 'I want my current frame to be marked complete after a strike' do

    it 'does not sum second game' do
      allow(frame).to receive(:get_player_input).and_return(10,3)
      frame.play
      expect(frame.first_roll_score).to eq 10
      expect(frame.second_roll_score).to eq 0
    end

  end

end