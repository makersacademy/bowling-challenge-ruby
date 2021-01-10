require 'user_interface'

describe UserInterface do
  it 'can be initialised' do
    expect(UserInterface).to respond_to(:new)
  end

  it 'initializes with a game instance' do
    ui = UserInterface.new
    expect(subject.game).to be_kind_of Game
  end

#   describe '#play_game' do
#     # it 'can call on ask_for_rolls' do
#     #   allow(subject).to receive(:ask_for_rolls)
#     #   subject.play_game
#     # end
#
#   #   it 'can call on complete_frame' do
#   #   #   allow(subject).to receive(:complete_frame).with(4, 3)
#   #   #   subject.play_game
#   #   # end
#   # end
end
