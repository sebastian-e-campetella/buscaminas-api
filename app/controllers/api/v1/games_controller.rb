class Api::V1::GamesController < ApplicationController
  before_action :set_params
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def create
    render json: Game.create
  end

  # put
  def flag
    game = Game.find(params[:id])
    game.cells[params[:cell_id].to_i].has_flag = !game.cells[params[:cell_id].to_i].has_flag if game.cells[params[:cell_id].to_i].present?
    render json: game.json_api
  end

  def exposed
    game = Game.find(params[:id])
    params[:cell]
    if( game.cells[params[:cell_id].to_i].present? && !game.cells[params[:cell_id].to_i].exposed)
      game.cells[params[:cell_id].to_i].exposed = true
    end
    game.save
    render json: game
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def set_params
      params.permit(:id, :cell_id)
    end

  def render_404
    render :json => {"error": "404"}, :status => 404
  end
end
