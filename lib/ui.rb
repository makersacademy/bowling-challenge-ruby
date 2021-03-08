
class UI
  def initialize
    get_names()
    create_players()
    run()
  end

  def run
    (1..10).each do |frame|
      @players.each do |player|
        enter_score(player, frame)
      end
    end
    print_scores()
  end

  private

  def print_scores
    @players.each do |player|
      puts "#{player.name} has a final score of #{player.total}"
    end
  end

  def enter_score(player, frame)
    (1..3).each do |roll|
      puts "Enter score for #{player.name}, frame #{frame}, roll #{roll}:"
      score = gets.chomp.to_i
      break if player.add_score(frame, score)
    end
  end

  def get_names
    @names = []
    loop do
      puts "Please enter player name, or hit enter to begin:"
      name = gets.chomp
      break if name == ""
      @names << name
    end
  end

  def create_players
    if @names.empty?
      @players = [Score.new()]
    else
      @players = @names.map{ |name| Score.new(name)}
    end
  end
end