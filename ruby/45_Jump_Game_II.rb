# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  # If the Array is Length 1 or
  # less then no jumps will be needed.
  nums_l = nums.length
  return 0 if nums_l < 2

  jumps = 0
  max_reached_index = 0
  next_max = nums[0]

  index = 1
  while index < nums_l
    # puts "index: #{index}"
    if max_reached_index < index
      jumps += 1
      max_reached_index = next_max

      break unless jumps < nums_l
    end

    reached_index = index + nums[index]
    next_max = [next_max, reached_index].max

    index += 1
  end

  jumps
end
