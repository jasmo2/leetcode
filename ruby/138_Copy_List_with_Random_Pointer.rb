# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  # Modify original structure: Original->Copy->Original->Copy
  # node.next.random = node.random.next
  pointer = head
  head_copy = nil

  # Create a Copy without the random pointers.
  until pointer.nil?
    next_pointer = pointer.next
    copy = Node.new(pointer.val)
    pointer.next = copy
    copy.next = next_pointer
    pointer = next_pointer
  end
  pointer = head

  until pointer.nil?
    pointer.next.random = pointer.random.next unless pointer.random.nil?
    pointer = pointer.next.next
  end
  pointer = head

  head_copy = pointer.next unless pointer.nil?

  until pointer.nil?
    copy = pointer.next
    pointer.next = copy.next
    pointer = pointer.next
    copy.next = pointer.next unless pointer.nil?
  end

  head_copy
end
