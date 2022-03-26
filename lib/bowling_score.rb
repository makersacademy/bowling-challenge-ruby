class BowlingScore
  attr_reader :name, :current_score, :frame

  def initialize(name)
    @name = name
    @current_score = 0
    @frame = 0
  end
  
  def add(increase)
    @current_score += increase
  end
end

=begin
1  1
1  4
2  4
2  5
3  6
3  4
4  5
4  5
5  10
5  nil
6  0
6  1
7  7
7  3
8  6
8  4
9  10
9  nil
10  2
10  8
10  6
=end