require 'bowling_score'

describe BowlingScore do
  subject(:score) { described_class.new('Paul') }

  it "stores a player's name" do
    expect(score.name).to eq 'Paul'
  end
  
  it 'stores a default score of 0' do
    expect(score.frame_score(1)).to eq 0
  end

  describe '#add' do
    it 'adds to the score' do
      expect { score.add(5) }.to change { score.total_score }.by(5)
    end
  end

  describe '#next_frame_number' do
    context 'when no frames have been scored' do
      it 'returns 1' do
        expect(score.next_frame_number).to eq 1
      end
    end
    context 'when a frame has already been created' do
      it 'returns the next frame number' do
        score.add_new_frame
        expect(score.next_frame_number).to eq 2
      end
    end
  end
end
