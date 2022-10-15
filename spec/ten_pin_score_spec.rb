require_relative '../lib/ten_pin_score'

Describe TenPinScore do
    it 'adds scores to the array scorecard' do
        ten_pin = TenPinScore.new
        ten_pin.add_roll(1)
        ten_pin.add_roll(4)
        ten_pin.add_roll(4)
        ten_pin.add_roll(5)
        ten_pin.add_roll(6)
        ten_pin.add_roll(4)
        ten_pin.add_roll(5)
        ten_pin.add_roll(5)
        ten_pin.add_roll(10)
        ten_pin.add_roll(0)
        # Below is frame 6
        ten_pin.add_roll(0)
        ten_pin.add_roll(1)
        ten_pin.add_roll(7)
        ten_pin.add_roll(3)
        ten_pin.add_roll(6)
        ten_pin.add_roll(4)
        ten_pin.add_roll(10)
        ten_pin.add_roll(0)
        # Tenth frame
        ten_pin.add_roll(2)
        ten_pin.add_roll(8)
        ten_pin.add_roll(6)
        expect(ten_pin.scorecard.length).to eq 10
        expect(ten_pin.scorecard[-1].length).to eq 3
    end

end