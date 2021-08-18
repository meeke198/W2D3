class Board
    attr_reader :size 
    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
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
        num_ships = 0
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                if @grid[row][col] == :S
                    num_ships += 1
                end
            end
        end
        num_ships
    end

    def attack(pos)
        

    end

end