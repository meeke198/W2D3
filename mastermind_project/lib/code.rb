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
      if @pegs[i] == guess[i] 
        count += 1
      end
    end

    count
  end

  def num_near_matches(guess)
    guess_dup = guess.pegs.dup
    code_dup = self.pegs.dup

   guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        guess_dup[i] = nil
        code_dup[i] = nil
      end
    end
      code_dup.delete(nil)
      guess_dup.delete(nil)
      count = 0
      guess_dup.each_with_index do |peg, i|
        if code_dup.include?(peg)
          count += 1
          code_up.delete_at(code_dup.index(peg))
        end
      end                                                                 
    count
  end

  def ==(guess)
    guess.length == self.length && self.num_exact_matches(guess).length == self.length
  end

end
