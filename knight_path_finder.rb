class KnightPathFinder
    def initialize(initial_pos)
        @initial_pos = initial_pos
        @@root_node = PoltTreeNode(@initial_pos)
    end
end