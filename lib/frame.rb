class Frame
  attr_accessor :first_roll, :second_roll
  
  def initialize
    @first_roll = nil
    @second_roll = nil
  end

  def strike?
    @first_roll == 10
  end

  def spare?
    if strike?
      return false
    elsif @first_roll.nil? || @second_roll.nil?
      return false
    else !@first_roll.nil? && !@second_roll.nil?
      (@first_roll + @second_roll) == 10
    end
  end
end