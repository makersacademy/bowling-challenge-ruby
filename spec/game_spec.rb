# frozen_string_literal: true

require 'game'

describe Game do
  game = described_class.new

  describe '#initialize' do
    it 'should be instance of Game class' do
      expect(game).to be_instance_of(Game)
    end
    it 'should be initialized with a frame_score variable' do
      expect(game).to respond_to(:frame_score)
      expect(game.frame_score).to eq([])
    end
    it 'should be initialized with an empty array to store frame scores' do
      expect(game).to respond_to(:results)
      expect(game.results).to eq([])
    end
    it 'should be initialized with a frame_count variable' do
      expect(game).to respond_to(:frame_count)
      expect(game.frame_score).to eq([])
    end

    it 'should respond to print_frame_score' do
      expect(game).to respond_to(:print_frame_score)
    end

    it 'should respond to input_scores' do
      expect(game).to respond_to(:input_scores)
    end

    it 'should respond to current_frame' do
      expect(game).to respond_to(:current_frame)
    end
  end

  describe '#print_frame_score' do
    it 'should print the current frames score' do
      game.frame_score << 0
      game.frame_score << 0
      expect(game.print_frame_score).to eq('Your current score this frame is 0.')
      game.frame_score << 1
      game.frame_score << 2
      expect(game.print_frame_score).to eq('Your current score this frame is 3.')
      game.frame_score.clear
      game.frame_score << 7
      game.frame_score << 1
      expect(game.print_frame_score).to eq('Your current score this frame is 8.')
      game.frame_score.clear
      game.frame_score << 10
      expect(game.print_frame_score).to eq('Your current score this frame is 10.')
    end
  end

  describe '#input_scores' do
    it 'should take a maximum of two arguments' do
      expect{ game.input_scores(1, 2, 3) }.to raise_exception(ArgumentError, 'Too many arguments (there should be a maximum of two).')
      expect(game.input_scores(1, 2)).to eq("Your bowls for frame 1 are 1 and 2.")
    end
    it 'the arguments should total a maximum of ten' do
      game.results.clear
      expect(game.input_scores(1, 8)).to eq("Your bowls for frame 1 are 1 and 8.")
      expect{ game.input_scores(10, 1) }.to raise_exception(ArgumentError, 'Argument total is too high (the maximum total should be ten).')
      expect{ game.input_scores(0, 11) }.to raise_exception(ArgumentError, 'Argument total is too high (the maximum total should be ten).')
      expect{ game.input_scores(11, 0) }.to raise_exception(ArgumentError, 'Argument total is too high (the maximum total should be ten).')
    end
    it 'should tell the user if they bowl a Strike' do
      game.results.clear
      game.frame_count = 0
      expect(game.input_scores(10)).to eq('You scored a Strike for frame 1. Nice work!')
    end
    it 'should tell the user if they bowl a Spare' do
      game.frame_count = 0
      expect(game.input_scores(9, 1)).to eq('You scored a Spare for frame 2. Not bad!')
    end
    it 'should push the arguments input by the user to the results array' do
      game.results.clear
      game.input_scores(1, 2)
      game.input_scores(3, 4)
      expect(game.results).to eq([[1, 2], [3, 4]])
    end
    it 'should increment the frame count by 1 after each successful score input' do
      game.results.clear
      game.input_scores(2, 1)
      game.input_scores(2, 6)
      expect(game.frame_count).to eq(2)
    end
    it 'should end the game if the user tries to input more scores after frame 10' do
      game.frame_count = 10
      expect{ game.input_scores(1, 8) }.to raise_exception(RuntimeError, 'You have played 10 frames and your game is now over.')
    end
  end

  describe '#current_frame' do
    it 'should tell the user the current frame and how many frames are left' do
      game.results.clear
      game.frame_count = 0
      game.input_scores(1, 2)
      game.input_scores(3, 4)
      game.input_scores(2, 1)
      game.input_scores(2, 6)
      expect(game.current_frame).to eq("You are currently on frame 4 of 10. You have 6 frames to play.")
    end
  end
end
