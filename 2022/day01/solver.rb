data = File.readlines("input.csv")
calories_by_elf = Hash.new(0)
elf = 1
most_calories = []
data.each do |row|
  if row == "\n"
    elf += 1
  else
    calories_by_elf[elf] += row.to_i
  end

  most_calories.push(calories_by_elf[elf])
end
most_calories.sort!
puts calories_by_elf
puts "\nMost calories: #{most_calories[-1]}"

puts "\nSum of calories from three elves with most calories: #{most_calories[-3..-1].sum}"
