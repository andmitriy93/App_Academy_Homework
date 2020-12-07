require 'set'

class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        self.value = value
        self.neighbors = []
    end

    def bfs(starting_node, target_value)
        visited = Set.new()
        queue = [starting_node]

        until (queue == [])
            if !queue.first.neighbors.empty? && !visited.include?(queue.first)
                queue += queue.first.neighbors
            end
            if queue.first.value == target_value
                return queue.first.value
            else
                visited << queue.first
                queue.shift
            end
        end
        return nil
    end


end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
# p a
# p f
p a.bfs(a, "b")
p a.bfs(a, "f")