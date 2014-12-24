module Tictactoe4rb

  class Checker

    def initialize(start, vector, number_of_points)
      @start = start
      @dr, @dc = vector
      @number_of_points = number_of_points
    end

    def check(board, player)
      check_points = Array.new(@number_of_points, @start)

      check_points = check_points.each_with_index.map do |point, index|
        row, column = point
        [row + @dr*index, column + @dc*index]
      end

      check_points.reduce(true) do |acc, point|
        row, column = point
        acc && board[row, column] == player.token
      end
    end

  end


  class CompositeChecker < Checker

    def initialize(checkers)
      @checkers = checkers
    end

    def check(board, player)
      @checkers.reduce(false) do |acc, row_checker|
        acc || row_checker.check(board, player)
      end
    end

  end


  class ColumnChecker < CompositeChecker

    def initialize(columns)
      super([])
      columns.times do |column|
        @checkers << Checker.new([0, column], [1, 0], columns)
      end
    end

  end


  class RowChecker < CompositeChecker

    def initialize(rows)
      super([])
      rows.times do |row|
        @checkers << Checker.new([row, 0], [0, 1], rows)
      end
    end

  end


  class DiagonalChecker < CompositeChecker

    def initialize(rows, columns)
      super([])
      cells = [rows, columns].min
      @checkers << Checker.new([0,0],[1,1],cells) # Top-left to Bottom-right Diagonal Checker
      @checkers << Checker.new([columns-1,0],[-1,1],cells) # Top-right to Bottom-left Diagonal Checker
    end

  end

end