module Tictactoe4rb
  class Board
    Empty = :_
    attr_reader :rows, :columns
    def initialize(rows, columns)
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

  end
end