require_relative '../bowling'

RSpec.describe Bowling do

    before do
        @game = Bowling.new
    end
    
    it "rolls gutter game" do
        result = @game.roll(0)
        expect(result).to eq("Gutter Game!")
    end

    it "rolls perfect game" do
        result = @game.roll(300)
        expect(result).to eq("Perfect Game!")
    end
end