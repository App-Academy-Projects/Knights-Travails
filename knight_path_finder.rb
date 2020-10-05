require_relative 'poly_tree_node'

class KnightPathFinder
    attr_reader :root_node
    def initialize(initial_pos)
        @initial_pos = initial_pos
        @root_node = PolyTreeNode.new(@initial_pos)
    end
end