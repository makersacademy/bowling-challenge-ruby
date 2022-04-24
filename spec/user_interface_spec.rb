require 'user_interface'

describe UserInterface do
  it 'can be initialised' do
    expect(UserInterface).to respond_to(:new)
  end

  it 'initializes with a game instance' do
    ui = UserInterface.new
    expect(subject.game).to be_kind_of Game
  end
end
