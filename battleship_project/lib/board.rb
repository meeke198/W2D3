class Board
    attr_reader :size

   def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end
    
    def num_ships
        count = 0
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                if @grid[row][col] == :S 
                    count += 1
                end
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S 
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        total_ship = size / 4.00

        while self.num_ships < total_ship
        random_r = rand(0...@grid.length)
        random_c = rand(0...@grid.length)
        pos = [random_r, random_c]
        self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |subarray|
            subarray.map do |ele|
                if ele == :S 
                   :N 
                else
                   ele 
                end
            end
        end

    end

    def self.print_grid(another_grid)
        another_grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    def print
        Board.print_grid(self.hidden_ships_grid)
    end


end
