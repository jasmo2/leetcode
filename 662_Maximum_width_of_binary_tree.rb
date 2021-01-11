# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def width_of_binary_tree(root)
  # Edge cases
  return 0 if root.nil?

  # return 1 if(root.left.val.nil? || root.right.val.nil?)

  max_tree_width = 0
  # Each pair is [Node, Index]
  root_pair = [root, 0]
  queue = [root_pair]

  until queue.empty?
    # check if the transversal order on a level
    node_level_count = queue.length
    puts "node_level_count #{node_level_count}"

    first_pair = queue.first
    current_pair = nil

    while node_level_count.positive?
      node_level_count -= 1

      current_pair = queue.shift
      node = current_pair.first
      index = current_pair.last
      #   pp "val #{node.val} index #{index}"

      unless node.left.nil?
        pair = [node.left, index * 2]
        queue.push(pair)
      end

      next if node.right.nil?

      pair = [node.right, (index * 2) + 1]
      queue.push(pair)

    end
    level_width = current_pair.last - first_pair.last + 1
    # pp "current_pair.last(#{current_pair.last}) - first_pair.last(#{first_pair.last}) + 1 =  #{level_width}"
    # puts "Queue #{queue.map { |e| e.first.val }}"
    max_tree_width = [max_tree_width, level_width].max

  end

  max_tree_width
end
