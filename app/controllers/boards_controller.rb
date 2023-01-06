class BoardsController < ApplicationController

    def index
      @search = params[:search]
      if @search.present?
        scope = Board.search_board(@search)
      else
        scope = Board.all
      end

      @pagy, @boards = pagy(scope.order(created_at: :desc))
    end

    def new
      @board = Board.new
    end

    def create
      board = BoardCreator.new(board_params).call
      redirect_to board, notice: 'Board was successfully created.'
    rescue StandardError => e
      flash.now[:alert] = 'There are something wrong, please try again. Thank you!'
      @board = Board.new(board_params)
      render :new
    end

    def show
      @board = Board.includes(:cells).find(params[:id])
    end

    def board_params
      params.require(:board).permit(:height, :width, :name, :creator_email, :num_mimes)
    end
end