require 'score_card'

describe ScoreCard do
  let(:sc) { described_class.new }

  describe 'All 7/3 Spares Game' do
    it 'scores 170' do
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(7)

      expect(sc.calculate_score). to eq(170)
    end
  end
end