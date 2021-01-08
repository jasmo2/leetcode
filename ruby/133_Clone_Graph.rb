# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

# @param {Node} node
# @return {Node}
def cloneGraph(node)
  if node.nil?
    puts "node.nil? #{node.nil?}"
    return nil
  end

  node_hash = {}
  queue = [node]
  puts "last element added in the queue: #{queue.last.val}"

  clone_graph = Node.new(node.val)
  node_hash[node.val] = clone_graph

  while queue.length.positive?
    curr = queue.pop # lastest element added to the queue.
    # puts "curr #{curr.val}"
    # puts "node_hash[curr.val] #{node_hash[curr.val].val}"

    curr.neighbors.each do |neighbor_node|
      if node_hash.key?(neighbor_node.val)
        current_node = node_hash[curr.val]
        neighbor_node_clone = node_hash[neighbor_node.val]

        current_node.neighbors.push(neighbor_node_clone)
      else
        neighbor_copy = Node.new(neighbor_node.val)
        node_hash[curr.val].neighbors.push(neighbor_copy)
        node_hash[neighbor_node.val] = neighbor_copy

        queue.push(neighbor_node)
        puts "last element added in the queue: #{neighbor_node.val}"
      end
    end

  end

  clone_graph
end
