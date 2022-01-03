class Bowl

  attr_reader :rolls

  def initialize
    @rolls = [ 
      {frame: 1, roll_one: nil, roll_two: nil, total_roll: nil},
      {frame: 2, roll_one: nil, roll_two: nil, total_roll: nil}, 
      {frame: 3, roll_one: nil, roll_two: nil, total_roll: nil},
      {frame: 4, roll_one: nil, roll_two: nil, total_roll: nil},
      {frame: 5, roll_one: nil, roll_two: nil, total_roll: nil},
      {frame: 6, roll_one: nil, roll_two: nil, total_roll: nil},
      {frame: 7, roll_one: nil, roll_two: nil, total_roll: nil},
      {frame: 8, roll_one: nil, roll_two: nil, total_roll: nil},
      {frame: 9, roll_one: nil, roll_two: nil, total_roll: nil},
      {frame: 10, roll_one: nil, roll_two: nil, total_roll: nil}  ]
      @frames = 1
  end

  def first_roll(pins_one)
      @rolls[@frames -1][:roll_one] = pins_one
      if strike?
        @frames += 1
      end
  end

  def second_roll(pins_two)
    fail 'Strike in previous roll' if @rolls[@frames -1][:roll_one] == 10
    @rolls[@frames -1][:roll_two] = pins_two
    calculate_total_roll_strike if previous_strike?
    calculate_total_roll
    @frames += 1
  end


  def total_score
    @rolls.sum{|hash| hash[:total_roll]}
  end



  
  private 
  def calculate_total_roll
    @rolls[@frames -1][:total_roll] = @rolls[@frames -1][:roll_one] + @rolls[@frames -1][:roll_two]
  end

  def strike?
     @rolls[@frames -1][:roll_one] == 10
    
  end

  def previous_strike?
     @rolls[@frames -2][:roll_one] == 10
    
  end

  def calculate_total_roll_strike
    @rolls[@frames -2][:total_roll] = @rolls[@frames -2][:roll_one]  +  @rolls[@frames -1 ][:roll_one] + @rolls[@frames -1][:roll_two]

  end





end