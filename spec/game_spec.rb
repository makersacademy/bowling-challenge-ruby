require 'game'

describe Game do
    let(:game) { Game.new }
    let(:frame) { Frame.new }

    context 'player hits zero pins in every frame' do
        before do
            frame.roll1 = 0
            frame.roll2 = 0
        end

        it 'after one frame shows total points as zero' do
            game.add_frame(frame)
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 1
        end

        it 'after 9 frames shows total points as zero' do
            9.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 9
        end

        it 'after 10 frames shows total points as zero' do
            10.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 10
        end

        it 'when trying to enter 11th frame shows a message' do
            10.times { game.add_frame(frame) }
            status = game.add_frame(frame)
            expect(status).to eq 'START NEW GAME'
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 10
        end
    end

    context 'player hits some pins without strike or spare' do
        it 'returns correct score after one frame and gutter roll' do
            frame.roll1 = 1
            frame.roll2 = 0
            game.add_frame(frame)
            expect(game.calculate_score).to eq 1
        end

        it 'returns correct score after one frame and no gutter rolls' do
            frame.roll1 = 7
            frame.roll2 = 2
            game.add_frame(frame)
            expect(game.calculate_score).to eq 9
        end

        it 'correct score after two frames' do
            frame.roll1 = 6
            frame.roll2 = 1
            game.add_frame(frame)
            frame2 = Frame.new
            frame2.roll1 = 4
            frame2.roll2 = 5
            game.add_frame(frame2)
            expect(game.calculate_score).to eq 16
        end
        
        it 'correct score when finished (10 frames)' do
            frame.roll1 = 7
            frame.roll2 = 2
            10.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 90
        end
    end

    context 'player hits all pins a frame' do
        it 'they hit a spare' do
            frame.roll1 = 9
            frame.roll2 = 1
            game.add_frame(frame)
            expect(game.calculate_score).to eq 10
            frame2 = Frame.new
            frame2.roll1 = 3
            frame2.roll2 = 2
            game.add_frame(frame2)
            expect(game.calculate_score).to eq 18
            frame3 = Frame.new
            frame3.roll1 = 7
            frame3.roll2 = 3
            game.add_frame(frame3)
            expect(game.calculate_score).to eq 28
            frame4 = Frame.new
            frame4.roll1 = 8
            frame4.roll2 = 1
            game.add_frame(frame4)
            expect(game.calculate_score).to eq 45
        end

        it 'they hit a strike once' do
            frame.roll1 = 10
            game.add_frame(frame)
            expect(game.calculate_score).to eq 10
            frame2 = Frame.new
            frame2.roll1 = 3
            frame2.roll2 = 2
            game.add_frame(frame2)
            expect(game.calculate_score).to eq 20
            frame3 = Frame.new
            frame3.roll1 = 0
            frame3.roll2 = 10
            game.add_frame(frame3)
            expect(game.calculate_score).to eq 30
            frame4 = Frame.new
            frame4.roll1 = 8
            frame4.roll2 = 1
            game.add_frame(frame4)
            expect(game.calculate_score).to eq 47
        end

        it 'they hit a couple strikes in a row' do
            frame.roll1 = 10
            game.add_frame(frame)
            expect(game.calculate_score).to eq 10
            frame2 = Frame.new
            frame2.roll1 = 10
            game.add_frame(frame2)
            expect(game.calculate_score).to eq 30
            frame3 = Frame.new
            frame3.roll1 = 4
            frame3.roll2 = 3
            game.add_frame(frame3)
            expect(game.calculate_score).to eq 48
            frame4 = Frame.new
            frame4.roll1 = 10
            game.add_frame(frame4)
            expect(game.calculate_score).to eq 58
            frame5 = Frame.new
            frame5.roll1 = 3
            frame5.roll2 = 1
            game.add_frame(frame5)
            expect(game.calculate_score).to eq 66
        end

        it 'they hit 9 strikes in a row' do
            frame.roll1 = 10
            9.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 240
        end
        
        it 'they hit alternating strike/spare' do
            frame.roll1 = 10
            frame2 = Frame.new
            frame2.roll1 = 0
            frame2.roll2 = 10
            4.times do
                game.add_frame(frame)
                game.add_frame(frame2)
            end
            game.add_frame(frame)
            expect(game.calculate_score).to eq 170
        end
    end

    context 'player plays full game' do
        it 'they hit a perfect game' do
            frame.roll1 = 10
            9.times { game.add_frame(frame) }
            frame10 = Frame.new
            frame10.roll1 = 10
            frame10.roll2 = 10
            frame10.roll3 = 10
            game.add_frame(frame10)
            expect(game.calculate_score).to eq 300
        end

        it 'they hit a perfect game except for a spare and strike in the 10th frame' do
            frame.roll1 = 10
            9.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 240
            frame10 = Frame.new
            frame10.roll1 = 9
            frame10.roll2 = 1
            frame10.roll3 = 10
            game.add_frame(frame10)
            expect(game.calculate_score).to eq 279
        end

        it 'they hit a perfect game except for a spare and gutter in the 10th frame' do
            frame.roll1 = 10
            9.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 240
            frame10 = Frame.new
            frame10.roll1 = 5
            frame10.roll2 = 5
            frame10.roll3 = 5
            game.add_frame(frame10)
            expect(game.calculate_score).to eq 270
        end

        it 'they hit a perfect game except for a spare and gutter in the 10th frame' do
            frame.roll1 = 10
            9.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 240
            frame10 = Frame.new
            frame10.roll1 = 0
            frame10.roll2 = 10
            frame10.roll3 = 3
            game.add_frame(frame10)
            expect(game.calculate_score).to eq 263
        end

        it 'they hit a perfect game except for a spare and gutter in the 10th frame' do
            frame.roll1 = 10
            9.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 240
            frame10 = Frame.new
            frame10.roll1 = 10
            frame10.roll2 = 0
            frame10.roll3 = 10
            game.add_frame(frame10)
            expect(game.calculate_score).to eq 280
        end
    end

    context 'player plays a whole game' do
        it 'example from readme' do
            frame.roll1 = 1
            frame.roll2 = 4
            game.add_frame(frame)
            frame2 = Frame.new
            frame2.roll1 = 4
            frame2.roll2 = 5
            game.add_frame(frame2)
            frame3 = Frame.new
            frame3.roll1 = 6
            frame3.roll2 = 4
            game.add_frame(frame3)
            frame4 = Frame.new
            frame4.roll1 = 5
            frame4.roll2 = 5
            game.add_frame(frame4)
            frame5 = Frame.new
            frame5.roll1 = 10
            game.add_frame(frame5)
            frame6 = Frame.new
            frame6.roll1 = 0
            frame6.roll2 = 1
            game.add_frame(frame6)
            frame7 = Frame.new
            frame7.roll1 = 7
            frame7.roll2 = 3
            game.add_frame(frame7)
            frame8 = Frame.new
            frame8.roll1 = 6
            frame8.roll2 = 4
            game.add_frame(frame8)
            frame9 = Frame.new
            frame9.roll1 = 10
            game.add_frame(frame9)
            frame10 = Frame.new
            frame10.roll1 = 2
            frame10.roll2 = 8
            frame10.roll3 = 6
            game.add_frame(frame10)
            expect(game.cumulative_frame_totals).to eq [5, 14, 29, 49, 60, 61, 77, 97, 117, 133]
            expect(game.calculate_score).to eq 133
        end
    end
end