require_relative "board"
require_relative "player"

class Battleship
    attr_reader :size, :n
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

end
