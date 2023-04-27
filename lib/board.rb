class Board
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def display_board
    puts ""
    puts "    1   2   3"
    puts "  +---+---+---+"
    puts "A | #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} |"
    puts "  +---+---+---+"
    puts "B | #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} |"
    puts "  +---+---+---+"
    puts "C | #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} |"
    puts "  +---+---+---+"
    puts ""
  end

  def valid_move?(position)
    row = position[0].upcase.ord - 65
    col = position[1].to_i - 1
    @board[row][col] == " "
  end

  def place_move(position, player)
    row = position[0].upcase.ord - 65
    col = position[1].to_i - 1
    @board[row][col] = player
  end

  def winner?
    # check rows
    @board.each do |row|
      return true if row.uniq.length == 1 && row[0] != " "
    end
  
    # check columns
    (0...@board.length).each do |col|
      return true if @board.all? { |row| row[col] == @board[0][col] } && @board[0][col] != " "
    end
  
    # check diagonals
    return true if [@board[0][0], @board[1][1], @board[2][2]].uniq.length == 1 && @board[1][1] != " "
    return true if [@board[0][2], @board[1][1], @board[2][0]].uniq.length == 1 && @board[1][1] != " "
  
    false
  end  

  def tie?
    @board.flatten.none? { |pos| pos == " " }
  end
end