require 'tictactoe4rb'

module Tictactoe4rb
  describe Board do

    context "#initialize" do
      it 'create board' do
        board = Board.new(3, 3)
        expect(board.rows).to eq 3
        expect(board.columns).to eq 3
        3.times do |row|
          3.times do |column|
            expect(board[row, column]).to eq Board::Empty
          end
        end
      end
    end
  end
end