class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos
        pos.all? do |i|
            0 <= i && i < @grid.length
        end
    end

    def empty?(pos)
        self[pos] == '_'
    end

    def place_mark(pos, mark)
        raise 'invalid mark' if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end


    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
      @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
      @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
      (@grid[0].length - 1..0).all? do |col|
        (0...@grid.length).all? do |row|
          @grid[row][row] == mark || @grid[row][col] == mark
        end
      end
    end

    def win?(mark)
      win_diagonal?(mark) || win_row?(mark) || win_col?(mark)
    end

    def empty_positions?
      @grid.any? {|row| row.any?("_")}
    end
    # def empty_positions?
    #     indices = (0...@grid.length).to_a
    #     positions = indices.product(indices)
    #     positions.any? { |pos| empty?(pos) }
    # end

end
