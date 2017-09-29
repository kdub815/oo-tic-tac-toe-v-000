class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top-row win
    [3,4,5], #mid-row win
    [6,7,8], #bottom-row win
    [0,3,6], #left col win
    [1,4,7], #mid col win
    [2,5,8], #right col win
    [0,4,8], #left diag win
    [2,4,6]  #right diag win
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    player_token = current_player
    if valid_move?(index)
      move(index, player_token)
      display_board
    else
      turn
    end
  end

end
