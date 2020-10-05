require_relative 'poly_tree_node'

BOARD_SIZE = 8
MOVES = [
    [-1, -2],
    [-2, -1],
    [-1, 2],
    [-2, 1],
    [1, -2],
    [2, -1],
    [1, 2],
    [2, 1]
]

class KnightPathFinder
    attr_reader :root_node
    def initialize(initial_pos)
        @initial_pos = initial_pos
        @root_node = PolyTreeNode.new(@initial_pos)
        @considered_positions = [initial_pos]
    end

    def self.valid_moves(pos)
        pos.all? { |cord| cord.between?(0, BOARD_SIZE-1) }
    end

    def new_move_positions(pos)
        row, col = pos
        new_positions = []
        MOVES.each do |dx, dy|
            new_pos = [row + dx, col + dy]
            if KnightPathFinder.valid_moves(new_pos)
                new_positions << new_pos && @considered_positions << new_pos unless @considered_positions.include?(new_pos)
            end
        end
        new_positions
    end
end