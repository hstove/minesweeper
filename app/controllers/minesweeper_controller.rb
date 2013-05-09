class MinesweeperController < ApplicationController
  def show
    size = params[:size] || 10
    mines = params[:mines] || 4
    @minesweeper = Minesweeper.new size, mines
  end
end
