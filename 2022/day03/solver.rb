data = File.readlines("input.csv")

ITEMS = ("a".."z").to_a + ("A".."Z").to_a

def score(item)
  ITEMS.find_index(item) + 1
end

sum = 0
data.each do |line|
  left, right = line[0..line.size/2-1].chars, line[line.size/2..-1].chars
  common_items = left & right
  sum += score(common_items.first)
end

puts "Sum of scores for puzzle 1: #{sum}"

sum = 0
data.each_slice(3).each do |group|
  top, middle, bottom = group[0].strip.chars, group[1].strip.chars, group[2].strip.chars
  common_items = top & middle & bottom
  sum += score(common_items.first)
end

puts "Sum of scores for puzzle 2: #{sum}"
