WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Converts user's string input to an integer and subtracts one 
#The board contains spaces 1-9 but he indexes are 0-8
def input_to_index(user_input)
  user_input.to_i - 1 
end

def move(board, index, player_charcter)
  board[index] = player_charcter
end

#Checks to see if the index on the board is currently occupied.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#Checks the index position on board and if the position is nbot taken will return true.
def valid_move?(board, index)
  index.between(0,8) && !position_taken?(board,index)
end

def turn(board)
  puts "Please choose a number 1-9:"
  user_input = gets.chomp 
  index = input_to_index(user_input)
  if valid_move?(board, index)
    player_character = current_player(board)
    move(board, index, player_character)
    display_board(board)
  else 
    turn(board)
  end
end

