require 'user_interface'

describe UserInterface do
  it 'can be initialised' do
    expect(UserInterface).to respond_to(:new)
  end

end
