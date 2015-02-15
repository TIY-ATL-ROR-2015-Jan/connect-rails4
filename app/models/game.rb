class Game < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players

  validates_length_of :users, maximum: 2, message: "can have at most two players."

  serialize :board

  def initialize(player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @player_1piece = "black"
    @player_2piece = "red"
    @turns = 42
    @row = 0
    @col = 0
    @next_player = @player_1
    super()
  end

  def self.waiting
    Game.where(:players_count => 1)
  end

  def self.active
    Game.where(:finished => false)
  end


  def place_piece (col, piece)
    col_height = 6
    while @board[col][col_height].length != 2 && col_height >0
      col_height -= 1
    end
    if col_height == 0
      puts 'Get out of here, this is full.'
      pick_col
    end
    @board[col][col_height]=piece

  end

  def pick_col
    @col = @next_player.prompt_user("Player #{@next_player.username}: Please choose a letter between A and G",
                         /^[#{A-Ga-g}]$/, 'You must choose an available space!')
    piece = @next_player == @player_1 ? @player_1piece : @player2_piece
    place_piece(@col.to_sym, piece)
  end

  def take_turn
  puts "It is #{@next_player}'s turn."
   show_board
   pick_col
   @next_player = @player1 == @next_player ? @player2 : @player1
   @turns -= 1

  def can_move?(user)
    if self.turn_count.even?
      user == self.users.first
    else
      user == self.users.second
    end

  end
end
