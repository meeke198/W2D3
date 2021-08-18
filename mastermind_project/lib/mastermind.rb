require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess_code)
       puts "Exact matches: #{@secret_code.num_exact_matches(guess_code)}"
       puts "Near matches: #{@secret_code.num_near_matches(guess_code)}"
    end

    def ask_user_for_guess
        print "Enter code"
        guess = gets.chomp
        Code.from_string(guess)
        print_matches(guess)
        num_exact_matches(guess) == @secret_code.length
    end

end
