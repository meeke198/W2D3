



class HumanPlayer
  attr_reader :mark_value
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position
    puts "Player #{@mark.to_s}, enter two number following the format"
    pos = gets.chomp.split(" ").map{|i| i.to_i}
    raise "Sorry, invalid format" if pos.length != 2   
    pos
  end


end
