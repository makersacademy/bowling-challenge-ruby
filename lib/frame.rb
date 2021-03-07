require 'userinput'

class Frame

  def initialize(user_input = UserInput.new)
    @roll_one = nil
    @roll_two = nil
    @user_input = user_input
  end

  def frame_result(user_input_class_instance)
  @roll_one = user_input_class_instance.get_input_roll_one
  if @roll_one == '10' then return [:roll_one => '10', :roll_two => nil] end

  @roll_two = user_input_class_instance.get_input_roll_two
  [:roll_one => @roll_one, :roll_two => @roll_two]
  end

end
