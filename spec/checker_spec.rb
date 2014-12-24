require 'tictactoe4rb'

module Tictactoe4rb
  describe Checker do
      it "tests if single row checker works" do
        board = Board.new(3, 3)
        player = Player.new 'dummy', :x
        board[0,0] = player.token
        board[0,1] = player.token
        board[0,2] = player.token

        first_row_checker = Checker.new [0,0],[0,1], 3
        expect(first_row_checker.check(board, player)).to eq true
        second_row_checker = Checker.new [1,0],[0,1], 3

        expect(second_row_checker.check(board, player)).to eq false
      end

      it "tests if single column checker works" do
        board = Board.new(3, 3)
        player = Player.new 'dummy', :x
        board[0,0] = player.token
        board[1,0] = player.token
        board[2,0] = player.token

        first_column_checker = Checker.new [0,0],[1,0], 3
        expect(first_column_checker.check(board, player)).to eq true
        second_column_checker = Checker.new [0,1],[1,0], 3

        expect(second_column_checker.check(board, player)).to eq false
      end
  end

  describe RowChecker do
    it "tests if row checker works" do
      board = Board.new(3, 3)
      row_checker = RowChecker.new 3
      player = Player.new 'dummy', :x
      expect(row_checker.check(board, player)).to eq false


      board[0,0] = player.token
      board[0,1] = player.token
      board[0,2] = player.token

      expect(row_checker.check(board, player)).to eq true
    end
  end

  describe ColumnChecker do
    it "tests if row checker works" do
      board = Board.new(3, 3)
      column_checker = ColumnChecker.new 3
      player = Player.new 'dummy', :x
      expect(column_checker.check(board, player)).to eq false

      board[0,0] = player.token
      board[1,0] = player.token
      board[2,0] = player.token

      expect(column_checker.check(board, player)).to eq true
    end
  end


  describe DiagonalChecker do
    it "tests if LR diagonal checker works" do
      board = Board.new(3, 3)
      diagonal_checker = DiagonalChecker.new 3, 2
      player = Player.new 'dummy', :x
      expect(diagonal_checker.check(board, player)).to eq false

      board[0,0] = player.token
      board[1,1] = player.token
      board[2,2] = player.token

      expect(diagonal_checker.check(board, player)).to eq true
    end

    it "tests if RL diagonal checker works" do
      board = Board.new(3, 3)
      diagonal_checker = DiagonalChecker.new 3, 2
      player = Player.new 'dummy', :x
      expect(diagonal_checker.check(board, player)).to eq false

      board[0,2] = player.token
      board[1,1] = player.token
      board[2,0] = player.token

      expect(diagonal_checker.check(board, player)).to eq true
    end
  end

end