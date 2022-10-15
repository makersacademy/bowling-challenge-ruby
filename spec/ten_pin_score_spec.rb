require_relative '../lib/ten_pin_score'

describe TenPinScore do
    it 'Inserts 10 arrays into @scorecard' do
        ten_pin = TenPinScore.new
        ten_pin.format_arrays
        expect(ten_pin.scorecard.length).to eq 10
    end

    it 'Adds one score into first array in @scorecard' do
        ten_pin = TenPinScore.new
        ten_pin.format_arrays
        ten_pin.add_roll(1)
        expect(ten_pin.scorecard.length).to eq 10
        expect(ten_pin.scorecard[0][0]).to eq 1
    end

    it 'adds scores to the array scorecard' do
        ten_pin = TenPinScore.new
        ten_pin.format_arrays
        # 1
        ten_pin.add_roll(1)
        ten_pin.add_roll(4)
        # 2
        ten_pin.add_roll(4)
        ten_pin.add_roll(5)
        # 3
        ten_pin.add_roll(6)
        ten_pin.add_roll(4)
        # 4
        ten_pin.add_roll(5)
        ten_pin.add_roll(5)
        # 5
        ten_pin.add_roll(10)
        ten_pin.add_roll(0)
        #  6
        ten_pin.add_roll(0)
        ten_pin.add_roll(1)
        # 7
        ten_pin.add_roll(7)
        ten_pin.add_roll(3)
        # 8
        ten_pin.add_roll(6)
        ten_pin.add_roll(4)
        # 9 strike
        ten_pin.add_roll(10)
        ten_pin.add_roll(0)
        # 10
        ten_pin.add_roll(2)
        ten_pin.add_roll(8)
        #this makes a split and gets extra go
        ten_pin.add_roll(6)
        expect(ten_pin.scorecard.length).to eq 10
        expect(ten_pin.scorecard[-1].length).to eq 3
        expect(ten_pin.total_score).to eq 133
    end

   
    it 'checks a strike in 10th frame roll 1' do
        ten_pin = TenPinScore.new
        ten_pin.format_arrays
        18.times {|i| ten_pin.add_roll(5)}
        ten_pin.add_roll(10)
        ten_pin.add_roll(10)
        ten_pin.add_roll(10)
        expect(ten_pin.scorecard.length).to eq 10
        expect(ten_pin.scorecard[-1].sum).to eq 30
    end

    it 'checks a run of all strikes' do
        ten_pin = TenPinScore.new
        ten_pin.format_arrays
        9.times {|i| 
            ten_pin.add_roll(10)
            ten_pin.add_roll(0)
        }
        ten_pin.add_roll(10)
        ten_pin.add_roll(10)
        ten_pin.add_roll(10)
        expect(ten_pin.scorecard.length).to eq 10
        expect(ten_pin.scorecard[-1].sum).to eq 30
    end
end