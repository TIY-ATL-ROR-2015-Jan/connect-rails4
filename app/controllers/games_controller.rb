class GamesController < ApplicationController
  before_action :set_users

  def index
    @games = Game.all
    render :index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create
    redirect_to :action => :index
  end

  # def join
  #   @game = Game.find(params[:id])
  #   render :index
  # end

  def show
    @game = Game.find(params[:id])
    render :show
  end

  def destroy
    @game.destroy 
    redirect_to games_index_path, notice: "Your game was deleted."
  end

  def move
  end

  private
  # def game_params
  #   params.require().permit()
  # end

  def set_users
    @user = User.find(current_user)
  end
end