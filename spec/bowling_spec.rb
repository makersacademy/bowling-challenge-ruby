require 'game'

RSpec.describe Game do
    context 'initilaize game' do
        xit "should start game with 0 score" do
            game = Game.new
            expect(game.total_score).to eq 0
            expect(game.roll_number).to eq 1
            expect(game.frame).to eq 1
        end
    end
    context 'roll a frame' do
        xit "should roll a 4 and add roll score to total score, add to the roll number and keep the same frame" do
            game = Game.new
            game.roll(4)
            expect(game.frame).to eq 1
            expect(game.roll_number).to eq 2
            expect(game.total_score).to eq 4
        end

        xit "should roll a 10 and add to total score, skip over to the next frame" do
            game = Game.new
            game.roll(10)
            expect(game.frame).to eq 2
            expect(game.roll_number).to eq 1
            expect(game.total_score).to eq 10
        end

        xit "should return 10 after two rolls with a frame change" do
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
    end

    context 'roll two frames with some bonuses' do
        xit "should return 20 for score due to spare bonus, the frame should change and the 3rd roll added to the 1st index of the board" do
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

        xit "should return 28 with strike bonus after 3 rolls, frame should return 3 on a new frame with roll counter to 1" do
            game = Game.new
            game.roll(10)
            game.roll(5)
            game.roll(4)
            expect(game.total_score).to eq 28
            expect(game.frame).to eq 3
            expect(game.roll_number).to eq 1
        end
    end

    context "throw three frames" do 
        xit "should return score as 60 after 3 strikes and be on the 4th frame" do
            game = Game.new
            game.roll(10)
            game.roll(10)
            game.roll(10)
            expect(game.total_score).to eq 60
            expect(game.frame).to eq 4
            expect(game.roll_number).to eq 1
        end

        xit "should return score as 48 after 1 strike, a spare, a 9 and then a 0 and be on the 4th frame" do
            game = Game.new
            game.roll(10)
            game.roll(5)
            game.roll(5)
            game.roll(9)
            game.roll(0)
            expect(game.total_score).to eq 48
            expect(game.frame).to eq 4
            expect(game.roll_number).to eq 1
        end
    end

    context "after 8 frames" do
        xit "should return 90 with board below" do
            game = Game.new
            game.board = [[7,3],[5,2],[10,0],[5,4],[6,0],[4,4],[8,2],[7,0],[0,0],[0,0,0]]
            game.roll_number = 2
            game.frame = 8
            game.roll(2)
            expect(game.total_score).to eq 90
            expect(game.frame).to eq 9
            expect(game.roll_number).to eq 1
        end
    end
end