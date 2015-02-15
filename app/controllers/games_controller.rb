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
    binding.pry
    @game = Game.create
    redirect_to :action => :index
  end

  # def join
  #   @game = Game.find(params[:id])
  #   render :index
  # end

  def show
    @game = Game.find(params[:id])
    show_board
    render :show
  end

  def destroy
    @game.destroy 
    redirect_to games_index_path, notice: "Your game was deleted."
  end

  def move
  end

  def show_board
    board = {:A =>["a1", "a2", "a3", "a4", "a5", "a6", "a7" ],
             :B =>["b1", "b2", "b3", "b4", "b5", "b6", "b7" ],
             :C =>["c1", "c2", "c3", "c4", "c5", "c6", "c7" ],
             :D =>["d1", "d2", "d3", "d4", "d5", "d6", "d7" ],
             :E =>["e1", "e2", "e3", "e4", "e5", "e6", "e7" ],
             :F =>["f1", "f2", "f3", "f4", "f5", "f6", "f7" ]
            }
  end

  private
  # def game_params
  #   params.require().permit()
  # end

  def set_users
    @user = User.find(current_user)
  end
end