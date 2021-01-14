# @param {String} s
# @return {Boolean}
def is_valid(s)
  is_it_valid = true

  s_size = s.size
  return false unless s_size.even?

  stack = []
  s.split('').each do |c|
    prev_char = stack.pop
    case c
    when ']'
      return false if prev_char != '['
    when ')'
      return false if prev_char != '('
    when '}'
      return false if prev_char != '{'
    else
      stack.push(prev_char) unless prev_char.nil?
      stack.push(c)
    end
  end

  return false if stack.length.positive?

  is_it_valid
end
