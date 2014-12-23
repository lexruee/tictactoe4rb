module Tictactoe4rb

  class Checker

    def initialize(rows=false)
      if rows
        @x = :rows
        @y = :columns
      else
        @x = :columns
        @y = :rows
      end
    end

    def check(board, player)
      fields = board.fields
      board.send(@x).times do |row|
        counter = 0
        board.send(@y).times do |column|
          if fields[[row, column]] == player.token
            counter += 1
          end
          return true if counter == @rows
        end
      end
    end
  end

  class Board
    Empty = :_

    attr_reader :rows, :columns, :fields

    def initialize(rows = 3, columns = 3)
      @rows = rows
      @columns = columns
      @fields = {}

      @rows.times do |row|
        @columns.times do |column|
          @fields[[row, column]] = Empty
        end
      end
    end

    def [](row, column)
      @fields[[row, column]]
    end

    def []=(row, column, token)
      if @fields[[row, column]] == Empty
        @fields[[row, column]] = token
        return true
      else
        raise 'Field is not empty'
      end
    end

    def check(player)
      row_checker = Checker.new(true)
      column_checker = Checker.new(false)
      return row_checker.check(self, player) || column_checker.check(self, player)
    end

  end
end