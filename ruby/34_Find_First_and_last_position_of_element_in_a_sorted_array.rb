# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def search_range(nums, target)
  nums_l = nums.length - 1
  left = 0
  right = nums_l

  not_found = [-1, -1]
  return not_found if nums.empty?

  while left <= right
    mid = (right + left / 2).floor
    puts "mid:#{mid}\tnums[mid]:#{nums[mid]}\ttarget:#{target}\tleft:#{left}\tright:#{right}"

    if nums[mid] < target # go to the Right size
      left = mid + 1
    elsif nums[mid] > target # go to the Left size
      right = mid - 1
    else # found the item
      return [left_boundary(nums, 0, mid, target), right_boundary(nums, mid, nums_l, target)]
    end
  end

  not_found
end

def left_boundary(nums, left, right, target)
  puts "\n\t---------- Left Boundary ----------\n"

  while left < right
    mid = ((right + left) / 2).floor
    puts "mid:#{mid}\tnums[mid]:#{nums[mid]}\ttarget:#{target}\tleft:#{left}\tright:#{right}"

    ''"
    First needs to verify that the middle number is less than
    the target.

    After we can compare it.
    Due to always work with the original array,
    ,we have to compare the 'nums[mid]' agains the target

    "''
    if nums[mid] < target
      left = mid + 1
    elsif nums[mid - 1] < target
      return mid
    else
      right = mid - 1
    end
  end

  left
end

def right_boundary(nums, left, right, target)
  puts "\n\t---------- Right Boundary ----------\n"
  while left < right
    mid = ((right + left) / 2).floor
    puts "mid:#{mid}\tnums[mid]:#{nums[mid]}\ttarget:#{target}\tleft:#{left}\tright:#{right}"

    if nums[mid] > target
      right = mid - 1
    elsif nums[mid + 1] > target
      return mid
    else
      left = mid + 1
    end
  end

  right
end
