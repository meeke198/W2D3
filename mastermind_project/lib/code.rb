require "byebug"
class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs
  def self.valid_pegs?(pegs)
    pegs.all? {|char| Code::POSSIBLE_PEGS.include?(char.upcase)}
  end
  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise "Error!"
    end
    @pegs = pegs.map {|char| char.upcase}
  end
  def self.random(length)
    random_pegs = Array.new(length, Code::POSSIBLE_PEGS.keys.sample)
    Code.new(random_pegs)
  end

  def self.from_string(string_pegs)
    chars = string_pegs.split("")
    Code.new(chars)
  end 

  def [](index)
    @pegs[index]
  end
  def length
    @pegs.length
  end
  def num_exact_matches(guess_code)
    count = 0
    @pegs.each_with_index {|peg, i| count +=1 if peg == guess_code[i]} #why cant i call each_with_index with code_guess
    count
  end
  def num_near_matches(guess_code)
    guess_dup = guess_code.pegs.dup
    pegs_dup = @pegs.dup
    length = guess_dup.length
      (0...length).each do |i|
        if guess_dup[i] == pegs_dup[i]
          guess_dup[i] = nil
          pegs_dup[i] = nil
        end
      end
    guess_dup.delete(nil)
    pegs_dup.delete(nil)
    count = 0
    guess_dup.each_with_index do |peg, i| 
      if pegs_dup.include?(peg)
        count += 1 
        index = pegs_dup.index(peg)
        pegs_dup.delete_at(index)
      end
    end
    count
  end
# pegs: R0RB
# guess: B0BG
  def ==(another_code)
    self.length == another_code.length && self.num_exact_matches(another_code) == self.length
  end
end