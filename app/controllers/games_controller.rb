class GamesController < ApplicationController
  before_action :authenticate_user!, :only => [:join, :move]

  def join
  end

  def move
  end

  def show
    @game = Game.find(params[:id])
    @player1 = @game.users.first
    @player2 = @game.users.second
  end
end
