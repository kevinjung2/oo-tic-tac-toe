class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    index.between?(0,8) && self.position_taken?(index) == false ? true : false
  end

  def turn_count
    @board.count { |token| token == "X" || token == "O" }
  end

  def current_player
    self.turn_count.odd? ? "O" : "X"
  end

  def turn
    puts "Please select a number 1-9"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      curr = self.current_player
      self.move(index, curr)
      self.display_board
    else
      self.turn
    end
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      winner = combo if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    end
    winner
  end

  def full?
    @board.count { |token| token == "X" || token == "O" } == 9 ? true : false
  end

  def draw?
    self.full? && self.won? == nil ? true : false
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    self.won? ? @board[self.won?[0]] : nil
  end

  def play
    while self.over? == false
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
