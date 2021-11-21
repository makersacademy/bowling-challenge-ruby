class Frame
  attr_reader :id, :first_bowl, :second_bowl, :third_bowl

  def initialize(id, first_bowl, second_bowl = 0, third_bowl = 0)
    @id = id
    @first_bowl = first_bowl
    @second_bowl = second_bowl
    @third_bowl = third_bowl
  end

  def strike?
    if @first_bowl == 10
      true
    else
      false
    end
  end

  def spare?
    if @first_bowl + @second_bowl == 10
      true
    else
      false
    end
  end

end