require 'scorecard'

describe Scorecard do
  let(:game) { Scorecard.current_game }
  # let(:frame) { Frame.new }

  describe '.start_game' do
    it 'creates an instance of Scorecard and passes a new frame instance into @frames' do
      Scorecard.start_game("Mabon")
      # frameobj = object_double(Frame)
      # allow(frameobj).to receive(:new).and_return(frame)
      expect(game).to be_a Scorecard
      expect(game.name).to eq "Mabon"
      expect(game.frames.count).to eq 1
      # expect(game.frames).to include frame
    end
  end

  # describe '.bowl' do
  #   it 'initiates a bowl if frame is not finished' do
  #     Scorecard.start_game("Mabon")
  #     expect(Scorecard.bowl)

  describe 'frames_played' do
    it 'returns the number of frames played so far' do
      Scorecard.start_game("Mabon")
      game.next_frame
      expect(game.frames_played).to eq 2
    end
  end

  # describe 'score' do
  #   it 'returns the score total score across all frames played' do
  #     # allow(frame).to receive(:frame_score).and_return(11)
  #     allow(frame).to receive(:gets).and_return("5", "6")
  #     Scorecard.start_game("Mabon")
  #     Scorecard.bowl
  #     Scorecard.bowl
  #     expect(game.score).to eq 11
  #   end
  # end
end
