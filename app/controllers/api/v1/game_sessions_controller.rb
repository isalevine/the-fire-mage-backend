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
    # Time.now.to_f will generate time in SECONDS, not milliseconds
    expiration = (Time.now.to_i * 1000) + 3600   # 10 minutes
    check_expired_game_sessions

    @game_session = GameSession.new(in_progress: true, complete: false, expiration: expiration)
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
    params.permit(:in_progress, :complete, :expiration_date)
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

  def check_expired_game_sessions
    expiration = Time.now.to_i
    @game_sessions = GameSession.where("expiration > ?", 1)
    # byebug
    if @game_sessions
      @game_sessions.destroy_all
    end
  end

end
