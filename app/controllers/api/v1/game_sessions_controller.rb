class Api::V1::GameSessionsController < ApplicationController

  # added index route for debugging on Heroku
  def index
    @game_sessions = GameSession.all
    render json: @game_sessions
  end

  def show
    find_game_session
    render json: @game_session
  end


  def create
    @game_session = GameSession.new(in_progress: true, completed: false)
    if @game_session.save
      render json: @game_session
    end
  end


  def update
    find_game_session
    @game_session.update(game_session_params)
    if @game_session.save
      render json: @game_session
    end
  end


  def destroy
    puts "Delete request detected!"
    
    find_game_session
    @game_session.destroy
    destroy_game_data

    render json: {status: "GameSession deleted!"}
  end


  private


  def game_session_params
    params.permit(:in_progress, :complete)
  end

  def find_game_session
    @game_session = GameSession.find(params[:id])
  end

  def destroy_game_data
    @all_terrain = AllTerrain.find_by(game_session_id: params[:id])
    @all_terrain.destroy
    @cells = Cell.find_by(game_session_id: params[:id])
    @cells.destroy
  end


end
