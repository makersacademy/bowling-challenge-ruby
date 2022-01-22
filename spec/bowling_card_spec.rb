require 'bowling_card'

describe BowlingCard do
  let(:bowling) { BowlingCard.new }

  it { is_expected.to respond_to :frames, :frame_round }

  it 'frame_round is set to 1' do
    expect(bowling.frame_round).to eq 1
  end
  
  describe '#frames' do 

    it 'calls the roll method' do
      expect(bowling).to receive(:roll).at_least(:once)
      bowling.frames
    end

    it 'calls the score method' do
      expect(bowling).to receive(:score).at_least(:once)
      bowling.frames
    end

    it 'when 10 rounds are played, calls print_score method' do
      expect(bowling).to receive(:print_score)
      bowling.frames
    end

  end 

end