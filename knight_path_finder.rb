require_relative 'poly_tree_node'

BOARD_SIZE = 8

class KnightPathFinder
    attr_reader :root_node
    def initialize(initial_pos)
        @initial_pos = initial_pos
        @root_node = PolyTreeNode.new(@initial_pos)
    end

    def self.valid_moves(pos)
        pos.all? { |cord| cord.between?(0, BOARD_SIZE-1) }
    end
end