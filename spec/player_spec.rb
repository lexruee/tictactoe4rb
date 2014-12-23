require 'tictactoe4rb'

module Tictactoe4rb
  describe Player do

    context "#initialize" do
      it 'create player' do
        player = Player.new("Roman", :x)
        expect(player.name).to eq 'Roman'
        expect(player.token).to eq :x
      end
    end

  end
end