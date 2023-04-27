require_relative "lib/game"
require_relative "lib/board"
require_relative "lib/player"

def play_again?
  loop do
    print "Rejouer ? (o/n) "
    answer = gets.chomp.downcase
    case answer
    when "o", "oui"
      return true
    when "n", "non"
      return false
    else
      puts "Veuillez entrer un choix entre oui (o) et non (n)."
      next
    end
  end
end

loop do
  game = Game.new
  game.play

  break unless play_again?
end