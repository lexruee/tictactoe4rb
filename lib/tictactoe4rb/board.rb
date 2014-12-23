module Tictactoe4rb
  class Board
    Empty = :_
    attr_reader :rows, :columns
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

  end
end