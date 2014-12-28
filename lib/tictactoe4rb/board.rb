module Tictactoe4rb

  class Board
    include Enumerable
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
      if @fields[[row, column]].nil?
        false
      else
        @fields[[row, column]]
      end
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
      checkers = []
      checkers << RowChecker.new(rows)
      checkers << ColumnChecker.new(columns)
      checkers << DiagonalChecker.new(rows,columns)
      checkers.reduce(false) do |acc, checker|
        acc || checker.check(self, player)
      end
    end

    def each(&block)
      @fields.each do |key, value|
        block.call value
      end
    end

    def full?
      booleans = self.map do |field_value|
        field_value == Empty
      end
      !booleans.reduce(:|)
    end

  end
end