require 'score_card'

describe ScoreCard do
  let(:sc) { described_class.new }

  describe 'Perfect Game' do
    it 'scores 300' do
      12.times { sc.enter_pins(10) }

      expect(sc.calculate_score). to eq(300)
    end
  end
end