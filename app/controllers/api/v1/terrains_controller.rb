class Api::V1::TerrainsController < ApplicationController

  def index
    @allTerrain = Terrain.where("game_session_id = " + params[:game_session_id])
    render json: @allTerrain
  end


  def create
    all_terrain_params.each do |terrain|
      byebug
      @terrain = Terrain.new(game_session_id: terrain["game_session_id"], grid_x: terrain["grid_x"], grid_y: terrain["grid_y"], img_src: terrain["img_src"])
      @terrain.save
    end
    @allTerrain = Terrain.where("game_session_id = " + params[:game_session_id])
    render json: @allTerrain
  end


  private


  def all_terrain_params
    params.require(:allTerrain)
  end


end
