class Game
  def initialize
    puts "Morpion."
    print "Entrez le nom du joueur 1 : "
    name1 = gets.chomp
    print "Entrez le nom du joueur 2 : "
    name2 = gets.chomp
    @player1 = Player.new(name1, "X")
    @player2 = Player.new(name2, "O")
    @board = Board.new
  end

  def play
    loop do
      @board.display_board
      get_move(@player1, @board)
      break if game_over?

      @board.display_board
      get_move(@player2, @board)
      break if game_over?
    end
    @board.display_board

    if @board.winner?
      puts "#{winner.name} gagne la partie."
    else
      puts "Pas de gagnant."
    end
  end

  def get_move(player, board)
    puts "#{player.name}, à toi de jouer (#{player.symbol})."
    loop do
      print "Définis des coordonnées (ex : A1) : "
      position = gets.chomp.upcase
      unless ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"].include?(position)
        print "Coordonnées invalides. Veuillez réessayer : "
        next
      end
      if board.valid_move?(position)
        board.place_move(position, player.symbol)
        break
      else
        puts "Coordonnées déjà prises. Veuillez réessayer."
      end
    end
  end

  def game_over?
    @board.winner? || @board.tie?
  end

  def winner
    board_array = @board.instance_variable_get(:@board)
    if board_array.transpose.flatten.count("X") > board_array.transpose.flatten.count("O")
      return @player1
    else
      return @player2
    end
  end  
end