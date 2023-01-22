require 'game'

RSpec.describe Game do
    context 'initilaize game' do
        it "should start game with 0 score" do
            game = Game.new
            expect(game.total_score).to eq 0
            expect(game.roll_number).to eq 1
            expect(game.frame).to eq 1
        end
    end
    context 'roll a frame' do
        it "should roll a 4 and add roll score to total score, add to the roll number and keep the same frame" do
            game = Game.new
            game.roll(4)
            expect(game.frame).to eq 1
            expect(game.roll_number).to eq 2
            expect(game.total_score).to eq 4
        end

        it "should roll a 10 and add to total socre, skip over to the next frame" do
            game = Game.new
            game.roll(10)
            expect(game.frame).to eq 2
            expect(game.roll_number).to eq 1
            expect(game.total_score).to eq 10
        end

        it "should return 10 after two rolls with a frame change" do
            game = Game.new
            game.roll(6)
            expect(game.frame).to eq 1
            expect(game.roll_number).to eq 2
            expect(game.total_score).to eq 6
            game.roll(4)
            expect(game.frame).to eq 2
            expect(game.roll_number).to eq 1
            expect(game.total_score).to eq 10
        end

        it "should return 20 for score due to spare bonus, the frame should change and the 3rd roll added to the 1st index of the board" do
            game = Game.new
            game.roll(7)
            expect(game.frame).to eq 1
            expect(game.roll_number).to eq 2
            expect(game.total_score).to eq 7
            game.roll(3)
            expect(game.frame).to eq 2
            expect(game.roll_number).to eq 1
            expect(game.total_score).to eq 10
            game.roll(5)
            expect(game.frame).to eq 2
            expect(game.roll_number).to eq 2
            expect(game.total_score).to eq 20
        end
    end
end