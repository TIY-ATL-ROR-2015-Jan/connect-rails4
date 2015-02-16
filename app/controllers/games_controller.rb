class GamesController < ApplicationController
  before_action :authenticate_user!, :only => [:join, :move]

  def join
  end

  def move
  end

  def show
  end
end
