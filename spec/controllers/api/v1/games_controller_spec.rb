require 'rails_helper'

RSpec.describe Api::V1::GamesController, type: :controller do
  before(:each) do
    @game = Game.create
  end

  describe "Put flag to game" do
    it "game exist" do
      put :flag, params: { :id => @game.id, :cell_id => 22 }
      response.should be_successful
      body = JSON.parse(response.body)
      expect(body["data"]["id"].to_i).to eql(@game.id)
    end
  end

  describe "Put exposed to game" do
    it "game exist" do
      put :exposed, params: { :id => @game.id, :cell_id => 22 }
      response.should be_successful
      body = JSON.parse(response.body)
      expect(body["cells"][22]["exposed"]).to eql(true)
    end
  end
end
