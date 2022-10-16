require_relative "../lib/round"

describe Round do
    describe "#add_pins" do
        it "adds the current frame's pins to the game_pins array" do
            current_round = Round.new
            pins_knocked = [1, 3]

            expect(game_pins.first).to eq([1, 3])
        end
    end
end