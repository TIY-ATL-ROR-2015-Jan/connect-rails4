class Game < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players

  validates_length_of :users, maximum: 2, message: "can have at most two players."

  serialize :board

  def self.waiting
    Game.where(:players_count => 1)
  end

  def self.active
    Game.where(:finished => false)
  end

  def can_move?(user)
    if self.turn_count.even?
      user == self.users.first
    else
      user == self.users.second
    end
  end
end
