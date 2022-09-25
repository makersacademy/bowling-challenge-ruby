class Frame
  attr_accessor :first_roll, :second_roll
  
  def initialize
    @first_roll = nil
    @second_roll = nil
  end

  def strike?
    raise 'First roll not complete.' if @first_roll.nil?
    @first_roll == 10
  end

  def spare?
    if strike?
      return false
    elsif @second_roll.nil?
      raise 'Second roll not complete.'
    else
      (@first_roll + @second_roll) == 10
    end
  end
end