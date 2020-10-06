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
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
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

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            current_node = queue.shift
            current_pos = current_node.value
            new_move_positions(current_pos).each do |nxt_pos|
                next_node = PolyTreeNode.new(nxt_pos)
                current_node.add_child(next_node)
                queue << next_node
            end
        end
    end
end