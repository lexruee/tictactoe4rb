require 'tictactoe4rb'

module Tictactoe4rb
  describe Board do

    context "#initialize" do
      it 'create board' do
        board = Board.new(3, 3)
        expect(board.full?).to eq false
        expect(board.rows).to eq 3
        expect(board.columns).to eq 3
        3.times do |row|
          3.times do |column|
            expect(board[row, column]).to eq Board::Empty
          end
        end
      end

      it "create full board" do
        board = Board.new(3, 3)
        board[0,0] = :x
        board[1,0] = :x
        board[2,0] = :x

        board[0,1] = :x
        board[1,1] = :x
        board[2,1] = :x

        board[0,2] = :x
        board[1,2] = :x
        board[2,2] = :x
        expect(board.full?).to eq true
      end

    end
  end
end