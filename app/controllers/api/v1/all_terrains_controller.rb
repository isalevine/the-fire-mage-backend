# copied directly from terrains_controller.rb to start...

class Api::V1::AllTerrainsController < ApplicationController

  def index
    @allTerrain = Terrain.where("game_session_id = " + params[:game_session_id])
    render json: @allTerrain
  end

  # parse tiles => start by building in iterators to go through each grid_x/y row,
  # then save either img_src--or JUST THE INTEGER AT string[-1]--into the Postgres array
  #
  # also, go back and figure out how to make the frontend send the tiles to the ALL_TERRAINS
  # table now, instead of the regular ol' TERRAINS table (which will be deprecated...??)
  def create
    terrain_array = []
    all_terrain_params.each do |terrain|
      terrain_array << terrain["img_src"][-5]
      # @allTerrain = AllTerrain.new(game_session_id: terrain["game_session_id"], grid_x: terrain["grid_x"], grid_y: terrain["grid_y"], img_src: terrain["img_src"])
      # @allTerrain.save
    end
    byebug
    @allTerrain = AllTerrain.new(game_session_id: all_terrain_params[0]["game_session_id"], img_src_array: terrain_array)
    @allTerrain.save
    render json: @allTerrain
  end


  private


  def all_terrain_params
    params.require(:allTerrain)
  end


end
