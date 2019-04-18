class Api::V1::CellsController < ApplicationController

    def index
      @cells = Cell.where("game_session_id = " + params[:game_session_id])
      render json: @cells
    end

    def show
      find_cell
      render json: @cell
    end

    # def new
    # end

    def create
      @cell = Cell.new(cell_params)
      if @cell.save
        render json: @cell
      end
    end

    # def edit
    # end

    def update
      find_cell
      puts "CELL PARAMS:"
      puts cell_params
      @cell.update(cell_params)
      if @cell.save
        render json: @cell
      end
    end

    def destroy
    end


    private


    def cell_params
      params.permit(:id, :game_session_id, :name, :cell_type, :on_map, {:inventory => []}, :position_left, :position_top, :position_width, :position_height)
    end

    def find_cell
      @cell = Cell.find(cell_params[:id])
    end


end
