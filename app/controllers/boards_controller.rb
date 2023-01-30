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
    resolve("boards.create").call(board_params.to_h) do |m|
      m.success do |board|
        return redirect_to board, notice: 'Board was successfully created.'
      end

      m.failure do |failure|
        flash.now[:alert] = failure.errors(full: true).to_h.values.join(',')
        @board = Board.new(board_params)
        render :new
      end
    end
  rescue StandardError => error
    flash.now[:alert] = error
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
