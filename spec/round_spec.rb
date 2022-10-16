require_relative "../lib/round"

describe Round do
    describe "#add_pins" do
        it "adds the current frame's pins to the round_pins array" do
            current_round = Round.new
            pins_knocked = 1

            current_round.add_pins(pins_knocked)

            pins_knocked = 4

            current_round.add_pins(pins_knocked)

            expect(current_round.round_pins).to eq([1, 4])
        end
    end
end