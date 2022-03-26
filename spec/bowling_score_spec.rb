require 'bowling_score'

describe BowlingScore do
  subject(:score) { described_class.new('Paul') }

  it "stores a player's name" do
    expect(score.name).to eq 'Paul'
  end
  
  it 'stores a default score of 0' do
    expect(score.current_score).to eq 0
  end

  it 'stores a default frame of 0' do
    expect(score.frame).to eq 0
  end

  describe '#add' do
    it 'adds to the current score' do
      expect { score.add(5) }.to change{ score.current_score }.by(5)
    end
  end
end
