class GamesController < ApplicationController
  before_action :authenticate_user!, :only => [:join, :move]

  def join
    @waiting = Game.waiting.first
    if @waiting
      @waiting.users << current_user
      redirect_to game_path(@waiting)
    else
      @game = Game.create
      @game.users = [current_user]
      @game.new_board!
      redirect_to game_path(@game)
    end
  end

  def move
  end

  def show
    @game = Game.find(params[:id])
    @player1 = @game.users.first
    @player2 = @game.users.second
  end
end
