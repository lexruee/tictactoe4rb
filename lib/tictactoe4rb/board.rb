module Tictactoe4rb

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

    end

  end
end