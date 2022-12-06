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
