require_relative 'knights_classes.rb'

module KnightsTravails
  def self.knight_moves(start, finish)
    knight = Knight.new(start)
    moves, path = knight.shortest_path(finish)
    puts "You made it in #{moves} moves! Here's your path:"
    path.each { |coord| p coord }
  end

  def self.test
    15.times do
      start, finish = Array.new(2) do
        Array.new(2) { rand(0..7) }
      end

      puts "Start: #{start}"
      puts "End: #{finish}"

      knight_moves(start, finish)
    end
  end
end
KnightsTravails.test
