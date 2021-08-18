# require "byebug"
class Board
    attr_reader :size 
    def initialize(n)
        # debugger
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end 
    def [](pos)
        # debugger
        row, col = pos  
        @grid[row][col]
    end

    def []=(pos, value)
        # debugger
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
        if self[pos] == :S 
            self[pos] = :H 
            print 'You sunk my battleship!'
            return true
        else
            self[pos] = :X 
            return false
        end
    end
    
    def place_random_ships
        total_ship = @size * 0.25
        
        while self.num_ships < total_ship
            rand_r = rand(0...@grid.length)
            rand_c = rand(0...@grid.length)
            pos = [rand_r, rand_c] 
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



# board = Board.new(3)
# board[[1,2]] = :S 
# p board.attack([1, 2])


#phải dùng "self" instead of @grid ở đây
# truơcs hết phải hiểu là 2 brackets methods line 9 và 15 trong class này sẽ overwrite [] method thông thường
# mà mình hay dùng trong ruby, nên mình phải xài với instances của class only
# không dùngg được cho @grid, vì @grid là variable instance(declare trong initialize),
# @grid không phải class instance,nên nhớ điều đó. 2 cái khác nhau. instance method only can call on instance of class
# that why we have to use self there (in attack method).