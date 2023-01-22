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

        it "should roll a 10 and add to total score, skip over to the next frame" do
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
    end

    context 'roll two frames with some bonuses' do
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

        it "should return 28 with strike bonus after 3 rolls, frame should return 3 on a new frame with roll counter to 1" do
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
        it "should return score as 60 after 3 strikes and be on the 4th frame" do
            game = Game.new
            game.roll(10)
            game.roll(10)
            game.roll(10)
            expect(game.total_score).to eq 60
            expect(game.frame).to eq 4
            expect(game.roll_number).to eq 1
        end

        it "should return score as 48 after 1 strike, a spare, a 9 and then a 0 and be on the 4th frame" do
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
        it "should return 90 with board below" do
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

    context "after a full game" do
        it "should return 111 with no spare or strike at end" do
            game = Game.new
            game.board = [[7,3],[5,2],[10,0],[5,4],[6,0],[4,4],[8,2],[7,2],[9,1],[4,0,0]]
            game.roll_number = 2
            game.frame = 10
            game.roll(3)
            expect(game.total_score).to eq 111
            expect(game.frame).to eq 10
            expect(game.roll_number).to eq 3
        end

        it "should return 111 with a spare at end" do
            game = Game.new
            game.board = [[7,3],[5,2],[10,0],[5,4],[6,0],[4,4],[8,2],[7,2],[9,1],[1,9,0]]
            game.roll_number = 3
            game.frame = 10
            game.roll(5)
            expect(game.total_score).to eq 116
            expect(game.frame).to eq 10
            expect(game.roll_number).to eq 4
        end

        it "should return 140 with 3 strikes at the end" do
            game = Game.new
            game.board = [[7,3],[5,2],[10,0],[5,4],[6,0],[4,4],[8,2],[7,2],[9,1],[10,10,0]]
            game.roll_number = 3
            game.frame = 10
            game.roll(10)
            expect(game.total_score).to eq 140
            expect(game.frame).to eq 10
            expect(game.roll_number).to eq 4
        end

        it "should return 129 with a spare and 1 strike at the end" do
            game = Game.new
            game.board = [[7,3],[5,2],[10,0],[5,4],[6,0],[4,4],[8,2],[7,2],[9,1],[9,1,0]]
            game.roll_number = 3
            game.frame = 10
            game.roll(10)
            expect(game.total_score).to eq 129
            expect(game.frame).to eq 10
            expect(game.roll_number).to eq 4
        end

        it "should return 100 with all gutterballs at the end" do
            game = Game.new
            game.board = [[7,3],[5,2],[10,0],[5,4],[6,0],[4,4],[8,2],[7,2],[9,1],[0,0,0]]
            game.roll_number = 2
            game.frame = 10
            game.roll(0)
            expect(game.total_score).to eq 100
            expect(game.frame).to eq 10
            expect(game.roll_number).to eq 3
        end

        it "should return 100 with all gutterballs at the end" do
            game = Game.new
            game.board = [[7,3],[5,2],[10,0],[5,4],[6,0],[4,4],[8,2],[7,2],[9,1],[0,0,0]]
            game.roll_number = 3
            game.frame = 10
            game.roll(5)
            expect(game.finished).to eq true
        end
    end
end