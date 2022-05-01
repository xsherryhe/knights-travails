class Position
  attr_accessor :coord, :next_coords

  def self.changes
    base_change = [[1, 1], [1, -1], [-1, 1], [-1, -1]].map { |x, y| [x * 1, y * 2] }
    base_change + base_change.map(&:reverse)
  end
  CHANGES = changes

  def initialize(coord)
    @coord = coord
    @next_coords = CHANGES.map { |change_x, change_y| [@coord.first + change_x, @coord.last + change_y] }
                          .select { |x, y| x.between?(0, 7) && y.between?(0, 7) }
  end
end

class Knight
  attr_reader :start

  def initialize(start)
    @start = Position.new(start)
  end

  def shortest_path(finish, queue = [[start, 0, []]])
    curr, edges, visited = queue.shift
    return [edges, visited << finish] if curr.coord == finish

    queue += curr.next_coords.filter_map do |coord|
      [Position.new(coord), edges + 1, visited.dup << curr.coord] unless visited.include?(coord)
    end
    shortest_path(finish, queue)
  end
end
