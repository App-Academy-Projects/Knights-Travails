class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        @value.inspect
    end

    def parent=(parent)
        @parent.children.delete(self) if !@parent.nil?
        @parent = parent
        return nil if @parent.nil?
        @parent.children << self if !@parent.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "This node isn't a child for any parent" if !@children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value=nil, &prc)
        prc ||= Proc.new { |node| target_value == node.value }
        return self if prc.call(self)
        children.each do |child|
            search_res = child.dfs(&prc)
            return search_res unless search_res.nil?
        end
        nil
    end

    def bfs(target_value=nil, &prc)
        prc ||= Proc.new { |node| target_value == node.value }

        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if prc.call(node)
            nodes += node.children
        end
        nil
    end
end