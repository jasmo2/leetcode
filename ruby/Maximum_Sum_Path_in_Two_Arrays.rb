def maximum_Sum_Path_in_Two_Arrays(arr1, arr2)
  j = i = sum = sum1 = sum2 = prev_i = prev_j = 0

  arr1_l = arr1.length
  arr2_l = arr2.length
  result_items = []
  sub_arr1 = []
  sub_arr2 = []

  while (arr1_l > i) && (arr2_l > j)
    item1 = arr1[i]
    item2 = arr2[j]
    ''"
    ar1 = [2, 3, 7, 10, 12, 15, 30, 34]
    ar2 = [1, 5, 7, 08, 10, 15, 16, 19]
    "''
    if item1 < item2
      sum1 += item1
      i += 1
      sub_arr1.push(item1)
    elsif item2 < item1
      sum2 += item2
      j += 1
      sub_arr2.push(item2)

    else
      max = [sum1, sum2].max
      sum = sum + max + item1
      result_items = if max == sum1
                       result_items.concat(sub_arr1, [item1])
                     else
                       result_items.concat(sub_arr2, [item1])
                     end
      sub_arr1 = sub_arr2 = []
      sum1 = sum2 = 0

      i += 1
      j += 1
    end
  end

  while i < arr1_l
    item = arr1[i]
    result_items.push(item)
    sum += item
    i += 1
  end

  while j < arr2_l
    item = arr2[j]
    result_items.push(arr2[j])
    sum += item
    i += 1
  end

  pp result_items
  sum
end

ar1 = [2, 3, 7, 10, 12, 15, 30, 34]
ar2 = [1, 5, 7, 8, 10, 15, 16, 19]

puts "Maximum sum path is #{maximum_Sum_Path_in_Two_Arrays(ar1, ar2)}"
