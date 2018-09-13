require 'rails_helper'

RSpec.describe Game, type: :model do
 
  it "#new game init" do
    game = FactoryGirl.create(:game)
    expect(game.cells.count).to eql(9)
    expect(game.mines.count).to eql(2)
  end

  it "#new must be populate with cells and mine" do
    game = Game.new
    expect(game.cells.count).to eql(64)
    expect(game.mines.count).to eql((game.squares*0.33).to_i)
  end


end
