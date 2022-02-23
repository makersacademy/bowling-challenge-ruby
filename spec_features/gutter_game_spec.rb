require 'score_card'

describe ScoreCard do
  let(:sc) { described_class.new }

  describe 'Gutter Game' do
    it 'scores 0' do
      12.times { sc.enter_pins(0) }

      expect(sc.calculate_score). to eq(0)
    end
  end
end