class Code
  
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| Code::POSSIBLE_PEGS.include?(char.upcase) }
  end 

  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise "Error!"
    else
      @pegs = pegs.map{|char| char.upcase}
    end
  end

  def self.random(length)
    pegs = Array.new(length,Code::POSSIBLE_PEGS.keys.sample)
    Code.new(pegs)
  end


  def self.from_string(pegs)
    chars = pegs.split("")
    Code.new(chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if @pegs[i] == guess[i]    #@peg[i] why self[i] instead
        count += 1
      end
    end

    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if guess[i] != @pegs[i] && @pegs.include?(guess[i])
        count += 1
      end
    end
    count
  end

  def ==(guess)
    guess.length == self.length && self.num_exact_matches(guess).length == self.length
  end

end
